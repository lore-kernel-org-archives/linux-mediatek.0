From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 0/3] net: dsa: mt7530: Convert to PHYLINK and
 add support for port 5
Date: Sun, 25 Aug 2019 00:15:19 +0200
Message-ID: <20190824221519.GF8251@lunn.ch>
References: <20190821144547.15113-1-opensource@vdorst.com>
 <20190822.162047.1140525762795777800.davem@davemloft.net>
 <20190823010928.GK13020@lunn.ch>
 <20190824.141803.1656753287804303137.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190824.141803.1656753287804303137.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: opensource@vdorst.com, sean.wang@mediatek.com, vivien.didelot@gmail.com, f.fainelli@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, john@phrozen.org, linux-mips@vger.kernel.org, frank-w@public-files.de
List-Id: linux-mediatek@lists.infradead.org

65;5402;1cOn Sat, Aug 24, 2019 at 02:18:03PM -0700, David Miller wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> Date: Fri, 23 Aug 2019 03:09:28 +0200
> 
> > That would be Russell.
> > 
> > We should try to improve MAINTAINER so that Russell King gets picked
> > by the get_maintainer script.
> 
> Shoule he be added to the mt7530 entry?

Hi David

No. I think we need a phylink entry. And then make use of the K: line
format to list keywords. I hope that even though changes like this
don't touch any files listed as being part of phylink, they will match
the keyword and pickup Russell.

I need to do some testing and see if this actually works.

  Andrew
