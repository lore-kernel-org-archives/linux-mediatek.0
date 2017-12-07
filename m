From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 1/3] net: dsa: mediatek: add VLAN support for
 MT7530
Date: Thu, 7 Dec 2017 16:24:15 +0100
Message-ID: <20171207152415.GB24750@lunn.ch>
References: <cover.1512625814.git.sean.wang@mediatek.com>
 <792c2d52b8da717b55ead9d480863ca390fe91b3.1512625814.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <792c2d52b8da717b55ead9d480863ca390fe91b3.1512625814.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: davem@davemloft.net, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

>  static void
> +mt7530_port_set_vlan_unware(struct dsa_switch *ds, int port)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +	int i;
> +	bool all_user_ports_removed = true;

Hi Sean

Reverse Christmas tree please.

> +static int
> +mt7530_vlan_cmd(struct mt7530_priv *priv, enum mt7530_vlan_cmd cmd, u16 vid)
> +{
> +	u32 val;
> +	int ret;
> +	struct mt7530_dummy_poll p;

Here too.

> +static int
> +mt7530_port_vlan_prepare(struct dsa_switch *ds, int port,
> +			 const struct switchdev_obj_port_vlan *vlan,
> +			 struct switchdev_trans *trans)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +
> +	/* The port is being kept as VLAN-unware port when bridge is set up
> +	 * with vlan_filtering not being set, Otherwise, the port and the
> +	 * corresponding CPU port is required the setup for becoming a
> +	 * VLAN-ware port.
> +	 */
> +	if (!priv->ports[port].vlan_filtering)
> +		return 0;
> +
> +	mt7530_port_set_vlan_ware(ds, port);
> +	mt7530_port_set_vlan_ware(ds, MT7530_CPU_PORT);

A prepare function should just validate that it is possible to carry
out the operation. It should not change any state. These two last
lines probably don't belong here.

> +
> +	return 0;
> +}
> +
> +static void
> +mt7530_hw_vlan_add(struct mt7530_priv *priv,
> +		   struct mt7530_hw_vlan_entry *entry)
> +{
> +	u32 val;
> +	u8 new_members;

Reverse Christmas tree. Please check the whole patch.

> +static inline void INIT_MT7530_HW_ENTRY(struct mt7530_hw_vlan_entry *e,
> +					int port, bool untagged)
> +{
> +	e->port = port;
> +	e->untagged = untagged;
> +}

All CAPITAL letters is for #defines. This is just a normal
function. Please use lower case.

	  Andrew
