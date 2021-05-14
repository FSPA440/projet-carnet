class PersonnesController < ApplicationController

    def index
        @personne = Personne.all
    end


    def show
        @personne = Personne.find(params[:id])
    end

    def new
        @personne = Personne.new
    end
    

    def create
        @personne = Personne.new(personne_params)
        if @personne.save
            flash[:success] = 'Personne successfully created'
            redirect_to @personne
        else
            flash[:error] = "Opération non aboutie: #{@personne.errors.messages}"
            render :new
        end
    end

    private

    def personne_params
        params.require(:personne).permit(:prenom, :nom, :profession, :telephone, :adresse)
    end
end
