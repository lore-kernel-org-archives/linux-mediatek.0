Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC437C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etdPu7ZHR6s1G27l0n5keJNFGD1mGQTrUvf9WBbghdA=; b=bsfOIkggNEWyk2mIEoqWIyv4PG
	rUljiiJdquoQjMQVbVzJeJj4z0S+Ghc742uID3lQa2W5VZB63zI+g0QxeZAAtHLqAMs4CugxglJ72
	WfzXKpbrFZh4fjhrf6jIm8B1RhGLmFm897kNEzGVnE2eU7w9pAJ9ALtALQ5ka51Q9UbSL5USNkWfG
	6pVi9ZKj+8CObivUWkFG6Qy8sWzYErg+QW3WRBxcydLd2vd/j7PAHsig/u/KmcM26+f4Rgi5mvAY9
	EAT2CnDufAFrUFY9NeGhPTCz3LZR00bOtkC1AuJiQFeNu0l4Qc8qlBUDGJ1/KtsvEkeQRN2snVivI
	icnT6c9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paJqy-00BOVL-Cz; Thu, 09 Mar 2023 17:14:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paJqu-00BOTy-GA
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 17:14:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id g3so2614031wri.6
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 09:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678382090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=etdPu7ZHR6s1G27l0n5keJNFGD1mGQTrUvf9WBbghdA=;
        b=152ZJWbdFi/reWXLpFL+Z8iItaLRegYplrUviJaFIf7l5BMGjNKLSeeT5EJSKlj8A0
         UVObjPqAuN7Cua5DmlSUXOfDbd/DwHGM4O39sXrRdtSmOiCDQ0Vk7gj2Nh7n7w30eP/H
         +RrEL/rN3oBZZ8xyPr5MVc6OneB5WFm616Hbv3neFg9QuiNDkeZouZXSdRv3HzJfRMzp
         y1XWntgyhLqHy2uLr6LoCWOhAsO7pCSH2Lwju9NICszo2/Q595DFAYVnpH2UifFx+pyt
         n46zuxiun/UtOVkj3yjlQPrzbJBZ821Q9uyRIzTidtQ2BgqWDWwiknChqH1CBFYTcVdI
         aUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678382090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etdPu7ZHR6s1G27l0n5keJNFGD1mGQTrUvf9WBbghdA=;
        b=zPx765z3kuU26adIsfxago6h8GrpQZ1ph9n2xGrecngGxi1YJy92u7fzkMvqttESln
         gg6mUzJlB4vQ/nuJk/AIKowKtyhB1PqVrPquKPZBdUrDXfPAtYfTJOnPcXI24FyZfpMu
         EkkOL/fpW6793o9t185F4HphtPru2DtgSseWUvPacnehu7NGM+Xsaz8eTtmc8TQBd3sz
         r3pFZAP9g81OE3eZudpQLXYbyMNVsAwLeFCqi3nEQjI/Di4P0JlZBYVdqx6CGZIfJUE7
         P3/ekedIYtyaC34GPTmeGX8Xcg/LAyQCVpSflWfnBqBLp6btb6aIJUQCNM8j0a6yX9Ba
         75ng==
X-Gm-Message-State: AO0yUKXuyQsKAj+tpBNBLQ9l9prNXtQHC06GOqZNnBUXfW9YwameubUL
	p3C96xoI4S+sjrX+NupqjzI5WQ==
X-Google-Smtp-Source: AK7set/wQdg094HolkqpN/B63LJ58ZKbcq1wqCEBpKsbTQRpdSfArJikyYC7VtJsbK2OJ7Q5qIGfXQ==
X-Received: by 2002:adf:fe47:0:b0:2c7:1a96:efcd with SMTP id m7-20020adffe47000000b002c71a96efcdmr14438370wrs.1.1678382089656;
        Thu, 09 Mar 2023 09:14:49 -0800 (PST)
Received: from [192.168.0.20] (ip-87.net-80-236-117.rev.numericable.fr. [80.236.117.87])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d408e000000b002bfd524255esm18257200wrp.43.2023.03.09.09.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 09:14:48 -0800 (PST)
Message-ID: <1e4ff264-523e-7d40-f487-5ed535a520ea@baylibre.com>
Date: Thu, 9 Mar 2023 18:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
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
X-CRM114-CacheID: sfid-20230309_091452_776037_F7B9F023 
X-CRM114-Status: GOOD (  23.53  )
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

Hi Daniel,

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

This should rather be "mtk_thermal_turn_on_buffer(mt, apmixed_base);" as this patch

also adds mtk_thermal arg to the function.


Regards,

Amjad

> +
> +       if (mt->conf->version != MTK_THERMAL_V1)
>                 mtk_thermal_release_periodic_ts(mt, auxadc_base);
> -       }
>
> Let me know if there is something wrong.
>
>

