From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v3 4/5] phy: mvebu-cp110-comphy: convert to use eth phy
 mode and submode
Date: Wed, 21 Nov 2018 08:58:50 +0100
Message-ID: <20181121075850.GA6494@kwain>
References: <20181120012424.11802-1-grygorii.strashko@ti.com>
 <20181120012424.11802-5-grygorii.strashko@ti.com>
 <d80901b2-a38a-7abf-23b2-c2b0c84ff321@ti.com>
 <20181121075220.z6smcpk3y7vab7ix@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181121075220.z6smcpk3y7vab7ix@qschulz>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "David S. Miller" <davem@davemloft.net>, Antoine Tenart <antoine.tenart@free-electrons.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Carlo Caione <carlo@caione.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Quentin,

On Wed, Nov 21, 2018 at 08:52:20AM +0100, Quentin Schulz wrote:
> On Wed, Nov 21, 2018 at 01:08:42PM +0530, Kishon Vijay Abraham I wrote:
> > 
> > On 20/11/18 6:54 AM, Grygorii Strashko wrote:
> > > Convert mvebu-cp110-comphy PHY driver to use recently introduced
> > > PHY_MODE_ETHERNET and phy_set_mode_ext().
> > 
> > Care to give ACK for this patch?
> > 
> 
> Acked-by Antoine and Tested-by Maxime given in v2:
> https://patchwork.kernel.org/patch/10676749/

The Acks were removed from v3 due to changes in the patches.

Thanks,
Antoine

-- 
Antoine Ténart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
