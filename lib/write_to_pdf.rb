module Write_to_pdf
    def writing(details)
    	require 'prawn'
    	begin
            puts details["name"]
    		content ="Name \t\t: #{details["name"]}\n\nEmail \t\t: #{details["email"]}\n\nPhone Number \t: #{details["phone"]}\n\nDescription\t: #{details["description"]}\n"  
    		pdf = Prawn::Document.new
    		pdf.text content
    		pdf.render_file details["name"].to_s + (".pdf")
    		sleep(0.8)
    		puts "Content written successfully to Pdf File #{details["name"]}.pdf"
    	rescue IOError => e
    		"some error occur, dir not writable."
    	end
    end
end
