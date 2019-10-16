<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

</head>

<div id="navigation">                                            
    <div id="portal-column-one" class="cell width-1:4 position-0">      

        <ul class="menu-info">
            <li><a href="http://www.inpe.br/acessoainformacao/" title="Saiba sobre o Acesso � Informa��o" target="_blank">Acesso � Informa��o</a></li>
            <li><a href="/" title="Acesse INPE"><img src="../img/logoinpe-azul-menor.png" alt="Imagem do INPE" /><span class="none">INPE</span></a></li>
        </ul>


        <input type="checkbox" id="menu-mobile" class="trigger" />              
        <label for="menu-mobile">Menu <img src="../img/menu.png" alt="Menu" /><span class="clear"><!-- --></span></label>


        <ul class="cd-accordion-menu">
            <li>
                <input type="checkbox" id="1" />
                <label for="1" title="Acesse os subitens de Modelo Padr�o" class="titulo">Menu</label>

                <ul>
                    <li><a href="./" title="Home">Home</a></li>
                    
                    <li><a href="#" title="Catalog">View catalog</a></li>
                    
                    <li>
                        <div class="dropdown">
                            <a href="#" data-toggle="dropdown">
                                Search Object <i class="fas fa-sort-down"></i>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="searchObject.jsp">By name</a>
                                <a class="dropdown-item" href="searchObjectCoord.jsp">By coordinates</a>
                            </div>
                        </div>
                    </li>
                    
                    <li><a href="#" title="admin">Admin</a></li>
                    
                    <li><a href="about.jsp" title="About">About</a></li>
                </ul>
            </li>      
        </ul> 
    </div>
</div>    