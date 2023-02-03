Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13627C05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2MGbg/8o+abIGc0E3O5T3MnuHPupls9EiKUA8fQhWs=; b=KsWvLTn1SxZUhLV61ENUkS1iwa
	akOpmS/bJOXYDvXd+A4LvIQSmDeCCeUDtKP3zSTApXaBE+EuRpZeLB8tsH6n6bcPqW4xYPN5lZ/Pv
	sQjhCslvgzWgfyWGdxC2Mp2KOc1EdiPXx4fdTKEB82xXkt/AxgDrDOpSXrXWVjCKlnB8KviZ+lSb4
	NbWB4M5lFeKuHT2nV0rkJU0Tu5IoUgYnbjgDzd6MVrhqzViGurenbOtjNCIzUfKZXRGwBuG/kA4Az
	JxJ3qSmWUIi5YLbS2hOvyytzoAciwr1esEkRSmzWc87mfrQEnvMnc3KHLCZzIhOMIh0u6FmyW4rSF
	HqpXVluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO3vV-003grT-Fe; Fri, 03 Feb 2023 21:48:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO3vP-003gpr-Ec; Fri, 03 Feb 2023 21:48:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso4868311wms.4;
        Fri, 03 Feb 2023 13:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F2MGbg/8o+abIGc0E3O5T3MnuHPupls9EiKUA8fQhWs=;
        b=LqWK7bpbT4S9m5fLKLW7NM9LNTDKyFZAkMLH+YzTh4IS2z8utaMnRvo9mQnjhqwIdU
         CEB4N+nrQ4zrJfRK57lRdROwzqMoLkfKzsD0QoZh5XE6Of8bBQDRvj8ry17gP733G+TF
         r6OSL8JiNaCsD1zVicRF9MUlft9JdaTpbzNEZz1yFnb5FyIR3GKd98XLAkkenS6epiUX
         YJqFfys5RLoyn/VkaW/SBfLsa8XjO2vUjdRO5n07hrxP/7TYx3bxTmHgJkTjzoSKZBeU
         6CRMs2g5mp9cBzVy/lahNyx4bF68HuAGbWil4r4HARNnKEROdn32E35mlURQfWNYTUDD
         7bCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2MGbg/8o+abIGc0E3O5T3MnuHPupls9EiKUA8fQhWs=;
        b=5BYETOEwtXRMn2VX0D4ShmgcBAKgcRL2LCZ6Y+WiyKIhYBKS5pSWAZR1EFiL4XCqSu
         nSXSfKkeV07AWMLM6XEddaGCUjagt8xA+cPutTaB/Vw01APJCnoFFfPNrRSNB8SsHoVc
         KVQIdbBeLP8CHEDGlE2DTMxOW/qRNLF88KlhUpMY3HtAw9JRcORprAJJ4l0hyp1rNbEG
         V1ieCdmn1Pt9hri8jhXfiGz3H00YiiIXIFbCa3A82dyciCfau3YvR1u4XUqbzphkq8ji
         UQNNVL1ZitMDfUe52CW406B+PYcpPOmFn9x9QTC2IGccJWyyL8qrwsMIagMb3kxHNkgA
         oAOA==
X-Gm-Message-State: AO0yUKVabID4dtpmxEyqKABNLje7VYhZCisjrCWRm/Nu1KApuEybvHdo
	6KymBB7ewB2Dznn5AU9qQg0=
X-Google-Smtp-Source: AK7set85lrCYKEyfy05TF6DM5Y8P3A0rWOxyikWBgI5c4wbWzr7wHvuYxoTOE7UBY+5RMD9l5GPfQg==
X-Received: by 2002:a05:600c:288:b0:3dc:1054:3acd with SMTP id 8-20020a05600c028800b003dc10543acdmr10916930wmk.17.1675460927888;
        Fri, 03 Feb 2023 13:48:47 -0800 (PST)
