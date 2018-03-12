#!/usr/bin/perl -w
# show.pl - display the survey results

use CGI ":standard";

# error - a function to produce an error message for the client
#         and exit in case of open errors

sub error {
    print "Error - file could not be opened in conelec2.pl <br/>";
    print end_html();
    exit(1);
}

# Begin main program
# Initialize file locking/unlocking parameter

$LOCK = 2;
$UNLOCK = 8;

print header();
# Open, lock, read, and unlock the survey data file

open(SURVDAT, "<survdat.dat") or error();
flock(SURVDAT, $LOCK);
#@vote_data = <SURVDAT>;
@data=<SURVDAT>;
flock(SURVDAT, $UNLOCK);
$len=@data;#the length of data
# Create the beginning of the result Web page

print start_html("Survey Results");
print "<h2> Results of the Consumer Electronics Purchasing Survey",
      "</h2><br/> \n";

# Split the input lines for females into age arrays

#@age1 = split(/ /, $vote_data[0]);
#@age2 = split(/ /, $vote_data[1]);
#@age3 = split(/ /, $vote_data[2]);
#@age4 = split(/ /, $vote_data[3]);

# Add the row titles to the age arrays

#unshift(@age1, "10-25");
#unshift(@age2, "26-40");
#unshift(@age3, "41-60");
#unshift(@age4, "Over 60");

# Make the column titles array

@col_titles = ("name", "age", "gendar","email");

# Create the column titles in HTML by giving their address to the th
#  function and storing the return value in the @rows array

@rows = th(\@col_titles);


for( $a = 0; $a < $len; $a = $a + 1 ){
   @shuju=split(/&/,@data[$a]);
   $names[$a]=$shuju[0];
     $Id[$a]=$a;
   push(@rows, td(\@shuju));
}
# Now create the data rows with the td function
#  and add them to the row addresses array



# Create the table for the female survey results
#  The address of the array of row addresses is passed to Tr

print table({-border => "border"},
            caption("<h3>Survey Data for Females</h3>"),
            Tr(\@rows)
           );

# Split the input lines for the males into age arrays

#@age1 = split(/ /, $vote_data[4]);
#@age2 = split(/ /, $vote_data[5]);
#@age3 = split(/ /, $vote_data[6]);
#@age4 = split(/ /, $vote_data[7]);

# Add the first column titles to the rows of votes

#unshift(@age1, "10-25");
#unshift(@age2, "26-40");
#unshift(@age3, "41-60");
#unshift(@age4, "Over 60");

# Create the column titles in HTML by giving their address to the 
#  function and storing the return value in the @rows array

#@rows = th(\@col_titles);

# Now create the data rows with the td function
#  and add them to the row addresses array

#push(@rows, td(\@age1), td(\@age2), td(\@age3), td(\@age4));

# Create the table for the female survey results
#  The address of the array of row addresses is passed to Tr

#print "<br/><br/>";
#print table({-border=>"border"},
#            caption("<h3>Survey Data for Males</h3>"),
#            Tr(\@rows)
#           );
print "<br>Select the items to delete:";
print '<br /><form action="./del.pl" method="post">';

for($index = 0;$index<$len;$index++)
{
    print '<input type="checkbox" name="',$index,'" value="',$names[$index],'" />';
    print $names[$index];
}   

print '<br /><input type="submit" name="delete" value="Delete Items">
</form>';

print end_html();

