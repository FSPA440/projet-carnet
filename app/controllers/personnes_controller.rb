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

    def edit
        @personne = Personne.find(params[:id])
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

    def update
        @personne = Personne.find(params[:id])
        if @personne.update(personne_params)
          flash[:success] = 'Personne successfully OK'
          redirect_to personne_path(@personne)
        end
    end

    def destroy
        @personne = Personne.find(params[:id])
        @personne.destroy
        flash[:success] = 'Suppression successfully OK'
        redirect_to personnes_path
    end

    private
    def personne_params
        params.require(:personne).permit(:prenom, :nom, :profession, :telephone, :adresse)
    end
end
