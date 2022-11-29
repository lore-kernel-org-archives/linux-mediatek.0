Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67D3C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 07:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loSpF9AgG01RMo3LBV/v8v6fFtboHwkwvrGYRwDPayw=; b=MASIaFilJa4gIzG1YJHg0jeIZ1
	YhPep7BFw1hrXN5GMjbF0HXbgBOWeD55PtL60omOR0lkLl5oE7es3s3C2INPCP4xVSO7+sKSIBwJC
	MrigM0qPO8Ccryvodv1i3DzAj7NnNrh7qTCPlL1Igoc+7pbs5MzPchs7gKkx8qPqBPJBcHfMKczIo
	JV/slZQpGDO7plwhIS6LEg8f2L9ckpggb9lD3P7AEIXWmovl4urm0qaWvyFdfcdzS+spSoSzla6Wo
	7BL5Ch6v+CEq1xrLEaXvNuHvAN0NqbrA3mCwqKRf39lzmhqSdXbquaIeJEen3w+07UOts+3MVBF81
	1ZC29gRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvKl-0073Bn-MI; Tue, 29 Nov 2022 07:47:15 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvKf-00738Q-S0
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 07:47:11 +0000
Received: by mail-lf1-x12a.google.com with SMTP id u27so10183803lfc.9
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 23:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loSpF9AgG01RMo3LBV/v8v6fFtboHwkwvrGYRwDPayw=;
        b=BCIwFn6W/n3Cf25bMWz/YeiC1vDxWars4v8YMEFnaxBFn1+klIarsq0thr5IvFXBd9
         y0iEYk/HW1kb38E9fGJQE23xoYKh1JSMPNptDyAci8eDnjw187PoZRcMaTSsGScprKF0
         3JnzlEVO7XLzbb726ClGkCFzGKUg130Zltw6RkyFgarJr3EFrx3Ku1npNJ8ga77eTfkO
         69uWTfnN2vC1onzoddkNRL9JzocY4lCxV2vQJqwWxkWEMQCWlm07jXhcvDk8tqH+MEI6
         NmW+Z+mOT5piPL3GJr0IjEujQDbz1T01BGCV4QvqAHhK5GOztAAeZlu9lhf35ypj5sSe
         RrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loSpF9AgG01RMo3LBV/v8v6fFtboHwkwvrGYRwDPayw=;
        b=5LwKHP66Yp2XfyGb9YN+oTbTSTSbdNXuUgDEZxAbz81SRIAOSND7AcU17zm/RarRKT
         vXnaokiB8dxFiIFVXfCimKkwL3ob3NcFU94s3K5YBhEoDl5CLrjeStpSyqS8PlrizNfn
         PRBundhf7OChhIeT4HbtBa3HGYaZ4GGLLsuyqD4eDXptZVY1ifuivTpT4rmm3IO4V5uW
         IMrcD9apDe3TkBFxeZw1pgYg0nqzWF3zgS1d9EcESgPY8q3lQJJ8AjS1HGpiKSpE1i+A
         ZmJFgRNv0TFPuqDAR36N2444eLVyz8RyegcXmjZiSF/z9OiNsBzxq/CoKux/v7w/F1l5
         IVbQ==
X-Gm-Message-State: ANoB5pkQUIlTyFFYr5x/gB8meH6y2LJJMmAv2Uxmw7jfmVmmpld9ZNY5
	2droOf6cRounwr/XVZlNwHO05A==
X-Google-Smtp-Source: AA0mqf6+wcgPAn5cslfEauv8J6Mh6lwM69/leKqgZb2AnXuqe0SSsSZ6WHFsED5uSwSOj/bep+llhw==
X-Received: by 2002:a05:6512:2212:b0:4b5:acf:8789 with SMTP id h18-20020a056512221200b004b50acf8789mr4757200lfu.549.1669708026761;
        Mon, 28 Nov 2022 23:47:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r13-20020ac252ad000000b004b49025f96dsm2096814lfm.187.2022.11.28.23.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 23:47:06 -0800 (PST)
Message-ID: <08ebc76a-0220-f984-b546-23dba8677be9@linaro.org>
Date: Tue, 29 Nov 2022 08:47:05 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f83184ae803dbe0afd37a31a8a83a369a9772880.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_234709_910793_62FE5920 
X-CRM114-Status: GOOD (  14.26  )
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

On 29/11/2022 03:50, Xiangsheng Hou (侯祥胜) wrote:

>>> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
>>> snfi.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
>>> snfi.yaml
>>> @@ -55,6 +55,22 @@ properties:
>>>      description: device-tree node of the accompanying ECC engine.
>>>      $ref: /schemas/types.yaml#/definitions/phandle
>>>  
>>> +  rx-sample-delay:
>>
>> No, use existing property, don't invent your own stuff - missing unit
>> suffix. See spi-peripheral-props.yaml.
> Will change to other private property. The read sample delay with
> MediaTek SPI NAND controller can be set with values from 0 to 47.
> However, it`s difficult to say the unit of each vaule, because the unit
> value will be difference with different chip process or different
> corner IC.

Why you cannot use same formula as other SPI drivers for sample-delay?
And divide/multiple by some factor specific to SoC, which is taken from
driver_data?

> 
>>> +    description: Rx delay to sample data with this value, the
>>> valid
>>> +                 values are from 0 to 47. The delay is smaller
>>> than
>>> +                 the rx-latch-latency.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>
>> Drop $ref.
> Will do.
> 
>>
>>> +    minItems: 0
>>> +    maxItems: 47
>>> +    default: 0
>>> +
>>> +  rx-latch-latency:
>>
>> Same problems. Did you check spi-peripheral-props.yaml or other SPI
>> controller schemas for such property?
>>
>>> +    description: Rx delay to sample data with this value, the
>>> value
>>> +                 unit is clock cycle.
>>
>> I think the unit should be rather time (e.g. us).
>>
> Yes, I checked the spi-peripheral-props.yaml and the delay values are
> described exactly unit with ns or us. However the unit of MediaTek read
> latch latency is clock cycle and it`s difference with different clock
> frequency.

This is fine in such case.

> 
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [0, 1, 2, 3]
>>> +    default: 0
>>> +

Best regards,
Krzysztof


