require_relative 'contact'

class CRM

  def initialize
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.chomp.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
      when 7 then enter_number
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "Input the ID of the contact you want to modify."
    id = gets.chomp.to_i
    # @@contact.each do |id|

    puts "What do you want to modify?"
    attr_name = gets.chomp

    puts "What do you want to modify it into?"
    attr_value = gets.chomp
      modify_contact = Contact.find(id)
      if modify_contact == nil
        puts "ID not found."
      else
      modify_contact.update(attr_name, attr_value)
    end
  end

  def delete_contact
    print 'The contact ID you like to delete.'
    id = gets.chomp.to_i
    delete_id = Contact.find(id)
    delete_id.delete
  end


  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts
    Contact.each do |contacts|
      print "First name: #{contacts.first_name}, Last name: #{contacts.last_name}, Email address: #{contacts.email}, Notes: #{contacts.note}"
    end

    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  end

  def display_all_contacts
    Contact.all.each do |contacts|
      print "First name: #{contacts.first_name}, Last name: #{contacts.last_name}, Email address: #{contacts.email}, Notes: #{contacts.note}"
    end
    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def search_by_attribute
    puts "What is your ID number?"
    id = gets.chomp.to_i

    found_contact = Contact.find(id)
    puts "#{found_contact.first_name} #{found_contact.last_name}"

    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  # Add other methods here, if you need them.

end

a = Contact.create('Father', 'MC', 'fathermc@hiphop.com', 'Artist')
b = Contact.create( 'Kenny', 'Greene', 'kgreene@hotmail.com', 'Artist')
c = Contact.create('Gerald', 'Levert', 'gl@jackson.com', 'Singer')

a_crm_app = CRM.new
a_crm_app.main_menu
