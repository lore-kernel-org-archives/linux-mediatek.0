From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH RFC net-next 1/5] net: dsa: mt7530: Convert to PHYLINK API
Date: Wed, 26 Jun 2019 08:41:59 +0100
Message-ID: <20190626074158.odyrgzie7sv4ovtn@shell.armlinux.org.uk>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-2-opensource@vdorst.com>
 <20190624153950.hdsuhrvfd77heyor@shell.armlinux.org.uk>
 <6f80325d-4b42-6174-e050-48626f7a3662@gmail.com>
 <20190625215329.5ubixxiwprnubwmv@shell.armlinux.org.uk>
 <CA+h21hqK0VMtHpZ6eka9ESuMhsFTw2mx+c0GYmxq4_G_YmiVpg@mail.gmail.com>
 <20190625225759.zztqgnwtk4v7milp@shell.armlinux.org.uk>
 <CA+h21hq_w8-96ehKYxcziSq1TjOjoKduZ+pB3umBfjODaKWd+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+h21hq_w8-96ehKYxcziSq1TjOjoKduZ+pB3umBfjODaKWd+A@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, sean.wang@mediatek.com, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, matthias.bgg@gmail.com, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, frank-w@public-files.de, netdev <netdev@vger.kernel.org>, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jun 26, 2019 at 02:10:27AM +0300, Vladimir Oltean wrote:
> On Wed, 26 Jun 2019 at 01:58, Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > On Wed, Jun 26, 2019 at 01:14:59AM +0300, Vladimir Oltean wrote:
> > > On Wed, 26 Jun 2019 at 00:53, Russell King - ARM Linux admin
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > On Tue, Jun 25, 2019 at 11:24:01PM +0300, Vladimir Oltean wrote:
> > > > > Hi Russell,
> > > > >
> > > > > On 6/24/19 6:39 PM, Russell King - ARM Linux admin wrote:
> > > > > > This should be removed - state->link is not for use in mac_config.
> > > > > > Even in fixed mode, the link can be brought up/down by means of a
> > > > > > gpio, and this should be dealt with via the mac_link_* functions.
> > > > > >
> > > > >
> > > > > What do you mean exactly that state->link is not for use, is that true in
> > > > > general?
> > > >
> > > > Yes.  mac_config() should not touch it; it is not always in a defined
> > > > state.  For example, if you set modes via ethtool (the
> > > > ethtool_ksettings_set API) then state->link will probably contain
> > > > zero irrespective of the true link state.
> > > >
> > >
> > > Experimentally, state->link is zero at the same time as state->speed
> > > is -1, so just ignoring !state->link made sense. This is not in-band
> > > AN. What is your suggestion? Should I proceed to try and configure the
> > > MAC for SPEED_UNKNOWN?
> >
> > What would you have done with a PHY when the link is down, what speed
> > would you have configured in the phylib adjust_link callback?  phylib
> > also sets SPEED_UNKNOWN/DUPLEX_UNKNOWN when the link is down.
> >
> 
> With phylib, I'd make the driver ignore the speed and do nothing.
> With phylink, I'd make the core not call mac_config.
> But what happened is I saw phylink call mac_config anyway, said
> 'weird' and proceeded to ignore it as I would have for phylib.
> I'm just not understanding your position - it seems like you're
> implying there's a bug in phylink and the function call with
> MLO_AN_FIXED, state->link=0 and state->speed=-1 should not have taken
> place, which is what I wanted to confirm.

It is not a bug.  It is a request to configure the MAC, and what it's
saying is "we don't know what speed and/or duplex".

Take for instance when the network adapter is brought up initially.
The link is most likely down, but we should configure the initial MAC
operating parameters (such as the PHY interface).  Phylink makes a
mac_config() call with the speed and duplex set to UNKNOWN.

Using your theory, we shouldn't be making that call.  In which case,
MAC drivers aren't going to initially configure their interface
settings.

_That_ would be a bug.

> > It's unlikely that it would switch between SGMII and USXGMII
> > dynamically, as USXGMII supports speeds from 10G down to 10M.
> >
> > Where interface mode switching tends to be used is with modes such
> > as 10GBASE-R, which doesn't support anything except 10G.  In order
> > for the PHY to operate at slower speeds, it has a few options:
> >
> > 1) perform rate adaption.
> > 2) dynamically switch interface type to an interface type that
> >    supports the desired speed.
> > 3) just not support slower speeds.
> >
> 
> So am I reading this correctly - it kind of makes sense for gigabit
> MAC drivers to not check for the MII interface changing protocol?

Again, that's incorrect in the general case.  Gigabit includes SGMII
and 802.3z PHY protocols which need to be switched between for SFPs.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
