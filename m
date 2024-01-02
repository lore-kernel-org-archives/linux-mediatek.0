Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36301C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfPmEMBE1Wpq00R+242jiaLXkWvYzNKOQ5mWEYSaTTM=; b=o3Wf+jDVugwABRuBUrsJRdmdZ6
	9nK1AS2vhIhnekkKj3bMWIP7VX2Roo4/wPZun6HCdjz4kayNvpt8tNX/W2ze6NxKcDyHiqwm9xAuT
	f6IXvbHALXyIZF3tGqkm2UOB5YdRvKlzHkWjm866xoUxLZUG8xZQOR8npn9xR0cHpg5mpizUQJHO+
	F+Ft+KTAyYDMMczX+47VAsRHz2NF7FfvagTPBzX9t+dDlQFLV5fozm3SSc7MZukh39sPE8uxYqGdU
	ZY1/CVu9OO8daO0MBxngjgBgaHzdGvwD/gEwUFgHMIhRgCLkgwkrzttsqO57aspu6CloC3h+VvM4Q
	66dGThPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcQm-007edV-0N;
	Tue, 02 Jan 2024 10:55:32 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcQi-007ebh-2P;
	Tue, 02 Jan 2024 10:55:30 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rKcQJ-0006IK-2M;
	Tue, 02 Jan 2024 10:55:04 +0000
Date: Tue, 2 Jan 2024 11:52:34 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH RFC net-next] net: phylink: add quirk for disabling
 in-band-status for mediatek pcs at 2500base-x
Message-ID: <ZZPq8iMAv3eR9Gfk@pidgin.makrotopia.org>
References: <20240102074326.1049179-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102074326.1049179-1-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_025528_785694_C96F693C 
X-CRM114-Status: GOOD (  36.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 02, 2024 at 08:43:26AM +0100, Eric Woudstra wrote:
> In follow up to: net: pcs: pcs-mtk-lynxi: use 2500Base-X without AN
> 
> MediaTek LynxI PCS, 2500Base-X will only work without inband status due to
> hardware limitation.
> 
> I understand this patch probably will not get approved as it is now, but
> perhaps with some pointers in the correct direction to follow, I can change
> it so it could be. It does however get the result that the rtl8221b on a
> sfp module functions correctly, with and without (as optical sfp) the phy
> attached and without using a quirk/ethtool to disable auto-negotiation.
> 
> Introduce bool phylink_major_no_inband(pl,interface), a function similar to
> bool phylink_phy_no_inband(phy). An option could be to use a function like
> bool pcs->ops->supports_inband(interface), where if the function-pointer is
> null, it means it is supported for all. This instead of using
> of_device_is_compatible() inside the phylink_major_no_inband() function.
> 
> Code added to phylink_major_config():
> 
> When there is no PHY attached, pl->pcs_neg_mode is set to
> PHYLINK_PCS_NEG_INBAND_DISABLED.
> 
> When there is a PHY attached, pl->cur_link_an_mode is set to MLO_AN_PHY.
> To have the pcs function correctly with the rtl8221b, we need to do the
> following to the in-band-status:
> 
> We need to disable it when interface of the pcs is set to 2500base-x,
> but need it enable it when switched to sgmii.
> 
> So we get:
> 
> [...] mtk_soc_eth ... eth1: phy link up sgmii/1Gbps/Full/none/rx/tx
> [...] mtk_soc_eth ... eth1: phylink_mac_config: mode=inband/sgmii/none
>                                 adv=00,00000000,00000000,00000000 pause=03
> 
> [...] mtk_soc_eth ... eth1: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx
> [...] mtk_soc_eth ... eth1: phylink_mac_config: mode=phy/2500base-x/none
>                                 adv=00,00000000,00008000,0000606f pause=03
> 
> Changes to be committed:
> 	modified:   drivers/net/phy/phylink.c
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  drivers/net/phy/phylink.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Your changes should go into mtk_eth_soc.c, you sould not need to modify
phylink for this and as the link being up or down is still reported
correctly by the hardware, it is also ok to have phylink believe that
in-band-status is being used and just not set the SGMII_AN bit in the
MediaTek LynxI hardware.
(ie. only auto-negotiation of speed and duplex doesn't work in
2500Base-X mode)

> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 298dfd6982a5..6e443eb8ee46 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1074,6 +1074,22 @@ static void phylink_pcs_an_restart(struct phylink *pl)
>  		pl->pcs->ops->pcs_an_restart(pl->pcs);
>  }
>  
> +static bool phylink_major_no_inband(struct phylink *pl, phy_interface_t interface)
> +{
> +	struct device_node *node = pl->config->dev->of_node;
> +
> +	if (!node)
> +		return false;
> +
> +	if (!of_device_is_compatible(node, "mediatek,eth-mac"))
> +		return false;
> +
> +	if (interface != PHY_INTERFACE_MODE_2500BASEX)
> +		return false;
> +
> +	return true;
> +}
> +
>  static void phylink_major_config(struct phylink *pl, bool restart,
>  				  const struct phylink_link_state *state)
>  {
> @@ -1085,10 +1101,22 @@ static void phylink_major_config(struct phylink *pl, bool restart,
>  
>  	phylink_dbg(pl, "major config %s\n", phy_modes(state->interface));
>  
> +	if (phylink_major_no_inband(pl, state->interface) && (!!pl->phydev)) {
> +		if (pl->cur_link_an_mode == MLO_AN_INBAND)
> +			pl->cur_link_an_mode = MLO_AN_PHY;
> +		else
> +			/* restore mode if it was changed before */
> +			pl->cur_link_an_mode = pl->cfg_link_an_mode;
> +	}
> +
>  	pl->pcs_neg_mode = phylink_pcs_neg_mode(pl->cur_link_an_mode,
>  						state->interface,
>  						state->advertising);
>  
> +	if (phylink_major_no_inband(pl, state->interface) && !pl->phydev &&
> +	    pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
> +		pl->pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
> +
>  	if (pl->using_mac_select_pcs) {
>  		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
>  		if (IS_ERR(pcs)) {
> @@ -1218,6 +1246,9 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
>  				      struct phylink_link_state *state)
>  {
>  	linkmode_copy(state->advertising, pl->link_config.advertising);
> +	if (pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_DISABLED)
> +		linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> +				   state->advertising);
>  	linkmode_zero(state->lp_advertising);
>  	state->interface = pl->link_config.interface;
>  	state->rate_matching = pl->link_config.rate_matching;
> -- 
> 2.42.1
> 

