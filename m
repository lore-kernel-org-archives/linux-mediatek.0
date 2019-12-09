Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD34C43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 05:29:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FE8520637
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 05:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rs/3tG3S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RW5WN56e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FE8520637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyEQl4WX9MrVha0Cb1qvEb2gQ1E2abpiVXBsOyB9of0=; b=Rs/3tG3SbOnX02
	ep4Ko3d24kyntXueGw8fKk7BYMGQAJxYHcxEcX3xtuxHMDiX8NYx1OvhWMsB76wvEislq9ly23N+0
	OHVWLv2PJ0GaHgUQK1DZmBYdVh7Rnpt0vLgnfsxM7vt9CJQDexpM1mQP9I3Q0j2CH01OrAJ+sL2kB
	EwNAt1HPQN0mmDC32c0XLJIwLDR/4ABrAu0gS0TLymtr6Zrent2nuutFu9SJXKZLtdynVHVRvDWdt
	xP8aBkeBz9a5UJZaMp2FhfU27l+eCItWisUNM4KEbyupWajCJoMXRxZQVaUz4FoUo8D7x8DmgZg0Y
	4Sej71/Nh0Rpor7Qcgeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieBbj-0002m3-Ps; Mon, 09 Dec 2019 05:29:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieBbf-0002le-PA; Mon, 09 Dec 2019 05:29:18 +0000
X-UUID: 46916c96969d4fb08260827b8177c7ec-20191208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1kPa4zJHOSGaYA23yBBwBHLWH3hbtYiGylkDOLzCaCs=; 
 b=RW5WN56e4ZEmzyodValrlYVVgY8rihf9F+AcOz2mBQoOZRhGppamwzP0uo7q3C7E1aex4aMUX2aGz+GR/ciKs1LQ8vMbdKBFJ9aqv36iBfa/N4B0LYrLqA23yB06BiYi1/gJEAHGIGWGaqnPQKprr7rXeP4KtWE+gKHR/cWgCXE=;
X-UUID: 46916c96969d4fb08260827b8177c7ec-20191208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1137832282; Sun, 08 Dec 2019 21:29:12 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 8 Dec 2019 21:20:11 -0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Dec 2019 13:18:39 +0800
Message-ID: <1575868749.7013.6.camel@mtksdaap41>
Subject: Re: [resend PATCH v6 04/12] drm: mediatek: Omit warning on probe
 defers
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Mon, 9 Dec 2019 13:19:09 +0800
In-Reply-To: <20191207224740.24536-5-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-5-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_212915_829004_7146994C 
X-CRM114-Status: GOOD (  13.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Matthias:

On Sat, 2019-12-07 at 23:47 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> It can happen that the mmsys clock drivers aren't probed before the
> platform driver gets invoked. The platform driver used to print a warning
> that the driver failed to get the clocks. Omit this error on
> the defered probe path.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_color.c |  5 ++++-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c   |  5 ++++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c  |  5 ++++-
>  drivers/gpu/drm/mediatek/mtk_dpi.c        | 12 +++++++++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c    |  4 +++-
>  drivers/gpu/drm/mediatek/mtk_dsi.c        |  8 ++++++--
>  drivers/gpu/drm/mediatek/mtk_hdmi.c       |  4 +++-
>  7 files changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> index 59de2a46aa49..8f0fc96ef7bc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> @@ -118,7 +118,10 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
>  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
>  				&mtk_disp_color_funcs);
>  	if (ret) {
> -		dev_err(dev, "Failed to initialize component: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to initialize component: %d\n",
> +				ret);
> +
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 21851756c579..7487b0182c05 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -285,7 +285,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
>  				&mtk_disp_ovl_funcs);
>  	if (ret) {
> -		dev_err(dev, "Failed to initialize component: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to initialize component: %d\n",
> +				ret);
> +
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 405afef31407..835ea8f8dab9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -287,7 +287,10 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
>  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
>  				&mtk_disp_rdma_funcs);
>  	if (ret) {
> -		dev_err(dev, "Failed to initialize component: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to initialize component: %d\n",
> +				ret);
> +
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index be6d95c5ff25..9ed32470ad02 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -700,21 +700,27 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>  	dpi->engine_clk = devm_clk_get(dev, "engine");
>  	if (IS_ERR(dpi->engine_clk)) {
>  		ret = PTR_ERR(dpi->engine_clk);
> -		dev_err(dev, "Failed to get engine clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get engine clock: %d\n", ret);
> +
>  		return ret;
>  	}
>  
>  	dpi->pixel_clk = devm_clk_get(dev, "pixel");
>  	if (IS_ERR(dpi->pixel_clk)) {
>  		ret = PTR_ERR(dpi->pixel_clk);
> -		dev_err(dev, "Failed to get pixel clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get pixel clock: %d\n", ret);
> +
>  		return ret;
>  	}
>  
>  	dpi->tvd_clk = devm_clk_get(dev, "pll");
>  	if (IS_ERR(dpi->tvd_clk)) {
>  		ret = PTR_ERR(dpi->tvd_clk);
> -		dev_err(dev, "Failed to get tvdpll clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get tvdpll clock: %d\n", ret);
> +
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index b765181223e6..6054e2b675f9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -558,7 +558,9 @@ static int mtk_ddp_probe(struct platform_device *pdev)
>  
>  	ddp->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(ddp->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> +		if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get clock\n");
> +
>  		return PTR_ERR(ddp->clk);
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 4332563df952..66d5b0fdd678 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1110,14 +1110,18 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  	dsi->engine_clk = devm_clk_get(dev, "engine");
>  	if (IS_ERR(dsi->engine_clk)) {
>  		ret = PTR_ERR(dsi->engine_clk);
> -		dev_err(dev, "Failed to get engine clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get engine clock: %d\n", ret);
> +
>  		return ret;
>  	}
>  
>  	dsi->digital_clk = devm_clk_get(dev, "digital");
>  	if (IS_ERR(dsi->digital_clk)) {
>  		ret = PTR_ERR(dsi->digital_clk);
> -		dev_err(dev, "Failed to get digital clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get digital clock: %d\n", ret);
> +
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index ce91b61364eb..62f9ca2308ee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1447,7 +1447,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>  
>  	ret = mtk_hdmi_get_all_clk(hdmi, np);
>  	if (ret) {
> -		dev_err(dev, "Failed to get clocks: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get clocks: %d\n", ret);
> +
>  		return ret;
>  	}
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
