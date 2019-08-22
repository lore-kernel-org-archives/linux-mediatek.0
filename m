From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next v2 1/3] net: ethernet: mediatek: Add basic
 PHYLINK support
Date: Thu, 22 Aug 2019 15:11:16 +0000
Message-ID: <20190822151116.Horde.3pVh2Kr0MEO82EWm7859Zd2@www.vdorst.com>
References: <20190821144336.9259-1-opensource@vdorst.com>
 <20190821144336.9259-2-opensource@vdorst.com>
 <20190822142739.GS13294@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190822142739.GS13294@shell.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, Stefan Roese <sr@denx.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Russell,

Quoting Russell King - ARM Linux admin <linux@armlinux.org.uk>:

> On Wed, Aug 21, 2019 at 04:43:34PM +0200, René van Dorst wrote:
>> +static void mtk_mac_link_down(struct phylink_config *config,  
>> unsigned int mode,
>> +			      phy_interface_t interface)
>> +{
>> +	struct mtk_mac *mac = container_of(config, struct mtk_mac,
>> +					   phylink_config);
>>
>> -	return 0;
>> +	mtk_w32(mac->hw, MAC_MCR_FORCE_LINK_DOWN, MTK_MAC_MCR(mac->id));
>>  }
>
> You set the MAC_MCR_FORCE_MODE bit here...
>
>> +static void mtk_mac_link_up(struct phylink_config *config,  
>> unsigned int mode,
>> +			    phy_interface_t interface,
>> +			    struct phy_device *phy)
>>  {
>> +	struct mtk_mac *mac = container_of(config, struct mtk_mac,
>> +					   phylink_config);
>> +	u32 mcr = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
>>
>> +	mcr |= MAC_MCR_TX_EN | MAC_MCR_RX_EN;
>> +	mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
>> +}
>
> Looking at this, a link_down() followed by a link_up() would result in
> this register containing MAC_MCR_FORCE_MODE | MAC_MCR_TX_EN |
> MAC_MCR_RX_EN ?  Is that actually correct?  (MAC_MCR_FORCE_LINK isn't
> set, so it looks to me like it still forces the link down.)

Thanks for reviewing.

Probably not.
I assumed that mac_config() is always called before link_up()

I simply can make it the opposite of link_up()

like this:
static void mtk_mac_link_down(struct phylink_config *config, unsigned  
int mode,
                               phy_interface_t interface)
{
       struct mtk_mac *mac = container_of(config, struct mtk_mac,
                                  phylink_config);
       u32 mcr = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));

       mcr &= (MAC_MCR_TX_EN | MAC_MCR_RX_EN);
       mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
}

>
> Note that link up/down forcing should not be done for in-band AN.
>

This means that mac_config() of the SGMII patch is also incorrect?

mac_config() always sets the MAC in a force mode.
But the SGMII block is set in AN.

Mainline code seems to do the same.
Puts the SGMII block in AN or forced mode and always set the MAC in  
forced mode.

>> +static void mtk_validate(struct phylink_config *config,
>> +			 unsigned long *supported,
>> +			 struct phylink_link_state *state)
>> +{
>> +	struct mtk_mac *mac = container_of(config, struct mtk_mac,
>> +					   phylink_config);
>> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
>>
>> +	if (state->interface != PHY_INTERFACE_MODE_NA &&
>> +	    state->interface != PHY_INTERFACE_MODE_MII &&
>> +	    state->interface != PHY_INTERFACE_MODE_GMII &&
>> +	    !(MTK_HAS_CAPS(mac->hw->soc->caps, MTK_RGMII) &&
>> +	      phy_interface_mode_is_rgmii(state->interface)) &&
>> +	    !(MTK_HAS_CAPS(mac->hw->soc->caps, MTK_TRGMII) &&
>> +	      !mac->id && state->interface == PHY_INTERFACE_MODE_TRGMII)) {
>> +		linkmode_zero(supported);
>> +		return;
>>  	}
>>
>> +	phylink_set_port_modes(mask);
>> +	phylink_set(mask, Autoneg);
>>
>> +	if (state->interface == PHY_INTERFACE_MODE_TRGMII) {
>> +		phylink_set(mask, 1000baseT_Full);
>> +	} else {
>> +		phylink_set(mask, 10baseT_Half);
>> +		phylink_set(mask, 10baseT_Full);
>> +		phylink_set(mask, 100baseT_Half);
>> +		phylink_set(mask, 100baseT_Full);
>> +
>> +		if (state->interface != PHY_INTERFACE_MODE_MII) {
>> +			phylink_set(mask, 1000baseT_Half);
>> +			phylink_set(mask, 1000baseT_Full);
>> +			phylink_set(mask, 1000baseX_Full);
>> +		}
>> +	}
>>
>> +	phylink_set(mask, Pause);
>> +	phylink_set(mask, Asym_Pause);
>>
>> +	linkmode_and(supported, supported, mask);
>> +	linkmode_and(state->advertising, state->advertising, mask);
>>  }
>
> This looks fine.

OK.

> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up

Greats,

René
