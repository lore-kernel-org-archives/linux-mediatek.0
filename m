Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545BCC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 18:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHQFyw10BVunJxsxfMJNLLH0YrstlFb/O3uzZ6Wfpjg=; b=gGcVx14/Vif90McA4GaaT9BRO0
	065wROsWRgX1ThP+0ph/SYt1Zh85g+kYvm4NY/TC8rtJYVEKsZ7MML1f2CuigAVA8pmWUom17QkiX
	pYHWn0xdPBG7ujq//ek3S0437aIbRth8QzSyE91UJG7J1w6c/r/+AJgDyGjt+KCdk4FH1O91+kMvD
	vuJXrGyfmI1PkGBf8KyXK1YE+OtcebhX/niWpET0G0A/dPLiwnswT+jufBgTyMJ/mf7Lfd8jg/Z5G
	SEV1TPZqP8Tq/FD9++lzizPBrxY3gpk+Ls03nTUxa/3SizmY9la8hVFrrMjP9jJjcCmsGIJ+hXJsT
	tJ7m9BUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZy5Z-006Hzj-BA; Wed, 08 Mar 2023 18:00:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZy5V-006HyT-7V
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 18:00:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id p16so10322271wmq.5
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 10:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678298426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHQFyw10BVunJxsxfMJNLLH0YrstlFb/O3uzZ6Wfpjg=;
        b=ufyRbw83qMR9Tdb34LRa+lUAFh1PAN8VwgGsw0takIfgH/kTPequORWhdtOk/hz5TD
         uRxobnLYhVlG+PW0wIj1K+cJm0mLhmrmqXvQER3wRGFHdw7ddbyx2E0NGGU0xaDUN9dT
         1jme7DeSFewuaURlDbgMvR3SjknlL/1TH8PLnBVBldHtbqonpBflPeRQ/DiO6gl4jHzw
         3KMmb7RulbUuusz8Q1dpE8PPu7jEni9L+dAPnnDD4Vz3LDHbV5XocVtJT1zor4B8UDWx
         /VZOqy5NR9DrnbUzr2m/2Vg/se5GqLAZDeSKleWyH3pkj2F9BIx3p9dn8YOga/ccjCKo
         g8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678298426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHQFyw10BVunJxsxfMJNLLH0YrstlFb/O3uzZ6Wfpjg=;
        b=w9ddfXLG+n9x4qX+RspYEGzeKJbbCwO293rZsvjRDGZGUJ57Z8yN8bzI0udfEl/ua+
         5uPoeL4/ncr8TtGRGw6W1M7TZrFAWUXlElxoYpnOURGjb1Y4oSprfiHI7O6powBHsI3e
         fewzVa/XplvaNmfZRBUJHu2DbGf2tMhX0l4oXEWANrO9eyU6gs6Jrf4X9J4hB/2b5LPI
         BY0m4N4QjKJJUwy5YYXE84caHyaa6DGfvFSxHPJMtxsM8UyB3IdASIBkgEeVlMPnY/cz
         skRafdFr2voiSIcasarYzN3yCYNCKHJ/HlLUw/0JEHMWDTr0IlKG6PjorQY8g6+XHq1K
         UNxw==
X-Gm-Message-State: AO0yUKXt0ss7CxYHUw+hfuw6SmyzjdrylahIiukrCNOfpd8BdIT7B2fC
	EQc+YOOhQ58jKq0I0PiuGPitsw==
X-Google-Smtp-Source: AK7set+jvMl0EhuBZoHUFo60bJY0uF8ULFjfyqCjDSi5m2PvUIoskKxq3Mw/V3oU38SLKMDcpmJjBA==
X-Received: by 2002:a05:600c:4509:b0:3eb:29fe:7343 with SMTP id t9-20020a05600c450900b003eb29fe7343mr16964033wmo.33.1678298426297;
        Wed, 08 Mar 2023 10:00:26 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:4213:ad42:5630:43c4? ([2a05:6e02:1041:c10:4213:ad42:5630:43c4])
        by smtp.googlemail.com with ESMTPSA id t1-20020a5d49c1000000b002c563b124basm15585115wrs.103.2023.03.08.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 10:00:25 -0800 (PST)
Message-ID: <aefb1a57-6ec4-fefc-b5eb-42c899228255@linaro.org>
Date: Wed, 8 Mar 2023 19:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 0/5] thermal: mediatek: Add support for MT8365 SoC
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
 <afa4aacd-bacf-a545-3973-474286fd4b9c@linaro.org>
 <a328c1c5-7cec-4499-8e5f-92d8cc233d38@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a328c1c5-7cec-4499-8e5f-92d8cc233d38@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_100029_373322_8640C8FE 
X-CRM114-Status: GOOD (  13.37  )
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

On 06/03/2023 11:13, Amjad Ouled-Ameur wrote:
> Hi Daniel,
> 
> On 1/27/23 22:59, Daniel Lezcano wrote:
>> On 27/01/2023 16:44, Amjad Ouled-Ameur wrote:
>>> This patchset adds thermal support for MT8365 SoC.
>>>
>>> MT8365 has 4 thermal sensors, one for CPUs and the rest for debug/dev
>>> purposes. The CPU thermal zone uses passive cooling device with
>>> CPU{0..3}.
>>>
>>> Changes in v9:
>>> - Use delay between bank init and the thermal zone device register.
>>> - Link to v8: 
>>> https://lore.kernel.org/r/20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com
>>>
>>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>>> ---
>>> Amjad Ouled-Ameur (2):
>>>        thermal: mediatek: add callback for raw to mcelsius conversion
>>>        thermal: mediatek: add delay after thermal banks initialization
>>>
>>> Fabien Parent (2):
>>>        dt-bindings: thermal: mediatek: add binding documentation for 
>>> MT8365 SoC
>>>        thermal: mediatek: add support for MT8365 SoC
>>>
>>> Markus Schneider-Pargmann (1):
>>>        thermal: mediatek: control buffer enablement tweaks
>>>
>>>   .../bindings/thermal/mediatek-thermal.txt          |   1 +
>>>   drivers/thermal/mtk_thermal.c                      | 117 
>>> +++++++++++++++++----
>>>   2 files changed, 96 insertions(+), 22 deletions(-)
>>> ---
>>
>> Applied, with some changes and the subject fixed:
>>
> Any news about this patchset ?

Yep, sorry for that. It will be in bleeding-edge soon.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


