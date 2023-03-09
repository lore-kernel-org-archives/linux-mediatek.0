Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A5CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqPGgd3BFdJ5Z3N2xYuAK2cKJFro8IMB7DoFRyNGYm4=; b=lH1/iRBHpQB36JC2mQLWVeM7Q6
	jJtKzfkGJqP1vHcudSFs6DFQTuSZkpNzVobGoFEt2qsA2R49ejQO9s2Osl3puW1ZMdVSHOaD9slef
	j3RDruYleYFN82HnWeLsbrM68ggazW6Yq5KjXcR3dRH++yjd6wAJ5ZPOsv68XjXM1JQvFrfBmaLI7
	HIYh5f4ZWUqNDXxvieRpJ7PW8E/sSpvQuhkVwVUXvQckB7sjq5YbX2CAecDwU4B8zbwcDpzTk4X9s
	Tib2TrwTZ0EFiB/1VUCARDmMUJq7hlBigA52/S+xDz3Axp69ABX0wt3FxcW3Ba+N/RC5zl8XGCFHM
	CCYdbY/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDgG-0097hu-Ka; Thu, 09 Mar 2023 10:39:28 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDg5-0097eZ-Ad
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 10:39:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bx12so1349926wrb.11
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 02:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678358355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqPGgd3BFdJ5Z3N2xYuAK2cKJFro8IMB7DoFRyNGYm4=;
        b=cyuWrije1J+G0kpt9rtg9Zl9sy2vZ6FM3iuAuq3aa6xpiGzEf2lm0y2C8jOCJlsWeJ
         EWmWc+ptmmIZ9VpxZoDLI1gR53mm2YZY+lWHHX9DnYPngQ1jRmg6Jeu657tZGxz2jX6N
         YsoLVo8eGy3iUnDoOpwdsva1cuCV/u8EvWap4XFofYLdq6F3rlwtUXKWVPAevmo9lZVA
         HDTeFqtX5+kZHYiMCjYQZiL2O9EhJWAWwx+6m0tXDA025+3xrVorFWwpWXEzFQ6EFYpQ
         qC2bZ8Hc50FwsaxXuDrl5qnMSJlJexrK54vU2rtvMh2yoUkAcNaGANtYbeaPWwZlJBxe
         G4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqPGgd3BFdJ5Z3N2xYuAK2cKJFro8IMB7DoFRyNGYm4=;
        b=gNtY9dhs4LIWFHy40YECKhzdq19vlASbl3+MhedXFHQtzKuHFaPP6e55AjaXLVFFAy
         CE9KQhcr/iJWGzo3/YgiHnDcT4eM0vGr3pfyPB4rfNxKwk7CVfuPU8gRAkSf3dLLGq6r
         H5VvpKEiPvz/mdjjNX1JBGMC+RqeELrwU+k0dWyC39ee9+F/H1XPZvEvaFCbFdxVti4f
         qlj0UHtD/0EUF+W4shqKiPakM5ivW3DSc7cnsnJ4ck64FX6jUOWaVsr+0jIvjJzNRuIV
         3ZINb1YEY58bfdOENqKV/Awuz9McsYjRtIZpcLe7LD9tjsxzn5xZKxEX42SRNJ693HwI
         zMsA==
X-Gm-Message-State: AO0yUKUzFtqnFuIGwjmpZv+51H5vJq+wIc0BPwBcsBSYyuChZz80IDCg
	2aNuaqUKMNvi/B7vPrmC6AsoIg==
X-Google-Smtp-Source: AK7set/FRRRB0+8uQ1yztBz2VteqoM/5ZDzGzNq25bY2dg07fWy53EiQjle/35Q0iTayjTBe36Tw7Q==
X-Received: by 2002:a5d:4a43:0:b0:2cd:ceab:df1a with SMTP id v3-20020a5d4a43000000b002cdceabdf1amr14687125wrs.32.1678358354769;
        Thu, 09 Mar 2023 02:39:14 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:fbda:65f5:e873:7527? ([2a05:6e02:1041:c10:fbda:65f5:e873:7527])
        by smtp.googlemail.com with ESMTPSA id s1-20020a5d5101000000b002c559405a1csm17580482wrt.20.2023.03.09.02.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 02:39:14 -0800 (PST)
