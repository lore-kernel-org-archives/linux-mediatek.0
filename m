From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH RFC net-next 1/5] net: dsa: mt7530: Convert to PHYLINK API
Date: Tue, 25 Jun 2019 22:21:08 +0100
Message-ID: <20190625212108.hh4g32co6s4drniw@shell.armlinux.org.uk>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-2-opensource@vdorst.com>
 <20190624153950.hdsuhrvfd77heyor@shell.armlinux.org.uk>
 <20190625113158.Horde.pCaJOVUsgyhYLd5Diz5EZKI@www.vdorst.com>
 <20190625121030.m5w7wi3rpezhfgyo@shell.armlinux.org.uk>
 <1ad9f9a5-8f39-40bd-94bb-6b700f30c4ba@pobox.com>
 <20190625190246.GA27733@lunn.ch>
 <4fc51dc4-0eec-30d7-86d1-3404819cf6fe@pobox.com>
 <20190625204148.GB27733@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625204148.GB27733@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Santos <daniel.santos@pobox.com>, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jun 25, 2019 at 10:41:48PM +0200, Andrew Lunn wrote:
> On Tue, Jun 25, 2019 at 02:27:55PM -0500, Daniel Santos wrote:
> > On 6/25/19 2:02 PM, Andrew Lunn wrote:
> > >> But will there still be a mechanism to ignore link partner's advertising
> > >> and force these parameters?
> > > >From man 1 ethtool:
> > >
> > >        -a --show-pause
> > >               Queries the specified Ethernet device for pause parameter information.
> > >
> > >        -A --pause
> > >               Changes the pause parameters of the specified Ethernet device.
> > >
> > >            autoneg on|off
> > >                   Specifies whether pause autonegotiation should be enabled.
> > >
> > >            rx on|off
> > >                   Specifies whether RX pause should be enabled.
> > >
> > >            tx on|off
> > >                   Specifies whether TX pause should be enabled.
> > >
> > > You need to check the driver to see if it actually implements this
> > > ethtool call, but that is how it should be configured.
> > >
> > > 	Andrew
> > >
> > Thank you Andrew,
> > 
> > So in this context, my question is the difference between "enabling" and
> > "forcing".  Here's that register for the mt7620 (which has an mt7530 on
> > its die): https://imgur.com/a/pTk0668  I believe this is also what René
> > is seeking clarity on?
> 
> Lets start with normal operation. If the MAC supports pause or asym
> pause, it calls phy_support_sym_pause() or phy_support_asym_pause().
> phylib will then configure the PHY to advertise pause as appropriate.
> Once auto-neg has completed, the results of the negotiation are set in
> phydev. So phdev->pause and phydev->asym_pause. The MAC callback is
> then used to tell the MAC about the autoneg results. The MAC should be
> programmed using the values in phdev->pause and phydev->asym_pause.
> 
> For ethtool, the MAC driver needs to implement .get_pauseparam and
> .set_pauseparam. The set_pauseparam needs to validate the settings,
> using phy_validate_pause(). If valid, phy_set_asym_pause() is used to
> tell the PHY about the new configuration. This will trigger a new
> auto-neg if auto-neg is enabled, and the results will be passed back
> in the usual way. If auto-neg is disabled, or pause auto-neg is
> disabled, the MAC should configure pause directly based on the
> settings passed.
> 
> Looking at the data sheet page, you want FORCE_MODE_Pn set. You never
> want the MAC directly talking to the PHY. Bad things will happen.
> Then use FORCE_RX_FC_Pn and FORCE_TX_Pn to reflect phydev->pause and
> phydev->asym_pause.
> 
> The same idea applies when using phylink.

Except when using phylink, use pause & MLO_PAUSE_RX to determine whether
FORCE_RX_FC_Pn should be set, and use pause & MLO_PAUSE_TX to determine
whether FORCE_TX_Pn should be set.

phylink will take care of the results of negotiation with the link
partner and tell you what should be set if pause autoneg is enabled.
If the user has decided to force it via ethtool, and the MAC driver
passes the calls on to phylink, phylink will instead set MLO_PAUSE_RX
and MLO_PAUSE_TX according to the users settings.

So, with phylink, it's quite literally "if MLO_PAUSE_RX is set in
mac_config, enable receiption of pause frames.  if MLO_PAUSE_TX is set,
enable transmission of pause frames."

The above applies for phylink's PHY, FIXED, and SGMII in-band modes.
For 802.3z in-band modes, pause is negotiated between the two link
parters (which could be the PCS built into the MACs at either end)
and in some cases its possible to set the MAC to automatically adjust
to the results of the built-in PCS negotiation.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
