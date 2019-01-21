using NG
using Test
#=
gas=[
"CO2"    0.006  0.005  0.015  0.016  0.076  0.011;
"N2"     0.003  0.031  0.010  0.100  0.057  0.117;
"H2"     0.00   0.00   0.00   0.095  0.00   0.00;
"CO"     0.00   0.00   0.00   0.010  0.00   0.00;
"CH4"    0.965  0.907  0.859  0.735  0.812  0.826;
"C2H6"   0.018  0.0450 0.085  0.033  0.043  0.035;
"C3H8"   0.0045 0.0084 0.023  0.0074 0.009  0.0075;
"iC4H10" 0.0010 0.0010 0.0035 0.0012 0.0015 0.0012;
"nC4H10" 0.0010 0.0015 0.0035 0.0012 0.0015 0.0012;
"iC5H12" 0.0005 0.0003 0.0005 0.0004 0.00   0.0004;
"nC5H12" 0.0003 0.0004 0.0005 0.0004 0.00   0.0004;
"nC6H14" 0.0007 0.0004 0.00   0.0002 0.00   0.0002;
"nC7H16" 0.00   0.00   0.00   0.0001 0.00   0.000 ;
"nC8H18" 0.00   0.00   0.00   0.0001 0.00   0.00]
=#
case=[
60  -3.15 0.84053 0.83348 0.79380 0.88550 0.82609 0.85380;
60   6.85 0.86199 0.85596 0.82206 0.90144 0.84969 0.87370;
60  16.85 0.88006 0.87484 0.84544 0.91501 0.86944 0.89052;
60  36.85 0.90867 0.90466 0.88183 0.93674 0.90052 0.91723;
60  56.85 0.93011 0.92696 0.90868 0.95318 0.92368 0.93730;
120 -3.15 0.72133 0.71044 0.64145 0.81024 0.69540 0.75074;
120  6.85 0.76025 0.75066 0.68971 0.83782 0.73780 0.78586;
120 16.85 0.79317 0.78475 0.73123 0.86137 0.77369 0.81569;
120 36.85 0.84515 0.83863 0.79697 0.89913 0.83022 0.86311;
120 56.85 0.88383 0.87870 0.84553 0.92766 0.87211 0.89862]
atol=0.005
@testset "Gas 1" begin
    for i=1:10
        @test isapprox(ng_zfactor(case[i,1]/10,case[i,2]+273.15,CO2=0.006,N2=0.003,CH4=0.965,C2H6=0.018,
        C3H8=0.0045,iC4H10=0.001,nC4H10=0.001,iC5H12=0.0005,nC5H12=0.0003,nC6H14=0.0007),case[i,3];rtol=atol)
    end
end

@testset "Gas 2" begin
    for i=1:10
        @test isapprox(ng_zfactor(case[i,1]/10,case[i,2]+273.15,CO2=0.005,N2=0.031,CH4=0.907,C2H6=0.045,
        C3H8=0.0084,iC4H10=0.001,nC4H10=0.0015,iC5H12=0.0003,nC5H12=0.0004,nC6H14=0.0004),case[i,4];rtol=atol)
    end
end

@testset "Gas 3" begin
    for i=1:10
        @test isapprox(ng_zfactor(case[i,1]/10,case[i,2]+273.15,CO2=0.015,N2=0.01,CH4=0.859,C2H6=0.085,
        C3H8=0.023,iC4H10=0.0035,nC4H10=0.0035,iC5H12=0.0005,nC5H12=0.0005,nC6H14=0.0000),case[i,5];rtol=atol)
    end
end

@testset "Gas 4" begin
    for i=1:10
        @test isapprox(ng_zfactor(case[i,1]/10,case[i,2]+273.15,CO2=0.016,N2=0.1,H2=0.095,CO=0.01,CH4=0.735,C2H6=0.033,
        C3H8=0.0074,iC4H10=0.0012,nC4H10=0.0012,iC5H12=0.0004,nC5H12=0.0004,nC6H14=0.0002,nC7H16=0.0001,nC8H18=0.0001),case[i,6];rtol=atol)
    end
end

@testset "Gas 5" begin
    for i=1:10
        @test_skip isapprox(ng_zfactor(case[i,1]/10,case[i,2]+273.15,CO2=0.076,N2=0.057,CH4=0.812,C2H6=0.043,
        C3H8=0.009,iC4H10=0.0015,nC4H10=0.0015),case[i,7];rtol=atol)
    end
end

@testset "Gas 6" begin
    for i=1:10
             @test isapprox(ng_zfactor(case[i,1]/10,case[i,2]+273.15,CO2=0.011,N2=0.117,CH4=0.826,C2H6=0.035,
            C3H8=0.0075,iC4H10=0.0012,nC4H10=0.0012,iC5H12=0.0004,nC5H12=0.0004,nC6H14=0.0002,nC7H16=0.0001),case[i,8];rtol=atol)
    end
end
