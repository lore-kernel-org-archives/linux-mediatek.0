Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F0EC77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 01:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2G2QvD8LSN6zsKrK4x10klW74FtFwbyAIvDGNKBlgI=; b=NtxvhX0eRtTEj5QIbHUndcSqwD
	Xo4IGipQs4xYEB83tCm9p6hFEuoC1XT52m3CdBLIoWWCeX/vqqYLXBp93+kGd6XVfAg0V3E1rRrOP
	l58NQyWwW7gSjjRiFyrI0/HgaJK0uJ2Mm+zMm8HVrzVpXh8yakoD6/y73eBUhLyY21MjQOEfqtgQW
	gPbbfoLV54G9fzFy7XSxPyMMTYx9Rdv7WyiRdgU5Fmcyzk2sNe4KZPi/as/qS/Ebx1wl0IUhRtiqp
	lj2elEcyRoNt+oE23tGS2P0lblbsoPq1Q1hppyT+Pz8OvxBlsXwCs92M7u19Gvsw9dU7TSOBfVfzh
	57POqW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn8Yx-0083or-3C;
	Fri, 14 Apr 2023 01:49:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn8Yv-0083oD-26;
	Fri, 14 Apr 2023 01:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=E2G2QvD8LSN6zsKrK4x10klW74FtFwbyAIvDGNKBlgI=; b=mKoGtUTFW1RJGS3hAqeCxHJJ5A
	zG4T1dYaG40Nfu1CCGZib5u3IkjqmcT+jBShPe9xtQQfghWSW/OHaOAHOWJsQTOy9l4J9eBKHOsCw
	HPW9qZFTv1e7UxRIblVwHXOAAhULUz3eydk7O7toklv4Zq3xiEsVo6Oc0k9Gd8bUdDpo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pn8Ym-00AF4Q-5H; Fri, 14 Apr 2023 03:49:08 +0200
Date: Fri, 14 Apr 2023 03:49:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH net-next] net: phy: add driver for MediaTek SoC built-in
 GE PHYs
Message-ID: <1295d8aa-35e8-4396-b347-efc8d7557c79@lunn.ch>
References: <ZDihjfnzaZ1yh9cT@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDihjfnzaZ1yh9cT@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_184917_686362_96BC8CC6 
X-CRM114-Status: GOOD (  18.01  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +/* Registers on MDIO_MMD_VEND1 */
> +#define MTK_PHY_MIDDLE_LEVEL_SHAPPER_0TO1	0
> +#define MTK_PHY_1st_OVERSHOOT_LEVEL_0TO1	1
> +#define MTK_PHY_2nd_OVERSHOOT_LEVEL_0TO1	2
> +#define MTK_PHY_1st_OVERSHOOT_LEVEL_1TO0	4
> +#define MTK_PHY_2nd_OVERSHOOT_LEVEL_1TO0	5 /* N means negative */
> +#define MTK_PHY_1st_OVERSHOOT_LEVEL_0TON1	7
> +#define MTK_PHY_2nd_OVERSHOOT_LEVEL_0TON1	8
> +#define MTK_PHY_1st_OVERSHOOT_LEVEL_N1TO0	10
> +#define MTK_PHY_2nd_OVERSHOOT_LEVEL_N1TO0	11

Mixed case like this is very unusual.

> +static int tx_amp_fill_result(struct phy_device *phydev, u16 *buf)
> +{
> +	int i;
> +	int bias[16] = {0};
> +	const int vals_9461[16] = { 7, 1, 4, 7,
> +				    7, 1, 4, 7,
> +				    7, 1, 4, 7,
> +				    7, 1, 4, 7 };
> +	const int vals_9481[16] = { 10, 6, 6, 10,
> +				    10, 6, 6, 10,
> +				    10, 6, 6, 10,
> +				    10, 6, 6, 10 };
> +
> +	switch (phydev->drv->phy_id) {
> +	case MTK_GPHY_ID_MT7981:
> +		/* We add some calibration to efuse values
> +		 * due to board level influence.
> +		 * GBE: +7, TBT: +1, HBT: +4, TST: +7
> +		 */
> +		memcpy(bias, (const void *)vals_9461, sizeof(bias));
> +		for (i = 0; i <= 12; i += 4) {
> +			if (likely(buf[i >> 2] + bias[i] >= 32)) {
> +				bias[i] -= 13;
> +			} else {
> +				phy_modify_mmd(phydev, MDIO_MMD_VEND1,
> +					       0x5c, 0x7 << i, bias[i] << i);
> +				bias[i + 1] += 13;
> +				bias[i + 2] += 13;
> +				bias[i + 3] += 13;

How does 13 map to GBE: +7, TBT: +1, HBT: +4, TST: +7 ?

> +static inline void mt798x_phy_common_finetune(struct phy_device *phydev)

No inline functions in .c files. Let the compiler decide. There
appears to be a number of these. And they are big function, too big to
make sense to inline.

>  static struct phy_driver mtk_gephy_driver[] = {
>  	{
> -		PHY_ID_MATCH_EXACT(0x03a29412),
> +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
>  		.name		= "MediaTek MT7530 PHY",
>  		.config_init	= mt7530_phy_config_init,
>  		/* Interrupts are handled by the switch, not the PHY
> @@ -84,7 +1205,7 @@ static struct phy_driver mtk_gephy_driver[] = {
>  		.write_page	= mtk_gephy_write_page,
>  	},
>  	{
> -		PHY_ID_MATCH_EXACT(0x03a29441),
> +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7531),
>  		.name		= "MediaTek MT7531 PHY",
>  		.config_init	= mt7531_phy_config_init,
>  		/* Interrupts are handled by the switch, not the PHY

Useful changes, but please put them in a separate patch.

> @@ -97,16 +1218,42 @@ static struct phy_driver mtk_gephy_driver[] = {
>  		.read_page	= mtk_gephy_read_page,
>  		.write_page	= mtk_gephy_write_page,
>  	},
> +#if IS_ENABLED(CONFIG_MEDIATEK_GE_PHY_SOC)
> +	{
> +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
> +		.name		= "MediaTek MT7981 PHY",
> +		.probe		= mt7981_phy_probe,
> +		.config_intr	= genphy_no_config_intr,
> +		.handle_interrupt = genphy_handle_interrupt_no_ack,
> +		.suspend	= genphy_suspend,
> +		.resume		= genphy_resume,
> +		.read_page	= mtk_gephy_read_page,
> +		.write_page	= mtk_gephy_write_page,
> +	},
> +	{
> +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988),
> +		.name		= "MediaTek MT7988 PHY",
> +		.probe		= mt7988_phy_probe,
> +		.config_intr	= genphy_no_config_intr,
> +		.handle_interrupt = genphy_handle_interrupt_no_ack,
> +		.suspend	= genphy_suspend,
> +		.resume		= genphy_resume,
> +		.read_page	= mtk_gephy_read_page,
> +		.write_page	= mtk_gephy_write_page,

So the only thing these two new PHYs share with the other two PHYs is
mtk_gephy_read_page and mtk_gephy_write_page?

static int mtk_gephy_read_page(struct phy_device *phydev)
{
        return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
}

static int mtk_gephy_write_page(struct phy_device *phydev, int page)
{
        return __phy_write(phydev, MTK_EXT_PAGE_ACCESS, page);
}

Given the size of the new code, maybe consider adding
mediatek-ge-soc.c and make a copy these two functions?

	Andrew

