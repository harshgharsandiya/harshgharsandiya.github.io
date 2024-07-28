# _plugins/practicals_generator.rb

module Jekyll
    class PracticalsGenerator < Generator
      safe true
  
      def generate(site)
        subjects = [
          { 'name' => 'INS', 'path' => 'assets/docx/ins' },
          { 'name' => 'WT', 'path' => 'assets/docx/wt' },
          { 'name' => 'EAD', 'path' => 'assets/docx/ead' },
          { 'name' => 'IOE Robotics', 'path' => 'assets/docx/ioe' },
          { 'name' => 'AI', 'path' => 'assets/docx/ai' }
        ]
  
        site.data['practicals'] = { 'subjects' => [] }
  
        subjects.each do |subject|
          documents = Dir.glob("#{site.source}/#{subject['path']}/*.docx").map do |file|
            {
              'title' => File.basename(file, '.docx').gsub('_', ' ').split.map(&:capitalize).join(' '),
              'file' => "/#{subject['path']}/#{File.basename(file)}"
            }
          end
  
          site.data['practicals']['subjects'] << {
            'name' => subject['name'],
            'documents' => documents
          }
        end
      end
    end
  end
  