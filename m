Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C016C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 18:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYY1WGUlFu3LHEknIjWYzHC9m3GxRypTmJeMZynpmoc=; b=0fML3tqopKsPzddnV/NF3z2m9M
	VRy7cKnIuviwGXkGZdn0Ycy3B1ipDdimM9O9HZP7pmhNB6UWybMY1JCLBbyLxMYj6oC00nfA2QeJ0
	wQOnRCzJ2ww1zXMx+umocoqGRpdEnr1vpBWa+joBckWzuOGg3m87ARvnH+Ifa2baLFL9sZHLeN6EY
	tT0ZxEbMEiMXVRBoxFUfnib7GWaPbcHD/EIRlu2lBgzLcVIAg1R44nD5hrf+bhKQRoFl6v+X5NBrL
	ln4sVRGU8P4J7cNno4DiUVuptppDZwoTB81h3zo404N7ZTo0h2LlPlhiUJekkEKmyAfo1eJhIdYJP
	0apTlaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBV3-00Gq3H-LA; Mon, 21 Nov 2022 18:26:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBV1-00Gq22-77; Mon, 21 Nov 2022 18:26:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso9625420wms.4;
        Mon, 21 Nov 2022 10:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYY1WGUlFu3LHEknIjWYzHC9m3GxRypTmJeMZynpmoc=;
        b=BMpPUpy1dbUannUvVn81D+zgHMQqJrxbhFO0RaRdh0Sr2YdIiA8qWiPQId/7e86XyE
         UKKUu8FAasA4QhntkdxzK6hhIhw2Kyqdm1ZJxNmD6FLO3b+MiBmFfhiPmmRSr+f6PU2f
         U96ThI8i28vUX0MA1CYwx1GN1Rx7gHILRlCGpDLmSZYh4q1avVqgRxj7HITGxyOb99LI
         aw0mYNug5f9Z8SKZ27Q7XEdzI+xIiJlm9oOprr7CHODuhS5UdqbgS0as/Qrjda6m/Fxc
         Lo83yKRtFrFkCXhVWnr0wxarEA1dXcPtxNAgS0WmPCitqVYJjqv+DJ1dVG00vmQ6oJUW
         RDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYY1WGUlFu3LHEknIjWYzHC9m3GxRypTmJeMZynpmoc=;
        b=NVg22O/tmD3ydWsOFos4JtkOpKKE2Q8H+RpQOb2XOzOOeI88WY73wJEqG54+hRmMIn
         CZ2RJ/MghMzBEyjcZfXaoSv6JyVI+FAYzxIi6jidb3Z+eXp2xUYOcga1XfDkjxfh2Xsu
         QJOMDS3ZDdL9ECw1cmXf3K5im3USzk9JNydLjymB+XZobbJ/kTV/wcD2fGl7BghYINK6
         sP7IwvojtpV0nIV9/OxDcetPG3WdkFMZvTBBlmlKdGA0Y/JvIIu2Az/XIafwlKGHflQJ
         TfQZUhQW+mGG10aqKt9WlidIxiZUHG34+qLGV+pDAb0u0hxAfKiT/eC1aC8t6BETL+UR
         d+9A==
X-Gm-Message-State: ANoB5pk8oZGlCu9fxX2p5pxONqOcBv8qMTbjxxaVEtqCJb8Gbu4ReXND
	zqZJb5gcGIwOg4QtGeF2FqY=
X-Google-Smtp-Source: AA0mqf6yCGhkec2FBMPTt/xEGxj7cTO8UY/s4IB/NjHb8m/jA+PTdyj33+oFLraPa4pI+obZxpLhXA==
X-Received: by 2002:a05:600c:4f93:b0:3cf:a616:ccc0 with SMTP id n19-20020a05600c4f9300b003cfa616ccc0mr17700691wmq.73.1669055188375;
        Mon, 21 Nov 2022 10:26:28 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j39-20020a05600c1c2700b003cf57329221sm20867065wms.14.2022.11.21.10.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 10:26:26 -0800 (PST)
Message-ID: <d7afdf50-0e8c-4954-d3f8-1d8890e70a24@gmail.com>
Date: Mon, 21 Nov 2022 19:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v13,2/3] drm: mediatek: Set dpi format in mmsys
Content-Language: en-US
To: xinlei.lee@mediatek.com, rex-bc.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 nfraprado@collabora.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
References: <1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com>
 <1666577099-3859-3-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1666577099-3859-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_102631_299840_F8EB6E8B 
X-CRM114-Status: GOOD (  20.31  )
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



On 24/10/2022 04:04, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

I realized that I took this patch by error. I'll drop it from my tree now.

Regards,
Matthias

> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..ad87ecddf58d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,6 +15,7 @@
>   #include <linux/of_graph.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/types.h>
>   
>   #include <video/videomode.h>
> @@ -30,6 +31,7 @@
>   #include "mtk_disp_drv.h"
>   #include "mtk_dpi_regs.h"
>   #include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
>   
>   enum mtk_dpi_out_bit_num {
>   	MTK_DPI_OUT_BIT_NUM_8BITS,
> @@ -67,6 +69,7 @@ struct mtk_dpi {
>   	struct drm_connector *connector;
>   	void __iomem *regs;
>   	struct device *dev;
> +	struct device *mmsys_dev;
>   	struct clk *engine_clk;
>   	struct clk *pixel_clk;
>   	struct clk *tvd_clk;
> @@ -135,6 +138,7 @@ struct mtk_dpi_yc_limit {
>    * @yuv422_en_bit: Enable bit of yuv422.
>    * @csc_enable_bit: Enable bit of CSC.
>    * @pixels_per_iter: Quantity of transferred pixels per iteration.
> + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
>    */
>   struct mtk_dpi_conf {
>   	unsigned int (*cal_factor)(int clock);
> @@ -153,6 +157,7 @@ struct mtk_dpi_conf {
>   	u32 yuv422_en_bit;
>   	u32 csc_enable_bit;
>   	u32 pixels_per_iter;
> +	bool edge_cfg_in_mmsys;
>   };
>   
>   static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
> @@ -449,8 +454,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
>   		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
>   			     dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE ?
>   			     EDGE_SEL : 0, EDGE_SEL);
> +		if (dpi->conf->edge_cfg_in_mmsys)
> +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_DPI_RGB888_DDR_CON);
>   	} else {
>   		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE, 0);
> +		if (dpi->conf->edge_cfg_in_mmsys)
> +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_DPI_RGB888_SDR_CON);
>   	}
>   }
>   
> @@ -778,8 +787,10 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>   {
>   	struct mtk_dpi *dpi = dev_get_drvdata(dev);
>   	struct drm_device *drm_dev = data;
> +	struct mtk_drm_private *priv = drm_dev->dev_private;
>   	int ret;
>   
> +	dpi->mmsys_dev = priv->mmsys_dev;
>   	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
>   				      DRM_MODE_ENCODER_TMDS);
>   	if (ret) {

