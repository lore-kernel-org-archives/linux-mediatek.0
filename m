From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 0/3] net: dsa: mt7530: Convert to PHYLINK and
 add support for port 5
Date: Fri, 23 Aug 2019 03:09:28 +0200
Message-ID: <20190823010928.GK13020@lunn.ch>
References: <20190821144547.15113-1-opensource@vdorst.com>
 <20190822.162047.1140525762795777800.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190822.162047.1140525762795777800.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: opensource@vdorst.com, sean.wang@mediatek.com, vivien.didelot@gmail.com, f.fainelli@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, john@phrozen.org, linux-mips@vger.kernel.org, frank-w@public-files.de
List-Id: linux-mediatek@lists.infradead.org

On Thu, Aug 22, 2019 at 04:20:47PM -0700, David Miller wrote:
> From: René van Dorst <opensource@vdorst.com>
> Date: Wed, 21 Aug 2019 16:45:44 +0200
> 
> > 1. net: dsa: mt7530: Convert to PHYLINK API
> >    This patch converts mt7530 to PHYLINK API.
> > 2. dt-bindings: net: dsa: mt7530: Add support for port 5
> > 3. net: dsa: mt7530: Add support for port 5
> >    These 2 patches adding support for port 5 of the switch.
> > 
> > v1->v2:
> >  * Mostly phylink improvements after review.
> > rfc -> v1:
> >  * Mostly phylink improvements after review.
> >  * Drop phy isolation patches. Adds no value for now.
> 
> This definitely needs some review before I'll apply it.

That would be Russell.

We should try to improve MAINTAINER so that Russell King gets picked
by the get_maintainer script.

   Andrew
