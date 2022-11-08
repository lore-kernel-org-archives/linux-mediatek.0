Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AECC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 18:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNbuvhNf/Wvi9KDrdhQiQ7CIoY1oS0/eXau3bWTCZqo=; b=gbIDWun++I6m2cMljGIAIVKauI
	Ogduj03PNOANxU4X5sUTWfaxrlLGvaZEd0bLtG+0xRbVdk7tp2SNLxPdT4NDHwJ+5Sg0TzunQGfR5
	IklokbA0qNvZHJL64Q3vB5Tfncsc8KjhSTDoYASiR4UviTLY9jToL++vKziSS6L39TbXojb2W0J34
	H3fazsE9OnEz/RzGyPvtjidasXX0FYlA/8Ic9ygcRQ9FBqxKCJ84fCALJGdd1sAJOe3IonyaDUD3k
	/OvQ9zu9JMPrnU0Gk697darjpFJ48BgpCRlH90iJmiD2dRkMauygJBAa6mJrAbkfb6hDRo6HK3lkm
	w2WM0ARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osT4h-007NCf-RY; Tue, 08 Nov 2022 18:11:51 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osT4e-007NAk-E9; Tue, 08 Nov 2022 18:11:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id a14so22287372wru.5;
        Tue, 08 Nov 2022 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNbuvhNf/Wvi9KDrdhQiQ7CIoY1oS0/eXau3bWTCZqo=;
        b=aAo97Lk7t8HYJYAQH+EepvDRsg9bR5P+VV7s+6T1YBRXmvxQRjh7gy++zo+Y+ZXRdx
         YR9BZg+ULLNQeeJVYoaatkdckzPUcE0/ceV66dSZsMwNKONY/6kM/jP3VLVs24YYnzPx
         p4duRRADFem32dEbRqMt4nQCyjzjIAzAiYZniLuqT1966rGL6dHzHveRqJVBNucWCO+5
         nm0uG8+s+TzJddl9DjklHuDeY46/wHBJuthagt1wwW/d2SqF0kCQApgZAzJI44U2hE6Z
         5JMz72qjeEnloIK8AFnGf9m2mIsTGytswmW5LtfKpffbnH+Bog4GUbSx/LQk97AMnILo
         s1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNbuvhNf/Wvi9KDrdhQiQ7CIoY1oS0/eXau3bWTCZqo=;
        b=6agsmvXt2FbhQBBmqi7Hqg7qrB3VbJHA88ho40qP4Db5GdnXJ16vKSc9tv6WdpJntu
         i+RG/sQO6k7/7P3biYJkqR9YobVE65DGCEl23g8lqQRvhX3bYpS0etajUcijwDPtz4PN
         faJlKtRn5H8Sv/LTTK1/oLwfv2KBqiEFr1ZoGID67FUyjDTjNgbHGXMAbUxDV4LRyY8t
         9V3qmviyyceopyGO/nhdlAon/mEuqBHdFSMH/CYsAa8lQJ6x/hpO/nZyzarfNEV5b8QB
         q3aNA2i4jiFM3G/kRSBMa5zYmg/3mJSFRLVn6qc5aH+5ONIRVPtHar25FfUR13Gs5V17
         z4Hg==
X-Gm-Message-State: ACrzQf3w5jKsrr5JGgHTDb0kSC/ATQlxAGygEvenFcKlv6g2UJl7Xp5w
	MQ7gbW02ksUG04j0ZI9kAkI=
X-Google-Smtp-Source: AMsMyM6ErS/0hA9t6B9+8Qsgjup9o1jMSAt9VpHujCwfERrvF9rKCdB4Y0IaSRtElie7ycelM0GySg==
X-Received: by 2002:a5d:5270:0:b0:236:60c6:6e80 with SMTP id l16-20020a5d5270000000b0023660c66e80mr35179041wrc.140.1667931105355;
        Tue, 08 Nov 2022 10:11:45 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id iv9-20020a05600c548900b003cf87623c16sm17256080wmb.4.2022.11.08.10.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 10:11:44 -0800 (PST)
