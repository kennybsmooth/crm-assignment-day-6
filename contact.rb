class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
    puts "Contact does not exist."
    return nil
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(update, value)
    if update == 'first_name'
      self.first_name = value
    elsif update == 'last_name'
      self.last_name = value
    elsif update == 'email'
      self.email = value
    elsif update == 'note'
      self.note = value
    else
      puts "We did't recognize your entry."
    end
  end

  def print_all
      puts "Name: #{self.first_name} Lastname: #{self.last_name} Email: #{self.email}"
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attr_name, attr_value)
    @@contacts.each do |contact|
      if attr_name == 'first_name' && contact.first_name == attr_value
        return contact
      elsif attr_name == 'last_name' && contact.last_name == attr_value
        return contact
      else attr_name == 'email' && contact.email == attr_value
        return contact
      end
        puts "that comments was unrecoginzed."
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
    # @@contacts.each do |contact|
    #   if contact.id == id
    #     count = id - 1
    #     @@contacts.delete_at(count)
    #   end
    # end Woo!
  end

  # Feel free to add other methods here, if you need them.
end