Received: from skbuf ([188.26.57.116])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c469000b003a84375d0d1sm9596218wmo.44.2023.02.03.13.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 13:48:47 -0800 (PST)
Date: Fri, 3 Feb 2023 23:48:44 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 2/9] net: ethernet: mtk_eth_soc: set MDIO bus clock
 frequency
Message-ID: <20230203214844.jqvhcdyuvrjf5dxg@skbuf>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <cover.1675407169.git.daniel@makrotopia.org>
 <a613b66b4872b5f3f09544138d03d5326a8f6f8b.1675407169.git.daniel@makrotopia.org>
 <a613b66b4872b5f3f09544138d03d5326a8f6f8b.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a613b66b4872b5f3f09544138d03d5326a8f6f8b.1675407169.git.daniel@makrotopia.org>
 <a613b66b4872b5f3f09544138d03d5326a8f6f8b.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_134852_941187_B6E2A12F 
X-CRM114-Status: GOOD (  23.47  )
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

On Fri, Feb 03, 2023 at 07:01:01AM +0000, Daniel Golle wrote:
> Set MDIO bus clock frequency and allow setting a custom maximum
> frequency from device tree.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 25 +++++++++++++++++++++
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  5 +++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index a44ffff48c7b..9050423821dc 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -790,7 +790,9 @@ static const struct phylink_mac_ops mtk_phylink_ops = {
>  static int mtk_mdio_init(struct mtk_eth *eth)
>  {
>  	struct device_node *mii_np;
> +	int clk = 25000000, max_clk = 2500000, divider = 1;

Would be good if constant values (clk) weren't put in variables.

>  	int ret;
> +	u32 val;
>  
>  	mii_np = of_get_child_by_name(eth->dev->of_node, "mdio-bus");
>  	if (!mii_np) {
> @@ -818,6 +820,29 @@ static int mtk_mdio_init(struct mtk_eth *eth)
>  	eth->mii_bus->parent = eth->dev;
>  
>  	snprintf(eth->mii_bus->id, MII_BUS_ID_SIZE, "%pOFn", mii_np);
> +
> +	if (!of_property_read_u32(mii_np, "clock-frequency", &val))
> +		max_clk = val;

Checking for valid range? There should also probably be a dt-bindings
patch for this.

> +
> +	while (clk / divider > max_clk) {
> +		if (divider >= 63)
> +			break;
> +
> +		divider++;
> +	};

uhm, "divider = min(DIV_ROUND_UP(25000000, max_clk), 63);"? I don't
think the compiler is smart enough to optimize away this loop.

> +
> +	val = mtk_r32(eth, MTK_PPSC);
> +	val |= PPSC_MDC_TURBO;
> +	mtk_w32(eth, val, MTK_PPSC);

What does "TURBO" do and why do you set it unconditionally?

> +
> +	/* Configure MDC Divider */
> +	val = mtk_r32(eth, MTK_PPSC);
> +	val &= ~PPSC_MDC_CFG;
> +	val |= FIELD_PREP(PPSC_MDC_CFG, divider);
> +	mtk_w32(eth, val, MTK_PPSC);
> +
> +	dev_dbg(eth->dev, "MDC is running on %d Hz\n", clk / divider);
> +
>  	ret = of_mdiobus_register(eth->mii_bus, mii_np);
>  
>  err_put_node:
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 7230dcb29315..724815ae18a0 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -363,6 +363,11 @@
>  #define RX_DMA_VTAG_V2		BIT(0)
>  #define RX_DMA_L4_VALID_V2	BIT(2)
>  
> +/* PHY Polling and SMI Master Control registers */
> +#define MTK_PPSC		0x10000
> +#define PPSC_MDC_CFG		GENMASK(29, 24)
> +#define PPSC_MDC_TURBO		BIT(20)
> +
>  /* PHY Indirect Access Control registers */
>  #define MTK_PHY_IAC		0x10004
>  #define PHY_IAC_ACCESS		BIT(31)
> -- 
> 2.39.1
> 


