Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29993C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jan 2023 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwT09QFvbeIdYBJsfcmVCJn9nySi46ioy4UiTZXOQBU=; b=V4l9ebXLuuk1g6zh9HTmte3Tdc
	Kwu+csGFNSlarT7lodp0VFUu4TU3YGMpgAqb7Z67R+VZN6MQwFbVptIk3emGStQSiHgA+wmqzOtQE
	jt0J8RiR6uD91jD8bl0DjmvLUKP0s9uc4pRp22JtE6Ke9vBo/hGyDU4QphBqYsdo3A10odKMRks6p
	JBhCcajViqU0rDJ8ntXz5e0M6mOtIanCaMTD4FSxO/E3VnV5ILtpTqkVh6lAV32SmqSdZfFWAFA9B
	7v7SrRYs+8HEisjQeUeQC8TPMo5d6hhH3DnrWqfgKf9+FpZEuuRc322hZPJ11T4RBYfWlw9tdI4N9
	vtu20Kew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLg0Y-00HPjW-U3; Sat, 28 Jan 2023 07:52:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLg0L-00HPhs-PD
	for linux-mediatek@lists.infradead.org; Sat, 28 Jan 2023 07:52:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id fl24so4920163wmb.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 23:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwT09QFvbeIdYBJsfcmVCJn9nySi46ioy4UiTZXOQBU=;
        b=O9xMHDeSECxW7o24q/6NUFHzLv5SOU7LuUFzeYGUCKEUfx5ZJ3tE4pipR2JhWAP+jg
         hPoesVW7rhnn9xzLRSskElx6CmZTetOAxdvriYZEZTJ3pb68iL6YW2YkYWFg4wHIA6W9
         5xBJLfpPHq4CK6+Z536WA3f+hDRxMti0zb848BvE1aXs/kGND7eqyknPpj4d9vnu3vLK
         OL3D+AkI/gJ0VG58PsxRDY1/OamUADlhthBOy+c2/99cAyHEiW1M+ZlMgAs4eYJusHOG
         qhdU+mBXeUO9K12bPXjy8LTm0Wk86BNUNKc3vG8qiBAy+AmBL0E3kLLkVznbDvrsY/sc
         OV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwT09QFvbeIdYBJsfcmVCJn9nySi46ioy4UiTZXOQBU=;
        b=YddM/rHfrA0PJinvE+245/YCMcpQYUIVc4/MGV7/GWSKTPreSB8lmX41QowHiacvi+
         dp6o/PXZNEXluRRu6+Hg5NPtZwVv3J3WJPiWp6x3vXvV9jL3uPFFpuNV2ilaInS7R6y6
         /1vWPRHWo9PUJFeUiELkgQJZlh/rpSYNlA0k8tayT/yCz+piOJRUaLAQZ4SklW2XR3PM
         cFodKFZzgLtbhQ4DOctb04qMIvB8v+ahUl5UCFAPeQETI8qs15Fi3vngSxioO4xaza/R
         LU9ENuHAMihQGxmIc1rmLAZpplGztM3D99fSl31HhnhT2/9TVJN0kMo1EHyhvVQnZn06
         fLxw==
X-Gm-Message-State: AFqh2kqL1AWoXg9XoEQLBppipl5+IxcHn2aHQdy/lN8jdB9v1YhxwJ7n
	E3dsT4e/vmmAxend8OOW+mmKpw==
X-Google-Smtp-Source: AMrXdXvSNekIIQS28DBo7WV5qCK0p341YhGJ92/g23fsqCqTUyMImv07j8DGXqwVqRJdkFHAGIuVOA==
X-Received: by 2002:a05:600c:3ba9:b0:3da:b40f:7a55 with SMTP id n41-20020a05600c3ba900b003dab40f7a55mr48469547wms.6.1674892323044;
        Fri, 27 Jan 2023 23:52:03 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id v1-20020a5d6781000000b002b9b9445149sm6701742wru.54.2023.01.27.23.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 23:52:02 -0800 (PST)
Message-ID: <64b7e7f1-44ff-09fe-c292-40eaa30a76a1@linaro.org>
Date: Sat, 28 Jan 2023 08:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 2/5] thermal: mediatek: control buffer enablement
 tweaks
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Michael Kao <michael.kao@mediatek.com>
References: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
 <20221018-up-i350-thermal-bringup-v9-2-55a1ae14af74@baylibre.com>
 <eb3b9439-172b-daea-8f0f-53c8fe7648f9@linaro.org>
 <df39cc8c-29db-f401-e1a2-1a3b7e962a7e@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <df39cc8c-29db-f401-e1a2-1a3b7e962a7e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_235205_903713_D1D8B67D 
