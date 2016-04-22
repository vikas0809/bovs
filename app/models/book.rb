class Book < ActiveRecord::Base
    
    belongs_to :user
    validates :bookfile,presence: true
    validates :name,presence: true
    validates :description,presence: true
    validates :category,presence: true
    validates :condition,presence: true
    validates :status,presence: true
    validates :publishedDate,presence: true
    validates :price,presence: true
    def update(params = {})
      @file = params.delete(:file)
      if @file
        self.Image_Filename = sanitize_filename(@file.original_filename)
        self.Image_Format = @file.content_type
        self.cover = @file.read
      end
      
      @filemain = params.delete(:filemain)
      if @filemain
        self.Book_Filename = sanitize_filename(@filemain.original_filename)
        self.Book_Format = @filemain.content_type
        self.bookfile = @filemain.read
      end
      super
    end
    
    
    def initialize(params = {})
      @file = params.delete(:file)
      @filemain = params.delete(:filemain)
      super
      if @file
        self.Image_Filename = sanitize_filename(@file.original_filename)
        self.Image_Format = @file.content_type
        self.cover = @file.read
      end
      
      if @filemain
        self.Book_Filename = sanitize_filename(@filemain.original_filename)
        self.Book_Format = @filemain.content_type
        self.bookfile = @filemain.read
      end
    
    end
    private
      def sanitize_filename(filename)
        # Get only the filename, not the whole path (for IE)
        # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
        return File.basename(filename)
      end
     
end
