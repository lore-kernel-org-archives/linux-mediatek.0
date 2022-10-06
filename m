Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B727C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 12:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+ItVpsQsYklgVUHiymvIh93EUItJezlQHGjky0UkYs=; b=lesV0fK4LJyDDNZBAEErge/RRr
	vwpgVk84fSQ+Ofo5qqAd1uC+Y37Bus+/QS6GWt9+ieftf5KmRN5iNCrftz77qNgyDn8O+FvvVZOmu
	pXWZOz9Kby5UP9X9scX6Vz+3Sq18dCtdWXsECXYzm6Uz9jvsKbpKlB0of/7WoxK6fqZz3hkKmHipf
	N0IxpHkHiAD6lZFzx7XIcyaGW7bb9A2Wydnarz7vEeKSH10VCjGVfdXI4LbPTG8jzRmoQnnflOLCF
	SiI32YchfXJ0iS91bNR3j7qf6vLvBMEOdWncFehWo3tRkR92gpLww+0OgNl/cxN/NNnnabc4mrfql
	VF3oYxRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQ5L-002KD6-Ig; Thu, 06 Oct 2022 12:34:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQ4i-002Jwp-8q; Thu, 06 Oct 2022 12:34:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DCC9D6602301;
	Thu,  6 Oct 2022 13:34:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665059642;
	bh=qkkpSsxIMeDT9BV02FWV/AHFBaKuCtwlZphzAFH4cCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VEqNn94fof5Ie5QMY9/ws1jnX2t+w8B3WepGN2ReqqHvTu1tuCGr3C1tuVN/L44Tt
	 IefnVUZahCnaLb/Yw6SuWHxXVm/PPPalZIjralwVQcDt954qmQWdSSo5v2obAR0klS
	 FTif35BrPjVadDfbrcYit4ANdFzOybiWe61HWCCLDoSYHZ5OZ4iReEF+5epu2xXC+8
	 rTNYuZFjk3XCBLhbExuBMufffoMehrPAuSnvWf6kiqRRsaHNhsE42CU+Bfufd65C8+
	 gQ7lWMMLPU+OM8zMF+JgEfK/lMRSzlAFb7q6VBNbfIDzD4LtzSWDK4JqHjErf6y3vV
	 O+YzNBdP0G6hg==
Message-ID: <8fd7c872-fadb-5dc2-6bc1-5b59a9a3b133@collabora.com>
Date: Thu, 6 Oct 2022 14:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?S3Vhbi1Ic2luIExlZSAo5p2O5Yag5pawKQ==?=
 <Kuan-Hsin.Lee@mediatek.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?WXUtQ2hhbmcgV2FuZyAo546L54Wc5qifKQ==?=
 <Yu-Chang.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 =?UTF-8?B?RWR3YXJkLUpXIFlhbmcgKOaliuWTsue2rSk=?=
 <Edward-JW.Yang@mediatek.com>
References: <20220929114624.16809-1-johnson.wang@mediatek.com>
 <20220929114624.16809-3-johnson.wang@mediatek.com>
 <ed723cb2-ba79-55d7-7869-abf153e4af0a@collabora.com>
 <20220930190703.GA657929-robh@kernel.org>
 <5b84c81d0d7f71bb83fcbef860433e4704ae5c72.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5b84c81d0d7f71bb83fcbef860433e4704ae5c72.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_053404_648951_1B9D9C6D 
X-CRM114-Status: GOOD (  19.02  )
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

Il 06/10/22 13:23, Johnson Wang (王聖鑫) ha scritto:
> On Fri, 2022-09-30 at 14:07 -0500, Rob Herring wrote:
>> On Thu, Sep 29, 2022 at 03:07:49PM +0200, AngeloGioacchino Del Regno
>> wrote:
>>> Il 29/09/22 13:46, Johnson Wang ha scritto:
>>>> Add the new binding documentation for MediaTek frequency hopping
>>>> and spread spectrum clocking control.
>>>>
>>>> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>>> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>>>> ---
>>>>    .../arm/mediatek/mediatek,mt8186-fhctl.yaml   | 53
>>>> +++++++++++++++++++
>>>>    1 file changed, 53 insertions(+)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
>>>> fhctl.yaml
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
>>>> fhctl.yaml
>>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
>>>> fhctl.yaml
>>>> new file mode 100644
>>>> index 000000000000..258dff7ce6bc
>>>> --- /dev/null
>>>> +++
>>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
>>>> fhctl.yaml
>>>> @@ -0,0 +1,53 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id:
>>>> https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-fhctl.yaml*__;Iw!!CTRNKA9wMg0ARbw!xVt73f8PaQKph8n0ffGHHmQIxdzooUtGr0xDNVqy_6V0vwcs5k-FLrmkB3PZupSu1ciC$
>>>>   
>>>> +$schema:
>>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!xVt73f8PaQKph8n0ffGHHmQIxdzooUtGr0xDNVqy_6V0vwcs5k-FLrmkB3PZulXwBACk$
>>>>   
>>>> +
>>>> +title: MediaTek frequency hopping and spread spectrum clocking
>>>> control
>>>> +
>>>> +maintainers:
>>>> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
>>>> +
>>>> +description: |
>>>> +  Frequency hopping control (FHCTL) is a piece of hardware that
>>>> control
>>>> +  some PLLs to adopt "hopping" mechanism to adjust their
>>>> frequency.
>>>> +  Spread spectrum clocking (SSC) is another function provided by
>>>> this hardware.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: mediatek,mt8186-fhctl
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    description: Phandles of the PLL with FHCTL hardware
>>>> capability.
>>>> +    minItems: 1
>>>> +    maxItems: 30
>>>> +
>>>> +  mediatek,hopping-ssc-percent:
>>>> +    description: The percentage of spread spectrum clocking for
>>>> one PLL.
>>>> +    minItems: 1
>>>> +    maxItems: 30
>>>> +    items:
>>>> +      default: 0
>>>> +      minimum: 0
>>>> +      maximum: 8
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/mt8186-clk.h>
>>>> +    fhctl: fhctl@1000ce00 {
>>>> +        compatible = "mediatek,mt8186-fhctl";
>>>> +        reg = <0x1000c000 0xe00>;
>>>> +        clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
>>>> +        mediatek,hopping-ssc-percent = <3>;
>>>> +    };
>>>
>>>
>>> .... a more realistic example:
>>
>> One or 2 cells is really outside the scope of the binding as either
>> is
>> valid. If the parent bus only has 32-bits of address space, there's
>> little reason to use 2 cells.
>>
> 
> Hi Rob,
> 
> Thanks for the explanation.
> 
> Then I will keep this example the same in the next version.

That was just to have it 1:1 with how it'll be written in the devicetree....
....in any case, Johnson, there's a discrepancy in the iospace:
1000ce00 vs 0c1000c000 - that has to be fixed anyway.

Cheers,
Angelo

> 
> BRs,
> Johnson Wang
>>>
>>>      #include <dt-bindings/clock/mt8186-clk.h>
>>>
>>>      soc {
>>>          #address-cells = <2>;
>>>          #size-cells = <2>;
>>>
>>>          fhctl: fhctl@1000ce00 {
>>>              compatible = "mediatek,mt8186-fhctl";
>>>              reg = <0 0x1000c000 0 0xe00>;
>>>              clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
>>>              mediatek,hopping-ssc-percent = <3>;
>>>          };
>>>      };
>>>
>>> After which...
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>>


