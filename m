Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E69FC678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0dZrCyZVePxq5BUU/YkTwP3QyVp97gUFcbVu16exZQ=; b=ps/PckxpK6MSqbSLI+j6kaayki
	AV6sXpJ3XrnADwnQRxSAhzlDytsN8BRznpVMf4fp24RvUpAubwJGknLiTj/PUv8Ivr8aOBVdq9mYu
	sE/GzFKrxv7H9M5JbPiRV/BfyB4uSnAiPJf6qXEsWxE/enJ/ZaR8HkdhmcyIL98Y+gnGigD9TBa4J
	UXJre1o8C25HV6kfd0oeuKPRvSb3e/bIsYvwNWwbsjcQ+EtjO8N8tQUq/eGUl7efRc6mXEaGWTuOF
	g6EwCIRFTKlI3SPNOrqKlnlhtYI9KZv78kCJnpXjgIE5ZABC26y7O8qSZY5wLzy4i0E0hpTfks5sT
	KHDJFIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7qJ-00CFmt-TJ; Mon, 06 Mar 2023 10:13:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7qD-00CFkQ-3R
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 10:13:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id j3so5267152wms.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 02:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V0dZrCyZVePxq5BUU/YkTwP3QyVp97gUFcbVu16exZQ=;
        b=VAMbs2MseNBShP/wYO7DA2LAXa9iQlURyyw2UcYxBUWgG1SUSHRAerNFWwn+z0f/o7
         4W7fCfgIBC4yFyHNbODj7SqT2jgH6Gpx08FaIUvXoLlL8tZt5GwwYstRBNJkevp2ZRxn
         9X3DpoRzIXo1hZCwoPE7aJpi7fKO1KAiUW9ljeRaDunHB5XhVI6p8h7p+BPco8Gt12+g
         P/TN8V73RFa/+VbdF6bG5g8ITB3YTiNfDc9fzz1b3u7Dpw9BpT0Vz+rQKUURCnrr/R80
         KBDgXbBqCtH0lzDe0ThStkYhzA/fgwiS2sAcPzHaNxTHxTiSB3gou5QeJRksi1FwF3VF
         +3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0dZrCyZVePxq5BUU/YkTwP3QyVp97gUFcbVu16exZQ=;
        b=EBxyglc5qF73Hn50xwukKIm5aWCVwO1aNaWEw1rHcpm6npmS+z4bxCdpyCG3nP4coo
         Ec7SM5adu3Ql5mm7xMI38Qk9Gdy3Fbql/P0b1RRMX/OZ9OcCMKO5BGs1y0SKNJqC4+yj
         LKVyyPxgg9tBS6BFAuhXU+YW+1MAPREcUbIU+VPcPIZkLfKOVbGdnS6XUbk/XNYOjuPv
         LhSju2JIC3T5VCaJB/Ev0bdAFrEaXqCRuhs7a1t2Iyrht2cECq+o6dJMao4mmIl7pNIN
         318bYojSQ1mHb0j5TIFy2Ngl5HZKFlN8Jddh5wd5uaxVI7z+k60Jh+bN4yoRh0ZVkRYa
         pJlw==
X-Gm-Message-State: AO0yUKVRhP/xAzwEKmfGFSjo/zhQ6/C2r1gsQnlcCpw98btm8b1dUNUj
	bwDQO3fqBTJdyrmRvlTi3S1WSg==
X-Google-Smtp-Source: AK7set8pw6NSScyjKceJ3BvlYig59ULCK8zSwQcbBmWA6SGBC1dwfoZQ6UoO/+GVzY+PU3FI4YVnqA==
X-Received: by 2002:a05:600c:4448:b0:3ea:82a9:3644 with SMTP id v8-20020a05600c444800b003ea82a93644mr8323670wmn.34.1678097590052;
        Mon, 06 Mar 2023 02:13:10 -0800 (PST)
Received: from [192.168.0.20] (ip-87.net-80-236-117.rev.numericable.fr. [80.236.117.87])
        by smtp.gmail.com with ESMTPSA id p13-20020a056000018d00b002c5691f13eesm9251879wrx.50.2023.03.06.02.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:13:09 -0800 (PST)
Message-ID: <a328c1c5-7cec-4499-8e5f-92d8cc233d38@baylibre.com>
Date: Mon, 6 Mar 2023 11:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 0/5] thermal: mediatek: Add support for MT8365 SoC
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
 <afa4aacd-bacf-a545-3973-474286fd4b9c@linaro.org>
Content-Language: en-US
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <afa4aacd-bacf-a545-3973-474286fd4b9c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_021313_760094_A036E65A 
X-CRM114-Status: GOOD (  14.91  )
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

On 1/27/23 22:59, Daniel Lezcano wrote:
> On 27/01/2023 16:44, Amjad Ouled-Ameur wrote:
>> This patchset adds thermal support for MT8365 SoC.
>>
>> MT8365 has 4 thermal sensors, one for CPUs and the rest for debug/dev
>> purposes. The CPU thermal zone uses passive cooling device with
>> CPU{0..3}.
>>
>> Changes in v9:
>> - Use delay between bank init and the thermal zone device register.
>> - Link to v8: https://lore.kernel.org/r/20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com
>>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> ---
>> Amjad Ouled-Ameur (2):
>>        thermal: mediatek: add callback for raw to mcelsius conversion
>>        thermal: mediatek: add delay after thermal banks initialization
>>
>> Fabien Parent (2):
>>        dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
>>        thermal: mediatek: add support for MT8365 SoC
>>
>> Markus Schneider-Pargmann (1):
>>        thermal: mediatek: control buffer enablement tweaks
>>
>>   .../bindings/thermal/mediatek-thermal.txt          |   1 +
>>   drivers/thermal/mtk_thermal.c                      | 117 +++++++++++++++++----
>>   2 files changed, 96 insertions(+), 22 deletions(-)
>> ---
>
> Applied, with some changes and the subject fixed:
>
Any news about this patchset ?

Kindly,

Amjad

> Subject format for thermal is: thermal/drivers/<thedriver>: [A-Z]*.
>
> Thanks
>
>   -- Daniel
>

