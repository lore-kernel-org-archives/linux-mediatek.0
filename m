Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F366BC25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 08:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9TONvTEWThGczkgWTi4O6+TwYpFpcfs3Yxs9Jjw9zo=; b=lpwqb501AY8E6vjH0EV6KHYVEp
	5JNrl8usGMDB7xUg0uUQ1Y2rtZo/6H3ADBk4+lDrj2VwVRTsJXu6z4TDAWTgHl4C5KRvIf2CBo/Rd
	2kmG0d5HOpM021rDnZFTXdCjPCTRrjRMtqpGMUoF4gefAHtVkpfUNKvD1TAwOz3Kq3b799AWwtW9B
	idm8FEeW+VMs8i6t8lcqQa9Z444UlMQwHv2kJTjTm+c5QUZOOFoOFVuBDQjBIsj/cslw2ekbZugPs
	C1m/lmp1SUmxFH0Qvc6W/MZf9ZIdMMuQGRfrJE726E7yYq5V/ANMo0t4rt/Q4R6TDblvKqGot/j+6
	wsgJrgSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVVL-0000000EC4W-3BrM;
	Mon, 27 May 2024 08:14:51 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVVI-0000000EC3c-3iDQ
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 08:14:50 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2e968e77515so22099831fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 May 2024 01:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716797685; x=1717402485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9TONvTEWThGczkgWTi4O6+TwYpFpcfs3Yxs9Jjw9zo=;
        b=WKySpKgacypl9ThLCyZwft887Cmfwbvd26Fk44Ju/d+FkkLrHbZtS4T1PSJWxVcr/q
         IQ5yxwbo0e6QO2kGXHIEAsAe1joAB2zhDYRuWqIM9KOzpBUwKqf0j30PTjq4dNdQy8uB
         V27wu5+r97XS7l28n8495qKgV4GdfPO7sqPYSloVZNtXBPyrEjOFQTyujmXsSn5BIjZL
         P6+2YgupkMYIlvqu3ViYiTLYD8cIjJ9ocH1IUuNqNg8gFTXAVFDdSK5pe6M3X78dYF/M
         lXzs/g874jCYzN4hEvyLhFm3gM9R+0MdNuW4L0wNazFfr2CqR+kz021+JmFwy5NCJu5q
         l4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797685; x=1717402485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9TONvTEWThGczkgWTi4O6+TwYpFpcfs3Yxs9Jjw9zo=;
        b=Tsx476VDdL2niwlBLNxCeyR5nfAGkm5OnjpGTmQDf1x6UQjdcjTMNiIRAmEI1B4GAg
         d0AS64nRyNUr+A22LyjHKbdxrOQdkN27TcJ3zXLSFWLD0KI+kNl517yhwOAYGOY82AMO
         7iCZr1RUnz1s2dmi+azwJvWst6YOlqGZcOw3sNgyBF1KzqyWKbtojeFKAFH6TbWpg3ba
         54T11nTDacCpwP5E8BM8F1rQqAgJ38+HrwVKsAzPdxfmE0S88+CmgaH0VvCyI5x1SH9Q
         LyEJTxJZbTB4iBc7UXZCz69vyxR3azEov/FMqeSGcuWl0V4xqfDu6+cLpKKUdT/NkUum
         jfkw==
X-Forwarded-Encrypted: i=1; AJvYcCWLv5VXnCKN8dkNu4W2RAC1FOi5KrIH40HFbz7nXJe1viuJ/OZ8zI5qSnRqin4E86aItTQ5qaZrjZAhbc9WzRgREviGrFQtAQyiQeXbeRBX0iGO
X-Gm-Message-State: AOJu0YyY8+RtQdnRNopuTTZ7mBZpzQ6G5nxQPVkerBVJ+QjXAyVLF7Br
	uWyyzwIVnfJXyF5CDddAorSPkyJia9OU9F0EoKeFGyLqAcbFAefDwny8pPYlfzI=
