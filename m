From: Russell King - ARM Linux admin <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH RFC net-next 1/5] net: dsa: mt7530: Convert to PHYLINK API
Date: Tue, 25 Jun 2019 22:53:29 +0100
Message-ID: <20190625215329.5ubixxiwprnubwmv@shell.armlinux.org.uk>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-2-opensource@vdorst.com>
 <20190624153950.hdsuhrvfd77heyor@shell.armlinux.org.uk>
 <6f80325d-4b42-6174-e050-48626f7a3662@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6f80325d-4b42-6174-e050-48626f7a3662-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Vladimir Oltean <olteanv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vivien.didelot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource-91nzXlUTePbQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jun 25, 2019 at 11:24:01PM +0300, Vladimir Oltean wrote:
> Hi Russell,
> 
> On 6/24/19 6:39 PM, Russell King - ARM Linux admin wrote:
> > This should be removed - state->link is not for use in mac_config.
> > Even in fixed mode, the link can be brought up/down by means of a
> > gpio, and this should be dealt with via the mac_link_* functions.
> > 
> 
> What do you mean exactly that state->link is not for use, is that true in
> general?

Yes.  mac_config() should not touch it; it is not always in a defined
state.  For example, if you set modes via ethtool (the
ethtool_ksettings_set API) then state->link will probably contain
zero irrespective of the true link state.

It exists in this structure because it was convenient to just use one
structure to store all the link information in various parts of the
code, and when requesting the negotiated in-band MAC configuration.

I've come to the conclusion that that decision was a mistake, based
on patches such as the above mistakenly thinking that everything in
the state structure is fair game.  I've since updated the docs to
explicitly spell it out, but I'm also looking at the feasibility of
changing the mac_config() interface entirely - splitting it into two
(mac_config_fixed() and mac_config_inband()) and passing only the
appropriate parameters to each.

However, having looked at that, I think such a change will make some
MAC drivers quite a bit more complicated - having all the config
steps in one method appears to make the configuration of MAC drivers
easier (eg, mvneta, mvpp2.)

> In drivers/net/dsa/sja1105/sja1105_main.c, if I remove the "if
> (!state->link)" guard, I see PHYLINK calls with a SPEED_UNKNOWN argument for
> ports that are BR_STATE_DISABLED. Is that normal?

This looks like another driver which has been converted to phylink
without my review; I certainly wasn't aware of it.  It gets a few
things wrong, such as:

1) not checking state->interface in the validate callback - so it
   is basically saying that it can support any PHY interface mode
   that the kernel happens to support.

2) if phylink is configured to use in-band, then state->speed is
   undefined; this driver will fail.  (If folk don't want to support
   that, we ought to have a way to tell phylink to reject anything
   that attempts to set it to in-band mode!)

3) it doesn't implement phylink_mac_link_state DSA ops, so it doesn't
   support SGMII or 802.3z phy interface modes (see 1).

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
