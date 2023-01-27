Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184A0C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 22:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7mNH8UjS1eLeKEg29OSJTNzCrRV1GaewWlhXhn/Ass=; b=FVi6YRab2Qixdbhj42PzqvCG8+
	G/PeX/mGBzS78JSUrMyw8hkGDZxcmULTPXW5XPVRNW5itatcJKbE5IcrjGa4WDWPlkj0c+m0sO+PG
	G+eo4iSZS3MTZmDTI5LnNleeF+iAFlJ1vjHsFlWiCmN/1c5R1ZGj43sF261SWUAVqTWnRDAIsr4XT
	OAzx3rw6Leu9laOmcW/YbLqH9eRopuvooGx3a/X+mtANHx4ZCPrJeQtJ5Vjrz7YVK3m2oDAuvJoYb
	Mw6yhp29L4V6Gjh1lNp5ZgHScy+kH5DyuZBRzpxVUsGJytNE/3GQ/Q92flbVWim76gI+ND9NPkipN
	5ymZsM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLX67-00Gh4t-GB; Fri, 27 Jan 2023 22:21:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLX5r-00Gh0M-5e
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 22:21:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id y1so6253836wru.2
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7mNH8UjS1eLeKEg29OSJTNzCrRV1GaewWlhXhn/Ass=;
        b=phX5a0bkyIOQHgeKrnGJ6rP2bFpUOK7+GfRnIGaTXbJHXepfIv3gEQw48mJPig+faD
         TnUHxa80I7+4/bpCYyiJbYnwnb9UzCcDTCfoxEsIaSlgLIsfyEkzyl66zWgmoEBk52gM
         03EFgs6sTQAY3FtxiyKuCSZtpb9Qbrv3J0XBq/HnJAA6h5FWsWSa2JWiy+6dcErkMotM
         agNBfcUn7fOkpRaNVJ5X3xki4GHiX/hml0PzClY3zDeOAQnHhoZn6iiccU9g1e/FEPPW
         UL8kmJzSulZMmgIhybb4RkxJbY+h+YuYjCv0MX2lvOsOjemhoTogf2Omta/Pu05L+1L4
         9NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7mNH8UjS1eLeKEg29OSJTNzCrRV1GaewWlhXhn/Ass=;
        b=oxlHH19UU0QLy4OCDk7vNBOKFsdeTS9cGzpNxCoaLLbHn5om7aSVoYc5QgvG350SmE
         rFQOLSc15GNoSshw6XBb14sJQaRw19+uxr6BQQqLaZpatt5M7zl56Cqw7SkD8tXfxRRi
         2XMxQbawu1n3Q1bCXpeuDrEBoVKMAvbeiIapNtIrwRo6IyePwZ/OoRiPMqUZPDCeFFH6
         BBh/ano1eXhtM58oUKEcZAHPj47fzEDW19WFjjqT08gw2GBqz52c6GCsdBYQCIiV8Q48
         XpbmHQ1wNW5ojvwFWY1kyUFR1UoJMHF0rfQJAIX5ZtU65pl3bQ9zOG2IRaVw2rmTEcGv
         kDtg==
X-Gm-Message-State: AFqh2koTEhzsIJHAjExhRBOvE8s3NMiHeKsQguh72WcNt2BTg9UlsNd3
	NHZjXJlygFHAYDaAKBOeI009hw==
X-Google-Smtp-Source: AMrXdXvpTC0WEHjMIdqtZJgSJEbDnzIJWgxxB9utWCGhrm/ZU+Tpgj0xpGRTg69JQyKH6I1qyty5mQ==
X-Received: by 2002:adf:8b45:0:b0:2bd:e8c9:bcd5 with SMTP id v5-20020adf8b45000000b002bde8c9bcd5mr34310410wra.61.1674858067148;
        Fri, 27 Jan 2023 14:21:07 -0800 (PST)
Received: from [192.168.0.20] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d500a000000b002be0b1e556esm4947431wrt.59.2023.01.27.14.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 14:21:06 -0800 (PST)
Message-ID: <df39cc8c-29db-f401-e1a2-1a3b7e962a7e@baylibre.com>
Date: Fri, 27 Jan 2023 23:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v9 2/5] thermal: mediatek: control buffer enablement
 tweaks
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
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
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <eb3b9439-172b-daea-8f0f-53c8fe7648f9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_142111_482948_617211CC 
X-CRM114-Status: GOOD (  22.41  )
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


On 1/27/23 22:48, Daniel Lezcano wrote:
> On 27/01/2023 16:44, Amjad Ouled-Ameur wrote:
>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>
>> Add logic in order to be able to turn on the control buffer on MT8365.
>> This change now allows to have control buffer support for MTK_THERMAL_V1,
>> and it allows to define the register offset, and mask used to enable it.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/thermal/mtk_thermal.c | 25 ++++++++++++++++++-------
>>   1 file changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
>> index 8440692e3890..d8ddceb75372 100644
>> --- a/drivers/thermal/mtk_thermal.c
>> +++ b/drivers/thermal/mtk_thermal.c
>> @@ -271,6 +271,9 @@ struct mtk_thermal_data {
>>       bool need_switch_bank;
>>       struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
>>       enum mtk_thermal_version version;
>> +    u32 apmixed_buffer_ctl_reg;
>> +    u32 apmixed_buffer_ctl_mask;
>> +    u32 apmixed_buffer_ctl_set;
>>   };
>>     struct mtk_thermal {
>> @@ -514,6 +517,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
>>       .adcpnp = mt7622_adcpnp,
>>       .sensor_mux_values = mt7622_mux_values,
>>       .version = MTK_THERMAL_V2,
>> +    .apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
>> +    .apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
>> +    .apmixed_buffer_ctl_set = BIT(0),
>>   };
>>     /*
>> @@ -963,14 +969,18 @@ static const struct of_device_id mtk_thermal_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
>>   -static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
>> +static void mtk_thermal_turn_on_buffer(struct mtk_thermal *mt,
>> +                       void __iomem *apmixed_base)
>>   {
>> -    int tmp;
>> +    u32 tmp;
>> +
>> +    if (!mt->conf->apmixed_buffer_ctl_reg)
>> +        return;
>>   -    tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
>> -    tmp &= ~(0x37);
>> -    tmp |= 0x1;
>> -    writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
>> +    tmp = readl(apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
>> +    tmp &= mt->conf->apmixed_buffer_ctl_mask;
>> +    tmp |= mt->conf->apmixed_buffer_ctl_set;
>> +    writel(tmp, apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
>>       udelay(200);
>>   }
>>   @@ -1070,8 +1080,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>>           goto err_disable_clk_auxadc;
>>       }
>>   +    mtk_thermal_turn_on_buffer(mt, apmixed_base);
>> +
>>       if (mt->conf->version == MTK_THERMAL_V2) {
>> -        mtk_thermal_turn_on_buffer(apmixed_base);
>>           mtk_thermal_release_periodic_ts(mt, auxadc_base);
>>       }
>
> This change conflicts with commit 4f2ee0aa2e706
>
> I fixed it with:
>
> -       if (mt->conf->version != MTK_THERMAL_V1) {
> -               mtk_thermal_turn_on_buffer(apmixed_base);
> +       mtk_thermal_turn_on_buffer(apmixed_base);
> +
> +       if (mt->conf->version != MTK_THERMAL_V1)
>                 mtk_thermal_release_periodic_ts(mt, auxadc_base);
> -       }
>
I think it's rather MTK_THERMAL_V2 and not MTK_THERMAL_V1. Other than that, it looks

fine by me, thanks.


Amjad

> Let me know if there is something wrong.
>
>

