class ApplicationController < ActionController::Base
  
  def blank_square_form
    render({:template =>"calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("alpha").to_f
    @square_of_num=@num**2
    render({ :template=>"calculation_templates/square_results.html.erb"})
  end


  def blank_root_form
    render({:template =>"calculation_templates/root_form.html.erb"})
  end

  def calculate_root
    @rnum = params.fetch("beta").to_f
    @root_of_num= @rnum**0.5
    render({ :template=>"calculation_templates/root_results.html.erb"})
  end


  def blank_payment_form
    render({:template =>"calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("apr").to_f.round(4)
    @years = params.fetch("years").to_f
    @pcpl = params.fetch("pcpl").to_f.round(2)
    #@finalamt = @pcpl*(1+@apr/100)**@years
    #@discountfactor=((1 + @apr/12)*12*@years-1)/(@apr/12*(1 + @apr/12)*12*@years)
    @monthlypayment = @apr/100/12*@pcpl/(1-(1+@apr/100/12)**(-1*@years*12))
    @monthlypayment=@monthlypayment.round(2)
    #@apr_perc = number_to_percentage(@apr, precision: 4)
    render({ :template=>"calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({:template =>"calculation_templates/rand_form.html.erb"})
  end

  def calculate_random
    @lower=params.fetch("user_min").to_f
    @upper=params.fetch("user_max").to_f
    @result=rand(@lower..@upper)
    render({:template=>"calculation_templates/rand_results.html.erb"})
  end

  

end
