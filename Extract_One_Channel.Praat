############################
#  Extract Only One Channel
#  Written by 
#  Kevin Tang (15 July 2013)
#  Email: kevin.tang@cantab.net
#  Website: http://www.ucl.ac.uk/psychlangsci/research/linguistics/People/research-students/k_tang
#  
#  Extract Only One Channel of all the files in a specified
#  directory.  Files are saved in specified
#  directory.
#
#  A copy of the GNU General Public License is available at
# <http://www.gnu.org/licenses/>.
############################


form Resample files
	comment Directory of sound files
	text sound_directory c:\temp\
	sentence Sound_file_extension .wav
	comment Save resulting files in which directory
	text end_directory c:\temp\
	comment Channel Number
	positive channum 1
endform

# Here, you make a listing of all the sound files in a directory.

Create Strings as file list... list 'sound_directory$'*'sound_file_extension$'
numberOfFiles = Get number of strings

for ifile to numberOfFiles

	# A sound file is opened from the listing:

	filename$ = Get string... ifile
	Read from file... 'sound_directory$''filename$'

	# Extract one channel

	Extract one channel... channum

	# Save resulting file

	Write to WAV file... 'end_directory$''filename$'

	select all
	minus Strings list
	Remove
	select Strings list
endfor

select all
Remove
	