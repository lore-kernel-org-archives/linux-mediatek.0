Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C81EEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkhL4uI0B/Lhmv/qxg6Gs+UQ4b+kwmWF1fiPyrwPCd8=; b=o0opS8y6MqbgdnjrELZb1Dmp60
	hmZA935T0qe2Y48Sjw8KZDKUio6Yvk5yZLtij8Mhoumtr3G/6zxC5XIugNLPHx7BMQrEmMe78kWjH
	6ViJhybbh7M1yUKGtwQEyJrtTWDWUIPaEAwsYD8JGjGN0nXMt+oqi7IrDCrNRcQMDW9OrYARZdrEF
	/5Q6I6D4dIwYCj8d+Mq9w/tjdtgO8BLattxNagVjB5aMNwFDFa7JiaTiq0tnpoe3qms3eTborAP3T
	NFw2IXtFQWDhTvfnulm0l5thDiAWSUU8Dy9ii5AH1OoFH+WObc967eSvIFBIaR/HJDdmX1PAmUGFK
	odoYLxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSn7-00B8f3-1C;
	Thu, 20 Jul 2023 12:29:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSn3-00B8cl-2M
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 12:29:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-307d20548adso596835f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689856189; x=1690460989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KkhL4uI0B/Lhmv/qxg6Gs+UQ4b+kwmWF1fiPyrwPCd8=;
        b=XlcBPi0luKar65pugUWZx5x76U0b3XAWX0S3KC0cPjqVI669s5QyFytRy0X+jN8CTq
         sDVQCCY99s5o+klAldXMilhf4WHNqPKVCzv2pNVJLaYb2hfoBrP0/MUw0cXLqHZ/uPTI
         rENCW5i5UDWZ7wB0xTHWALNWmGXtyPQOsyET/B0Z7gxJls3kjj2r/GSfnhwPwqkXdjfD
         egWY7X8oCcisSn9QdMrGy4o3cwNnQ4Q9drtmeKtA2iM/tMHgt8FAL11qFpqJbhSbNGqF
         /D0Hpj2+Vmx+4ozhjAlApiOU9Js0nS3s/KVQ6wpMf99mBYjTuI65hO57ijDxar4ZeYoL
         gfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689856189; x=1690460989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkhL4uI0B/Lhmv/qxg6Gs+UQ4b+kwmWF1fiPyrwPCd8=;
        b=OHyuQKn2hO31GiFzPXPtWkPoDYKaemp3m00lH3wc3EsAXFx1v8Y6Qun7xdKAlLAuHc
         lF3jcqeaJ4FmZjbhyuCi+jLfEKkQRDTOfMwcSwpdlsKchYTbxSgWCt3pdhm8YTJmQlbK
         S/Vd/pTlLJ4y2RnQHI/zuv3s52kV8UOp5KDAsMMiUNzBUHhzjxvhNtk983DnG/jCLWD4
         fwt9BWoJgeCbXETAYXdYP9+voVXCz4psdT9OnRXCKs8+ugn+sJIF/06wUebYgEuWSedv
         SEMQKuMBbeyRj8/9MlXg3C+0kQFOUu5wZlPhEZ9WSS83jrEbFDtDjTkODLTB3bAkP8NW
         THzA==
X-Gm-Message-State: ABy/qLZhLzcXl99Tp26M5Vj8jLGh9WcnQJpQ6aLx6IrrC5QxG9Hgb2h4
	yFQw8wvF3fdRvTtS7vPosI12zA==
X-Google-Smtp-Source: APBJJlE64chd/1tEB2ElppjUwBGavjD5dJTrzpri48CI5z/Qf7oQEoD8ZUvvWzAetnjz75c7W3VIyg==
X-Received: by 2002:a5d:5190:0:b0:316:f1f6:96d with SMTP id k16-20020a5d5190000000b00316f1f6096dmr2046396wrv.13.1689856189211;
        Thu, 20 Jul 2023 05:29:49 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0031128382ed0sm1222069wrn.83.2023.07.20.05.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 05:29:48 -0700 (PDT)
Message-ID: <16d2f0d7-f150-823b-b568-18f3bb6b2f77@baylibre.com>
Date: Thu, 20 Jul 2023 14:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3,3/3] drm/mediatek: dp: Add the audio divider to
 mtk_dp_data struct
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
 <a48e9f99-2b93-9eb6-daef-be95a956c3d8@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <a48e9f99-2b93-9eb6-daef-be95a956c3d8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_052953_770493_2904F26C 
X-CRM114-Status: GOOD (  18.85  )
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



On 20/07/2023 14:08, AngeloGioacchino Del Regno wrote:
> Il 20/07/23 14:07, Alexandre Mergnat ha scritto:
>>
>>
>> On 20/07/2023 13:54, AngeloGioacchino Del Regno wrote:
>>> Il 20/07/23 12:14, Alexandre Mergnat ha scritto:
>>>>
>>>>
>>>> On 20/07/2023 10:26, Shuijing Li wrote:
>>>>> Due to the difference of HW, different dividers need to be set.
>>>>>
>>>>> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
>>>>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>>>>> ---
>>>>> Changes in v3:
>>>>> Separate these two things into two different patches.
>>>>> per suggestion from the previous thread:
>>>>> https://lore.kernel.org/lkml/e2ad22bcba31797f38a12a488d4246a01bf0cb2e.camel@mediatek.com/
>>>>> Changes in v2:
>>>>> - change the variables' name to be more descriptive
>>>>> - add a comment that describes the function of 
>>>>> mtk_dp_audio_sample_arrange
>>>>> - reduce indentation by doing the inverse check
>>>>> - add a definition of some bits
>>>>> - add support for mediatek, mt8188-edp-tx
>>>>> per suggestion from the previous thread:
>>>>> https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
>>>>> ---
>>>>>   drivers/gpu/drm/mediatek/mtk_dp.c     | 7 ++++++-
>>>>>   drivers/gpu/drm/mediatek/mtk_dp_reg.h | 1 +
>>>>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>>>>
>> ...
>>>>> b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>>> index f38d6ff12afe..6d7f0405867e 100644
>>>>> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>>> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>>> @@ -162,6 +162,7 @@
>>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2    (1 << 8)
>>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4    (2 << 8)
>>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8    (3 << 8)
>>>>> +#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (4 << 8)
>>>>
>>>> IMO, it's a bit weird to have SoC specific define in the generic 
>>>> header.
>>>> Are you sure this bit is only available for MT8188 ?
>>>>
>>>
>>> Eh, the P0_DIV2 bit is 5<<8 for MT8195, while for 8188 it's 4<<8, 
>>> clearly :-)
>>>
>>
>> Ok then, to avoid this kind of issue for other SoCs in the future, is 
>> that make sense for you to do a SoC specific header file beside the 
>> generic one?
>>
> 
> For just one definition? That's a bit overkill :-)
> 

You're right, but we must start somewhere ^^, and show the proper way 
for future patches. Actually, I gave my Reviewed-by because it's only 
one definition. This will be fixed later (I hope).

>>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (5 << 8)
>>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4    (6 << 8)
>>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8    (7 << 8)
>>>>
>>>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>>
>>>
>>>
>>
> 
> 

-- 
Regards,
Alexandre

