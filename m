Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEE4C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOyX2y+yK0055b41MICdKQ4YUsD5Kv8I3S4JoEvD3+s=; b=cZBLned6SYNp4LwAvHPXS/zAD9
	ZLY38M9dOYQREepGxrqHrOrVE4heH14m05j7jOau9EDcYNMJIJzX0f8WoQG075oOrQGL51HTqTgSe
	4anw+LBO2dwZtFX7JJw7O8MUR4revwcNFleFmsySJjX/4XNi3X1vTpz3cbhGKMR228JxOORyy20H6
	X8dkLaeDlmdw7UNPeA8R3RE0yqdpp2lYH8rZcSNUaM2haNe61jEDfwIumWFgInQ4+PKCZDAXhmaLX
	5KOhS+X4l9hGrOkIegNiO/cRjAqEgOYR7OANPbKQYLNG0FWcqZ70ER0g3yU1//yyUe8j4U3j9YPN6
	GQNmZS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHS2L-005xiM-HY; Fri, 29 Jul 2022 15:36:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHS1z-005xRL-KP
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 15:36:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id m13so2489546wrq.6
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Jul 2022 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=WOyX2y+yK0055b41MICdKQ4YUsD5Kv8I3S4JoEvD3+s=;
        b=xbfzkZERozdMBRcOgicJM58M+/THgvCx3GpKROZViHKS8LplxroCDEH9yBY5Yu3xtw
         nuYfDFK7ctPBCgZjlwG6j4ZFbiB0p+n55irjINmm0//6S6geKc13W6xs6Tx2fcjs+OBj
         CEiYed4SZPcOuTE2JIrZuGPfoFlTiUEd+DRYYt6iFgeK5HNWss0g6Z/m05F9i6QVwanR
         LZN11YEaG11iT31jLUtmWEzQ8O1eyggr/ZQfptO1NDBOPcrvui0u/KT6YxIQBqDQxlVa
         8BJRfhTIRiXpcf48f2/JwbLdWCBq7DEa7l7zsU4npa08t8GSuYEA9EC+lSGXTXRkmJ2A
         pj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=WOyX2y+yK0055b41MICdKQ4YUsD5Kv8I3S4JoEvD3+s=;
        b=cHghBdF/4q/LvPPPeBxg1GkJ3TK4ifCl+JKcdHuxbufY+y7D4vb14KeveaA0mVWAyp
         on7sONuPIOcGPbPRi4T/wue8nZCN7Z969RvKHqJfmvTkn1moLBhAN4t5AWJmq1U6+FU6
         1DAPHuQtQAS7Q+ZkwTXTyqOkLyw0eQ+zu4t/I940//c0EBlOtdzpvxAloFaC2CJrWcj7
         FY3qHnUUMak4a1t9zqQfJSIy4A/SAh4yAOnM9OvT5quC5kSczKMRsErDdvvNypHReszb
         YFCEAWdrCAJIXDhgW1Hb9H+SCJlUPJcJmJ3j8gDdB+64df4CTC9RNKxK4zMADnULPbdK
         rMoQ==
X-Gm-Message-State: ACgBeo0nXqGh6AJtP20r9y6gusVc/qAn2cO1okaPUy/FhGAnLOdbYNTZ
	nRUw4olOFDXpgRcrIotQa5/Usw==
X-Google-Smtp-Source: AA6agR5m46hlp4+2Ih0uGB6NvQXsjckIOKi97W3GjOn1UxRDc27vQ3IwYtKwGaoHAhPJC8aD3Z3JpQ==
X-Received: by 2002:a05:6000:1849:b0:21d:9ad7:f27f with SMTP id c9-20020a056000184900b0021d9ad7f27fmr2707113wri.445.1659108959123;
        Fri, 29 Jul 2022 08:35:59 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a2b5:2611:bcc1:9aac? ([2a05:6e02:1041:c10:a2b5:2611:bcc1:9aac])
        by smtp.googlemail.com with ESMTPSA id v11-20020a5d43cb000000b0021ec76a0c36sm3806397wrr.106.2022.07.29.08.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 08:35:58 -0700 (PDT)
Message-ID: <9b224465-e9e5-43d3-50eb-3614decbd8b2@linaro.org>
Date: Fri, 29 Jul 2022 17:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek
 folder
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, amitk@kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-2-bchihi@baylibre.com>
 <24250d03-b25f-e521-5abd-f36109885c36@linaro.org>
 <CAGuA+opxZ7DDrWHcnTRhMcm7YveCAypdy9MDSytt58asgekayw@mail.gmail.com>
 <CAGuA+ooOUXaBM+uPvEEohFLtO8sRd4T=DMcc6Fvo9P92gsq4yg@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAGuA+ooOUXaBM+uPvEEohFLtO8sRd4T=DMcc6Fvo9P92gsq4yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_083603_713145_B1CDF546 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

Hi Balsam,

On 29/07/2022 17:21, Balsam CHIHI wrote:
> On Fri, Jul 29, 2022 at 5:19 PM Balsam CHIHI <bchihi@baylibre.com> wrote:

[ ... ]

>>> config MTK_SOC_THERMAL
>>>          tristate "Temperature sensor driver for MediaTek SoCs"
>>>          depends on HAS_IOMEM
>>>          depends on NVMEM
>>>          depends on RESET_CONTROLLER
>>>          help
>>>                  Enable this option if you want to get SoC temperature
>>>                  information for MediaTek platforms. This driver
>>>                  configures thermal controllers to collect temperature
>>>                  via AUXADC interface.
>>>
>>> drivers/thermal/mediatek/Makefile:
>>>
>>> obj-$(MTK_SOC_THERMAL)  += soc_temp.o
>>>
>>> However, rename 'soc_temp' to something more SoC explicit, eg.
>>> mtxxx_thermal.c
>>>
>>> Thanks
>>>
>>>     -- Daniel
>>
>> Hello Daniel,
>>
>> Thank you for the feedback.
>> Changes have been made as you suggested.
>> Resubmitting seen.
> *soon.

You may want to wait next week before sending a new version, I'm still 
reviewing your series (note you can send it anyway if you prefer)

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

