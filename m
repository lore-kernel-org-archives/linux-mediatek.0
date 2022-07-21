Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5606C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 06:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cnm73MX252Caj40ytmqHkjELENAHvDfcWrwZYR1/NVM=; b=g+e7T0sV3oh6aWi0pM7MbKsPpj
	6I7fsx70VK2cGAm77oyrEgiSOI5PyDUMaw7ADVala+pLqmAls/04IVHzsbPrv9Qsr30cbN33Sc1tE
	bZraQOzflJLPl8MXC2SKTh/3kStaHhV5nMXWmqkQDa0gaZLydlHjXx6Q9MxGIyEKtt74r2/uswmEw
	rP77uq8dpY6zB7epl3ZLvO5tuuTPl6UYJ+qcg6nvVoFGjTI9IQfPWXaXOhtYiU/ilA+qGaI8tsJIe
	QGIHJBPoNFKyeGlNmp7IoGV/kUQylQ04Ew+cv6rxa+3bDndNPk6kBZmo0fXHWjNNpSNvojn7kRi1J
	B21kLsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEPlL-0014gw-ML; Thu, 21 Jul 2022 06:34:19 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEPlH-0014Yw-7l
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 06:34:16 +0000
Received: by mail-lj1-x232.google.com with SMTP id m9so667026ljp.9
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 23:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Cnm73MX252Caj40ytmqHkjELENAHvDfcWrwZYR1/NVM=;
        b=TBOCPKAISq594QJmpljtXK5JvWglm2X0HAFUA+CLSC4fkmSuZGHuCVimq5IRhaiwTx
         7n4WQRUTkg7StEr07HUdlrnNngap3N9Dpptg779Uy6RPdLngI1bENO1KU+4HhdU6CI4a
         ZZ5n1Iaqhcb7Iuon41ih6fknwVYDtgjnxQZSdyBehcrzqcAXz+3mNlarYN4687J7AIV7
         HMVhwuc6sqyLPIbvRY14983JqnZGW6RK5johigv/Za282R0x8PDSZ2KDQ7rzOR8ERgOB
         WzQTZCGsID/tFmeI8kAwLUJOjqNCw5uRIP+GV8KPUwAChH4hhEmaAlj7NxkxHJ1PSWMk
         kHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Cnm73MX252Caj40ytmqHkjELENAHvDfcWrwZYR1/NVM=;
        b=1X1m4U7dlZGvg1ktMv9liDd1vBmuApc+iblac6y/4FOSgdYirWiPUDf5HmSSe5rJwW
         2Gvv94Fr9UU2DOM98xLbns1/d+Ok+x8HwUZifxX1AloobldOCfsGjOYn3e/cEopIYn1h
         Wo9VZWSLllDRLVDkVXndVF3jmVndhJrIXo2H1kLtVnEOnWlvE9bnytbPMciipg0LCQMM
         xKqkglxq18v/nuSQzi9PBOm1NxztHcl6K2OeCqkZA5M7jqH+QycXGmhnya9fU+MvcJ8i
         oORWXuZ+XUUS43lpsPjHwDh9n4hxo4RO6nmg6Zxr9cKOgYem0iB2kr4RWR9NspNperFc
         2Hew==
X-Gm-Message-State: AJIora+nFcgC7AuXcvS/6UNbrUi4NFd4rryS50VvhfBT1ZAneRvtSvSa
	JDh6Mf1iFBEopyyFY0xJp+hLtw==
X-Google-Smtp-Source: AGRyM1s1d4f5h2aNvGMt18zpn/ZfYfDPXUBZrMkOm4gFgu21R/BTsAfUGEaL5WsUnMIMqTbhpQg8HA==
X-Received: by 2002:a05:651c:1a1f:b0:25d:4517:faf with SMTP id by31-20020a05651c1a1f00b0025d45170fafmr17849916ljb.415.1658385252232;
        Wed, 20 Jul 2022 23:34:12 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id m16-20020a056512015000b00483e5f0192esm240085lfo.87.2022.07.20.23.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 23:34:11 -0700 (PDT)
Message-ID: <bba2bbbd-834e-d70a-91a4-6f2e989a6647@linaro.org>
Date: Thu, 21 Jul 2022 08:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 06/21] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-7-tinghan.shen@mediatek.com>
 <57b0cf62-0312-05cf-31ff-d38f83a35578@linaro.org>
 <00bc3a146f39feb1a83213fc8503ad1b52cda9f9.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <00bc3a146f39feb1a83213fc8503ad1b52cda9f9.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_233415_339721_488A4758 
X-CRM114-Status: GOOD (  19.94  )
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

On 21/07/2022 05:05, Tinghan Shen wrote:
> On Wed, 2022-07-20 at 19:35 +0200, Krzysztof Kozlowski wrote:
>> On 20/07/2022 14:30, Tinghan Shen wrote:
>>> The System Control Processor System (SCPSYS) has several power
>>> management related tasks in the system. Add the bindings for it.
>>>
>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>> ---
>>>  .../bindings/mfd/mediatek,mt8195-scpsys.yaml  | 68 +++++++++++++++++++
>>>  1 file changed, 68 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
>>> b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
>>> new file mode 100644
>>> index 000000000000..4117a6dbc19c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
>>> @@ -0,0 +1,68 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml*__;Iw!!CTRNKA9wMg0ARbw!y63E-9qbCW_vyn8RrsCCs7YvZ7NxKqFT7l8C0ZZirEW95Ec0ce3lwegsSq51wrjtz8GjVSpkK-omCBP5CKx1l0WESQ$
>>>  
>>> +$schema: 
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!y63E-9qbCW_vyn8RrsCCs7YvZ7NxKqFT7l8C0ZZirEW95Ec0ce3lwegsSq51wrjtz8GjVSpkK-omCBP5CKzzr9p82Q$
>>>  
>>> +
>>> +title: MediaTek System Control Processor System
>>> +
>>> +maintainers:
>>> +  - MandyJH Liu <mandyjh.liu@mediatek.com>
>>> +
>>> +description:
>>> +  MediaTek System Control Processor System (SCPSYS) has several
>>> +  power management tasks. The tasks include MTCMOS power
>>> +  domain control, thermal measurement, DVFS, etc.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - mediatek,mt8167-scpsys
>>> +          - mediatek,mt8173-scpsys
>>> +          - mediatek,mt8183-scpsys
>>> +          - mediatek,mt8192-scpsys
>>> +          - mediatek,mt8195-scpsys
>>> +      - const: syscon
>>> +      - const: simple-mfd
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +patternProperties:
>>> +  "^power-controller(@[0-9a-f]+)?$":
>>> +    $ref: /schemas/power/mediatek,power-controller.yaml#
>>
>> We talked that unit address might be useful but it was with an
>> assumption that you will actually use it. I think you don't use it, so
>> it is kind of meaningless now... unless you plan to use it?
> 
> I tried to add the offset in the node name, but the binding check reports this message.
>  	
>     power-controller@0: node has a unit name, but no reg or ranges property

Why would you add unit address without reg? What point would it solve?

> After considering the fact of mt8195 power controller HW resides in scpsys and the current power
> domain driver doesn't support parsing the register address seperated from scpsys, I decide to
> keep the power controller node as in v2 to pass the binding check and compatible with driver.

Then adding unit addresses in bindings has no point.


Best regards,
Krzysztof

