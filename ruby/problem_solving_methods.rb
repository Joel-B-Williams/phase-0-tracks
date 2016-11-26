
def find_interger (arr,int)

int.to_i

i = 0
# Check each index for int until arr.length is reached
while i < arr.length 
	if int == arr[i]
	 return i
	end
	i+=1
end 
# return index of int or nil if int is not present
end

puts find_interger([1,2,3,4,5,],3)


def fibbonaci (int)

arr=[0,1]
   (int-2).times {arr << arr[-1] +arr[-2]}
  puts arr
  
 # puts "hi"  if  218922995834555169026 == arr[-1] <- validation check

end 
fibbonaci(100)

#Sorting method
# check first and second index if in correct order check each index pair until number of elements in array is reached.  
# repeat process until array is sorted 


def bubble_sort(array)
  i = array.length
  loop do
    switch = false

    (i-1).times do |index|
      if array[index] > array[index+1]
        array[index], array[index+1] = array[index+1], array[index]
        switch = true
      end
    end

    break if switch != true
  end

  print array
end

bubble_sort([5,2,3,4])
