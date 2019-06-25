From: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH RFC net-next 1/5] net: dsa: mt7530: Convert to PHYLINK API
Date: Wed, 26 Jun 2019 02:10:27 +0300
Message-ID: <CA+h21hq_w8-96ehKYxcziSq1TjOjoKduZ+pB3umBfjODaKWd+A@mail.gmail.com>
References: <20190624145251.4849-1-opensource@vdorst.com> <20190624145251.4849-2-opensource@vdorst.com>
 <20190624153950.hdsuhrvfd77heyor@shell.armlinux.org.uk> <6f80325d-4b42-6174-e050-48626f7a3662@gmail.com>
 <20190625215329.5ubixxiwprnubwmv@shell.armlinux.org.uk> <CA+h21hqK0VMtHpZ6eka9ESuMhsFTw2mx+c0GYmxq4_G_YmiVpg@mail.gmail.com>
 <20190625225759.zztqgnwtk4v7milp@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190625225759.zztqgnwtk4v7milp@shell.armlinux.org.uk>
Sender: netdev-owner@vger.kernel.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, sean.wang@mediatek.com, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, matthias.bgg@gmail.com, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, frank-w@public-files.de, netdev <netdev@vger.kernel.org>, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 26 Jun 2019 at 01:58, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Wed, Jun 26, 2019 at 01:14:59AM +0300, Vladimir Oltean wrote:
> > On Wed, 26 Jun 2019 at 00:53, Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Tue, Jun 25, 2019 at 11:24:01PM +0300, Vladimir Oltean wrote:
> > > > Hi Russell,
> > > >
> > > > On 6/24/19 6:39 PM, Russell King - ARM Linux admin wrote:
> > > > > This should be removed - state->link is not for use in mac_config.
> > > > > Even in fixed mode, the link can be brought up/down by means of a
> > > > > gpio, and this should be dealt with via the mac_link_* functions.
> > > > >
> > > >
> > > > What do you mean exactly that state->link is not for use, is that true in
> > > > general?
> > >
> > > Yes.  mac_config() should not touch it; it is not always in a defined
> > > state.  For example, if you set modes via ethtool (the
> > > ethtool_ksettings_set API) then state->link will probably contain
> > > zero irrespective of the true link state.
> > >
> >
> > Experimentally, state->link is zero at the same time as state->speed
> > is -1, so just ignoring !state->link made sense. This is not in-band
> > AN. What is your suggestion? Should I proceed to try and configure the
> > MAC for SPEED_UNKNOWN?
>
> What would you have done with a PHY when the link is down, what speed
> would you have configured in the phylib adjust_link callback?  phylib
> also sets SPEED_UNKNOWN/DUPLEX_UNKNOWN when the link is down.
>

With phylib, I'd make the driver ignore the speed and do nothing.
With phylink, I'd make the core not call mac_config.
But what happened is I saw phylink call mac_config anyway, said
'weird' and proceeded to ignore it as I would have for phylib.
I'm just not understanding your position - it seems like you're
implying there's a bug in phylink and the function call with
MLO_AN_FIXED, state->link=0 and state->speed=-1 should not have taken
place, which is what I wanted to confirm.

> What we do in Marvell drivers is set to the lowest speed (10M) in such
> cases, which is fine as the MAC supports 10M.
>
> It wouldn't be appropriate for phylink to force something on MAC
> drivers, it's easier if the MAC just defaults SPEED_UNKNOWN to something
> itself.
>
> >
> > > It exists in this structure because it was convenient to just use one
> > > structure to store all the link information in various parts of the
> > > code, and when requesting the negotiated in-band MAC configuration.
> > >
> > > I've come to the conclusion that that decision was a mistake, based
> > > on patches such as the above mistakenly thinking that everything in
> > > the state structure is fair game.  I've since updated the docs to
> > > explicitly spell it out, but I'm also looking at the feasibility of
> > > changing the mac_config() interface entirely - splitting it into two
> > > (mac_config_fixed() and mac_config_inband()) and passing only the
> > > appropriate parameters to each.
> > >
> > > However, having looked at that, I think such a change will make some
> > > MAC drivers quite a bit more complicated - having all the config
> > > steps in one method appears to make the configuration of MAC drivers
> > > easier (eg, mvneta, mvpp2.)
> > >
> > > > In drivers/net/dsa/sja1105/sja1105_main.c, if I remove the "if
> > > > (!state->link)" guard, I see PHYLINK calls with a SPEED_UNKNOWN argument for
> > > > ports that are BR_STATE_DISABLED. Is that normal?
> > >
> > > This looks like another driver which has been converted to phylink
> > > without my review; I certainly wasn't aware of it.  It gets a few
> > > things wrong, such as:
> > >
> > > 1) not checking state->interface in the validate callback - so it
> > >    is basically saying that it can support any PHY interface mode
> > >    that the kernel happens to support.
> > >
> >
> > Partially true. It does check the DT bindings for supported MII modes
> > in sja1105_init_mii_settings (for fundamental reasons... the switch
> > expects an 'all-in-one' configuration buffer with the operating modes
> > of all MACs - don't ask me to delay the uploading of this static
> > config until all ports collected their interface_mode from phylink via
> > the mac_config callback - it's a deadlock).
>
> Ok, so you need to reject interface modes that are not compatible
> with the currently configured mode in the validate() callback, but
> please keep PHY_INTERFACE_MODE_NA reporting back the capabilities.
> (this is now documented.)
>

Ok.

> > It is a gigabit switch with MII/RMII/RGMII MACs - I have never seen
> > any PHY wired for these modes that can change system interface type.
>
> It is unlikely that MII/RMII/RGMII will switch modes, but in terms of
> correct implementation, sticking to the way the function is expected
> to behave means that I don't get surprises when changing phylink layer
> in the future.
>
> >
> > > 2) if phylink is configured to use in-band, then state->speed is
> > >    undefined; this driver will fail.  (If folk don't want to support
> > >    that, we ought to have a way to tell phylink to reject anything
> > >    that attempts to set it to in-band mode!)
> > >
> >
> > Ok.
> >
> > > 3) it doesn't implement phylink_mac_link_state DSA ops, so it doesn't
> > >    support SGMII or 802.3z phy interface modes (see 1).
> > >
> >
> > No, it doesn't.
> > Some odd switch in this device family supports SGMII on 1 of its
> > ports, however I haven't put my hands on it.
> > When I do I'll add checks for strange scenarios, like connecting it to
> > an Aquantia PHY that can switch between SGMII and USXGMII (although
> > why would anyone pair a 10G capable PHY to a 1G capable MAC...)
>
> It's unlikely that it would switch between SGMII and USXGMII
> dynamically, as USXGMII supports speeds from 10G down to 10M.
>
> Where interface mode switching tends to be used is with modes such
> as 10GBASE-R, which doesn't support anything except 10G.  In order
> for the PHY to operate at slower speeds, it has a few options:
>
> 1) perform rate adaption.
> 2) dynamically switch interface type to an interface type that
>    supports the desired speed.
> 3) just not support slower speeds.
>

So am I reading this correctly - it kind of makes sense for gigabit
MAC drivers to not check for the MII interface changing protocol?

> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up

Thanks,
-Vladimir
