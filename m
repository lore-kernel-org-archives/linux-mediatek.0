Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21670C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhSMFL+2HT+dSDSTP+uNKkyc+xeJJ+LqfYyUnCBoJHE=; b=iTWbTRVNENl5XD
	wtRMV44sHqX5UQlqFrov4nLu+wB3NN4YtLEUXt+eQRnVJMKseiNGOMF2TEmV3Z4tr2M30C01Gi3Xb
	sHTKRdzZRZhWThVq8SFiugcQ19d0RnYMw/W+qaHtbU04UlTJWwHDvAiHY2Gw0m0ULw7R2McADbb7h
	zk8hMpnQ4/CESchNnmyX8clq9/ofWUs0IbMWlo6tXuCH3wKTLCJVZGCUNAIrsFjVWG+z8HA6d9lo5
	dW2c/IJ762A9RRaUUA+rw4o3Cya1kswVZJOWrY2z/mkWOPb8QBq9ZaTEl8zI0sRtvETCH86DwomNj
	YdK4MhMyTAT+MiNGg7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIkbC-00GK3h-0L;
	Thu, 28 Dec 2023 07:14:34 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIkb8-00GK2g-2y
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Dec 2023 07:14:32 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2cca664b0dfso51909661fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Dec 2023 23:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703747667; x=1704352467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhSMFL+2HT+dSDSTP+uNKkyc+xeJJ+LqfYyUnCBoJHE=;
        b=gYxKFx/eRWxorwwyEhmLCcJZ/XLSPP7k9JwoPvkUCryh3A0a8Bi9BNMI+yjNHD3hF5
         wEYMmzJDcq01bvQ3GsQEC5FV4JZzOp7jKIi2spRxHNIHlsH+mCa8d5/pIdcy6MKJx7WT
         YDZj9cHgI5PJDHxf3l4eWtli1a7AwDpgS/vvZrDzi9FCfevEH0TDcjNLpod3NwEfLbcp
         0kwzukXS7yw+INhz0sAihnf61QA4ml10unoouT36It71cjZhhVKqSKVSe6t1iKWaqaG6
         xk9Jf0ZyYcM4onyx8Y138RGKn9oCmiAvK/9UtyYdXL42/vu3dugjlAYyZVgpSuq1pshD
         L+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703747667; x=1704352467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhSMFL+2HT+dSDSTP+uNKkyc+xeJJ+LqfYyUnCBoJHE=;
        b=a0Z+Vk/3ES33VlqF9MhsNXY6/dtUJVCl+v4yzAbeQ0xBaK8mFwITCwHtFO9jy9koCg
         D5gRHUjfil4URq108kz+O5DsZcaN80tAGjnFlCHcP33CYrKqq8HG5DqRXT4Jns/aRTZq
         GNnV+cxDV9TVM87HIJyLoLC5aauIifAct7YkTYFWwFliqNaEHyL8yYl1YZ2gOann6Vx0
         o2ES1XTJpyKYR5cUrVLxPuDTzlOc5FWFXXGDAOkM7DTaqpToWJcsVFr0gOT+hmoTkpJD
         WeROZ2+qq+YNWB80vYA7oCnHOn8W82I/hJrli4R8fA1DWsusV8fzffUBUDIlunzYDbVY
         WeuA==
X-Gm-Message-State: AOJu0Yzd4OPq47ZL9M2ejVtJAXrkxKmnqptWGujm3FMm6m2EPnCjYytg
	pu7qdsbo8xOqQ5H9NduTYKl/8XlFJpfxrw==
X-Google-Smtp-Source: AGHT+IG7ixYdscKkwtk36vyHIOjhIefzQL9OEYWpUFExTkKf4tL0MnVTIxxVDaTcZ69Wnxjwa8FN3g==
X-Received: by 2002:a2e:6a09:0:b0:2cc:5d04:13cf with SMTP id f9-20020a2e6a09000000b002cc5d0413cfmr3739906ljc.43.1703747666913;
        Wed, 27 Dec 2023 23:14:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d5503000000b00336b8461a5esm10405114wrv.88.2023.12.27.23.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 23:14:26 -0800 (PST)
Message-ID: <ddbdec9b-f075-4c7e-9411-28baf1e68401@linaro.org>
Date: Thu, 28 Dec 2023 08:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan
 node
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20231116130816.4932-1-zajec5@gmail.com>
 <a5113b85-e29c-454f-b776-ac7abbca771f@gmail.com>
 <d0734a8f-0b72-4609-a941-da4bdc3e323e@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d0734a8f-0b72-4609-a941-da4bdc3e323e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_231430_959614_09936F0B 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28/12/2023 08:03, Rafał Miłecki wrote:
> Hi,
> 
> On 14.12.2023 07:43, Rafał Miłecki wrote:
>> On 16.11.2023 14:08, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> This fixes typo and resolves following validation error:
>>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pwm-fan: pwms: [[54, 0, 10000], [0]] is too long
>>>          from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
>>>
>>> Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
>>> Cc: Daniel Golle <daniel@makrotopia.org>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>
>> I sent those few trivial fixes weeks ago:
>> [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan node
>> [PATCH 1/2] arm64: dts: mediatek: mt7986: fix SPI bus width properties
>> [PATCH 2/2] arm64: dts: mediatek: mt7986: fix SPI nodename
>> [PATCH] arm64: dts: mediatek: mt7986: drop crypto's unneeded/invalid clock name
>>
>> Could someone pick them up, please?

This should happen some time ago but...

> 
> Anyone, please?

... exactly now, this cannot happen. We are way past applying patches
for the next cycle. Please ping or resend after the merge window.

> 
> I did quick research and it seems Linus pulls mediatek DTS changes from:
> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (from Arnd)
> 
> 
> Arnd seems to pull mediatek changes from either:
> 
> 1. https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux
> (Most pulls so far from Matthias)
> 
> 2. git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux
> (The most recent pull from AngeloGioacchino)
> 
> 
> AngeloGioacchino, Matthias: can you pick up my patches, please?

Best regards,
Krzysztof


