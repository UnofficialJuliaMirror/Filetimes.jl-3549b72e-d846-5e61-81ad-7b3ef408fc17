module Filetimes

export filetime, datetime, EPOCH

const EPOCH =  Dates.DateTime(1601, 1, 1)

"""
    filetime()

Returns the current time as the number of 100 nanosecond intervals
since January 1, 1601.

"""
function filetime()
    filetime(now())
end

"""
    filetime(d::Dates.DateTime)

Returns the given DateTime as the number of 100 nanosecond intervals
since January 1, 1601.

"""
function filetime(d::Dates.DateTime)
    Dates.value(d - EPOCH) * 10000
end

"""
    datetime(f::Integer)

Returns a DateTime object given a filetime f, being the number of 100
nanosecond intervals since January 1, 1601.

N.B. Possible loss of precision.

"""
function datetime(f::Integer)
    EPOCH + Dates.Microsecond(f/10)
end

end # module
