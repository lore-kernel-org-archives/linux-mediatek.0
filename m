From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v3 0/3] net: dsa: mt7530: Convert to PHYLINK
 and add support for port 5
Date: Wed, 04 Sep 2019 15:28:37 -0700 (PDT)
Message-ID: <20190904.152837.1289570584021077118.davem@davemloft.net>
References: <20190902130226.26845-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190902130226.26845-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: opensource@vdorst.com
Cc: sean.wang@mediatek.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux@armlinux.org.uk, john@phrozen.org, linux-mips@vger.kernel.org, frank-w@public-files.de
List-Id: linux-mediatek@lists.infradead.org

From: René van Dorst <opensource@vdorst.com>
Date: Mon,  2 Sep 2019 15:02:23 +0200

> 1. net: dsa: mt7530: Convert to PHYLINK API
>    This patch converts mt7530 to PHYLINK API.
> 2. dt-bindings: net: dsa: mt7530: Add support for port 5
> 3. net: dsa: mt7530: Add support for port 5
>    These 2 patches adding support for port 5 of the switch.
> 
> v2->v3:
>  * Removed 'status = "okay"' lines in patch #2
>  * Change a port 5 setup message in a debug message in patch #3
>  * Added ack-by and tested-by tags
> v1->v2:
>  * Mostly phylink improvements after review.
> rfc -> v1:
>  * Mostly phylink improvements after review.
>  * Drop phy isolation patches. Adds no value for now.

Series applied.
