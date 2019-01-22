From: Greg Ungerer <gerg@kernel.org>
Subject: Re: [PATCHv3 2/3] net: dsa: mt7530: support the 7530 switch on the
 Mediatek MT7621 SoC
Date: Tue, 22 Jan 2019 11:33:00 +1000
Message-ID: <8b6746b2-2d90-99ba-c8e5-4e4089567155@kernel.org>
References: <1548101433.24552.14.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1548101433.24552.14.camel@mtkswgap22>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>, bjorn@mork.no, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org
Cc: rene@vdorst.com, john@phrozen.org, neil@brown.name, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Sean,

On 22/1/19 6:10 am, Sean Wang wrote:
> On Mon, 2019-01-21 at 11:31 -0800, Sean Wang wrote:
>> From: gerg@kernel.org [mailto:gerg@kernel.org]
>> Sent: Sunday, January 20, 2019 11:12 PM
>> To: Sean Wang <Sean.Wang@mediatek.com>; bjorn@mork.no; andrew@lunn.ch; vivien.didelot@savoirfairelinux.com; f.fainelli@gmail.com; netdev@vger.kernel.org
>> Cc: rene@vdorst.com; john@phrozen.org; neil@brown.name; Greg Ungerer <gerg@kernel.org>
>> Subject: [PATCHv3 2/3] net: dsa: mt7530: support the 7530 switch on the Mediatek MT7621 SoC
>>
>> From: Greg Ungerer <gerg@kernel.org>
>>
>> The MediaTek MT7621 SoC device contains a 7530 switch, and the existing linux kernel 7530 DSA switch driver can be used with it.
>>
>> The bulk of the changes required stem from the 7621 having different regulator and pad setup. The existing setup of these in the 7530 driver appears to be very specific to its implemtation in the Mediatek
>> 7623 SoC. (Not entirely surprising given the 7623 is a quad core ARM based SoC, and the 7621 is a dual core, dual thread MIPS based SoC).
>>
>> Create a new devicetree type, "mediatek,mt7621", to support the 7530 switch in the 7621 SoC. There appears to be no usable ID register to distinguish it from a 7530 in other hardware at runtime. This is used to carry out the appropriate configuration and setup.
>>
>> Signed-off-by: Greg Ungerer <gerg@kernel.org>
>> ---
>>   drivers/net/dsa/mt7530.c | 97 ++++++++++++++++++++++++----------------
>>   drivers/net/dsa/mt7530.h |  9 ++++
>>   2 files changed, 67 insertions(+), 39 deletions(-)
>>
>> v1: initial patch
>> v2: use separate devicetree binding
>> v3: rebase onto 5.0-rc3
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c index a8a2c728afba..350ce4c4fd52 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -621,17 +621,19 @@ static void mt7530_adjust_link(struct dsa_switch *ds, int port,
>>   	struct mt7530_priv *priv = ds->priv;
>>   
>>   	if (phy_is_pseudo_fixed_link(phydev)) {
>> -		dev_dbg(priv->dev, "phy-mode for master device = %x\n",
>> -			phydev->interface);
>> -
>> -		/* Setup TX circuit incluing relevant PAD and driving */
>> -		mt7530_pad_clk_setup(ds, phydev->interface);
>> -
>> -		/* Setup RX circuit, relevant PAD and driving on the host
>> -		 * which must be placed after the setup on the device side is
>> -		 * all finished.
>> -		 */
>> -		mt7623_pad_clk_setup(ds);
>> +		if (priv->id == ID_MT7530) {
>> +			dev_dbg(priv->dev, "phy-mode for master device = %x\n",
>> +				phydev->interface);
>> +
>> +			/* Setup TX circuit incluing relevant PAD and driving */
>> +			mt7530_pad_clk_setup(ds, phydev->interface);
>> +
>> +			/* Setup RX circuit, relevant PAD and driving on the
>> +			 * host which must be placed after the setup on the
>> +			 * device side is all finished.
>> +			 */
>> +			mt7623_pad_clk_setup(ds);
>> +		}
>>   	} else {
>>   		u16 lcl_adv = 0, rmt_adv = 0;
>>   		u8 flowctrl;
>> @@ -687,6 +689,10 @@ mt7530_cpu_port_enable(struct mt7530_priv *priv,
>>   	/* Unknown unicast frame fordwarding to the cpu port */
>>   	mt7530_set(priv, MT7530_MFC, UNU_FFP(BIT(port)));
>>   
>> +	/* Set CPU port number */
>> +	if (priv->id == ID_MT7621)
>> +		mt7530_rmw(priv, MT7530_MFC, CPU_MASK, CPU_EN | CPU_PORT(port));
>> +
>>   	/* CPU port gets connected to all user ports of
>>   	 * the switch
>>   	 */
>> @@ -1219,24 +1225,27 @@ mt7530_setup(struct dsa_switch *ds)
>>   	 * as two netdev instances.
>>   	 */
>>   	dn = ds->ports[MT7530_CPU_PORT].master->dev.of_node->parent;
>> -	priv->ethernet = syscon_node_to_regmap(dn);
>> -	if (IS_ERR(priv->ethernet))
>> -		return PTR_ERR(priv->ethernet);
>>   
>> -	regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
>> -	ret = regulator_enable(priv->core_pwr);
>> -	if (ret < 0) {
>> -		dev_err(priv->dev,
>> -			"Failed to enable core power: %d\n", ret);
>> -		return ret;
>> -	}
>> +	if (priv->id == ID_MT7530) {
>> +		priv->ethernet = syscon_node_to_regmap(dn);
>> +		if (IS_ERR(priv->ethernet))
>> +			return PTR_ERR(priv->ethernet);
>> +
>> +		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
>> +		ret = regulator_enable(priv->core_pwr);
>> +		if (ret < 0) {
>> +			dev_err(priv->dev,
>> +				"Failed to enable core power: %d\n", ret);
>> +			return ret;
>> +		}
>>   
>> -	regulator_set_voltage(priv->io_pwr, 3300000, 3300000);
>> -	ret = regulator_enable(priv->io_pwr);
>> -	if (ret < 0) {
>> -		dev_err(priv->dev, "Failed to enable io pwr: %d\n",
>> -			ret);
>> -		return ret;
>> +		regulator_set_voltage(priv->io_pwr, 3300000, 3300000);
>> +		ret = regulator_enable(priv->io_pwr);
>> +		if (ret < 0) {
>> +			dev_err(priv->dev, "Failed to enable io pwr: %d\n",
>> +				ret);
>> +			return ret;
>> +		}
>>   	}
>>   
>>   	/* Reset whole chip through gpio pin or memory-mapped registers for @@ -1326,9 +1335,17 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
>>   	.port_vlan_del		= mt7530_port_vlan_del,
>>   };
>>   
>> +static const struct of_device_id mt7530_of_match[] = {
>> +	{ .compatible = "mediatek,mt7621", .data = (void *)ID_MT7621, },
>> +	{ .compatible = "mediatek,mt7530", .data = (void *)ID_MT7530, },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, mt7530_of_match);
>> +
>>   static int
>>   mt7530_probe(struct mdio_device *mdiodev)  {
>> +	const struct of_device_id *of_id;
>>   	struct mt7530_priv *priv;
>>   	struct device_node *dn;
>>   
>> @@ -1356,13 +1373,21 @@ mt7530_probe(struct mdio_device *mdiodev)
>>   		}
>>   	}
>>   
>> -	priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core");
>> -	if (IS_ERR(priv->core_pwr))
>> -		return PTR_ERR(priv->core_pwr);
>> +	/* Get the hardware identifier from the devicetree node.
>> +	 * We will need it for some of the clock and regulator setup.
>> +	 */
>> +	of_id = of_match_node(mt7530_of_match, dn);
>> +	priv->id = (unsigned int)of_id->data;
>>   
> 
> We could use of_device_get_match_data instead of the above two lines.

Yep, good idea. Will change. I will add in some extra
casting to take care of the kbuild warning too.

  
> and could you help Cc linux-mediatek@lists.infradead.org if you have the
> next version for the series ?

Yep, sure thing.

Regards
Greg



>> -	priv->io_pwr = devm_regulator_get(&mdiodev->dev, "io");
>> -	if (IS_ERR(priv->io_pwr))
>> -		return PTR_ERR(priv->io_pwr);
>> +	if (priv->id == ID_MT7530) {
>> +		priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core");
>> +		if (IS_ERR(priv->core_pwr))
>> +			return PTR_ERR(priv->core_pwr);
>> +
>> +		priv->io_pwr = devm_regulator_get(&mdiodev->dev, "io");
>> +		if (IS_ERR(priv->io_pwr))
>> +			return PTR_ERR(priv->io_pwr);
>> +	}
>>   
>>   	/* Not MCM that indicates switch works as the remote standalone
>>   	 * integrated circuit so the GPIO pin would be used to complete @@ -1408,12 +1433,6 @@ mt7530_remove(struct mdio_device *mdiodev)
>>   	mutex_destroy(&priv->reg_mutex);
>>   }
>>   
>> -static const struct of_device_id mt7530_of_match[] = {
>> -	{ .compatible = "mediatek,mt7530" },
>> -	{ /* sentinel */ },
>> -};
>> -MODULE_DEVICE_TABLE(of, mt7530_of_match);
>> -
>>   static struct mdio_driver mt7530_mdio_driver = {
>>   	.probe  = mt7530_probe,
>>   	.remove = mt7530_remove,
>> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h index d9b407a22a58..a95ed958df5b 100644
>> --- a/drivers/net/dsa/mt7530.h
>> +++ b/drivers/net/dsa/mt7530.h
>> @@ -19,6 +19,11 @@
>>   #define MT7530_NUM_FDB_RECORDS		2048
>>   #define MT7530_ALL_MEMBERS		0xff
>>   
>> +enum {
>> +	ID_MT7530 = 0,
>> +	ID_MT7621 = 1,
>> +};
>> +
>>   #define	NUM_TRGMII_CTRL			5
>>   
>>   #define TRGMII_BASE(x)			(0x10000 + (x))
>> @@ -36,6 +41,9 @@
>>   #define  UNM_FFP(x)			(((x) & 0xff) << 16)
>>   #define  UNU_FFP(x)			(((x) & 0xff) << 8)
>>   #define  UNU_FFP_MASK			UNU_FFP(~0)
>> +#define  CPU_EN				BIT(7)
>> +#define  CPU_PORT(x)			((x) << 4)
>> +#define  CPU_MASK			(0xf << 4)
>>   
>>   /* Registers for address table access */
>>   #define MT7530_ATA1			0x74
>> @@ -430,6 +438,7 @@ struct mt7530_priv {
>>   	struct regulator	*core_pwr;
>>   	struct regulator	*io_pwr;
>>   	struct gpio_desc	*reset;
>> +	unsigned int		id;
>>   	bool			mcm;
>>   
>>   	struct mt7530_port	ports[MT7530_NUM_PORTS];
>> --
>> 2.17.1
