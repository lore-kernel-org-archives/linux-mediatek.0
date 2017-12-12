From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH net-next 1/3] net: dsa: mediatek: add VLAN support for
 MT7530
Date: Tue, 12 Dec 2017 14:52:17 +0800
Message-ID: <1513061537.28444.15.camel@mtkswgap22>
References: <cover.1512625814.git.sean.wang@mediatek.com>
 <792c2d52b8da717b55ead9d480863ca390fe91b3.1512625814.git.sean.wang@mediatek.com>
 <20171207152415.GB24750@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20171207152415.GB24750-g2DYL2Zd6BY@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org


Hi, Andrew

All sounds reasonable. All will be fixed in the next version.

	Sean

On Thu, 2017-12-07 at 16:24 +0100, Andrew Lunn wrote:
> >  static void
> > +mt7530_port_set_vlan_unware(struct dsa_switch *ds, int port)
> > +{
> > +	struct mt7530_priv *priv = ds->priv;
> > +	int i;
> > +	bool all_user_ports_removed = true;
> 
> Hi Sean
> 
> Reverse Christmas tree please.
> 

will be fixed 

> > +static int
> > +mt7530_vlan_cmd(struct mt7530_priv *priv, enum mt7530_vlan_cmd cmd, u16 vid)
> > +{
> > +	u32 val;
> > +	int ret;
> > +	struct mt7530_dummy_poll p;
> 
> Here too.
> 

will be fixed

> > +static int
> > +mt7530_port_vlan_prepare(struct dsa_switch *ds, int port,
> > +			 const struct switchdev_obj_port_vlan *vlan,
> > +			 struct switchdev_trans *trans)
> > +{
> > +	struct mt7530_priv *priv = ds->priv;
> > +
> > +	/* The port is being kept as VLAN-unware port when bridge is set up
> > +	 * with vlan_filtering not being set, Otherwise, the port and the
> > +	 * corresponding CPU port is required the setup for becoming a
> > +	 * VLAN-ware port.
> > +	 */
> > +	if (!priv->ports[port].vlan_filtering)
> > +		return 0;
> > +
> > +	mt7530_port_set_vlan_ware(ds, port);
> > +	mt7530_port_set_vlan_ware(ds, MT7530_CPU_PORT);
> 
> A prepare function should just validate that it is possible to carry
> out the operation. It should not change any state. These two last
> lines probably don't belong here.
> 

okay, it will be moved into the proper place such as
mt7530_port_vlan_filtering

> > +
> > +	return 0;
> > +}
> > +
> > +static void
> > +mt7530_hw_vlan_add(struct mt7530_priv *priv,
> > +		   struct mt7530_hw_vlan_entry *entry)
> > +{
> > +	u32 val;
> > +	u8 new_members;
> 
> Reverse Christmas tree. Please check the whole patch.
> 
 will be fixed

> > +static inline void INIT_MT7530_HW_ENTRY(struct mt7530_hw_vlan_entry *e,
> > +					int port, bool untagged)
> > +{
> > +	e->port = port;
> > +	e->untagged = untagged;
> > +}
> 
> All CAPITAL letters is for #defines. This is just a normal
> function. Please use lower case.
> 

will be fixed
> 	  Andrew
> 
