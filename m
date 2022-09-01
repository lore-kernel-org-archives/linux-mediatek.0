Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAA1ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROvkh0ThEOUnp9fSB2zvmoy2J4I2zY0/WqKPA+M8wvo=; b=qP+KlTUZ3z1L9wm0hlp9Aiuqel
	jT1FzCFXYx8xVe6kz6XlDW8dE3ebN2TTj7lF5AZ/a9TCT3hX0KDoHQVhUD4vhU/GRmi+9EbXhKHjT
	1zvq16+pszOf1vPY7bkawFR1vd/Mh+WuBOq5EtcI+d/kxP9K85dAH832iD+vp19CNHyKt7StMxBgH
	EY+Id7YTrLs3AAM20IabFyJ+dXAm+OmZdlJ1nzfkSdDPgs6tBj3W48dehc5g70hdUHcCF6kZl61o0
	TCR6BuDizU9B6qkjecY9IvGLROPCxSbCHYbPVWUIafkR1DxP2CdVjPpF4iU1zlKf0tbaRxHf+AOPi
	4Y9VJk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThL7-00B0WE-OP; Thu, 01 Sep 2022 10:22:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThKw-00B0TA-GQ; Thu, 01 Sep 2022 10:22:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 894856601DF7;
	Thu,  1 Sep 2022 11:22:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662027728;
	bh=vliuj8fpj7caeOIuls2yuQlrUTuHergsba1k5t5Te4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PlFNHJHi3Pc8I8/yuffbHpgB2Mp8/1YNeEcHtJ4RBVgo388GApwZVRJg93+qUCxaV
	 1sWua+xRUiftYNLLPhLf/IOM2yce0KI9QxbII+bM3SHCwnTukMFnfJqbpEqjjgx5D1
	 ioctp29KCItY3T2lBy5ljx8HJ60kHHThRxZJpGA9fDGWmfgi5lC+hZYXTOjKjVaXVe
	 iXojg9dJ3IijmOExWQ97jLKwgFG+svVMAOE50YUU8jrPYzFBSLUorJCALTubsL0fFc
	 UcvJpswf5PTL6AiKVQh9soSiglZ0XAqYM7TQRjk87+IZDzEWeV5n33Blb2wDI09rkZ
	 NftQoWbh2wJVA==
Message-ID: <955f7200-9d08-0d21-2d1a-5ccbd0f3a8af@collabora.com>
Date: Thu, 1 Sep 2022 12:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
 <20220831124850.7748-3-johnson.wang@mediatek.com>
 <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
 <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
 <38910de5-89ad-e7a1-261f-18b51c8e7877@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <38910de5-89ad-e7a1-261f-18b51c8e7877@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_032214_844330_79BA4632 
X-CRM114-Status: GOOD (  25.57  )
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

Il 01/09/22 11:42, Krzysztof Kozlowski ha scritto:
> On 01/09/2022 11:04, AngeloGioacchino Del Regno wrote:
>> Il 31/08/22 15:19, Krzysztof Kozlowski ha scritto:
>>> On 31/08/2022 15:48, Johnson Wang wrote:
>>>> Add the new binding documentation for MediaTek frequency hopping
>>>> and spread spectrum clocking control.
>>>>
>>>> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>>> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>>>> ---
>>>>    .../bindings/arm/mediatek/mediatek,fhctl.yaml | 49 +++++++++++++++++++
>>>>    1 file changed, 49 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
>>>> new file mode 100644
>>>> index 000000000000..c5d76410538b
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
>>>> @@ -0,0 +1,49 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: MediaTek frequency hopping and spread spectrum clocking control
>>>> +
>>>> +maintainers:
>>>> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
>>>> +
>>>> +description: |
>>>> +  Frequency hopping control (FHCTL) is a piece of hardware that control
>>>> +  some PLLs to adopt "hopping" mechanism to adjust their frequency.
>>>> +  Spread spectrum clocking (SSC) is another function provided by this hardware.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: mediatek,fhctl
>>>
>>> You need SoC/device specific compatibles. Preferably only SoC specific,
>>> without generic fallback, unless you can guarantee (while representing
>>> MediaTek), that generic fallback will cover all of their SoCs?
>>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  mediatek,hopping-ssc-percents:
>>>> +    description: |
>>>> +      Determine the enablement of frequency hopping feature and the percentage
>>>> +      of spread spectrum clocking for PLLs.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>>> +    items:
>>>> +      items:
>>>> +        - description: PLL id that is expected to enable frequency hopping.
>>>
>>> So the clocks are indices from some specific, yet unnamed
>>> clock-controller? This feels hacky. You should rather take here clock
>>> phandles (1) or integrate it into specific clock controller (2). The
>>> reason is that either your device does something on top of existing
>>> clocks (option 1, thus it takes clock as inputs) or it modifies existing
>>> clocks (option 2, thus it is integral part of clock-controller).
>>>
>>
>> FHCTL is a MCU that handles (some, or all, depending on what's supported on the
>> SoC and what's needed by the board) PLL frequency setting, doing it in steps and
>> avoiding overshooting and other issues.
>>
>> We had a pretty big conversation about this a while ago and the indices instead
>> of phandles is actually my fault, that happened because I initially proposed your
>> option 2 but then for a number of reasons we went with this kind of solution.
>>
>> I know it's going to be a long read, but the entire conversation is on the list [1]
>>
> 
> Sorry, but it's a hacky architecture where one device (which is a clock
> provider) and second device have no relationship in hardware description
> but both play with each other resources.

Yes, that's exactly how it is hardware-side. Except, just to be as clear as
possible, FHCTL plays with the clock provider, but *not* vice-versa.

> That's simply not a proper
> hardware description, so again:
> 
> 1. If this is separate device (as you indicated), then it needs
> expressing the dependencies and uses of other device resources.

Agreed. In this case, what about...

mediatek,hopping-ssc-percents = <&provider CLK_SOMEPLL 3>;

or would it be better to specify the clocks in a separated property?

clocks = <&provider CLK_SOMEPLL>, <&provider CLK_SOME_OTHER_PLL>;
mediatek,hopping-ssc-percents = <3>, <5>;

Thanks,
Angelo

> 
> 2. If this is not a separate device, but integral part of clock
> controller, then it would be fine but then probably should be child of
> that device.
> 
> Best regards,
> Krzysztof



