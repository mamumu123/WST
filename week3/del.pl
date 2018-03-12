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
# Produce the header for the reply page - do it here so
#  error messages appear on the page

print header();
print start_html("Thankyou");
# Set names for file locking and unlocking

$length=param;
@item=param;

$LOCK = 2;
$UNLOCK = 8;


open(SURVDAT, "<survdat.dat") or error();
flock(SURVDAT, $LOCK);

$count=0;
while($file_lines[$count]=<SURVDAT>){
    $count++;
}

flock(SURVDAT, $UNLOCK);
close(SURVDAT);

open(SURVDAT, ">survdat.dat") or error();
flock(SURVDAT, $LOCK);

seek(SURVDAT,0,0);
$flag=0;

for($it=0;$it<$count;$it++){
    #@file_items=split(/&/,$file_lines[$it]);
    for($iter=0;$iter<$length-1;$iter++){
        if($item[$iter]==$it){
            $flag=1;
        }
    }
    if($flag==0){
        print SURVDAT $file_lines[$it];
    }
    $flag=0;

}

flock(SURVDAT, $UNLOCK);
close(SURVDAT);

# Build the Web page to thank the survey participant

print "Deletion Completed! <br/>\n";
print end_html();