X-Google-Smtp-Source: AGHT+IE5hwvA+dnXZp0Ce0d7BlZoXZS8BtrFd0HTMRigsC5U6EqzAEtorNHmX+hus94f/jH5p+ygFg==
X-Received: by 2002:a2e:9819:0:b0:2e9:6d3e:e91f with SMTP id 38308e7fff4ca-2e96d3ee9b2mr28178891fa.52.1716797685169;
        Mon, 27 May 2024 01:14:45 -0700 (PDT)
Received: from [192.168.27.173] ([77.205.21.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210896fc8asm100562585e9.13.2024.05.27.01.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 01:14:44 -0700 (PDT)
Message-ID: <bb07e774-ba80-4fc5-a57e-ad5ef6360c32@baylibre.com>
Date: Mon, 27 May 2024 10:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] dt-bindings: thermal: mediatek: Rename thermal
 zone definitions for MT8186 and MT8188
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
 <20240524-mtk-thermal-mt818x-dtsi-v5-1-56f8579820e7@baylibre.com>
 <20240524-concerned-fritter-262f5e16293e@spud>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240524-concerned-fritter-262f5e16293e@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_011448_968153_36F39598 
X-CRM114-Status: GOOD (  18.81  )
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

On 5/24/24 20:24, Conor Dooley wrote:
> On Fri, May 24, 2024 at 11:04:34AM +0200, Julien Panis wrote:
>> Use thermal zone names that make more sense.
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> Removing the defines is an ABI break. If these are all the same devices,
> but with more accurate naming, then keep the old defines and add new
> ones. However, the GPU1 define changes in the course of this patch which
> is more problematic.
>
> Why do these names even make more sense? Where did the old names come
> from and where do the new?
>
> Thanks,
> Conor.

Thanks for your comment.

For mt8188, the old name 'soc' came from a document by MTK, which is not
public: MT8188G Functional Specification. This document does not explain
what 'soc' are/do exactly, it just says that some temperature sensors are
located on them.

Then, there was a comment about these 'soc' names:
https://lore.kernel.org/all/ff12e104-da8b-4800-bfbe-a006ffe1b840@collabora.com/

So, I had a discussion with MTK to understand what these 'soc1/2/3'
are/do. The new names comes from this discussion and were given by MTK.

For the other SoC of this series (mt8186), the same kind of document exists
(MT8186G Functional Specification) and explains what 'soc' are/do exactly:
('cam', 'dsp', 'nna'...which are used in 'mt8186.dtsi').
Using the same logic in 'mt8188.dtsi' would be more consistent. Besides,
these names are more explicit.

Julien

>
>> ---
>>   include/dt-bindings/thermal/mediatek,lvts-thermal.h | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
>> index bf95309d2525..ddc7302a510a 100644
>> --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
>> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
>> @@ -24,7 +24,7 @@
>>   #define MT8186_BIG_CPU1	5
>>   #define MT8186_NNA		6
>>   #define MT8186_ADSP		7
>> -#define MT8186_MFG		8
>> +#define MT8186_GPU		8
>>   
>>   #define MT8188_MCU_LITTLE_CPU0	0
>>   #define MT8188_MCU_LITTLE_CPU1	1
>> @@ -34,11 +34,11 @@
>>   #define MT8188_MCU_BIG_CPU1	5
>>   
>>   #define MT8188_AP_APU		0
>> -#define MT8188_AP_GPU1		1
>> -#define MT8188_AP_GPU2		2
>> -#define MT8188_AP_SOC1		3
>> -#define MT8188_AP_SOC2		4
>> -#define MT8188_AP_SOC3		5
>> +#define MT8188_AP_GPU0		1
>> +#define MT8188_AP_GPU1		2
>> +#define MT8188_AP_ADSP		3
>> +#define MT8188_AP_VDO		4
>> +#define MT8188_AP_INFRA		5
>>   #define MT8188_AP_CAM1		6
>>   #define MT8188_AP_CAM2		7
>>   
>>
>> -- 
>> 2.37.3
>>


