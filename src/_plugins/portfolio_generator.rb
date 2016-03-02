module Jekyll
    class PortfolioPage < Page
        def initialize(site, base, dir, data, category)
            @site = site
            @base = base
            @dir = dir
            @name = site.config['portfolio']['sections'][category]['index'] || 'index.html'
            @layout = site.config['portfolio']['sections'][category]['layout']

            self.process(@name)
            self.read_yaml(File.join(base, "_layouts"), @layout)

            data.each { |key, value| self.data[key] = value }
        end
    end

    class CategoryPage < Page
        def initialize(site, base, dir, category)
            @site = site
            @base = base
            @dir = dir
            @name = 'index.html'
            @layout = 'category.html'

            self.process(@name)
            self.read_yaml(File.join(base, "_layouts"), @layout)

            self.data["category"] = category

        end
    end

    class PortfolioGenerator < Generator
        safe true

        def generate(site)
            dir = site.config["portfolio"]["dir"]

            # Then generate the project pages
            site.data["portfolio"].each do |lib_file|
                #category is the name of the datapages sub-folder
                category = lib_file[0]
                path = File.join(dir, category)
                site.pages << CategoryPage.new(site, site.source, path, category)

                # parse the yml data from each file in the category
                lib_file[1].each do |data_file|

                    data = data_file[1]

                    file_name_slug = slugify(data["title"])

                    path = File.join(dir, category, file_name_slug)

                    data["id"] = data_file[0]
                    
                    data["dir"] = path

                    data["category"] = category

                    site.pages << PortfolioPage.new(site, site.source, path, data, category)
                end
            end
        end

        def slugify(title)
            title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end

    end

    module ProjectFilter
        def get_projects_from_files(input)
            projects = []
            input.each { |project| projects.push(project[1]) }
            return projects
        end
    end

end

Liquid::Template.register_filter(Jekyll::ProjectFilter)
