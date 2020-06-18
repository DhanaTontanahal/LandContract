pragma solidity ^0.4.11;

contract LandContract{
    
        address owner;
        
        struct Plot{
            address owner;
            bool forSale;
            uint price;
        }
    
        Plot[2] public plots;
    
        event PlotOwnerChanged(
            uint index
        );
        
        event PlotAvailabilityChanged(
            uint index,
            uint price,
            bool forSale
        );
            
        constructor() public{
                owner=msg.sender;
                plots[0].price=4000;
                plots[0].forSale=true;
                plots[1].price=4000;
                plots[1].forSale=true;
        }
        
        function putPlotForSale(uint index , uint price) public{
            Plot storage plot = plots[index];
            plot.forSale = true;
            emit PlotAvailabilityChanged(index,price,true);
            
        }
        
        function takeOfMarket(uint index) public{
             Plot storage plot = plots[index];
             plot.forSale=false;
             emit PlotAvailabilityChanged(index,plot.price,false);
        } 
        
        function changeOwner(uint index, address owner) public{
            Plot storage plot = plots[index];
            // if(msg.sender == owner)
                plot.owner=owner;
                plot.forSale=false;
                emit PlotOwnerChanged(index);
        }
        
        
}