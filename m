From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re: [PATCH 1/7] [DSA] adding fields for holding information
 about upstream-port
Date: Wed, 12 Dec 2018 16:12:53 +0100
Message-ID: <trinity-4ee13d71-22e7-4f95-a7b9-09bbefe7e6b6-1544627573309@3c-app-gmx-bs62>
References: <20181211193314.10695-1-frank-w@public-files.de>
 <63046efc-820c-aabf-a6f9-9393550b7056@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <63046efc-820c-aabf-a6f9-9393550b7056@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Florian,

thank you for first comments. It was my first Patchset i tried to send ia git send-email. i had searched the Patch 0/x-option but had not found it. i will rework this.

- i did only a porting to 4.15+ dsa-core. how do i credit John in this series?
- maybe i need a fallback to current "first cpu-port option", this was not defined by john, but i can add it in next series
- should i include dts (bananapi r2) also in the series?
- i have a additional patch renaming dts-option to default_cpu instead of cpu (hint of Andrew)

regards Frank


> Gesendet: Dienstag, 11. Dezember 2018 um 23:37 Uhr
> Von: "Florian Fainelli" <f.fainelli@gmail.com>
> An: "Frank Wunderlich" <frank-w@public-files.de>, "Andrew Lunn" <andrew@lunn.ch>, "Vivien Didelot" <vivien.didelot@savoirfairelinux.com>, "David S. Miller" <davem@davemloft.net>, "Matthias Brugger" <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
> Betreff: Re: [PATCH 1/7] [DSA] adding fields for holding information about upstream-port
>
> Hi,,
> 
> On 12/11/18 11:33 AM, Frank Wunderlich wrote:
> > based on
> > https://github.com/openwrt/openwrt/blob/master/target/linux/mediatek/patches-4.14/0033-dsa-multi-cpu.patch
> 
> There are several stylistic as well as logistical/technical issues with
> this patch series, so please address those before we can start doing the
> technical review:
> 
> - this is a multi patch series, so a cover letter should be provided
> (can be done with git format-patch --cover-letter)
> 
> - subject for the patches should be prefixed with net: dsa: <subject>
> 
> - commit messages explaining what is being achieved, how and what
> problem/feature this is providing is mandatory, you cannot just take
> patches from OpenWrt and provide no context what so ever except from the
> subject
> 
> Please fix that so we can do a meaningful and constructive technical
> review of the patches.
> 
> Thank you
> 
> > 
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  include/net/dsa.h  | 4 ++++
> >  net/dsa/dsa_priv.h | 5 +++++
> >  2 files changed, 9 insertions(+)
> > 
> > diff --git a/include/net/dsa.h b/include/net/dsa.h
> > index 23690c44e167..3efa81e08993 100644
> > --- a/include/net/dsa.h
> > +++ b/include/net/dsa.h
> > @@ -203,6 +203,10 @@ struct dsa_port {
> >  	struct net_device	*bridge_dev;
> >  	struct devlink_port	devlink_port;
> >  	struct phylink		*pl;
> > +
> > +	struct net_device	*ethernet;
> > +	int			upstream;
> > +
> >  	/*
> >  	 * Original copy of the master netdev ethtool_ops
> >  	 */
> > diff --git a/net/dsa/dsa_priv.h b/net/dsa/dsa_priv.h
> > index 9e4fd04ab53c..cc0cd7675117 100644
> > --- a/net/dsa/dsa_priv.h
> > +++ b/net/dsa/dsa_priv.h
> > @@ -81,6 +81,8 @@ struct dsa_slave_priv {
> >  
> >  	/* TC context */
> >  	struct list_head	mall_tc_list;
> > +
> > +	struct net_device       *master;
> >  };
> >  
> >  /* dsa.c */
> > @@ -188,7 +190,10 @@ static inline struct net_device *
> >  dsa_slave_to_master(const struct net_device *dev)
> >  {
> >  	struct dsa_port *dp = dsa_slave_to_port(dev);
> > +	struct dsa_slave_priv *p = netdev_priv(dev);
> >  
> > +	if (p->master)
> > +		return p->master;
> >  	return dp->cpu_dp->master;
> >  }
> >  
> > 
> 
> 
> -- 
> Florian
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
