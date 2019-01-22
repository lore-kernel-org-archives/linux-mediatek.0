From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCHv3 2/3] net: dsa: mt7530: support the 7530 switch on the
 Mediatek MT7621 SoC
Date: Tue, 22 Jan 2019 14:58:37 -0800
Message-ID: <200bd8ec-0e75-30f5-0444-323e4dc86210@gmail.com>
References: <1548101433.24552.14.camel@mtkswgap22>
 <8b6746b2-2d90-99ba-c8e5-4e4089567155@kernel.org>
 <20190122211307.Horde.V6XcMCE3ZFBZOJMYl12Uxex@www.vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190122211307.Horde.V6XcMCE3ZFBZOJMYl12Uxex@www.vdorst.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Greg Ungerer <gerg@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, bjorn@mork.no, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, john@phrozen.org, neil@brown.name, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 1/22/19 1:13 PM, René van Dorst wrote:
> Quoting Greg Ungerer <gerg@kernel.org>:
> 
> <snip>
> 
>>>>        /* Reset whole chip through gpio pin or memory-mapped
>>>> registers for @@ -1326,9 +1335,17 @@ static const struct
>>>> dsa_switch_ops mt7530_switch_ops = {
>>>>      .port_vlan_del        = mt7530_port_vlan_del,
>>>>  };
>>>>  +static const struct of_device_id mt7530_of_match[] = {
>>>> +    { .compatible = "mediatek,mt7621", .data = (void *)ID_MT7621, },
>>>> +    { .compatible = "mediatek,mt7530", .data = (void *)ID_MT7530, },
>>>> +    { /* sentinel */ },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, mt7530_of_match);
>>>> +
>>>>  static int
>>>>  mt7530_probe(struct mdio_device *mdiodev)  {
>>>> +    const struct of_device_id *of_id;
>>>>      struct mt7530_priv *priv;
>>>>      struct device_node *dn;
>>>>  @@ -1356,13 +1373,21 @@ mt7530_probe(struct mdio_device *mdiodev)
>>>>          }
>>>>      }
>>>>  -    priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core");
>>>> -    if (IS_ERR(priv->core_pwr))
>>>> -        return PTR_ERR(priv->core_pwr);
>>>> +    /* Get the hardware identifier from the devicetree node.
>>>> +     * We will need it for some of the clock and regulator setup.
>>>> +     */
>>>> +    of_id = of_match_node(mt7530_of_match, dn);
>>>> +    priv->id = (unsigned int)of_id->data;
>>>>
>>>
>>> We could use of_device_get_match_data instead of the above two lines.
>>
>> Yep, good idea. Will change. I will add in some extra
>> casting to take care of the kbuild warning too.
>>
>>
>>> and could you help Cc linux-mediatek@lists.infradead.org if you have the
>>> next version for the series ?
>>
>> Yep, sure thing.
>>
>> Regards
>> Greg
> 
> Hi Greg,
> 
> What about enabling mips mt7621/arm mt7623 code at compile time?
> Same binary can't be used on both platforms so it saves some space.
> This also solved/eliminates the need for CPU detection which was also
> needed if we want to support trgmii mode.
> Device tree bindings are now similar between the two platforms, no extra
> compatible id.

That reduces compile coverage, that is not really the direction Linux
drivers are going with in any case, even if some parts of the driver are
only running in specific CPU/SoCs cases, we still want the driver to be
as free as chip-specific or architecture specific knowledge.

> 
> I think it should look something like this:
> https://github.com/vDorst/linux-1/commit/93dc90ce56baeb3e71cae0f5339b811bbda57a97
> 
> 
> Greats,
> 
> René
> 
> 
> 
> 
> 


-- 
Florian
