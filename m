Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A53C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 23:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2X8jC778a1bD8tgrUWuX1UVZgnWt1gIMDS+KShdSfBc=; b=2djGqxz3WVhp46GEYUaWEFuUYm
	leyqcJf/LPfcvocl2zqGYVJqtbUCZVig+Qg995yz7rM9Hzkr/KN9hREZxO5lH2kch+2fdJMcIW83d
	w1czEK1KzGnBOIHPh16sBx3Xj+On4I7JkRd+ISjO1lVgRiVRvZu74vFaV2IEnX53J+s03OTvRljjv
	HavH8tK+j5fiPwrcng7MZV6HiDbrGPu35A8di9t577pzgYYZ29bxdcgRHTZKDhHWvu2wNEpm2Ir5w
	huOCFY0+Z98Zkc3/3v+W6LkbsgAxmcpyMDhIrzcqitF2uwSBcWux6CH4fqZGU16dYl0+phWLpFjBw
	8yLV0qWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUa7-00B4a3-0M; Fri, 15 Jul 2022 23:18:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCU0p-00AqT9-UV
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 22:42:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q9so8561635wrd.8
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2X8jC778a1bD8tgrUWuX1UVZgnWt1gIMDS+KShdSfBc=;
        b=jbTDGvlbbzs1z5HnP6/mapGZm7MZhRKQoJdleovVTDakEJlHvZYWh2EiETPybsKXzo
         /VzB18mZVy47k2XIwgMvLCGqHPCjdPRQrn/U53gJ6DeAPV9hfNoAfPEFLWb/KCjrE0gU
         OWn2J6fDaUJEIBjfUVqt4CEy3Jf02rNs1YOyHfbkbCT7IfrBZ1MucKQTC4Z4G+96Uoyw
         yY2JvulPnCRcg0lZPyXifOFkhnaSnx20tE2GYw+zVQJycbPHF7aPExnEGs4SGJMc7EKs
         c2Kmh35fY+dgaZnAY+bVZezFmtKt0xOYhQ2junox4EtLBShs5p5sa9ih32mFg6V/qR4A
         xhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2X8jC778a1bD8tgrUWuX1UVZgnWt1gIMDS+KShdSfBc=;
        b=mQqJR4cE6uDMWhKbHBKQxly3s975Zi+gK4y88RX98oWzDkytVucSWkZ2oakD1ZUzAT
         JWIN9geYZMhYB8/196xL1ZSGtEaWW8WUGvR9drqOS8+NZ56ScM3i0Vq/3/atoRSUxdN7
         1t/hOVW+RdlD4ueZ/uxhj5Yymn9ttDpxoemzTlOxJCegOcuwSjPdKlMcmzvX/WQjoF76
         2dSFG1i5yCbRd1iF94nhDm9MimCF6nc+SPoHZr/4gUnrUCLZfDyGagELCDmbUHV0IT0d
         yASb9E7nHnglSmkE9pBg9rORO6EjYiIeLd+Vw4F1GHiAMrfYdTfQ0S3+x7C2Hw2r0zvW
         udow==
X-Gm-Message-State: AJIora86qKcq+/iCYKsRdCCakBtGQ3GHC/QlJWBssWZ484H4Ko0HUKHn
	agy3xauV1IUe0tcpOUB1dbkq+w==
X-Google-Smtp-Source: AGRyM1slAuNUi2kVMR00o7FcgsJHvB9Ke/0OFXq7b+nWaaLRGPPkZevi0l6tGHJYVdskcIY7XQkawQ==
X-Received: by 2002:adf:e18a:0:b0:21d:93ac:bd55 with SMTP id az10-20020adfe18a000000b0021d93acbd55mr13486799wrb.100.1657924937976;
        Fri, 15 Jul 2022 15:42:17 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a223:f4b3:40c9:43fa? ([2a05:6e02:1041:c10:a223:f4b3:40c9:43fa])
        by smtp.googlemail.com with ESMTPSA id c6-20020a5d5286000000b0021d6e49e4ebsm4616406wrv.10.2022.07.15.15.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 15:42:17 -0700 (PDT)
Message-ID: <4f89bdc5-3047-7619-f518-3ef328a027a8@linaro.org>
Date: Sat, 16 Jul 2022 00:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 0/2] MediaTek SoC ARM/ARM64 System Timer
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20220613133819.35318-1-angelogioacchino.delregno@collabora.com>
 <217695f5-55d3-e347-ea04-d30aaee6e712@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <217695f5-55d3-e347-ea04-d30aaee6e712@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_154220_022925_5B6DAC5F 
X-CRM114-Status: GOOD (  14.98  )
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

On 08/07/2022 10:45, AngeloGioacchino Del Regno wrote:
> Il 13/06/22 15:38, AngeloGioacchino Del Regno ha scritto:
>> In an effort to give some love to the apparently forgotten MT6795 SoC,
>> I am upstreaming more components that are necessary to support platforms
>> powered by this one apart from a simple boot to serial console.
>>
>> This series introduces support to start the System Timer for the CPU
>> cores found in various MediaTek SoCs including, but not limited to the
>> MT6795 Helio X10 - and will most probably unblock many developers for
>> the upstreaming of various platforms.
>>
>> For a broad overview of why/what/when, please look at the description
>> of patch [2/2] in this series.
>>
>> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
>>
>> Changes in v4:
>>   - Changed statement in documentation, now saying:
>>     "MediaTek SoCs have different timers on different platforms"
>>
>> Changes in v3:
>>   - Merged mtk_cpux_{enable,disable}_irq() as one mtk_cpux_set_irq() 
>> function
>>     as suggested by Matthias
>>
>> Changes in v2:
>>   - Added back a lost line in commit 2/2 (sorry, commit didn't get 
>> amended...!)
>>   - Tested again for safety
>>
>> AngeloGioacchino Del Regno (2):
>>    dt-bindings: timer: mediatek: Add CPUX System Timer and MT6795
>>      compatible
>>    clocksource/drivers/timer-mediatek: Implement CPUXGPT timers
>>
>>   .../bindings/timer/mediatek,mtk-timer.txt     |   6 +-
>>   drivers/clocksource/timer-mediatek.c          | 114 ++++++++++++++++++
>>   2 files changed, 119 insertions(+), 1 deletion(-)
>>
> 
> 
> Gentle ping for this one - I need it to start upstreaming devicetrees for
> that MT6795 Xperia M5 smartphone, or it won't be able to boot.


Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

