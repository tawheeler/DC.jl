# module DC

using DataFrames
import Base.writemime

include("charts.jl")
include("dcout.jl")
include("io.jl")

function generate_test_df(nrows::Int)
	df = DataFrame()
	df[:a] = Array(Int, nrows)
	df[:b] = Array(Float64, nrows)
	df[:c] = Array(ASCIIString, nrows)

	for i in 1 : nrows
		df[:a][i] = rand(1:4)
		df[:b][i] = df[:a][i] + randn()
		if df[:b][i] > 2.0
			df[:c][i] = rand() > 0.5 ? "a" : "b"
		else
			df[:c][i] = rand() > 0.3 ? "c" : "d"
		end
	end
	df
end

# end # module

df = DataFrame()
df[:a] = [1,2,3]
df[:b] = [0.1,0.2,0.3]

dcout = DCOut(df)
write_script(STDOUT, dcout)