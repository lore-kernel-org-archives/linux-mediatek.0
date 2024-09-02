Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DD0CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWVfLyCu7TnRFXI3PcEj4EnQGK8DTBEvYZTOdp9ZUy4=; b=JfTF5v3CxP5QNZ/kqpMiib6Ped
	p/atGFBg5Ju1bPLG21AUEuPqSXKnCPOh42g0aRXMsNmTZFdwPCHcxH84DaYcG+E3LkO6jBdO4I6L8
	h8jdU0N3HaAVg0swjmJ/zDygYVptyx/2mrkWBrBPa11OKkRGJYhrx/vjjCiFqbDyfCaweJlRpA/4K
	dBO2NfeOtxZ53iD/KpVT2RKg6H1OeB+qa9ry4fL0nIR2YMUshh5I6kSPeGInU29+gd4ZXbMHrRS8Y
	FxpEFheMpZXI4JqdUNoK5+N2lXEHCPQA+MNPGx3j9wTgoK9GSi+6itiA9CZhgPhzi9V21Z1ePU0z1
	H4xunB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl8fl-0000000EnUJ-0YEx;
	Mon, 02 Sep 2024 15:08:53 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl8c7-0000000EmYu-0b0D;
	Mon, 02 Sep 2024 15:05:08 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5353d0b7463so7314764e87.3;
        Mon, 02 Sep 2024 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725289505; x=1725894305; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fWVfLyCu7TnRFXI3PcEj4EnQGK8DTBEvYZTOdp9ZUy4=;
        b=EpdUNJCTUxmIOKcPytnQrNl1XiQxHiwU7SvSoxzRJrHPfiUfLW99P6o4vaQtnpTE+n
         CIwNqc++gAdji7PTGi77CnlQLxUm4Wm1x8suE2kqqmAHDrSqkUztZ6BbPY4CfqhMxleS
         sB09LicahnhmEsc+2Y5DaOihx/QS6f5lJQ5RxmVVvWpdtEOgJc4hqvwrcM5JqBl21ItB
         IJNIxGCVF7q6NRCms4Aa1KDARJfza8Gf6ZDLZ8ClkOMenn8LaOSbfDha+rpkgmT4rfu9
         cHx/lwbSuh03UDQs9q2RO4skursaujJzpTIlRL+iuUJPNCgWoiTqux2L3dpCPyMyTCXh
         R5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725289505; x=1725894305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWVfLyCu7TnRFXI3PcEj4EnQGK8DTBEvYZTOdp9ZUy4=;
        b=xJobhZB9iH9nalaA+o1kmRQvmqf/PHWMzoU27CHGXY8Zf87sgadRa99nRJNneoLeUC
         uUwGiqMNkRE9FrDIrAm5onHZlCr7yJmA2C8iSCmMIqCpEGTGqCs+MtG8w7eiYZq9gDdr
         ahWePdId5/MNoBZkbBkD4ofPwBn94OkDuLUINexZ5fz70neOTl5g5JyccbEQ6KKU8wrz
         1EEZm647ym0dzY9Cl3t50muJ6gp5wxV8blyTAZ206btxwk7Mvy3/T1vAynuHYrHfz0rC
         r0E0Wko+oXGxhayyBSikvfRMBOtOYbnYJpA+xuY78kQJmmIGUTu6V+tjbQW7wF54JNaw
         0iOg==
X-Forwarded-Encrypted: i=1; AJvYcCUs7vwyu8Bj/lLgreUJygNgz6r1aU4ra0jIsAewHyL8xnLcAEnZ4rnh4cnE1rMclXv2vE6P/UKP7+7Ehh6/5EUg@lists.infradead.org, AJvYcCWbhjSvN8GNfplAMWXlnrYzWIBMgM5URc6B2Z4RKMnvor7e19hDmirNXdGbdBUVXMa7cSIbXMs6VPdfofsIZxY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+OwQREqRpbe3lP+oXsYAAdYQ+7a/tZnN9cXNbgsHktARTm/lI
	xJ3kvYJOmTAQcYvoLRTo6oHaARegl4p+JWHxJtmAkA81RmMdEsID
X-Google-Smtp-Source: AGHT+IFh64dOBlZhhpfwwTsOz8hViI+snEGY73VkK6LRwd/ze4p4sV6NWAsTw+FkFxQOOKvFKQdvKA==
X-Received: by 2002:a05:6512:68f:b0:52e:933f:f1fa with SMTP id 2adb3069b0e04-53546c03f81mr7989346e87.61.1725289504049;
        Mon, 02 Sep 2024 08:05:04 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898902292bsm566333566b.88.2024.09.02.08.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:05:02 -0700 (PDT)
Message-ID: <6cd86103-8ebf-469d-8e68-444fffa56c68@gmail.com>
Date: Mon, 2 Sep 2024 17:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 shuijing.li@mediatek.com, jitao.shi@mediatek.com, mac.shen@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240902133736.16461-1-liankun.yang@mediatek.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240902133736.16461-1-liankun.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_080507_223447_C8BEEB7B 
X-CRM114-Status: GOOD (  18.79  )
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



On 02/09/2024 15:36, Liankun Yang wrote:
> Update efuse data for MT8188 displayport.
> 
> The DP monitor can not display when DUT connected to USB-c to DP dongle.
> Analysis view is invalid DP efuse data.
> 
> Fixes: 350c3fe907fb ("drm/mediatek: dp: Add support MT8188 dp/edp function")
> 
> Changes in V2:
> - Add Fixes tag.
> - Update the commit title.
> - Update the commit description.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/
> 20240510061716.31103-1-liankun.yang@mediatek.com/

Changelog should go after '---' below your Signed-off-by, as we don't want that 
in the commit message later.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 85 ++++++++++++++++++++++++++++++-
>   1 file changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index d8796a904eca..f2bee617f063 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -145,6 +145,89 @@ struct mtk_dp_data {
>   	u16 audio_m_div2_bit;
>   };
>   
> +static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
> +	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
> +		.idx = 0,
> +		.shift = 10,
> +		.mask = 0x1f,
> +		.min_val = 1,
> +		.max_val = 0x1e,
> +		.default_val = 0xf,
> +	},
> +	[MTK_DP_CAL_CLKTX_IMPSE] = {
> +		.idx = 0,
> +		.shift = 15,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0] = {
> +		.idx = 1,
> +		.shift = 0,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1] = {
> +		.idx = 1,
> +		.shift = 8,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2] = {
> +		.idx = 1,
> +		.shift = 16,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3] = {
> +		.idx = 1,
> +		.shift = 24,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0] = {
> +		.idx = 1,
> +		.shift = 4,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1] = {
> +		.idx = 1,
> +		.shift = 12,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2] = {
> +		.idx = 1,
> +		.shift = 20,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3] = {
> +		.idx = 1,
> +		.shift = 28,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +};
> +
>   static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
>   	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
>   		.idx = 3,
> @@ -2771,7 +2854,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
>   static const struct mtk_dp_data mt8188_dp_data = {
>   	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
>   	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> -	.efuse_fmt = mt8195_dp_efuse_fmt,
> +	.efuse_fmt = mt8188_dp_efuse_fmt,
>   	.audio_supported = true,
>   	.audio_pkt_in_hblank_area = true,
>   	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,

