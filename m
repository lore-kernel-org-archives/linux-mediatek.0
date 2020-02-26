Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE44DC4BA0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 08:13:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD38C20714
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 08:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zjm90HDr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FrduCwNs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD38C20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KI8QwKELw5ObG7e5O7PAybPkFfBLcAtj+q0BsUPRSpc=; b=Zjm90HDrIgwBfj
	o65KvX/8g1f2PNup7K2Qc+tFeRk7R5QTmK7vrXJpDRUuwuOp0qYRZGU7WS125nESDBZ62rSEE+32C
	Xs4fGYrLjvwpddwy22O8xI+Uc065/L1I8f3Hc5KLS4kv4wHOpXAflP8Nug7Z/taKQghjYiwM92PtA
	2i/khHWAeD1HP3fpC2EoQflawiwjtlltvtLyOamu1q/cv4EDhn73McusSQ8zOFCoQZe3vhtbl7dmx
	hA4SpDCsJSHYTTjDBEpBShRELxaRYMobXSRIGjqatGWoVbCOIQX7Shccf+Uf2to9cw2TMPZlMCuEH
	mvg4hsRDYKULHHC/4Ffw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6rol-00034b-A8; Wed, 26 Feb 2020 08:13:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6roY-0002ua-Kw; Wed, 26 Feb 2020 08:13:08 +0000
X-UUID: 8fd1994aad2e45d9b43e8c0dc5274e81-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=noxquxXfq+6mXpmYdqPQhbsR120SnaVrynFCGzYug/4=; 
 b=FrduCwNsqTc82igR71qirzITQlHEg0jpki5wYi/J0KOAA3P23LOsbUYlIkcs+Ndw0JEqr/6qWjJrfp3ptbCqN7xBg9vyTbGPVreVIk/L6R/nCwna4Mbj1Q4qEgq8jwerPKbv5gu8hE9CKjGko4U/GeUY72vfJX5FkLDQ2uGbSXQ=;
X-UUID: 8fd1994aad2e45d9b43e8c0dc5274e81-20200226
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 982495471; Wed, 26 Feb 2020 00:13:00 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 00:14:04 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 16:11:04 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 16:13:05 +0800
Message-ID: <1582704777.11957.1.camel@mtksdaap41>
Subject: Re: [PATCH v9 5/5] drm/mediatek: set dpi pin mode to gpio low to
 avoid leakage current
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Wed, 26 Feb 2020 16:12:57 +0800
In-Reply-To: <20200226053238.31646-6-jitao.shi@mediatek.com>
References: <20200226053238.31646-1-jitao.shi@mediatek.com>
 <20200226053238.31646-6-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_001306_688126_5CF19287 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jitao:

On Wed, 2020-02-26 at 13:32 +0800, Jitao Shi wrote:
> Config dpi pins mode to output and pull low when dpi is disabled.
> Aovid leakage current from some dpi pins (Hsync Vsync DE ... ).
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 31 ++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index db3272f7a4c4..ae4c6308bb68 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -10,7 +10,9 @@
>  #include <linux/kernel.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_gpio.h>
>  #include <linux/of_graph.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
>  
> @@ -74,6 +76,9 @@ struct mtk_dpi {
>  	enum mtk_dpi_out_yc_map yc_map;
>  	enum mtk_dpi_out_bit_num bit_num;
>  	enum mtk_dpi_out_channel_swap channel_swap;
> +	struct pinctrl *pinctrl;
> +	struct pinctrl_state *pins_gpio;
> +	struct pinctrl_state *pins_dpi;
>  	int refcount;
>  	u32 pclk_sample;
>  };
> @@ -387,6 +392,9 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>  	if (--dpi->refcount != 0)
>  		return;
>  
> +	if (dpi->pinctrl && dpi->pins_gpio)
> +		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> +
>  	mtk_dpi_disable(dpi);
>  	clk_disable_unprepare(dpi->pixel_clk);
>  	clk_disable_unprepare(dpi->engine_clk);
> @@ -411,6 +419,9 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>  		goto err_pixel;
>  	}
>  
> +	if (dpi->pinctrl && dpi->pins_dpi)
> +		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> +
>  	mtk_dpi_enable(dpi);
>  	return 0;
>  
> @@ -719,6 +730,26 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>  	of_property_read_u32_index(dev->of_node, "pclk-sample", 1,
>  				   &dpi->pclk_sample);
>  
> +	dpi->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (IS_ERR(dpi->pinctrl)) {
> +		dpi->pinctrl = NULL;
> +		dev_dbg(&pdev->dev, "Cannot find pinctrl!\n");
> +	}
> +	if (dpi->pinctrl) {
> +		dpi->pins_gpio = pinctrl_lookup_state(dpi->pinctrl, "gpiomode");
> +		if (IS_ERR(dpi->pins_gpio)) {
> +			dpi->pins_gpio = NULL;
> +			dev_dbg(&pdev->dev, "Cannot find pinctrl gpiomode!\n");
> +		}
> +		if (dpi->pins_gpio)
> +			pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> +
> +		dpi->pins_dpi = pinctrl_lookup_state(dpi->pinctrl, "dpimode");
> +		if (IS_ERR(dpi->pins_dpi)) {
> +			dpi->pins_dpi = NULL;
> +			dev_dbg(&pdev->dev, "Cannot find pinctrl dpimode!\n");
> +		}
> +	}
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	dpi->regs = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(dpi->regs)) {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
