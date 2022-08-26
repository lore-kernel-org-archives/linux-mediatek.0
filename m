Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FE6ECAAA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+0yDajJ0wMjpgyqOUnKw47mL+zdc8UQAtbyK28TADE=; b=YshyJMWJAcjk1CzP4UHvQKXRY1
	HRCxm6YjH4EZxVkhhTi/foXJPj/23u2GtT5qDR09yWRBtSoCtoU2L8TAqYQMXxZTGXl8XJqSecUTO
	h0LfIlMBkWR1XmtA+EWkxEfhygWI1DdEptyxRkPhTwZvlFroMR+PDUEiYlb3rpNsQ3kSq+/F/dVYU
	/Fcb4hpd/ayV5W4c+7T+mRDQjwt8z4J5Nraf+Z5S36ysrxC0db9m2c+2isEWrugagVdm80dF0IRqW
	/3Gnw2cdMTAnv4V8hdEQWpoG80hmJPiwM2n62gUuzUbugZ9MCneGyiDL5o0FgaLJNy9QfTCTJY1Mb
	ZplGo01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZyR-005mDl-QQ; Fri, 26 Aug 2022 14:06:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZyC-005lzc-1Y
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 14:06:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id u5so1922868wrt.11
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Aug 2022 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Z+0yDajJ0wMjpgyqOUnKw47mL+zdc8UQAtbyK28TADE=;
        b=1TrEMsMjrNGXQg3zlIfMbp6DcGA/mnvnYEcXOVNWIZtxGMMtIIDBXFAdTbQdg1JhiZ
         NOUGwIig0tV7ocKG7N6MfxSRKKhCjxzyzNULveaen25A473Kz6VG6VewMXb6F9ODrHl3
         prvKMEYieaPC+isGsSBb5ZIGpmk1EXoIf7Xw/CMMowCQsPdIVOPsUbH3NE90Rjt6Vgsb
         wFetqy6U4nj5bS5DNnxsjUfxh4KXHMP2z9YMVBFv7o0B8WdX4pq+IybwfAv9Uh3nXWjK
         EtbG3Zxi2O/zO0WdLbyauOW08/7V+J6sJJ+2QI6d9IPSydep7VVX/UsSRlXBZFPlcItP
         /Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Z+0yDajJ0wMjpgyqOUnKw47mL+zdc8UQAtbyK28TADE=;
        b=VE+GTtPK/veL+SJM9UbbKQ0UbO8yk3dqg3rDllr3VbbvBmSi1179S/wznGvK8IuTPT
         5zhN9IKLgyWTL/UWz80DpxlKqh3hMY47XMIcTH1SB9oD6M9ZiDPXiHzONgcTG5rWO7P3
         p/5+I2EKu5ScZoyjeSEltboKIDwNsuxBXHh0LDBXZ755dQoAEUm1o6P/ZHQ/lJocghrn
         mBFg9Sj2/SN0HtmIip8VWStR5SEshS3H67NTRKjHPJjyVW1J808I2RsnSPSDOmbnvoFN
         yxiyJzHU9zPTHocqF/6Unv1pCTUNkGVZo5HCyq6vN9rfc9M7O70Ux++TVYdfVHTH6fnw
         wBMA==
X-Gm-Message-State: ACgBeo07CkGM6Ns7yerZrCP9a6pbF58dJ4R5C6OnzLCuG3Jyb60TxzeD
	Lbetru+XR9Nj5y42VNYMkzMA5w==
X-Google-Smtp-Source: AA6agR5LuyIlDMydRhgyzTFzClAGY8aeGYDhoH5FtmW4fur5TkLAwiWQlSHq4jMGUpVO741aer/a0w==
X-Received: by 2002:a5d:5305:0:b0:225:453a:be9b with SMTP id e5-20020a5d5305000000b00225453abe9bmr5058563wrv.516.1661522757838;
        Fri, 26 Aug 2022 07:05:57 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id j2-20020adff542000000b0021e51c039c5sm1967727wrp.80.2022.08.26.07.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 07:05:57 -0700 (PDT)
Message-ID: <cf60d0a7-2dec-a6c7-879f-ab4812a1e034@baylibre.com>
Date: Fri, 26 Aug 2022 16:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] thermal: mediatek: control buffer enablement
 tweaks
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: rafael@kernel.org, fparent@baylibre.com, amitk@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, robh+dt@kernel.org, rui.zhang@intel.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
References: <20220720181854.547881-1-aouledameur@baylibre.com>
 <20220720181854.547881-4-aouledameur@baylibre.com>
 <a143dfcd-7a6a-49ff-6bed-4ffdb0fa1c4a@collabora.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <a143dfcd-7a6a-49ff-6bed-4ffdb0fa1c4a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_070600_105843_9CAA3C05 
X-CRM114-Status: GOOD (  17.59  )
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

Hi Angelo,

On 7/21/22 10:11, AngeloGioacchino Del Regno wrote:
> Il 20/07/22 20:18, Amjad Ouled-Ameur ha scritto:
>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>
>> Add logic in order to be able to turn on the control buffer on MT8365.
>> This change now allows to have control buffer support for 
>> MTK_THERMAL_V1,
>> and it allows to define the register offset, and mask used to enable it.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> ---
>>   drivers/thermal/mtk_thermal.c | 23 +++++++++++++++++------
>>   1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/thermal/mtk_thermal.c 
>> b/drivers/thermal/mtk_thermal.c
>> index 216eb0d61c5b..1dc276f8c4f1 100644
>> --- a/drivers/thermal/mtk_thermal.c
>> +++ b/drivers/thermal/mtk_thermal.c
>> @@ -283,6 +283,9 @@ struct mtk_thermal_data {
>>       bool need_switch_bank;
>>       struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
>>       enum mtk_thermal_version version;
>> +    u32 apmixed_buffer_ctl_reg;
>> +    u32 apmixed_buffer_ctl_mask;
>> +    u32 apmixed_buffer_ctl_set;
>>   };
>>     struct mtk_thermal {
>> @@ -578,6 +581,9 @@ static const struct mtk_thermal_data 
>> mt7622_thermal_data = {
>>       .adcpnp = mt7622_adcpnp,
>>       .sensor_mux_values = mt7622_mux_values,
>>       .version = MTK_THERMAL_V2,
>> +    .apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
>> +    .apmixed_buffer_ctl_mask = ~0x37,
>
> This is effectively GENMASK(31, 6) | BIT(3) :-)
>
>> +    .apmixed_buffer_ctl_set = 0x1,
>
> ...and this is BIT(0)
>
Thank you for the catch, will update them appropriately.
>>   }; >
>>   /*
>> @@ -1031,14 +1037,18 @@ static const struct of_device_id 
>> mtk_thermal_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
>>   -static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
>> +static void mtk_thermal_turn_on_buffer(struct mtk_thermal *mt,
>> +                       void __iomem *apmixed_base)
>>   {
>>       int tmp;
>
> Since you're practically restructuring this function, please fix this 
> wrong
> variable type, as this should be a u32.
>
Sure agreed.


Thank you Angelo for the review.

Regards,

Amjad

> Regards,
> Angelo

