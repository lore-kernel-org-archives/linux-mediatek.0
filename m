Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36B0C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcyWsekNpjW83jaBV4h3bWe3M3a62T4akctRwJN9qQw=; b=2iqn327u+ZITlzBKdJrZGDG/+9
	Bwo1U38hJSZWHPdf++YQA236rTIh+y48cu56o0va6cEouy7GAjbzrDpI167PkP+RIHI7iN8uP5cFG
	KslTuGsFal+qEYpjlmt2x5m9OvGZtldR8lt8SSe2z2zO53/JDS3BLuE8hKrOOYijXvpvdCwwa93zw
	z2fBIXoLiWK/QcwuuPbHjPUvp/5SnkMAe2IxlMLbgrsSeggbMDk1ok+BC9+yEDaCL1N2lYp+hhLth
	1iVGKT0rtFpkmpDX1zrlO3LR+7l/LHJBY3OIGcLhtINthnatynNuuEzIVe1d+UeOxGUe5Mh6Cr/zF
	6OAcZLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IYm-00EaG1-R2; Wed, 30 Nov 2022 08:35:17 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IYe-00Ea7a-0Y
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 08:35:09 +0000
Received: by mail-lj1-x22e.google.com with SMTP id a19so4312737ljk.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Nov 2022 00:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcyWsekNpjW83jaBV4h3bWe3M3a62T4akctRwJN9qQw=;
        b=xxygHrVudH/jRn0zVZTJRKc+hk75Z//tJLTCgljOhPvuK4wDPJOhwCxdNjLllI+bKZ
         ORhapHPhNmP3+zRihBWBONgRqaHLXF5NjioBc83wTFDobjePOPwzfRzdH+Ym99XQtxrJ
         iHLZMR49Gxtzee5/M0vkXrN7WpfCZqqnHSJ0aleb1a4dmmrhfvIkn7K1AQXFxgrDaN9p
         Mh6v9aRVqEcjSavFC1xluoh/eg+3ymaf5XEP1zOOYWpvhk/1cWqqqMzeihAedfidWP3X
         koyUyxpmrFjPI1p7hxX9Rb2sdCwc86M2adQctegd+VwosMptsH+4zyVHGj/dZxmwDzHA
         vsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcyWsekNpjW83jaBV4h3bWe3M3a62T4akctRwJN9qQw=;
        b=BMsantl5Hi6pIvXi++zxjb+jV5ExAaitXn+6KF5gx7yuKdLk1QQ3528+Sasc6WAwWZ
         J8CInrKrZK3z7g/J4Zeoin3RLTK6O6DKmXsexq6pzK2m0dNQPdGCA94DC0rWeg7sf7Y2
         BElDuZfj8QR2P/wMh8rt5Cj7XpgYMTm+wRLv8tuhOKqhxw+JeQJoXAwZHpPLOwSy1zqo
         v79TgKOFtY1lItmp35622U/Ah083L1vs8MRgA8J5HtfJJo8VN4ur6MycjHN7jxPLmqiJ
         T4dRedTe9awDvyIAi7mLZjXQL3gvB4Lsw3pF/ungXkGBKXuCQ4tiqGYQ/DOYCIV/Wm9I
         sosQ==
X-Gm-Message-State: ANoB5pnhAnpYgFtYsfT1+9gh9Eewv7bDE06dGn6NhOziHXv3dJk9g32R
	YlVGkph2iyxkaE7/IcV5GQIaHg==
X-Google-Smtp-Source: AA0mqf4U+gFSGMAw9tW/t9ns6UxsiuwlvarT6QZfwU3S1rmz5GnvBtFX9HqRwIDY6T3CdKG32JHOFw==
X-Received: by 2002:a2e:592:0:b0:279:c85d:43da with SMTP id 140-20020a2e0592000000b00279c85d43damr295192ljf.435.1669797305804;
        Wed, 30 Nov 2022 00:35:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u13-20020a05651206cd00b0049fbf5facf4sm167617lff.75.2022.11.30.00.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 00:35:05 -0800 (PST)
Message-ID: <bc356f96-600a-64df-c0fe-00c807fa605c@linaro.org>
Date: Wed, 30 Nov 2022 09:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 7/9] dt-bindings: spi: mtk-snfi: add two timing delay
 property
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-8-xiangsheng.hou@mediatek.com>
 <9985d44e-977e-d7ea-0932-4879a3ccd14d@linaro.org>
 <f83184ae803dbe0afd37a31a8a83a369a9772880.camel@mediatek.com>
 <08ebc76a-0220-f984-b546-23dba8677be9@linaro.org>
 <741d7ce16df25450b08c92e508190bc7c91fc8d9.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <741d7ce16df25450b08c92e508190bc7c91fc8d9.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_003508_095145_4CB410A2 
X-CRM114-Status: GOOD (  12.95  )
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

On 30/11/2022 09:18, Xiangsheng Hou (侯祥胜) wrote:
> Hi Krzysztof,
> 
> On Tue, 2022-11-29 at 08:47 +0100, Krzysztof Kozlowski wrote:
>> On 29/11/2022 03:50, Xiangsheng Hou (侯祥胜) wrote:
>>
>>>>> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
>>>>> snfi.yaml
>>>>> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
>>>>> snfi.yaml
>>>>> @@ -55,6 +55,22 @@ properties:
>>>>>      description: device-tree node of the accompanying ECC
>>>>> engine.
>>>>>      $ref: /schemas/types.yaml#/definitions/phandle
>>>>>  
>>>>> +  rx-sample-delay:
>>>>
>>>> No, use existing property, don't invent your own stuff - missing
>>>> unit
>>>> suffix. See spi-peripheral-props.yaml.
>>>
>>> Will change to other private property. The read sample delay with
>>> MediaTek SPI NAND controller can be set with values from 0 to 47.
>>> However, it`s difficult to say the unit of each vaule, because the
>>> unit
>>> value will be difference with different chip process or different
>>> corner IC.
>>
>> Why you cannot use same formula as other SPI drivers for sample-
>> delay?
>> And divide/multiple by some factor specific to SoC, which is taken
>> from
>> driver_data?
> 
> Even for specific SoC, the unit of sample delay may be various with
> different corner IC.

Which is easy to achieve with driver_data as I said.

> Besides, whether it`s acceptable by change the property rx-sample-delay 
> and rx-latch-latency to mediatek,rx-sample-delay and mediatek,rx-latch-
> latency?

Not for sample delay, because you should use existing properties. Your
driver implementation is not usually argument to duplicate properties in
the bindings.

Best regards,
Krzysztof


