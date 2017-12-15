From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [net-next] phylib: Add device reset GPIO support causes DSA
 MT7530 acquires reset-gpios fails
Date: Fri, 15 Dec 2017 11:10:14 +0100
Message-ID: <20171215101014.GB4213@lunn.ch>
References: <1513320903.28444.65.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513320903.28444.65.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: sergei.shtylyov@cogentembedded.com, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, richard.leitner@skidata.com, geert+renesas@glider.be
List-Id: linux-mediatek@lists.infradead.org

On Fri, Dec 15, 2017 at 02:55:03PM +0800, Sean Wang wrote:
> Hi Sergei,
> 
> Recently I found the patch commit bafbdd527d56 (phylib: Add device reset
> GPIO support) would have the impact on MT7530 driver. Which causes the
> DSA MT7530 device (it's the child node under mdio bus) gets the
> reset-gpios fails because the same GPIO seems already be held in the
> earlier mdiobus_register_device call patched through the commit.
> 
> do you have any idea how the commits also considers DSA case ?
> 
> I guessed the DSA lan9303, mv88e8 switch should have the same issue
> since they have the same GPIO name as mdiobus_register_device required.

Hi Sean

Ah, not good :-(

I _think_ for the mv88e6xxx, we can remove the gpio reset code from
the driver, and let the mdio core do it. I need to test to be sure.

Would that work for you?

      Andrew
