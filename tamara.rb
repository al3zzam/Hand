def same_rank
    if($number_of_cards>4)
        return false
    else 
        diff=Hash.new
        diff[$cards_suits[0]]=1
        i=1
        prev=$cards_ranks[0].to_i
        if($cards_suits[0].ord=="j".ord)
            prev=$cards_ranks[1].to_i
            diff[$cards_suits[1]]=1
            i=2
            if($cards_suits[1].ord=="j".ord)
                prev=$cards_ranks[2].to_i
                diff[$cards_suits[2]]=1
                i=3
            end
        end
        
        while(i<$number_of_cards)
            if($cards_suits[i].ord=="j".ord)
                i+=1
                next
            end
                if(prev!=$cards_ranks[i].to_i)
                   return false
                end
                if (diff.has_key?($cards_suits[i]))
                   return false
                end
                   diff[$cards_suits[i]]=1
                i+=1
        end
        
    end

    return true
end

def sequential
    if($number_of_cards>13)
        puts "Invalid"
        return false
    end
    if($cards_ranks[0].to_i==1&&$cards_ranks[1].to_i==13)
        $cards_ranks[0]=14
    end
    if($cards_suits[0].ord!="j".ord&&$cards_suits[1].ord!="j".ord)
    if($cards_ranks[1].to_i-1!=$cards_ranks[0].to_i)
        $cards_ranks=$cards_ranks.reverse()
        $cards_suits=$cards_suits.reverse()
    end
else
    if($cards_suits[1].ord!="j".ord&&$cards_suits[2].ord!="j".ord)
        if($cards_ranks[2].to_i-1!=$cards_ranks[1].to_i)
            $cards_ranks=$cards_ranks.reverse()
            $cards_suits=$cards_suits.reverse()
        end
    else
        if($cards_ranks[3].to_i-1!=$cards_ranks[2].to_i)
            $cards_ranks=$cards_ranks.reverse()
            $cards_suits=$cards_suits.reverse()
        end
    end
end

    if($cards_suits[0].ord=="j".ord)
        if($cards_suits[1].ord=="j".ord)
            if($cards_ranks[2].to_i<3)
                puts "Invalid"
                return false
            end
            $cards_suits[1]=$cards_suits[2]
            $cards_ranks[1]=$cards_ranks[2].to_i-1
        end
        if($cards_ranks[1].to_i<2)
            puts "Invalid"
            return false
        end
        $cards_suits[0]=$cards_suits[1]
        $cards_ranks[0]=$cards_ranks[1].to_i-1
    end
    for i in 1..$number_of_cards-1 do
        if($cards_suits[i].ord=="j".ord)
            $cards_ranks[i]=$cards_ranks[i-1].to_i+1
            $cards_suits[i]=$cards_suits[i-1]
        
            if($cards_ranks[i].to_i==14&&($cards_ranks[0].to_i==0||$cards_ranks[0].to_i==14)||$cards_ranks[i].to_i==15)
                puts "Invalid"
                return false
            end
        else
                if($cards_ranks[i].to_i==1)
                    $cards_ranks[i]=14
                end
            if($cards_suits[i].ord!=$cards_suits[i-1].ord||($cards_ranks[i].to_i-1!=$cards_ranks[i-1].to_i))
                puts "Invalid"
                return false
            end
        end
    end
    return true
end


string=gets.chomp
cards=Array.new
cards=string.split
$number_of_cards=cards.size
if($number_of_cards>13||$number_of_cards<3)
    puts "Invalid"
else
$cards_ranks=Array.new
$cards_suits=Array.new
i=0
inv=false
while (i<$number_of_cards&&!inv)
     rank=cards[i].slice(0,1)
     suit=cards[i].slice(1,2)
    if(cards[i].size==3)
        rank=cards[i].slice(0,2)
        suit=cards[i].slice(2,3)
    end
    if(!rank.match(/\d/)&&rank!="J"&&rank!="Q"&&rank!="K"&&rank!="A"&&rank!="10"||rank=="0"||(rank!="1"&&rank!="2"&&suit.ord=="j".ord))
        puts "Invalid"
        inv=true
        next
    end
    if(suit.ord!="j".ord&&suit.ord!="d".ord&&suit.ord!="c".ord&&suit.ord!="h".ord&&suit.ord!="s".ord)
        puts "Invalid"
        inv=true
        next
    end

    if(rank=="A")
        rank=1
    else
        if(rank=="J")
            rank=11
        else
            if(rank=="Q")
                rank=12
            else
                if(rank=="K")
                    rank=13
                end
            end
        end
    end
    

    $cards_ranks.push rank
    $cards_suits.push suit
    i+=1
end
if(!inv)
if(same_rank==true)
    puts "Valid"
else
    if(sequential==true)
        puts "Valid"
    end
end
end
end

    
            
                







