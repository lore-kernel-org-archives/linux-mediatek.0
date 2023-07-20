Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BF3EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgR/v2tSKFAWg8JGcDgIlYGNaMxVHFU8awEJ10JMgL4=; b=aIlK8cbKnPJ2HQnvQUAwDhffVj
	WXw383armkQzOdSuD9Dp00POVK5Fk7fZAKBkqaWEUMgRlKE5Ea67Q+0nhkvq4to+AIcG9zQT5M7aR
	qcHfaHbd96POrR5B6FJqbEPQjnotCA2hSKgo60AT2dy6XgKpjb0SfAY3tK9GZWBhWGFq0HK6TrvKU
	A9p+S9zKmvz1gNEt8pnLOm41LMCAVqP8NsfBkd6d+S2uOouD5YhfQzPDeAdtt/2N0eIZ8PHDY3itq
	YJhySkVIS01pdcydjvm7Ac2H0xzMJSOosSmFaSImLnUXLCiI3UPVsj6+zAsIiGrjoKj2ZxvxTeKfp
	j3B9RPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQgI-00Ai67-31;
	Thu, 20 Jul 2023 10:14:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQgE-00Ai4X-31
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 10:14:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc5d5746cso5010525e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689848081; x=1690452881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xgR/v2tSKFAWg8JGcDgIlYGNaMxVHFU8awEJ10JMgL4=;
        b=ZlWCt++5xVRaYMUvNDumyvFs9ceI6zQJoyuunF56q1OyxwajbMz0jYiNi3ts0TbAF/
         jStioDtPGEe3D67yaeXn15vdB6mU5NwAO1CsZrn4RJcSTGpGq3GDx46Y+LU90sdyatYl
         CCpYauFdbtMtt/RvOuBhPlQmmCvFCPVnMdFsI0Qyk5TZBpaUop0BchRmxsnYCgfkk4Aa
         7k08jxzQb6PYPF9VfhBDjpWC4BlqmWgNVsoZQeVPBwqmbVk+jtpUDxLJhJPuieHQEIxh
         6Yiq5z8i8rLQjboMDZJcovSVAPVuBtHCwUSVOg0mGmir80I0oTBfM/rJAmV4eydrzyWJ
         jfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689848081; x=1690452881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xgR/v2tSKFAWg8JGcDgIlYGNaMxVHFU8awEJ10JMgL4=;
        b=YyrN/PZZRQ/Y8UDD/HDWYCEOdVwJ6/klnxV3ySN4VfvY9w17lNW/dq0vr39oVu/0d1
         WSH0kOE5a6+MGjQ7PUdOlgL2GSzxbIVdO78kw1QNuHeEUZViYr2ySbix8PKC8kvv7vQM
         lycDnn6cpddHB4dDVUU8Mi5qgfpBa+72MLm7QFqIaVT1mxo4beGd+m0qzkPBwDojXkGq
         xvDYEhX6UAwtOnLU+m80goWSd5dxTGT6Ga+EG3g/ZTOF3riXuVaNfmpgb09z4QPqChtI
         PbhDOH9pkykDT7Au/rqxCkQMJHoJ0IMdzVNPkLM8nefH/VTMqZHp0bjxYWD9PvWP0gxi
         YkGQ==
X-Gm-Message-State: ABy/qLYG5WsEX4ID/qd+2wyOkgfROYqQd6tHaxp7zN2acdYg2wg+mmUF
	eaNzj4EEPL8UgBupDjH7tuOsxg==
X-Google-Smtp-Source: APBJJlEn7afesFYcFAVd9IolYE+oiB5KW2PNECta7r263fwwlURO3tO4QXeOXbhRd1/MVqDP6X0gwA==
X-Received: by 2002:a5d:69c3:0:b0:314:2732:e81e with SMTP id s3-20020a5d69c3000000b003142732e81emr2063397wrw.8.1689848081370;
        Thu, 20 Jul 2023 03:14:41 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u2-20020a5d4342000000b003141f96ed36sm920685wrr.0.2023.07.20.03.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 03:14:40 -0700 (PDT)
Message-ID: <44cc9cc5-7dce-f7a2-f077-b62d7851ee12@baylibre.com>
Date: Thu, 20 Jul 2023 12:14:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3,3/3] drm/mediatek: dp: Add the audio divider to
 mtk_dp_data struct
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
 <20230720082604.18618-4-shuijing.li@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230720082604.18618-4-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_031442_984689_364243CA 
X-CRM114-Status: GOOD (  22.13  )
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



On 20/07/2023 10:26, Shuijing Li wrote:
> Due to the difference of HW, different dividers need to be set.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
> Changes in v3:
> Separate these two things into two different patches.
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/e2ad22bcba31797f38a12a488d4246a01bf0cb2e.camel@mediatek.com/
> Changes in v2:
> - change the variables' name to be more descriptive
> - add a comment that describes the function of mtk_dp_audio_sample_arrange
> - reduce indentation by doing the inverse check
> - add a definition of some bits
> - add support for mediatek, mt8188-edp-tx
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c     | 7 ++++++-
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h | 1 +
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index d8cda83d6fef..8e1a13ab2ba2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -140,6 +140,7 @@ struct mtk_dp_data {
>   	const struct mtk_dp_efuse_fmt *efuse_fmt;
>   	bool audio_supported;
>   	bool audio_pkt_in_hblank_area;
> +	u16 audio_m_div2_bit;
>   };
>   
>   static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
> @@ -648,7 +649,7 @@ static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
>   static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
>   {
>   	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
> -			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
> +			   mtk_dp->data->audio_m_div2_bit,
>   			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
>   }
>   
> @@ -2636,6 +2637,7 @@ static const struct mtk_dp_data mt8188_edp_data = {
>   	.efuse_fmt = mt8195_edp_efuse_fmt,
>   	.audio_supported = false,
>   	.audio_pkt_in_hblank_area = false,
> +	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>   };
>   
>   static const struct mtk_dp_data mt8188_dp_data = {
> @@ -2644,6 +2646,7 @@ static const struct mtk_dp_data mt8188_dp_data = {
>   	.efuse_fmt = mt8195_dp_efuse_fmt,
>   	.audio_supported = true,
>   	.audio_pkt_in_hblank_area = true,
> +	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>   };
>   
>   static const struct mtk_dp_data mt8195_edp_data = {
> @@ -2652,6 +2655,7 @@ static const struct mtk_dp_data mt8195_edp_data = {
>   	.efuse_fmt = mt8195_edp_efuse_fmt,
>   	.audio_supported = false,
>   	.audio_pkt_in_hblank_area = false,
> +	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>   };
>   
>   static const struct mtk_dp_data mt8195_dp_data = {
> @@ -2660,6 +2664,7 @@ static const struct mtk_dp_data mt8195_dp_data = {
>   	.efuse_fmt = mt8195_dp_efuse_fmt,
>   	.audio_supported = true,
>   	.audio_pkt_in_hblank_area = false,
> +	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>   };
>   
>   static const struct of_device_id mtk_dp_of_match[] = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> index f38d6ff12afe..6d7f0405867e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -162,6 +162,7 @@
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2	(1 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4	(2 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8	(3 << 8)
> +#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(4 << 8)

IMO, it's a bit weird to have SoC specific define in the generic header.
Are you sure this bit is only available for MT8188 ?

>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(5 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4	(6 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8	(7 << 8)

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

