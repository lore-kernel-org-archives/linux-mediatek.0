From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH RFC net-next 4/5] dt-bindings: net: dsa: mt7530: Add
 mediatek,ephy-handle to isolate ext. phy
Date: Tue, 25 Jun 2019 09:30:42 +0000
Message-ID: <20190625093042.Horde._8BNPFSzW6B9-CI8P6akHTh@www.vdorst.com>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-5-opensource@vdorst.com>
 <e6175753-eb99-63e5-767e-f82becbf8d1a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <e6175753-eb99-63e5-767e-f82becbf8d1a@gmail.com>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: sean.wang@mediatek.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Florian Fainelli <f.fainelli@gmail.com>:

Hi Florian

> On 6/24/19 7:52 AM, René van Dorst wrote:
>> On some platforum the external phy can only interface to the port 5 of the
>> switch because the RGMII TX and RX lines are swapped. But it still can be
>> useful to use the internal phy of the switch to act as a WAN port which
>> connectes to the 2nd GMAC. This gives WAN port dedicated bandwidth to
>> the SOC. This increases the LAN and WAN routing.
>>
>> By adding the optional property mediatek,ephy-handle, the external phy
>> is put in isolation mode when internal phy is connected to 2nd GMAC via
>> phy-handle property.
>
> Most platforms we have seen so far implement this logic with a mdio-mux,
> can you see if that is possible here? stmmac has plenty of examples like
> those.

May I don't understand it correctly, but all the devices are on the same MDIO
bus.
I tried to make a ASCII diagram to make it a bit more clear.

  +-------------------+                     
+----------------------------------------------+
  | SOC MT7621/3      |                    | MT7530 SWITCH              
                    |
  |   +-------------+ |(T)RGMII BUS        |  +-------------+    
INTERNAL                  |
  |   |  1st GMAC   <------------------------->  PORT 6     |   MII  
BUS  +----------+     |
  |   +-------------+ |                    |  +-------------+      
+------>  GMAC5   |     |
  |                   |                    |                      |     
   +----------+     |
  |   +-------------+ | RGMII BUS          |  +-------------+     |     
                    |
  |   |  2nd GMAC   <------------------+------>  PORT 5     +-----+     
   +----------+     |
  |   +-------------+ |                |   |  +-------------+      
+------>  PHY P0  +<--+ |
  |                   |                |   |                      |     
   +----------+   | |
  |   +-------------+ |  MDIO BUS      |   |                      |     
                  | |
  |   |  MDIO       +--------+         |   |                      |     
   +----------+   | |
  |   +-------------+ |      |         |   |                       
+------>  PHY P4  +<--+ |
  |                   |      |         |   |                            
   +----------+   | |
  +-------------------+      |         |    
+--------------------------------------------|-+
                             |         |       +-------------+          
                  |
                             |         |       |  EXTERNAL   |          
                  |
                             |         +------->  PHY AT8033 | SGMII  
BUS +----------+   |
                             |                 |              
+-----------> SFP CAGE |   |
                             +---------------->+             |          
   +----------+   |
                             |                 |             |          
                  |
                             |                 +-------------+          
                  |
                              
+----------------------------------------------------------+

I don't see why I need a MDIO mux. Devices; 2nd GMAC, external phy and port 5
share the same RGMII bus. Depending on the port 5 mux settings, port 5  
is acting
as a GMAC of PHY of port 0/4. As long as the unused devices doesn't drive the
RGMII bus we are good.

2nd GMAC RGMII control is currently set with a pinctrl "RGMII2".
Port 5 and external phy are done in mt7530_port5_setup() depending on the
device-tree.

Greats,

René

> --
> Florian
