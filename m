Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2179C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAQUCKEnYSfpKjHFXLGXeEkYkDD9RFMsA10lxwpL33U=; b=FzwnW7fiuzbmjNoopwqoVorWiL
	otXSvSPUZ19ZeudMk5EJjm8xBdQ/XXuZC3yKUUIIcbTQp+EU5kH5/B0X6QwXvOrEiu/uGejZwZSxP
	gnpkZx31041r0yT6YiKWLj3jFUlbZV0Xg8kR9HTBdp00up1o8D3OnSRFWfqLQwJTVNCBJJUYsmscR
	RcChpsaWZlB9A+3qc7bHkKYCUsE+n8dOgagjlECtWfajXgCpi6Qe8tLMsNa/GYZwb4xZf2Q4cKC/3
	sn0jOQnDmQQCVVJJbEWWXOaWxcAtihLZbqAtRI2B7X+EA9oAs/hZ0ED215xYAwsVrfDgv0brm7CGc
	uDtMoqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtSz-00DLKc-9g; Wed, 22 Feb 2023 18:03:45 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtSj-00DLA9-8V; Wed, 22 Feb 2023 18:03:33 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pUtSW-0008EJ-1o;
	Wed, 22 Feb 2023 19:03:16 +0100
Date: Wed, 22 Feb 2023 18:03:13 +0000
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
Subject: Re: [PATCH v5 32/54] clk: mediatek: mt7986-apmixed: Use PLL_AO flag
 to set critical clock
Message-ID: <Y/ZY4QVnreMX9K9S@makrotopia.org>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
 <20230222092543.19187-33-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222092543.19187-33-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_100329_326403_0573AF9F 
X-CRM114-Status: GOOD (  15.99  )
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

On Wed, Feb 22, 2023 at 10:25:21AM +0100, AngeloGioacchino Del Regno wrote:
> Instead of calling clk_prepare_enable() at probe time, add the PLL_AO
> flag to CLK_APMIXED_ARMPLL clock: this will set CLK_IS_CRITICAL.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Daniel Golle <daniel@makrotopia.org>
(on BananaPi BPi-R3)

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
> 2.39.2
> 
> 