Message-ID: <e5959cb5-af8c-9410-9530-b3e19e9b647a@linaro.org>
Date: Thu, 9 Mar 2023 11:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] dt-bindings: thermal: mediatek: Add AP domain to LVTS
 thermal controllers for mt8195
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, bchihi@baylibre.com
Cc: angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230307154524.118541-1-bchihi@baylibre.com>
 <20230307154524.118541-2-bchihi@baylibre.com>
 <CAGXv+5FUrWEF4SZ6DKjoF8Oai--JGFffzQ3_DyzQrUrThVEQ7Q@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAGXv+5FUrWEF4SZ6DKjoF8Oai--JGFffzQ3_DyzQrUrThVEQ7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_023917_377536_C9A7536A 
X-CRM114-Status: GOOD (  18.33  )
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

On 09/03/2023 05:40, Chen-Yu Tsai wrote:
> On Wed, Mar 8, 2023 at 12:46 AM <bchihi@baylibre.com> wrote:
>>
>> From: Balsam CHIHI <bchihi@baylibre.com>
>>
>> Add AP Domain to LVTS thermal controllers dt-binding definition for mt8195.
>>
>> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
>> ---
>>   include/dt-bindings/thermal/mediatek,lvts-thermal.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
>> index c09398920468..8fa5a46675c4 100644
>> --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
>> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
>> @@ -16,4 +16,14 @@
>>   #define MT8195_MCU_LITTLE_CPU2  6
>>   #define MT8195_MCU_LITTLE_CPU3  7
>>
>> +#define MT8195_AP_VPU0  8
> 
> Can't this start from 0? This is a different hardware block. The index
> namespace is separate. Same question for MT8192.

The ID is used to differentiate the thermal zone identifier in the 
device tree from the driver.

+		vpu0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_VPU0>;
+
+			trips {
+				vpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};

If MT8195_AP_VPU0 is 0, then the code won't be able to differentiate 
MT8195_AP_VPU0 and MT8195_MCU_BIG_CPU0

The LVTS driver will call devm_thermal_of_zone_register() with the 
sensor id. If MT8195_MCU_BIG_CPU0 and MT8195_AP_VPU0 have the same id, 
then at the moment of registering the MT8195_AP_VPU0, the underlying OF 
thermal framework code will use MT8195_MCU_BIG_CPU0 description instead 
because it will be the first to be find in the DT.

If MT8195_AP_VPU0 is described in DT before, then the same will happen 
when registering MT8195_MCU_BIG_CPU0, MT8195_AP_VPU0 will be registered 
instead.

IOW all ids must be different.

The namespace is already described by the macro name AFAICS, so whatever 
the values, we see only the macro names and those IDs are private the 
kernel implementation.

If the numbering is really important, may be something like:

#define MT8195_MCU_BIG_CPU0     00
#define MT8195_MCU_BIG_CPU1     01
#define MT8195_MCU_BIG_CPU2     02
#define MT8195_MCU_BIG_CPU3     03
#define MT8195_MCU_LITTLE_CPU0  04
#define MT8195_MCU_LITTLE_CPU1  05
#define MT8195_MCU_LITTLE_CPU2  06
#define MT8195_MCU_LITTLE_CPU3  07

#define MT8195_AP_VPU1  10
#define MT8195_AP_GPU0  11
#define MT8195_AP_GPU1  12
#define MT8195_AP_VDEC  13
#define MT8195_AP_IMG   14
#define MT8195_AP_INFRA 15
#define MT8195_AP_CAM0  16
#define MT8195_AP_CAM1  17

But I would suggest considering this change as a separate patch after 
the AP domain is added.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


