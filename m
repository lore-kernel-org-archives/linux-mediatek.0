From: biao huang <biao.huang@mediatek.com>
Subject: Re: [PATCH] net: stmmac: disable/enable ptp_ref_clk in
 suspend/resume flow
Date: Fri, 11 Oct 2019 16:21:09 +0800
Message-ID: <1570782069.5044.12.camel@mhfsdcap03>
References: <20191009085649.6736-1-biao.huang@mediatek.com>
         <20191010160103.63c3c0ed@cakuba.netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010160103.63c3c0ed@cakuba.netronome.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Cc: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>, andrew@lunn.ch, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com, yong.wu@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Appreciate your comments!

On Thu, 2019-10-10 at 16:01 -0700, Jakub Kicinski wrote:
> On Wed, 9 Oct 2019 16:56:49 +0800, Biao Huang wrote:
> > disable ptp_ref_clk in suspend flow, and enable it in resume flow.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index c7c9e5f162e6..b592aeecc3dd 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -4469,6 +4469,8 @@ int stmmac_suspend(struct device *dev)
> >  		stmmac_mac_set(priv, priv->ioaddr, false);
> >  		pinctrl_pm_select_sleep_state(priv->device);
> >  		/* Disable clock in case of PWM is off */
> > +		if (priv->plat->clk_ptp_ref)
> > +			clk_disable_unprepare(priv->plat->clk_ptp_ref);
> 
> I don't know much embedded, but it seems like this should perhaps just
> be clk_disable() without the unprepare? stmmac_hw_teardown() is called
> when driver is removed so it needs to unprepare as well.
> 
> Please feel free to explain to me why this needs to be
> clk_disable_unprepare(), as I said - not an expert.
> 
As our clock owner's advice, there are prepare/unprepare clk_ops for
pll, but no enable/disable clk_ops for it, and pll will be off only when
the prepare reference count decrease to 0.

so for the sake of power saving, we'd better call clk_disable_unprepare
to turn the parent pll off.

> Also - if this is a bug fix and you'd like to have it backported to
> older releases you need to add a Fixes tag.
> 
Thanks for the reminder, I'll add the fixes tag in the next version.
> Thanks!
> 
> >  		clk_disable(priv->plat->pclk);
> >  		clk_disable(priv->plat->stmmac_clk);
maybe it should be clk_disable_unprepare(priv->plat->pclk);
		   clk_disable_unprepare(priv->plat->stmmac_clk);
> >  	}
> > @@ -4535,6 +4537,8 @@ int stmmac_resume(struct device *dev)
> >  		/* enable the clk previously disabled */
> >  		clk_enable(priv->plat->stmmac_clk);
> >  		clk_enable(priv->plat->pclk);
> > +		if (priv->plat->clk_ptp_ref)
> > +			clk_prepare_enable(priv->plat->clk_ptp_ref);
> >  		/* reset the phy so that it's ready */
> >  		if (priv->mii)
> >  			stmmac_mdio_reset(priv->mii);
> 
