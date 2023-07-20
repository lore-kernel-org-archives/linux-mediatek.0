Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCBCEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIWSeSN1loINOubgOonH8DoFuSpxyz7CsG/Lab6ra14=; b=rLDJrfj9q/XhoZ9DHxQ7Pg/d36
	KXBmh9n8+INxqmAz9r6qdQcNMtLVP0fLNCo83gchQojwkVwYWOZH2D/p15m+/B9pIwkpNGgoxkLfu
	n3f0mIHGu3fDLokVGfkp2MlxsjDUuZeP3dZIJk/4h9v5pWGTpyT6QN68BD9HTr+oXBFsr16xP5Ong
	1H1B3LNhkCVDrJ74fHPuq9T8JWnQImSn00D04k7YuSot7/sxIWWEVS3yTzo8KvOZlQ2wiEG4Th5XS
	nJ55GvioyowF1LvU2ZrU46raEjAWwTy4r2aYKE0+7UPQdMpum6dk/Exa4SyYHfXW6s7CD55nbX3/d
	3Pl4Ar0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSSm-00B5f5-1l;
	Thu, 20 Jul 2023 12:08:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSSh-00B5cz-0X;
	Thu, 20 Jul 2023 12:08:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D0836607085;
	Thu, 20 Jul 2023 13:08:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689854929;
	bh=SgDyjdxIshyausnLbV7eqEbnWRDjrZQeUuWRlVZS+wc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J0PwYIF8/wDumfdHdqTHrUB+mYUH6hZvjs99V5ljNR0EypKgTLtTpcAUKQicgRamj
	 I+A2m+5+EOymq6XVYOjjhjNPatTq+kwWQCxbjhgQOYCyoy7X+2pR3EqFgash6CSXv8
	 fO0xB3wNtkMqADUs9847hBs3tSwgCKR0LZ5IJeorqLXgxKaxtOgopJTodFBvMJ0Trf
	 8tsVocYpmZ55WYwUpsD5MRGabhKNT+QHqKq8tCEOHN7t2STXzHUxGl2/56yT+B8pZV
	 y/PbbcmSl/mTrgEHcltZTZIQITJhpMNE96HNpMFGtcI9dM02D+nTDgqmSeYEsj5IQJ
	 Zpu15BHWe6uOQ==
Message-ID: <a48e9f99-2b93-9eb6-daef-be95a956c3d8@collabora.com>
Date: Thu, 20 Jul 2023 14:08:46 +0200
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
 <65da6005-3c07-a7ea-6b63-db45c8915ae8@collabora.com>
 <6c3422e8-4e2e-ba3a-4f30-d24308ef7c2a@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6c3422e8-4e2e-ba3a-4f30-d24308ef7c2a@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_050851_336708_47F1FF32 
X-CRM114-Status: GOOD (  16.94  )
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

Il 20/07/23 14:07, Alexandre Mergnat ha scritto:
> 
> 
> On 20/07/2023 13:54, AngeloGioacchino Del Regno wrote:
>> Il 20/07/23 12:14, Alexandre Mergnat ha scritto:
>>>
>>>
>>> On 20/07/2023 10:26, Shuijing Li wrote:
>>>> Due to the difference of HW, different dividers need to be set.
>>>>
>>>> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
>>>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>>>> ---
>>>> Changes in v3:
>>>> Separate these two things into two different patches.
>>>> per suggestion from the previous thread:
>>>> https://lore.kernel.org/lkml/e2ad22bcba31797f38a12a488d4246a01bf0cb2e.camel@mediatek.com/
>>>> Changes in v2:
>>>> - change the variables' name to be more descriptive
>>>> - add a comment that describes the function of mtk_dp_audio_sample_arrange
>>>> - reduce indentation by doing the inverse check
>>>> - add a definition of some bits
>>>> - add support for mediatek, mt8188-edp-tx
>>>> per suggestion from the previous thread:
>>>> https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
>>>> ---
>>>>   drivers/gpu/drm/mediatek/mtk_dp.c     | 7 ++++++-
>>>>   drivers/gpu/drm/mediatek/mtk_dp_reg.h | 1 +
>>>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>>>
> ...
>>>> b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>> index f38d6ff12afe..6d7f0405867e 100644
>>>> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>> @@ -162,6 +162,7 @@
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2    (1 << 8)
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4    (2 << 8)
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8    (3 << 8)
>>>> +#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (4 << 8)
>>>
>>> IMO, it's a bit weird to have SoC specific define in the generic header.
>>> Are you sure this bit is only available for MT8188 ?
>>>
>>
>> Eh, the P0_DIV2 bit is 5<<8 for MT8195, while for 8188 it's 4<<8, clearly :-)
>>
> 
> Ok then, to avoid this kind of issue for other SoCs in the future, is that make 
> sense for you to do a SoC specific header file beside the generic one?
> 

For just one definition? That's a bit overkill :-)

>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (5 << 8)
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4    (6 << 8)
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8    (7 << 8)
>>>
>>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>
>>
>>
> 



