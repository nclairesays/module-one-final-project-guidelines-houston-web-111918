require_relative '../config/environment'

cli = CLI.new

cli.welcome
# cli.get_num_and_show_fact
number = cli.get_number_from_user
fact = cli.web_request(number)


puts fact






