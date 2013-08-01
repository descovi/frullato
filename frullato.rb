class Frullato

  def folder path
    Dir.foreach("./#{path}") do |sub_folder|
      if FolderUtils.good_for_renaming? sub_folder
        self.explore_sub_folder path, sub_folder
      end
    end
  end

  def explore_sub_folder _folder, _sub
    counter = 1
    path = "#{_folder}/#{_sub}"
    Dir.foreach(path) do |element|
      path_to_file = "#{path}/#{element}"
      if FolderUtils.good_for_renaming? element
        end_file = path + "/#{counter}.jpeg"

        File.rename(path_to_file, end_file)
        counter += 1
      end
    end
  end

end

class FolderUtils
  def self.good_for_renaming? str
    lib = ['.','..','.git','.DS_Store']
    return false if lib.include? str
    return false if File.file?(str)
    return true
  end
end

p "-------------------"
p " Enter the folder: "
p "-------------------"
frullato = Frullato.new
frullato.folder gets.chomp
