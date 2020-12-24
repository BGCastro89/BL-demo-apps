#model file
class Message < ApplicationRecord
    #validations
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 1}

    before_create :encode_message

    private
    def encode_message
      if body
        ctext = ""
        body.split('').each { |c| 
            cval = c.ord + 5
            ctext = ctext+cval.chr("UTF-8")
        }
        self.body = ("Plaintext: "+ self.body + "---------" +
        "Ciphertext: " + ctext)
      end
    end
  
end
