Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DE0ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5SS+xihnxireB9OTo7DZT/v7UVpEZhe3eqfFpR3PEU=; b=H1wjOkAgk6SqIniVugryeyTXGg
	o3kz/S/+yCTZjqFyvQypRCAm3b3NaL0msL865tdESkAGPolXuI4Vo1TGA9CJv0v/ArEZCAWxVT/io
	NXDS9GPZfU9RCUSqkLna1zTtxVx0HD0e28Jhpv8JfCUiITLaxcws6PpYXRSv84hv+ntVGTmRQX7XX
	JLkf97ph55umg6rGKP6/PyDDUmdV0fIH3JS6N6MalRZahTPxhMTlrxfW2K96TYVz20CazSUajrbbz
	uKdUY1E5XpiBL/FeV+DnRADK/26DG1BT+Ubs1lDWyirWBUIPdlIrft5sJH0H8m+2ciFnoN+1t2uPI
	OqB6gmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYip2-002L01-CO; Thu, 15 Sep 2022 06:58:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYinW-002JgJ-Dv; Thu, 15 Sep 2022 06:56:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7D34A6601AAA;
	Thu, 15 Sep 2022 07:56:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663224989;
	bh=o2s8o3bUZ35Fc8myVBKxsKVtl6T6Tf2rP2KJHIQ3WnE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EZ7fUllGYbaK06F+/t1t7bN5ZjDYkfIh0XgUonCJqCJS9Qy917AVNdgfF4Mzq5kQY
	 lyL9yd0fwqfnMyRuKppUKJJwZT8hN08NlmwacpnkIeyvilIzHBBZP60AAY2or1gk5s
	 PzlvltTNiyuI7w2cvedSJL0vrnmUZIQPuLNfeNjTaohSNWIqmA6blt+Y8C69q9smAw
	 pJFQZ5zyU4n/dLohmPsDz3Y4J6/u37SDuVsoljJvaKkTkG4M75jUaziwgwozDbMIyn
	 yvigBObuCQ/zvUg3aKLJDagtACgllvRjWALNUQ9tYAQgsEx8Yd1CLYNOdGrbTemg3W
	 cDwsXoieJorjQ==
Message-ID: <551a0a6d-107e-d521-57cd-90c428576d69@collabora.com>
Date: Thu, 15 Sep 2022 08:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220914124552.16964-1-johnson.wang@mediatek.com>
 <20220914124552.16964-3-johnson.wang@mediatek.com>
 <06eb15ea-56b3-4f18-be18-3fc710cef779@collabora.com>
 <47ad92dfc593681508fcf09df1303cdfe86c4202.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <47ad92dfc593681508fcf09df1303cdfe86c4202.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_235630_836154_A3F77E38 
X-CRM114-Status: GOOD (  24.98  )
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

Il 15/09/22 06:00, Johnson Wang ha scritto:
> Hi Angelo,
> 
> Thanks for your review.
> 
> On Wed, 2022-09-14 at 15:46 +0200, AngeloGioacchino Del Regno wrote:
>> Il 14/09/22 14:45, Johnson Wang ha scritto:
>>> Add the new binding documentation for MediaTek frequency hopping
>>> and spread spectrum clocking control.
>>>
>>> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>>> ---
>>>    .../bindings/arm/mediatek/mediatek,fhctl.yaml | 47
>>> +++++++++++++++++++
>>>    1 file changed, 47 insertions(+)
>>>    create mode 100644
>>> Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yam
>>> l
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yam
>>> l
>>> new file mode 100644
>>> index 000000000000..7b0fd0889bb6
>>> --- /dev/null
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yam
>>> l
>>> @@ -0,0 +1,47 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id:
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml*__;Iw!!CTRNKA9wMg0ARbw!3sumdhtrK5Ah5_rfIilgm4UUmnwkkqMpc3r_ZfkLfsXsLn-_AKm9ZokhJGD1Fl-gJpckAKHZh-jNVW64KRU8Duv1kg$
>>>   
>>> +$schema:
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3sumdhtrK5Ah5_rfIilgm4UUmnwkkqMpc3r_ZfkLfsXsLn-_AKm9ZokhJGD1Fl-gJpckAKHZh-jNVW64KRWMb8jIsw$
>>>   
>>> +
>>> +title: MediaTek frequency hopping and spread spectrum clocking
>>> control
>>> +
>>> +maintainers:
>>> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
>>> +
>>> +description: |
>>> +  Frequency hopping control (FHCTL) is a piece of hardware that
>>> control
>>> +  some PLLs to adopt "hopping" mechanism to adjust their
>>> frequency.
>>> +  Spread spectrum clocking (SSC) is another function provided by
>>> this hardware.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt8186-fhctl
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>
>> There are still a few issues in this binding that I can immediately
>> see...
>>
>>> +
>>> +  clocks:
>>
>> MT8195 has 23 PLLs, MT8186 has 14, but perhaps in the future we may
>> see
>> something more than that on some newer SoC, so...
>>
>>     clocks:
>>       maxItems: 30
> 
> May I add "minItems: 1" to clocks property?
> 

Of course you can! Sorry for the incomplete advice here :-)

> Without this, dt_binding_check will fail because we don't have enough
> clocks in the example. (Both MT8195 and MT8186 don't have 30 PLLs)
> 
>>
>>> +    description: Phandles of the PLL with FHCTL hardware
>>> capability.
>>> +
>>> +  mediatek,hopping-ssc-percents:
>>> +    description: The percentage of spread spectrum clocking for
>>> one PLL.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>
>> This is an array, so...
>> $ref: /schemas/types.yaml#/definitions/uint32-array
>>
>> ...also, maxItems?
> 
> As you know, mediatek,hopping-ssc-percents property is used to specify
> ssc rate for matching clocks.
> 
> If we have to add maxItems, I think we should specify the same value
> as clocks property. Is my understanding wrong?
> 

Your understanding is right. The number of min/max items on the ssc
percents will be the same as clocks.

Regards,
Angelo

> 
> Thanks!
> 
> BRs,
> Johnson Wang
>>
>> and you should also specify:
>>
>> default: 0   <- because, by default, SSC is disabled
>> minimum: 0   <- because this is the minimum accepted value
>>
>>
>> Regards,
>> Angelo
>>
>>> +    maximum: 8
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/mt8186-clk.h>
>>> +    fhctl: fhctl@1000ce00 {
>>> +        compatible = "mediatek,mt8186-fhctl";
>>> +        reg = <0x1000c000 0xe00>;
>>> +        clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
>>> +        mediatek,hopping-ssc-percents = <3>;
>>> +    };
>>
>>
> 

-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


