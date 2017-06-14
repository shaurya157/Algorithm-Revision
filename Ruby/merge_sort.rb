def merge_sort(arr, &prc)
  return arr if arr.length <= 1
  prc ||= Proc.new {|x, y| x < y}
  mid = arr.length / 2
  left = merge_sort(arr[0, mid], &prc)
  right = merge_sort(arr[mid, arr.length], &prc)

  merge!(left, right, &prc)
end

def merge!(left, right, &prc)
  result = []
  until left.empty? || right.empty?
    prc.call(left.first, right.first) ? result << left.shift : result << right.shift
  end

  result + left + right
end
