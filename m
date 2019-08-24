From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v2 0/3] net: dsa: mt7530: Convert to PHYLINK and
 add support for port 5
Date: Sat, 24 Aug 2019 23:31:34 +0100
Message-ID: <20190824223133.GH13294@shell.armlinux.org.uk>
References: <20190821144547.15113-1-opensource@vdorst.com>
 <20190822.162047.1140525762795777800.davem@davemloft.net>
 <20190823010928.GK13020@lunn.ch>
 <20190824.141803.1656753287804303137.davem@davemloft.net>
 <20190824221519.GF8251@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190824221519.GF8251@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Miller <davem@davemloft.net>, f.fainelli@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, sean.wang@mediatek.com, linux-mips@vger.kernel.org, opensource@vdorst.com, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, vivien.didelot@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Sun, Aug 25, 2019 at 12:15:19AM +0200, Andrew Lunn wrote:
> 65;5402;1cOn Sat, Aug 24, 2019 at 02:18:03PM -0700, David Miller wrote:
> > From: Andrew Lunn <andrew@lunn.ch>
> > Date: Fri, 23 Aug 2019 03:09:28 +0200
> > 
> > > That would be Russell.
> > > 
> > > We should try to improve MAINTAINER so that Russell King gets picked
> > > by the get_maintainer script.
> > 
> > Shoule he be added to the mt7530 entry?
> 
> Hi David
> 
> No. I think we need a phylink entry. And then make use of the K: line
> format to list keywords. I hope that even though changes like this
> don't touch any files listed as being part of phylink, they will match
> the keyword and pickup Russell.

Note that phylink itself is already covered by

"SFF/SFP/SFP+ MODULE SUPPORT"

but doesn't pick up on keywords.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
