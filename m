From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH RFC net-next 1/5] net: dsa: mt7530: Convert to PHYLINK API
Date: Tue, 25 Jun 2019 13:10:30 +0100
Message-ID: <20190625121030.m5w7wi3rpezhfgyo@shell.armlinux.org.uk>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-2-opensource@vdorst.com>
 <20190624153950.hdsuhrvfd77heyor@shell.armlinux.org.uk>
 <20190625113158.Horde.pCaJOVUsgyhYLd5Diz5EZKI@www.vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625113158.Horde.pCaJOVUsgyhYLd5Diz5EZKI@www.vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jun 25, 2019 at 11:31:58AM +0000, René van Dorst wrote:
> > > +            if (state->link || mode == MLO_AN_FIXED)
> > > +                    mcr |= PMCR_FORCE_LNK;
> > 
> > This should be removed - state->link is not for use in mac_config.
> > Even in fixed mode, the link can be brought up/down by means of a
> > gpio, and this should be dealt with via the mac_link_* functions.
> 
> Maybe I understand it wrong, but is it the intention that in
> phylink_mac_config with modes MLO_AN_FIXED and MLO_AN_PHY the MAC is always
> forces into a certain speed/mode/interface. So it never auto-negotiate because
> phylink select the best configuration for you?

You are not the only one who has recently tried to make use of
state->link in mac_config(), so I'm now preparing a set of patches
to split the current mac_config() method into two separate methods:

        void (*mac_config_fixed)(struct net_device *ndev,
                                 phy_interface_t iface, int speed, int duplex,
                                 int pause);
        void (*mac_config_inband)(struct net_device *ndev,
                                  phy_interface_t iface, bool an_enabled,
                                  unsigned long *advertising, int pause);

so that it's not possible to use members that should not be accessed
in various modes.

> Also the PMCR_FORCE_LNK is only set in phylink_link_up() or can I do it here
> and do nothing phylink_link_up()?

When the link comes up/down, mac_link_up() and mac_link_down() will be
called appropriately.  In PHY mode, this is equivalent to phylink doing
this:

	if (link_changed) {
		if (phydev->link)
			mac_link_up();
		else
			mac_link_down();
	}

So the actions you would've done depending on phydev->link should be in
the mac_link_*() methods.

> Other question:
> Where does the MAC enable/disable TX and RX fits best? port_{enable,disable}?
> Or only mac_config() and port_disable?

mac_link_*().

> > > +            if (state->pause || phylink_test(state->advertising, Pause))
> > > +                    mcr |= PMCR_TX_FC_EN | PMCR_RX_FC_EN;
> > > +            if (state->pause & MLO_PAUSE_TX)
> > > +                    mcr |= PMCR_TX_FC_EN;
> > > +            if (state->pause & MLO_PAUSE_RX)
> > > +                    mcr |= PMCR_RX_FC_EN;
> > 
> > This is clearly wrong - if any bit in state->pause is set, then we
> > end up with both PMCR_TX_FC_EN | PMCR_RX_FC_EN set.  If we have Pause
> > Pause set in the advertising mask, then both are set.  This doesn't
> > seem right - are these bits setting the advertisement, or are they
> > telling the MAC to use flow control?
> 
> Last one, tell the MAC to use flow control.

So the first if() statement is incorrect, and should be removed
entirely.  You only want to enable the MAC to use flow control as a
result of the negotiation results.

> On the current driver both bits are set in a forced-link situation.
> 
> If we always forces the MAC mode I think I always set these bits and don't
> anything with the Pause modes? Is that the right way to do it?

So what happens if your link partner (e.g. switch) does not support
flow control?  What if your link partner floods such frames to all
ports?  You end up transmitting flow control frames, which could be
sent to all stations on the network... seems not a good idea.

Implementing stuff properly and not taking short-cuts is always a
good idea for inter-operability.

> > > +
> > > +static void mt7530_phylink_validate(struct dsa_switch *ds, int port,
> > > +                                unsigned long *supported,
> > > +                                struct phylink_link_state *state)
> > > +{
> > > +    __ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
> > > +
> > > +    switch (port) {
> > > +    case 0: /* Internal phy */
> > > +    case 1:
> > > +    case 2:
> > > +    case 3:
> > > +    case 4:
> > > +            if (state->interface != PHY_INTERFACE_MODE_NA &&
> > > +                state->interface != PHY_INTERFACE_MODE_GMII)
> > > +                    goto unsupported;
> > > +            break;
> > > +    /* case 5: Port 5 not supported! */
> > > +    case 6: /* 1st cpu port */
> > > +            if (state->interface != PHY_INTERFACE_MODE_RGMII &&
> > > +                state->interface != PHY_INTERFACE_MODE_TRGMII)
> > 
> > PHY_INTERFACE_MODE_NA ?
> 
> You mean PHY_INTERFACE_MODE_NA is missing?

Yes.  Please see the updated documentation in the patch I sent this
morning "net: phylink: further documentation clarifications".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
