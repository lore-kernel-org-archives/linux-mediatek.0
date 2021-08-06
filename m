Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9D2C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 17:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 638F26113B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 17:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 638F26113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l0zLDXJTgAn2hplI3VOKbjPTKQkrG+r1rlu4OH5s1Nc=; b=1QXX+pDzUIL1tVeiVem3b87QtF
	gcenejtmy21ORmD91mOHJkNNiNVZYjFq2oefoyS8wwfarhA5HokfhHwAG6IIvrsRL0YcLPvqpo1ry
	nD1kGInqsW93RmONvKOcRb75SoX1oBvDn2a4R7O2nCHPHW5xUf3T7c/rrk2sGfkBrtckLysLyeuBf
	c5pzIR1TBsE5BT+WUBx4Z20TQj7WKaGSbXIoIcBGxKun1fKFqc5H5ltcTlFa2el6xBKy2IFQqsU/n
	broKJWMMVMvTzNSjpte9YKDy3WVyffc+byZQ5HA2TNWU+JG/K1e/hbvNm0PMgHodWD06dXUnQd/Na
	DP3iF1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC3jW-00D336-JZ; Fri, 06 Aug 2021 17:34:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC3jJ-00D31x-FA; Fri, 06 Aug 2021 17:33:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id b11so12049030wrx.6;
 Fri, 06 Aug 2021 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=51Wt/epNCWPynZo+P6Tn8h9IazfrQzknOp2Tf5pj0cA=;
 b=hjwqkNIiEJwKS1s/Te9KqI1+7oDR4SYvX5/4vGEi/Ix4wAC0PeG+0xw8Sse6IV4WI9
 hWxlp6woHvgNjuEPWp2cs5WcJRwS0QiKxXDTXe4yLnXkkS1yxEBhJq3hBus+3GVpzyhf
 bt++srvFqauqJefvVBdz8hMKbhq4RAPidYEUGa0hbrqvS26TCoofEePDW+rSZ2DV4Lqp
 7Jk43NjqTehcwv+M++9+vGw3swh8m8jWmYMNYS7+ToUqTK0y13Sd6wQznmlV/MPLlxsJ
 NBUd544c4/R2Er6/VNP+x+sCmA1yV8592BACRaYW4ZNUbH75wFM6hylCwgE2me5ybZuE
 qeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=51Wt/epNCWPynZo+P6Tn8h9IazfrQzknOp2Tf5pj0cA=;
 b=uk3yTBhrEIsRD5SiBr3Mym3SRHzrBhf/hotPpOEOuSbyP5wVyWOpEq3HtNtnKMDc3M
 5fgH5qfmoLI3MOgCH8SZAqfff39YU08eLHxEr0mJfnqhKJy41k9cHPsdV4Kqpzpm40bm
 tyUdqkHVQL/7ZTrKVhYSn+UFDjXt/I3pMv+TXX/+Kc/REwTdAMPwK1rYO4RwxVHxH0SL
 YTSJBGPVqQIV/VQM90xbb0EjfSM0JLhztJHgFtkP6Yz9k5zM7MnKgJeTCFDJbiGUb8/J
 hH1PEJpmwFPLe2zn7VcgDMaELvsSrjDeXfMN267JKHSuW9WJ51L61zK1mcuU9cEDePCg
 Q1MQ==
X-Gm-Message-State: AOAM530nKFTMLPBQZhILmUg/YIUXYMNJHrseiV01w9EAsODGsgTrur05
 hHjPE/TT99szWib1uZ+94Ep6Y5P4bThDaw==
X-Google-Smtp-Source: ABdhPJzOTJ2EX8FsBZts+T/paw3f2zPRquLswWYFayFLKIcZGolcAU16ulg29fb0QV9HVRhGQ73qNw==
X-Received: by 2002:a05:6000:227:: with SMTP id
 l7mr11558350wrz.289.1628271235701; 
 Fri, 06 Aug 2021 10:33:55 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id q14sm10474504wrm.66.2021.08.06.10.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 10:33:55 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] drm/mediatek: mtk_dsi: Reset the dsi0 hardware
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <07319ed2-aed9-cbd7-06aa-6603a9bd4567@gmail.com>
Date: Fri, 6 Aug 2021 19:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210714121116.v2.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_103357_583327_A2D68147 
X-CRM114-Status: GOOD (  21.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/07/2021 12:11, Enric Balletbo i Serra wrote:
> Reset dsi0 HW to default when power on. This prevents to have different
> settingbetween the bootloader and the kernel.

settings between the...

> 
> As not all Mediatek boards have the reset consumer configured in their
> board description, also is not needed on all of them, the reset is optional,
> so the change is compatible with all boards.
> 
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index ae403c67cbd9..d8b81e2ab841 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  
>  #include <video/mipi_display.h>
>  #include <video/videomode.h>
> @@ -980,8 +981,10 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>  	struct mtk_dsi *dsi = dev_get_drvdata(dev);
>  
>  	ret = mtk_dsi_encoder_init(drm, dsi);
> +	if (ret)
> +		return ret;
>  
> -	return ret;
> +	return device_reset_optional(dev);
>  }
>  
>  static void mtk_dsi_unbind(struct device *dev, struct device *master,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
