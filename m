From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [net-next] phylib: Add device reset GPIO support causes DSA
 MT7530 acquires reset-gpios fails
Date: Mon, 18 Dec 2017 12:01:24 +0800
Message-ID: <1513569684.24235.12.camel@mtkswgap22>
References: <1513320903.28444.65.camel@mtkswgap22>
         <20171215101014.GB4213@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215101014.GB4213@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: sergei.shtylyov@cogentembedded.com, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, richard.leitner@skidata.com, geert+renesas@glider.be
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2017-12-15 at 11:10 +0100, Andrew Lunn wrote:
> On Fri, Dec 15, 2017 at 02:55:03PM +0800, Sean Wang wrote:
> > Hi Sergei,
> > 
> > Recently I found the patch commit bafbdd527d56 (phylib: Add device reset
> > GPIO support) would have the impact on MT7530 driver. Which causes the
> > DSA MT7530 device (it's the child node under mdio bus) gets the
> > reset-gpios fails because the same GPIO seems already be held in the
> > earlier mdiobus_register_device call patched through the commit.
> > 
> > do you have any idea how the commits also considers DSA case ?
> > 
> > I guessed the DSA lan9303, mv88e8 switch should have the same issue
> > since they have the same GPIO name as mdiobus_register_device required.
> 
> Hi Sean
> 
> Ah, not good :-(
> 
> I _think_ for the mv88e6xxx, we can remove the gpio reset code from
> the driver, and let the mdio core do it. I need to test to be sure.
> 
> Would that work for you?
> 
>       Andrew
> 

It probably can't. Because before the GPIO line is manipulated to reset,
certain power control should be handled such as power sources from
external PMIC to let devices actually enter the proper state.

So, I thought the kind of reset should be better controlled by the
specific driver, not by generic core.

	Sean
