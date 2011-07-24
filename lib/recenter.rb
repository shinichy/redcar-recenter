module Redcar
  class Recenter
    def self.keymaps
      osx = Keymap.build("main", :osx) do
        link "Ctrl+Shift+L", RecenterCommand
      end
      
      linwin = Keymap.build("main", [:linux, :windows]) do
        link = "Alt+Shift+L", RecenterCommand
      end
      
      [linwin, osx]
    end
  
    def self.menus
      Menu::Builder.build do
        sub_menu "Edit" do
          sub_menu "Document Navigation", :priority => 139 do
            item "Recenter", RecenterCommand
          end
        end
      end
    end
    
    class RecenterCommand < Redcar::DocumentCommand
      def execute
        doc.scroll_to_line_at_middle(doc.cursor_line)
      end
    end
  end
end