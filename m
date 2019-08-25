From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next v2 0/3] net: dsa: mt7530: Convert to PHYLINK
 and add support for port 5
Date: Sun, 25 Aug 2019 13:15:35 +0000
Message-ID: <20190825131535.Horde.K3HRnOFcIiu-aVdXmqwndlD@www.vdorst.com>
References: <20190821144547.15113-1-opensource@vdorst.com>
 <20190824222935.GG13294@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190824222935.GG13294@shell.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Russell,

Quoting Russell King - ARM Linux admin <linux@armlinux.org.uk>:

> On Wed, Aug 21, 2019 at 04:45:44PM +0200, René van Dorst wrote:
>> 1. net: dsa: mt7530: Convert to PHYLINK API
>>    This patch converts mt7530 to PHYLINK API.
>> 2. dt-bindings: net: dsa: mt7530: Add support for port 5
>> 3. net: dsa: mt7530: Add support for port 5
>>    These 2 patches adding support for port 5 of the switch.
>>
>> v1->v2:
>>  * Mostly phylink improvements after review.
>> rfc -> v1:
>>  * Mostly phylink improvements after review.
>>  * Drop phy isolation patches. Adds no value for now.
>> René van Dorst (3):
>>   net: dsa: mt7530: Convert to PHYLINK API
>>   dt-bindings: net: dsa: mt7530: Add support for port 5
>>   net: dsa: mt7530: Add support for port 5
>>
>>  .../devicetree/bindings/net/dsa/mt7530.txt    | 218 ++++++++++
>>  drivers/net/dsa/mt7530.c                      | 371 +++++++++++++++---
>>  drivers/net/dsa/mt7530.h                      |  61 ++-
>>  3 files changed, 577 insertions(+), 73 deletions(-)
>
> Having looked through this set of patches, I don't see anything
> from the phylink point of view that concerns me.  So, for the
> series from the phylink perspective:
>
> Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

Thanks and thanks for reviewing.

Greats,

René

>
> Thanks.
>
> I did notice a dev_info() in patch 3 that you may like to consider
> whether they should be printed at info level or debug level.  You
> may keep my ack on the patch when fixing that.
>
> I haven't considered whether the patch passes davem's style
> requirements for networking code; what I spotted did look like
> the declarations were upside-down christmas tree.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up
