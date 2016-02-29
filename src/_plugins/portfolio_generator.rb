module Jekyll
    class DataPage < Page
        def initialize(site, base, dir, project_data)
            @site = site
            @base = base
            @dir = dir
            @name = site.config['datapages']['index'] || 'index.html'
            @layout = site.config['datapages']['layout']

            self.process(@name)
            self.read_yaml(File.join(base, "_layouts"), @layout)

            project_data.each { |key, value| self.data[key] = value }
        end
    end

    class PortfolioGenerator < Generator
        safe true

        def generate(site)
            dir = site.config["datapages_dir"] || "datapages"

            # Then generate the project pages
            site.data["datapages"].each do |lib_file|
                lib_file[1].each do |data_file|
                category = lib_file[0]
                    data = data_file[1]

                    # I Love Cats -> i-love-cats
                    file_name_slug = slugify(data["title"])

                    # portfolio/i-love-cats/
                    path = File.join(dir, category, file_name_slug)
                    data["dir"] = path

                    site.pages << DataPage.new(site, site.source, path, data)
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
