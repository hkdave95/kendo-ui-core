require 'codegen/lib/options'
require 'codegen/lib/field'
require 'codegen/lib/markdown_parser'
require 'codegen/lib/component'

require 'nokogiri'
require 'codegen/lib/mvc/api'
require 'codegen/lib/mvc/mobile'
require 'codegen/lib/java/module'
require 'codegen/lib/java/composite_option'
require 'codegen/lib/java/event'
require 'codegen/lib/java/option'
require 'codegen/lib/java/component'
require 'codegen/lib/java/tld'
require 'codegen/lib/java/jsp'
require 'codegen/lib/java/api'

require 'codegen/lib/php/options'
require 'codegen/lib/php/composite_option'
require 'codegen/lib/php/event'
require 'codegen/lib/php/option'
require 'codegen/lib/php/component'
require 'codegen/lib/php/php'
require 'codegen/lib/php/api'

namespace :generate do
    def import_metadata(component)
        metadata = "build/codegen/#{component.name.downcase}.yml"

        if File.exists?(metadata)
            yaml = YAML.load(File.read(metadata))

            component.import(yaml)
        end
    end

    desc 'Generate all server wrappers and their API reference'
    task :all => [:php, :jsp, 'mvc:mobile:wrappers', 'mvc:api']

    namespace :mvc do

        desc 'Generate MVC API reference'
        task :api => 'Kendo.Mvc.xml' do
            parser = CodeGen::MVC::API::XmlParser.new('wrappers/mvc/src/Kendo.Mvc/bin/Release/Kendo.Mvc.xml')

            generator = CodeGen::MVC::API::Generator.new('docs/api/wrappers/aspnet-mvc/')

            parser.components do |component|
                generator.component(component)
            end
        end

        namespace :mobile do

            desc 'Generate MVC Mobile wrappers'
            task :wrappers do
                MARKDOWN = FileList['docs/api/mobile/*.md'].exclude(/listview|swipe|loader|pane|touch|scroller/)

                components = MARKDOWN.map { |filename| CodeGen::MarkdownParser.read(filename, CodeGen::MVC::Mobile::Wrappers::Component) }
                    .sort { |a, b| a.name <=> b.name }

                component_register = ''

                components.each do |component|

                    import_metadata(component)

                    generator = CodeGen::MVC::Mobile::Wrappers::Generator.new('wrappers/mvc/src/Kendo.Mvc/UI')

                    generator.component(component)

                    generator.cs_proj(component)

                    component.register(component_register)
                end

                factory_file = 'wrappers/mvc/src/Kendo.Mvc/UI/WidgetFactory.cs'

                content = File.read(factory_file)

                content = content.sub(/\/\/>> MobileComponents(.|\n)*\/\/<< MobileComponents/,
                             "//>> MobileComponents #{component_register}//<< MobileComponents")

                File.write(factory_file, content.dos)
            end
        end

    end

    desc 'Generate PHP wrappers'
    task :php => ['php:wrappers', 'php:api']

    namespace :php do
        desc 'Generate PHP classes'
        task :wrappers do
            components = CodeGen::MarkdownParser.all(CodeGen::PHP::Wrappers::Component)

            components.each do |component|

                import_metadata(component)

                generator = CodeGen::PHP::Wrappers::Generator.new('wrappers/php/lib')

                generator.component(component)

            end
        end

        desc 'Generate PHP API reference'
        task :api do
            components = CodeGen::MarkdownParser.all(CodeGen::PHP::API::Component)

            components.each do |component|

                import_metadata(component)

                generator = CodeGen::PHP::API::Generator.new('docs/api/wrappers/php/')

                generator.component(component)

            end
        end
    end

    desc 'Generate JSP wrappers'
    task :jsp => ['jsp:tld', 'jsp:wrappers', 'jsp:api']

    namespace :jsp do

        desc 'Generate JSP classes'
        task :wrappers do

            components = CodeGen::MarkdownParser.all(CodeGen::Java::JSP::Component)

            components.each do |component|

                import_metadata(component)

                generator = CodeGen::Java::JSP::Generator.new('wrappers/java/kendo-taglib/src/main/java/com/kendoui/taglib/')

                generator.component(component)

            end

        end

        desc 'Generate JSP API reference'
        task :api do

            components = CodeGen::MarkdownParser.all(CodeGen::Java::API::Component)

            components.each do |component|

                import_metadata(component)

                generator = CodeGen::Java::API::Generator.new('docs/api/wrappers/jsp/')

                generator.component(component)

            end

        end

        desc 'Generate JSP TLD'
        task :tld do

            generator = CodeGen::Java::TLD::Generator.new('wrappers/java/kendo-taglib/src/main/resources/META-INF/taglib.tld')

            components = CodeGen::MarkdownParser.all(CodeGen::Java::TLD::Component)

            components.each do |component|

                import_metadata(component)

                generator.component(component)

            end

            generator.sync

        end
    end

end
