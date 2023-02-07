Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1EAC636D6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdXqRodsT0KMBcr1Y+angUt5UdKnEnGifQwH1u2q9B0=; b=xljnHEUYPPwXzb+oXSYcp46RN1
	5KbJeNMFD2vC5nU2xPJu1I1LzuUWpelgCAI8zy1tlIh1HfBZwNL8g4A+VNl4rwqpSacwxOpW9uTVC
	CADa5ohAclh25O9NRfSyiXWD7NSIpnTanhlPqGAbeIAduCDVj8ZNp71iJlMxcXU52K9TiLwJwYkja
	iFNxreQY6MlfrZxdZQZXdxGS+XcVXqLVjYJZl+cyu+gks6WW1KJH0eUqduJMybs+SItb16BGbm5OC
	FMqJUBrrV0N3a1M38xV1OT27c+eEEecqn+D63ya0B9q86v5hBEwulxM+YiCAC2GuDrNFlmd2ynjWL
	hXU2p+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPCT-00CYSd-In; Tue, 07 Feb 2023 14:44:01 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPCJ-00CYPc-6H; Tue, 07 Feb 2023 14:43:52 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pPPBv-0002K9-2P;
	Tue, 07 Feb 2023 15:43:27 +0100
Date: Tue, 7 Feb 2023 14:43:24 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	wenst@chromium.org, johnson.wang@mediatek.com,
	miles.chen@mediatek.com, chun-jie.chen@mediatek.com,
	fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
	rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
	sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com, granquet@baylibre.com,
	pablo.sun@mediatek.com, sean.wang@mediatek.com,
	chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 29/45] clk: mediatek: mt7986-apmixed: Use PLL_AO flag
 to set critical clock
Message-ID: <Y+JjjLLYoOgSlG55@makrotopia.org>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-30-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206152928.918562-30-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_064351_249291_6B207BFE 
X-CRM114-Status: GOOD (  18.28  )
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


On Mon, Feb 06, 2023 at 04:29:12PM +0100, AngeloGioacchino Del Regno wrote:
> Instead of calling clk_prepare_enable() at probe time, add the PLL_AO
> flag to CLK_APMIXED_ARMPLL clock: this will set CLK_IS_CRITICAL.

I've been preparing a similar change, but also splitting-off the
apmixed part from dt headers into a file of its own, so that one of now
identical drivers for MT7986 and MT7981 can be removed in favor of a
shared driver.
Should I propose this on top of this series or can you make this change?


> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt7986-apmixed.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
> index 62080ee4dbe3..227ca572056e 100644
> --- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
> +++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
> @@ -42,7 +42,7 @@
>  		 "clkxtal")
>  
>  static const struct mtk_pll_data plls[] = {
> -	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, 0, 32,
> +	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, PLL_AO, 32,
>  	    0x0200, 4, 0, 0x0204, 0),
>  	PLL(CLK_APMIXED_NET2PLL, "net2pll", 0x0210, 0x021C, 0x0, 0, 32,
>  	    0x0210, 4, 0, 0x0214, 0),
> @@ -77,8 +77,6 @@ static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
>  
>  	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
>  
> -	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
> -
>  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
> -- 
> 2.39.1
> 
> 

