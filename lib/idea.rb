require 'colorize'
require 'fileutils'

module Clean
  module Idea
    class Manager
      def initialize(arguments)
        puts "Let the wipe begin....".yellow

        if !is_android_project?
          puts "but.. but... this isn't even an android project!".red
          exit
        end

        ideas = get_all_idea_folders
        imls = get_all_imls

        if ideas.empty? && imls.empty?
          puts "You have nothing to clean, cool!!".green
          exit
        end

        # wipe them all
        delete_them_all ideas
        delete_them_all imls

      end


      def delete_them_all array
        return nil if !array

        array.each do |item|
          delete item
        end
      end

      def delete(item)
        puts "Deleting: #{item.green}"
        FileUtils.rm_f(item) if File.exist?(item)
        FileUtils.remove_dir(item) if File.directory?(item)
      end

      def get_all_idea_folders
        Dir.glob("#{Dir.pwd}/**/.idea/")
      end

      def get_all_imls
        Dir.glob("#{Dir.pwd}/**/*.iml")
      end

      def is_android_project?
        File.exists?("#{Dir.pwd}/settings.gradle")
      end
    end
  end
end
