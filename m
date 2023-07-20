Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A633EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kxAUgGVaEKwqeI2NFv1lcoX5triToixRnV/JmFgB+E=; b=EfwFDySNLuqfEKJtDse3ftOgcH
	iR13dFoguRChoB7KKqijv2uhc/naIPtoebydkK+67lVKK97DR/1o8AcAmqIw5vSd1hk/co2qCVeEF
	eT2kK7M6cLoLWcJBDHF21GkGi39+KjVbbbGaLhRQQ11q+FhRY3Ggr43Z76EzQEtwWrymMCZ46dbf3
	c0+1BJa8mBoB3/J/O+qvz5cFvo7kqR1Sap5ZNSxR2mGuFOkaEIkMjfF9Euk7130gYehFDDJCh8DvV
	Zq8fEn5e0M1TdA7byYsK3BHhC6dX7XdniJqkFbuZ/+T+3/Z+xAxbrz03qDgEddwJZWIaMg+CYynoh
	D7E7Htyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSEx-00B2x4-1J;
	Thu, 20 Jul 2023 11:54:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSEt-00B2ua-1V;
	Thu, 20 Jul 2023 11:54:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C54DA6607083;
	Thu, 20 Jul 2023 12:54:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689854071;
	bh=xXEl0bZXMT2n/uen0YxtWvqWsJD2b4bMTkkm5cQcOic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jLSsMFqqYoBSQC564mB2hCYCi1hnD3bT31BL/kAaZhUmJ0FgmNIdhGxYyKmrPL0Ba
	 tJMMXoPkw3y5ZcpH1BmGQ8CoPXUUnQvGzwWY4f4WV8uXm9pzgf9E3CTVKi/lIYOOEF
	 JC9N7SaM2Ir5T+/RpZWjD1DyKIqoMa5es1vhDatBSaOO5VqOTWb5hUVLHKz5c8hw2c
	 fJ7PPkNtU0IKAlRXqcKsYM1gQOwYq4Pq7rLAZ+zOpuCCseCrOgLdZiU6hWQ76/0YoL
	 4Uye+n5XxetaD1Bbaj2zWHcm7WhfqbO0RbIWOkhL5Fr1JWllj6TdLyn0ah+EaLeQXb
	 YVf6ogHqsNJbg==
Message-ID: <65da6005-3c07-a7ea-6b63-db45c8915ae8@collabora.com>
Date: Thu, 20 Jul 2023 13:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3,3/3] drm/mediatek: dp: Add the audio divider to
 mtk_dp_data struct
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
 <20230720082604.18618-4-shuijing.li@mediatek.com>
 <44cc9cc5-7dce-f7a2-f077-b62d7851ee12@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <44cc9cc5-7dce-f7a2-f077-b62d7851ee12@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_045435_758802_2A0C0283 
X-CRM114-Status: GOOD (  20.13  )
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

Il 20/07/23 12:14, Alexandre Mergnat ha scritto:
> 
> 
> On 20/07/2023 10:26, Shuijing Li wrote:
>> Due to the difference of HW, different dividers need to be set.
>>
>> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>> ---
>> Changes in v3:
>> Separate these two things into two different patches.
>> per suggestion from the previous thread:
>> https://lore.kernel.org/lkml/e2ad22bcba31797f38a12a488d4246a01bf0cb2e.camel@mediatek.com/
>> Changes in v2:
>> - change the variables' name to be more descriptive
>> - add a comment that describes the function of mtk_dp_audio_sample_arrange
>> - reduce indentation by doing the inverse check
>> - add a definition of some bits
>> - add support for mediatek, mt8188-edp-tx
>> per suggestion from the previous thread:
>> https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dp.c     | 7 ++++++-
>>   drivers/gpu/drm/mediatek/mtk_dp_reg.h | 1 +
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>> index d8cda83d6fef..8e1a13ab2ba2 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>> @@ -140,6 +140,7 @@ struct mtk_dp_data {
>>       const struct mtk_dp_efuse_fmt *efuse_fmt;
>>       bool audio_supported;
>>       bool audio_pkt_in_hblank_area;
>> +    u16 audio_m_div2_bit;
>>   };
>>   static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
>> @@ -648,7 +649,7 @@ static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp 
>> *mtk_dp,
>>   static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
>>   {
>>       mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
>> -               AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>> +               mtk_dp->data->audio_m_div2_bit,
>>                  AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
>>   }
>> @@ -2636,6 +2637,7 @@ static const struct mtk_dp_data mt8188_edp_data = {
>>       .efuse_fmt = mt8195_edp_efuse_fmt,
>>       .audio_supported = false,
>>       .audio_pkt_in_hblank_area = false,
>> +    .audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>>   };
>>   static const struct mtk_dp_data mt8188_dp_data = {
>> @@ -2644,6 +2646,7 @@ static const struct mtk_dp_data mt8188_dp_data = {
>>       .efuse_fmt = mt8195_dp_efuse_fmt,
>>       .audio_supported = true,
>>       .audio_pkt_in_hblank_area = true,
>> +    .audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>>   };
>>   static const struct mtk_dp_data mt8195_edp_data = {
>> @@ -2652,6 +2655,7 @@ static const struct mtk_dp_data mt8195_edp_data = {
>>       .efuse_fmt = mt8195_edp_efuse_fmt,
>>       .audio_supported = false,
>>       .audio_pkt_in_hblank_area = false,
>> +    .audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>>   };
>>   static const struct mtk_dp_data mt8195_dp_data = {
>> @@ -2660,6 +2664,7 @@ static const struct mtk_dp_data mt8195_dp_data = {
>>       .efuse_fmt = mt8195_dp_efuse_fmt,
>>       .audio_supported = true,
>>       .audio_pkt_in_hblank_area = false,
>> +    .audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>>   };
>>   static const struct of_device_id mtk_dp_of_match[] = {
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h 
>> b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>> index f38d6ff12afe..6d7f0405867e 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>> @@ -162,6 +162,7 @@
>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2    (1 << 8)
>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4    (2 << 8)
>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8    (3 << 8)
>> +#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (4 << 8)
> 
> IMO, it's a bit weird to have SoC specific define in the generic header.
> Are you sure this bit is only available for MT8188 ?
> 

Eh, the P0_DIV2 bit is 5<<8 for MT8195, while for 8188 it's 4<<8, clearly :-)

>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (5 << 8)
>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4    (6 << 8)
>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8    (7 << 8)
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> 



