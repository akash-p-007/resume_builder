module WriteToPdf
    def writing(resume)
    	require 'prawn'
    	begin
    		content ="Name \t\t: #{resume["name"]}\n\nEmail \t\t: #{resume["email"]}\n\nPhone Number \t: #{resume["phone"]}\n\nDescription\t: #{resume["description"]}\n"  
    		pdf = Prawn::Document.new
    		pdf.text content
    		pdf.render_file resume["name"].to_s + ".pdf"
    		puts "Content written successfully to Pdf File #{resume["name"]}.pdf"
    	rescue IOError => e
    		"some error occur, dir not writable."
    	end
    end
end
