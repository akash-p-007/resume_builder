class Resume < ActiveRecord::Base
	validates :name, presence: true,
					 length: { minimum: 5 }
	validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Please enter full name correctly"	 
	validates :email, presence: true
	validates_format_of :email, :with =>  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Please enter a valid email id"	 
	validates :phone,   :presence => {:message => 'Please enter valid contact number'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }

end
