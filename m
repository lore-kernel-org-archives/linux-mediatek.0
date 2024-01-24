Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C934CC46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqg94+2132MKAOa/Slee4T9KmpMBoz0xnQ8gxLimzdc=; b=ZjQKGpAiWaVmZzQaazmHugHWkN
	cAFDjyqXExZ7H8FglzfPGTFpcDAMo75uD+O/bLImX9pMNTzH2FaXkWs8EFcrRmE638H59rrtgNNrc
	xih6JzugJ80A6OGjdIqRSrU5k/zXZEyXObSo+cNbEIcxnOYwdppArjpLNVCqtdgXGL72NxAt6ElGe
	DDdNLusG8JB4BQtI5HoeTHJ1Tl1kedFPpUzg+IpGu8pls49s45G0VtLoUOM3yICzAuzJlz7VrYdrD
	wBmt2gk/wRMa+EW+q67WbOjfJrw3pwmO8qpeF7ySS6esRQeW9R/HMcqmJH4fZY777xU5+oXSupfq7
	2opHwQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSfpz-0047PW-1S;
	Wed, 24 Jan 2024 16:10:51 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSfpv-0047NJ-08;
	Wed, 24 Jan 2024 16:10:48 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3606ebda57cso30341295ab.2;
        Wed, 24 Jan 2024 08:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706112645; x=1706717445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqg94+2132MKAOa/Slee4T9KmpMBoz0xnQ8gxLimzdc=;
        b=YFMh2slH0ah06BBy5tTVSkdARX7YOdK/jHfinaH/666BtYj/drRLgdOOSrPd41dJJO
         0pqVwyx4LLAdFfSTfAHrM4T90RgxJbgzUoKlhoC9tyvDxfbvcKtods1/obZFpZrBX8mm
         W108jfKsIeb9pN4oHHe0iKQVss3Oyltj/xLS3YKcICo9K9zBIJwbSllOgQLsiR1JWwRD
         Y7OI1spQt1ctBPwj0kxXMQssSWVdwHVZl0sjcNXvNADsZGp9XdrP/pX4IOoMbt9iZBQE
         Q7i4PkJIvk9RZMIoIVs7DhGMS0KjOFGct9FhGkqUkn1NSGezaNmODb3Y/hl89Gs/7te5
         yshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706112645; x=1706717445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqg94+2132MKAOa/Slee4T9KmpMBoz0xnQ8gxLimzdc=;
        b=DgypvrSrJTofM/qOH1V2SucQgB9AUV8RHmgvxLVDYYRkpWF9PfCKbGa+/vZFtP8KPi
         VNBIsjRgU/sM+lrcN4cI1FKn8pFB6asM4bLhIDTGSorgBR3Q7FLJZIumLL06n60CsQgo
         AkGkYmpqQnygqWExoBH2JnBSoVxgtt/sfEy/POMYwI2+0AinyWo+hMxaDiVGPbCpzOU4
         9eo+1wg2weluIuL/FJviJ69VQ8xnAUzYOBud5Q+kboM6eUgGAouOjUGbfNjcB9JkMKkM
         r8gWBZAn9d7/EP+FCjzLwzKoyvDMTT1Cu0UUONZSOC2ZpvZYCyBg4LQWbNNknL6unwNn
         3I5Q==
X-Gm-Message-State: AOJu0Yw4leUX0UwIxPBjE8AXy0kFLRat5gcE8WMEb6Scoy29CzzCEfna
	YSp9lBsiIW2vLlkvE9oPisaZY06IRc+NH3/MbWXpSZO1ld5EV71g
X-Google-Smtp-Source: AGHT+IEhmHp5it8E7bQ6MCCUo2BRPDbfck1Cu3X5c0Ap06NFhCbWeoQoR6Wr4BZ535FATA53117H3Q==
X-Received: by 2002:a05:6e02:58d:b0:360:ccb2:4323 with SMTP id c13-20020a056e02058d00b00360ccb24323mr1947056ils.34.1706112644668;
        Wed, 24 Jan 2024 08:10:44 -0800 (PST)
Received: from [192.168.0.32] (89.141.216.198.dyn.user.ono.com. [89.141.216.198])
        by smtp.gmail.com with ESMTPSA id f20-20020a056e020c7400b00361a3926a83sm4273965ilj.31.2024.01.24.08.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 08:10:43 -0800 (PST)
Message-ID: <85e794c9-bf3e-4738-90c9-ffdacd09ca97@gmail.com>
Date: Wed, 24 Jan 2024 17:10:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240122124949.29577-1-zajec5@gmail.com>
 <1c4e14f7-ca34-4433-96cb-0ba6d6c6906d@gmail.com>
 <311fa703-7dbc-41d2-bfde-85dd7cb20657@gmail.com>
 <227a0fec-d295-45ea-8d65-3cb0a7ce1af5@linaro.org>
 <6e2c7fed-0e61-41fe-8213-9c7ae483cfd7@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <6e2c7fed-0e61-41fe-8213-9c7ae483cfd7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_081047_100411_B238AAFD 
X-CRM114-Status: GOOD (  11.76  )
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



On 23/01/2024 11:40, AngeloGioacchino Del Regno wrote:
> Il 23/01/24 09:57, Krzysztof Kozlowski ha scritto:
>> On 22/01/2024 18:40, Rafał Miłecki wrote:
>>> On 22.01.2024 14:19, Matthias Brugger wrote:
>>>> On 22/01/2024 13:49, Rafał Miłecki wrote:
>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>
>>>>> This helps validating DTS files. Introduced changes:
>>>>> 1. Reworded title
>>>>> 2. Dropper redundant properties descriptions
>>>>> 3. Added required #include and adjusted "reg" in example
>>>>>
>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>> ---
>>>>>    .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
>>>>>    .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
>>>>>    2 files changed, 39 insertions(+), 14 deletions(-)
>>>>>    create mode 100644 
>>>>> Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>>>>    delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml 
>>>>> b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>>>
>>>> In this schema can easily fit "mediatek,mt7622-rtc", so how about renaming 
>>>> it and add reference for that RTC as well?
>>>
>>> I see your point but by looking at existing Linux drivers:
>>> drivers/rtc/rtc-mt2712.c
>>> drivers/rtc/rtc-mt7622.c
>>> it seems like quite different hardware blocks.
>>>
>>> Different registers, different programming, clk in MT7622.
>>>
>>> Should they really share a YAML binding just because they use similar
>>> properties?
>>
>> Hardware aspect matters more, including features not yet present in the
>> binding, like some power on/off control. Different clock inputs is also
>> an argument.
>>
> 
> I agree - those IPs are different, we should have two bindings for the two
> (very) different IP versions.
> 

Makes sense. Then for this patch:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

