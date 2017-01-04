class ShopController < ApplicationController
  respond_to :html, :json
  def index
    @search = Product.includes(:galleries).search(params[:q])
    @products = @search.result.includes(:category)
  	 # @products = Product.all


  end

def deletedetalle
  detallep = BudgetDetail.where(id: params[:id]).first
  presupuesto = Budget.find(detallep.budget_id)
  detallep.destroy
  detalle = presupuesto.budget_details.where(budget_id: presupuesto.id).first
  if !detalle

    msj="No hay mas productos en el presupuesto"
    flash[:notice]=msj
    presupuesto.destroy
    cookies.delete :budget_id
    cookies[:total_cart]= 0
    cookies[:moneda_total] = 0
    redirect_to root_path
  else
    cookies[:total_cart] = presupuesto.budget_details(:product_id).count
    moneda_total
    redirect_to shop_path
  end

  
end
        def restar
            presupuesto = Budget.find(cookies[:budget_id])

            detallep = BudgetDetail.where(id: params[:id]).first
            cantidad = detallep.cant

            if cantidad > 1
               detallep.cant -=1
            else
              detallep.destroy
            end
            detallep.save if detallep
              detalle = presupuesto.budget_details.where(budget_id: presupuesto.id).first 
              if detalle
                cookies[:total_cart]= presupuesto.budget_details(:product_id).count
                moneda_total
                redirect_to shop_path
              else
                presupuesto.destroy
                cookies.delete :budget_id
                cookies[:total_cart]= 0 # cantidad en stock en el carrito
                cookies[:moneda_total] = 0 #cantidad en moneda total
                redirect_to root_path

            end
        end









  def suma
      detallep = BudgetDetail.where(id: params[:id]).first
      detallep.cant +=1
    
          detallep.save if detallep 
            moneda_total
            redirect_to shop_path
           
      
  end

   def add

             # cookies.delete :budget_id
          if cookies[:budget_id]
                b_id = cookies[:budget_id]
                @presupuesto = Budget.find(b_id)   
             else
                @presupuesto = Budget.new(fecha: Date.today)
          end


          producto = Product.find(params[:id])
          detalle = @presupuesto.budget_details.where(product_id: producto.id).first
          puts "***************** detalle *********************"
          puts detalle.inspect
          puts "*********"
          if detalle 
                puts "********** el detalle si existe *************"
                detalle.cant +=1
               
              else
                 @presupuesto.budget_details.build(cant: 1, product_id: producto.id)
              
           end

        #Person.select(:age).count
       detalle.save if detalle
        if @presupuesto.save
          cookies[:total_cart] =@presupuesto.budget_details(:product_id).count

            cookies[:budget_id] =  @presupuesto.id
            moneda_total
            mss="se agrego  #{producto.name} presupuesto"
            flash[:notification] = "Post successfully created"

        else
            mss=" no se agrego producto al presupuesto"
            flash[:error]=mss
        end
        
         redirect_to root_path
      
  end


def moneda_total
  @sumtotal = 0
  @presupuesto = Budget.includes(budget_details: :product).find(cookies[:budget_id])
     @presupuesto.budget_details.each do |detalle| 
       @sumtotal = @sumtotal + (detalle.cant * detalle.product.price) 
    end
    cookies[:moneda_total]=@sumtotal 
    puts "************* total *************"
    puts cookies[:moneda_total].inspect
end

  def show
    # @varinstancia varlocal
    @presupuesto = Budget.includes(budget_details: :product).find(cookies[:budget_id])

   # @presupuesto = Budget.includes(:budget_details).find(params[:budget_id])

  end
  def showallbudget
    @presupuesto = Budget.includes(budget_details: :product).all

  end

 def pdf
          @presupuesto = Budget.includes(budget_details: :product).find(cookies[:budget_id])
          respond_to do |format|
          format.html
          format.pdf do 
            render :pdf         => "Presupuesto",
            :template  => "shop/pdf",
            :layout => 'pdf.html',   
            :page_size => 'A4',
            :dpi=>'72',
             title: 'Presupuesto', 

            :margin => {:top => 20, :bottom =>10 }
          
      end
    end
  end
end