Message-ID: <03fdf45d-be93-206a-8c9c-17d31010162f@gmail.com>
Date: Tue, 8 Nov 2022 19:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v13,1/3] soc: mediatek: Add all settings to
 mtk_mmsys_ddp_dpi_fmt_config func
Content-Language: en-US
To: xinlei.lee@mediatek.com, rex-bc.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 nfraprado@collabora.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com>
 <1666577099-3859-2-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1666577099-3859-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_101148_507876_B2B0B108 
X-CRM114-Status: GOOD (  25.71  )
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

Hi Xinlei,

Can you please fix the threading of this patches. I can see that this 1/3 but 
I'm not able to find 3/3 in the series. The first two look good, the third, I 
don't know.

Regards,
Matthias

On 24/10/2022 04:04, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> The difference between MT8186 and other ICs is that when modifying the
> output format, we need to modify the mmsys_base+0x400 register to take
> effect. So when setting the dpi output format, we need to call
> mtk_mmsys_ddp_dpi_fmt_config to set it to MT8186 synchronously.
>    
> Commit a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
> output for MT8186") lacked some of the possible output formats and also
> had a wrong bitmask.
> 
> Add the missing output formats and fix the bitmask.
>    
> While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use generic
> formats, so that it is slightly easier to extend for other platforms.
>    
> Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi output for MT8186")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++---
>   drivers/soc/mediatek/mtk-mmsys.c       | 27 ++++++++++++++++++++------
>   include/linux/soc/mediatek/mtk-mmsys.h |  7 +++++++
>   3 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index 09b1ccbc0093..279d4138525b 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -5,9 +5,11 @@
>   
>   /* Values for DPI configuration in MMSYS address space */
>   #define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> -#define DPI_FORMAT_MASK					0x1
> -#define DPI_RGB888_DDR_CON				BIT(0)
> -#define DPI_RGB565_SDR_CON				BIT(1)
> +#define MT8186_DPI_FORMAT_MASK				GENMASK(1, 0)
> +#define MT8186_DPI_RGB888_SDR_CON			0
> +#define MT8186_DPI_RGB888_DDR_CON			1
> +#define MT8186_DPI_RGB565_SDR_CON			2
> +#define MT8186_DPI_RGB565_DDR_CON			3
>   
>   #define MT8186_MMSYS_OVL_CON			0xF04
>   #define MT8186_MMSYS_OVL0_CON_MASK			0x3
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 2e20b24da363..16cd924d8973 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -238,12 +238,27 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
>   
>   void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
>   {
> -	if (val)
> -		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> -				      DPI_RGB888_DDR_CON, DPI_FORMAT_MASK);
> -	else
> -		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> -				      DPI_RGB565_SDR_CON, DPI_FORMAT_MASK);
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +
> +	switch (val) {
> +	case MTK_DPI_RGB888_SDR_CON:
> +		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB888_SDR_CON);
> +		break;
> +	case MTK_DPI_RGB565_SDR_CON:
> +		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB565_SDR_CON);
> +		break;
> +	case MTK_DPI_RGB565_DDR_CON:
> +		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB565_DDR_CON);
> +		break;
> +	case MTK_DPI_RGB888_DDR_CON:
> +	default:
> +		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB888_DDR_CON);
> +		break;
> +	}
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
>   
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index d2b02bb43768..b85f66db33e1 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -9,6 +9,13 @@
>   enum mtk_ddp_comp_id;
>   struct device;
>   
> +enum mtk_dpi_out_format_con {
> +	MTK_DPI_RGB888_SDR_CON,
> +	MTK_DPI_RGB888_DDR_CON,
> +	MTK_DPI_RGB565_SDR_CON,
> +	MTK_DPI_RGB565_DDR_CON
> +};
> +
>   enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_AAL0,
>   	DDP_COMPONENT_AAL1,

