#!/usr/bin/perl -w
# conelec1.pl
# This CGI program processes the consumer electronics survey
#  form and updates the file that stores the survey

use CGI ":standard";

# error ?a function to produce an error message for the client
#         and exit in case of open errors

sub error {
    print "Error file could not be opened in conelec1.pl <br/>";
    print end_html();
    exit(1);
}

# Begin main program
# Get the form values

my($name,$age, $gender, $email) = (param("name"),param("age"), param("gender"),
        param("email"));
# Produce the header for the reply page - do it here so
#  error messages appear on the page

print header();

# Set names for file locking and unlocking

$LOCK = 2;
$UNLOCK = 8;

# Set $index to the line index of the current vote

#$index = 0;
#if ($gender eq "male") {
#    $index = 4;
#}
##if ($age eq "b2640") { $index += 1 }
#elsif ($age eq "b4160") { $index += 2 }
#elsif ($age eq "o60") { $index += 3 }

# Open and lock the survey data file

open(SURVDAT, "<survdat.dat") or error();
flock(SURVDAT, $LOCK);

# Read the survey data file, unlock it, and close it

#for ($count = 0; $count <= 7; $count++) {
#   chomp($file_lines[$count] = <SURVDAT>);
#}

flock(SURVDAT, $UNLOCK);
close(SURVDAT);

# Split the line into its parts, increment the chosen
# device, and put it back together again

#@file_votes = split / /, $file_lines[$index];
#$file_votes[$vote]++;
#$file_lines[$index] = join(" ", @file_votes);
$file_line[0]=$name;
$file_line[1]=$age;
$file_line[2]=$gender;
$file_line[3]=$email;
$file_lines = join("&", @file_line);
# Reopen the survey data file for writing and lock it

open(SURVDAT, ">>survdat.dat") or error();
flock(SURVDAT, $LOCK);

# Write out the file data, unlock the file, and close it
    $line = $file_lines;
    print SURVDAT "$line\n";

flock(SURVDAT, $UNLOCK);
close(SURVDAT);

# Build the Web page to thank the survey participant
print start_html("Thankyou");
print "Thanks for participating in our survey <br/>\n";
print end_html();

