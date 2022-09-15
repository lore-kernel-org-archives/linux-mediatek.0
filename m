Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED09C6FA89
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04xgqSaRrD4Mt6bAKc6OPHCEttCSurLeTnJ0LfF3Y88=; b=mo3iQ2yHFaidKpdNGn9A08FmGH
	tyrdZfjR851TexdDKQ/4Yk+dLBTKXrWrpqo0iKc/PLkc3xRgH/Hm0t6oKDVoSeGTz5BI25IuubuaT
	x8l6gpVx7XZf24+9Yb2taeZYJR+e/KJ/0IdDply3ZoPySDyJ7tvfpH1s4trY4HKaLhi+TiPBJR3c1
	WDmTi6/wmtlBHSuPd5ux8nFQuqbkmlIXElCMM0BPJi+VTDbRJ0UxT/SO8+h8faINYnWbdzFJ0vgRB
	+kwf8FGwwv2dwiGaj0BsgXy4+sVMwFVrLZXNrS7qAZY3RhpFJ+pB/9LN15/SXbDulohMSIMczcpbe
	S6mQ4axw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrYw-00DKAC-EW; Thu, 15 Sep 2022 16:18:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrYu-00DJvO-1v; Thu, 15 Sep 2022 16:18:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id l14so43314066eja.7;
        Thu, 15 Sep 2022 09:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=04xgqSaRrD4Mt6bAKc6OPHCEttCSurLeTnJ0LfF3Y88=;
        b=W54LxCJxwzgcE/KxC7g2c70doyePGWlRwMOoJ7shqyflKt1q2SNQ2oI4JUsVBCn/u3
         WcKpZyFTEG+tc36gNQLIWOFL0lwecmoDWy+fcY/2FxpNXh4SWmX4dX92zLC0l0RCBugb
         0XM5QXZNULWoCzS3ShxXykAwqE/DNVuZ0P11pVcfHjU+Xoad5WXAPZTa1iAHWgGlCMBI
         SocOlS1dOkIK3c9giGxc7xYSjf8w2oBYb4eVHqkf8cb73T3MLwQJRr9lhMLdC7XHe8X+
         QfTpiFXLVgMaZPFAwXCoMcQ/GJ26dZkjwDnaM3vv7KFo6iIzJEHoduCHklX3HhlS0UD0
         F/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=04xgqSaRrD4Mt6bAKc6OPHCEttCSurLeTnJ0LfF3Y88=;
        b=5qF3MiXsFzpK06Pv0j3AlyMqhQPYAkj/F/8jiKQ2xW5khZnHTZb2bZQgxTEmDvaK9l
         kWKP8PMaq8OQxs+WoBz8Zmk4bQYsI6ntTFDCM2nXClOZ9QBl5d/Bz5WHfoxuF2Vs2b1E
         EoRZnnvMYyKboiKkZwtLi1VJfh304lfyy4SA2tYFDOydx+sXCOsqZ6FYpdawLALaaPgZ
         64lwQr3LPlDNAg3bgMA1eOXx0+1kJfN28q22vxhKO1/fmT+6tGYKsII6ExAxezQyNCCt
         6SaJalkK0qlIshn6XEUEW1VdPb7YH9lXsuzwl+RgwRcvrHfW/yMU3j7Hf1Zy13BEwJma
         eFxQ==
X-Gm-Message-State: ACrzQf0OKN33XUzJrjAwwqI8HBSv4irhdFEuGFoI2A1IdCz1gCuG9h5A
	TmE8zlcCSAQEnYCxQYNPFuw=
X-Google-Smtp-Source: AMsMyM6XCP2noM5ZoDO/SViV5bWU2rlo6M0rExAmhVAYI7gIgJk31zTRWDw+hwu9Bq2Bu4B1NRJ2GQ==
X-Received: by 2002:a17:907:a05:b0:77b:b538:6476 with SMTP id bb5-20020a1709070a0500b0077bb5386476mr521284ejc.324.1663258678460;
        Thu, 15 Sep 2022 09:17:58 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709066b8a00b00773dbdd8205sm9228718ejr.168.2022.09.15.09.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 09:17:57 -0700 (PDT)
Message-ID: <671a971e-1d5d-f420-25e1-2a83130d070e@gmail.com>
Date: Thu, 15 Sep 2022 18:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6,1/3] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, jason-jh.lin@mediatek.com,
 rex-bc.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jitao.shi@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1663161662-1598-1-git-send-email-xinlei.lee@mediatek.com>
 <1663161662-1598-2-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1663161662-1598-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_091800_140107_B24836A2 
X-CRM114-Status: GOOD (  17.70  )
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



On 14/09/2022 15:21, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys func to manipulate dpi output format config for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: Nís F. R. A. Prado <nfraprado@collabora.com>

Applied, thanks!


> ---
>   drivers/soc/mediatek/mt8186-mmsys.h    |  6 ++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 20 ++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-mmsys.h |  2 ++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..09b1ccbc0093 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,12 @@
>   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>   #define __SOC_MEDIATEK_MT8186_MMSYS_H
>   
> +/* Values for DPI configuration in MMSYS address space */
> +#define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> +#define DPI_FORMAT_MASK					0x1
> +#define DPI_RGB888_DDR_CON				BIT(0)
> +#define DPI_RGB565_SDR_CON				BIT(1)
> +
>   #define MT8186_MMSYS_OVL_CON			0xF04
>   #define MT8186_MMSYS_OVL0_CON_MASK			0x3
>   #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 06d8e83a2cb5..2e20b24da363 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -227,6 +227,26 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;
> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +
> +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
> +{
> +	if (val)
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_RGB888_DDR_CON, DPI_FORMAT_MASK);
> +	else
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_RGB565_SDR_CON, DPI_FORMAT_MASK);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
> +
>   static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
>   				  bool assert)
>   {
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 59117d970daf..d2b02bb43768 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -65,4 +65,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   			      enum mtk_ddp_comp_id cur,
>   			      enum mtk_ddp_comp_id next);
>   
> +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
> +
>   #endif /* __MTK_MMSYS_H */