X-CRM114-Status: GOOD (  20.22  )
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

On 27/01/2023 23:21, Amjad Ouled-Ameur wrote:
> 
> On 1/27/23 22:48, Daniel Lezcano wrote:
>> On 27/01/2023 16:44, Amjad Ouled-Ameur wrote:
>>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>>
>>> Add logic in order to be able to turn on the control buffer on MT8365.
>>> This change now allows to have control buffer support for 
>>> MTK_THERMAL_V1,
>>> and it allows to define the register offset, and mask used to enable it.
>>>
>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>>> Reviewed-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/thermal/mtk_thermal.c | 25 ++++++++++++++++++-------
>>>   1 file changed, 18 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/thermal/mtk_thermal.c 
>>> b/drivers/thermal/mtk_thermal.c
>>> index 8440692e3890..d8ddceb75372 100644
>>> --- a/drivers/thermal/mtk_thermal.c
>>> +++ b/drivers/thermal/mtk_thermal.c
>>> @@ -271,6 +271,9 @@ struct mtk_thermal_data {
>>>       bool need_switch_bank;
>>>       struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
>>>       enum mtk_thermal_version version;
>>> +    u32 apmixed_buffer_ctl_reg;
>>> +    u32 apmixed_buffer_ctl_mask;
>>> +    u32 apmixed_buffer_ctl_set;
>>>   };
>>>     struct mtk_thermal {
>>> @@ -514,6 +517,9 @@ static const struct mtk_thermal_data 
>>> mt7622_thermal_data = {
>>>       .adcpnp = mt7622_adcpnp,
>>>       .sensor_mux_values = mt7622_mux_values,
>>>       .version = MTK_THERMAL_V2,
>>> +    .apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
>>> +    .apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
>>> +    .apmixed_buffer_ctl_set = BIT(0),
>>>   };
>>>     /*
>>> @@ -963,14 +969,18 @@ static const struct of_device_id 
>>> mtk_thermal_of_match[] = {
>>>   };
>>>   MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
>>>   -static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
>>> +static void mtk_thermal_turn_on_buffer(struct mtk_thermal *mt,
>>> +                       void __iomem *apmixed_base)
>>>   {
>>> -    int tmp;
>>> +    u32 tmp;
>>> +
>>> +    if (!mt->conf->apmixed_buffer_ctl_reg)
>>> +        return;
>>>   -    tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
>>> -    tmp &= ~(0x37);
>>> -    tmp |= 0x1;
>>> -    writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
>>> +    tmp = readl(apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
>>> +    tmp &= mt->conf->apmixed_buffer_ctl_mask;
>>> +    tmp |= mt->conf->apmixed_buffer_ctl_set;
>>> +    writel(tmp, apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
>>>       udelay(200);
>>>   }
>>>   @@ -1070,8 +1080,9 @@ static int mtk_thermal_probe(struct 
>>> platform_device *pdev)
>>>           goto err_disable_clk_auxadc;
>>>       }
>>>   +    mtk_thermal_turn_on_buffer(mt, apmixed_base);
>>> +
>>>       if (mt->conf->version == MTK_THERMAL_V2) {
>>> -        mtk_thermal_turn_on_buffer(apmixed_base);
>>>           mtk_thermal_release_periodic_ts(mt, auxadc_base);
>>>       }
>>
>> This change conflicts with commit 4f2ee0aa2e706
>>
>> I fixed it with:
>>
>> -       if (mt->conf->version != MTK_THERMAL_V1) {
>> -               mtk_thermal_turn_on_buffer(apmixed_base);
>> +       mtk_thermal_turn_on_buffer(apmixed_base);
>> +
>> +       if (mt->conf->version != MTK_THERMAL_V1)
>>                 mtk_thermal_release_periodic_ts(mt, auxadc_base);
>> -       }
>>
> I think it's rather MTK_THERMAL_V2 and not MTK_THERMAL_V1. Other than 
> that, it looks

It was before if (version == MTK_THERMAL_V2). Now there is a V3, so it 
is replaced by if (version != MTK_THERMAL_V1) in order to include the V3


>> Let me know if there is something wrong.
>>
>>

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


