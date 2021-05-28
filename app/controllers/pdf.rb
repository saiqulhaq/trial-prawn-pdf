require 'prawn'
require 'prawn/table'

pdf = Prawn::Document.new(page_size: "A4")
image = './pic2.jpg'
header_data = [[{:image => image,:fit =>[50, 50]}, "All You Can Eat at The Seafood Cafe & Restaurant 1,190 Baht Net/ Person", {:image => image,:fit =>[50, 50]}],
              ['','','']]
{:borders => []}.each do |property, value|
  pdf.table(header_data,:cell_style =>{property => value, :size => 18, styles:[:bold], :align => :center,:position => :center},:position => :center)
end
table_data = [['Beverage included', ],
              ['PREMIUM MENU (CHOICE OF 1/ PERSON)', ],
              ['1. Steamed Crab/ female crab poached in milk (s) 1pcs.', "2. Stir fried crab/ female crab with yellow curry (s) (1pc.)"],
              ['3. stir fried Crab claw ,meat with bird chili sauce/ yellow curry/ omelette.', '4. stir fries crab with black pepper sauce/ salted egg sauce'], # For adding gap between my data
              ['5. depp fried sea bass with sour soup and mixed vegetables', "6. deep fried sea-bass with sweet and salty sauce/ three"],
              ['7. steamed sea-bass in spicy garlic and lime soup', "8. picled crab egg (1pc)"],
              ['9. grilled female crab with eggs (1pc)', ''],
              ['CRAB',''],
              ['11. stir fried crab meat with eggs (1pc)', ''],
              ['PRAWN',''],
              ['1. Steamed Crab/ female crab poached in milk (s) 1pcs.', "2. Stir fried crab/ female crab with yellow curry (s) (1pc.)"],
              ['3. stir fried Crab claw ,meat with bird chili sauce/ yellow curry/ omelette.', '4. stir fries crab with black pepper sauce/ salted egg sauce'], # For adding gap between my data
              ['5. depp fried sea bass with sour soup and mixed vegetables', "6. deep fried sea-bass with sweet and salty sauce/ three"],
              ['7. steamed sea-bass in spicy garlic and lime soup', "8. picled crab egg (1pc)"],
              ['9. grilled female crab with eggs (1pc)', ''],
              ['','']]
{:borders => []}.each do |property, value|
  pdf.table(table_data,:cell_style =>{property => value, :size => 9, :column_widths => [150,150]})
end
footer_data = [[{:image => image,:fit =>[20, 20]}, '~Price is inclusife of VAT and service charge | Exclisively brought to you by Hungry Hub~']]

{:borders => []}.each do |property, value|
  pdf.table(footer_data,:cell_style =>{property => value, :size => 5, styles:[:italic, { :align => :center }]},:position => :center, :width => 300)
end
# pdf.bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
#   stroke_horizontal_rule
#   pdf.text 'This text is flowing from the center. ', :align => :center, :size => 5

# end

pdf.bounding_box([300, 220], width: 250, height: 220) do
  pdf.text 'This text should be vertically centered', valign: :center, :size => 5
end
pdf.render_file("we.pdf")
