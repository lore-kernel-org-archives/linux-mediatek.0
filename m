Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790F9C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 10:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbmkOqwi39JGXC5REwT0Km32Lla29z5DRY/mJ5CJpKM=; b=Q3p7cM9T6mhrLVoVs4B0QgrQuP
	uc4QyxLxB1ao5zCZYUkPk2/jrXBqQ4T4qpTw9Ba4fXT6CT3G5keU2lV6wQWuekqqEPxkD6zyBxFnY
	ZGqA/UG3fXIg/xZtitJKSZtmPOJIdfnwwGfc3U+zdfA7KVF2pzk+NsuV0CYg4o0Z2wmFHibWpikSS
	NX9TcoS1g12okdLD65114vhVmJXthvK5PYSicROWFSzYlv6Yj2Bctiy4eF1Jx5D3FbMJz1Qv905Nw
	Br3wNRmn2796+KVtAx10qMgwUG9T1n0VNndu+2HtVVlN+Hr4ducR6VAdSnndaTQBB71Iyqr/p3Pck
	e2CrsTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCear-000jII-PY; Tue, 03 Jan 2023 10:32:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCeGm-000eCa-PL; Tue, 03 Jan 2023 10:11:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A6A16602CE1;
	Tue,  3 Jan 2023 10:11:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672740702;
	bh=iDxcTBwfqu1inbI6ClQj+J/Gk+ZBgBuM6mX2e/vswOo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M44qVGQFfORgub+nkagT98LCBMLVcctjM4qK7ke/N4CsekYf+FgG+ZKGiUrq8StK/
	 8gXYgCiE8pDnJX4+MibzzWBugkzZsYXZTJz3csLYBW8WRm9hXf0I3DhdzaUmlZyJ7y
	 k0QG2jh+mz8ChL6NLSLa8cnbkf9jlrxdriulXsKICbzRFgRQoF7TcSnnxqaOJ/3MBw
	 jR6SToUTohDpDbYsUDrW1HcxVlU09SW3SbUovD6ZM3r3smTulmHKhjx+bqDzrz3/gX
	 4ujbn0MMJe4gY8y8Q9kPxJWSHyB/mE4Y39jdfdbSFlQbtD4gx//J4fyUqLIbyg6E6Y
	 vpaASmtsiWdVw==
Message-ID: <761791af-971d-8e64-857c-4b3cbf9487da@collabora.com>
Date: Tue, 3 Jan 2023 11:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 "oul@kernel.org" <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 "obh+dt@kernel.org" <robh+dt@kernel.org>, "kishon@ti.com" <kishon@ti.com>,
 Chunfeng Yun <Chunfeng.Yun@mediatek.com>,
 "hunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "atthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 ".zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "irlied@gmail.com" <airlied@gmail.com>,
 "zysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Mac Shen <Mac.Shen@mediatek.com>,
 "vicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "zysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 Stuart Lee <Stuart.Lee@mediatek.com>,
 "i-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "inux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-2-a803f2660127@baylibre.com>
 <7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com>
 <CABnWg9tf8Sx8S0d8mGowZ80YmZLz6cX2iyxZyKYCGbH_RKMKyA@mail.gmail.com>
 <187044b3-b154-256a-c107-3dc9de57d60b@collabora.com>
 <CABnWg9tRveoZb8e7zGkGqb0MMoJiTxfS1NeJDtfFqMYsf-zJcg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CABnWg9tRveoZb8e7zGkGqb0MMoJiTxfS1NeJDtfFqMYsf-zJcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_021145_322279_8242FE58 
X-CRM114-Status: GOOD (  19.79  )
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

Il 02/01/23 16:19, Guillaume Ranquet ha scritto:
> On Mon, 02 Jan 2023 15:14, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 02/01/23 14:38, Guillaume Ranquet ha scritto:
>>> On Mon, 26 Dec 2022 06:18, CK Hu (胡俊光) <ck.hu@mediatek.com> wrote:
>>>> Hi, Guillaume:
>>>>
>>>> On Fri, 2022-11-04 at 15:09 +0100, Guillaume Ranquet wrote:
>>>>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>>>>
>>>>> On mt8195 the ddc i2c controller is part of the hdmi IP block and
>>>>> thus has no
>>>>> specific register range, power domain or interrupt, making it simpler
>>>>> than its the legacy "mediatek,hdmi-ddc" binding.
>>>>>
>>>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>>> ---
>>>>>
>>>>
>>>> [snip]
>>>>
>>>>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>>>> hdmi-ddc.yaml
>>>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>>>> hdmi-ddc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..2dc273689584
>>>>> --- /dev/null
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>>>> hdmi-ddc.yaml
>>>>> @@ -0,0 +1,51 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id:
>>>>> https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUkVXPWT8cIu96xdkn4tMams1E55qyxEZmgV1i0WfpOlq57w$
>>>>>
>>>>> +$schema:
>>>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUkVXPWT8cIu96xdkn4tMams1E55qyxEZmgV1i0WdSGOSxzw$
>>>>>
>>>>> +
>>>>> +title: Mediatek HDMI DDC for mt8195
>>>>> +
>>>>> +maintainers:
>>>>> +  - CK Hu <ck.hu@mediatek.com>
>>>>> +  - Jitao shi <jitao.shi@mediatek.com>
>>>>> +
>>>>> +description: |
>>>>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC
>>>>> pins.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - mediatek,mt8195-hdmi-ddc
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: ddc
>>>>> +
>>>>> +  mediatek,hdmi:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description:
>>>>> +      A phandle to the mt8195 hdmi controller
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +    hdmiddc0: i2c {
>>>>> +      compatible = "mediatek,mt8195-hdmi-ddc";
>>>>> +      mediatek,hdmi = <&hdmi0>;
>>>>> +      clocks = <&clk26m>;
>>>>> +      clock-names = "ddc";
>>>>> +    };
>>>>
>>>> I think we should not have a virtual device. This ddc is part of
>>>> mt8195-hdmi device, so just keep mt8195-hdmi, and let mt8195-hdmi
>>>> driver to probe the sub driver of ddc driver.
>>>>
>>>> Regards,
>>>> CK
>>>
>>> Hi CK,
>>>
>>> Thx for your input.
>>> Though I would strongly prefer to keep the ddc as a separate "virtual device".
>>>
>>> It aligns better with the goal of reusing as much code as possible
>>> from the HDMI V1 IP,
>>> which is something you have been advocating since V1 of this patch
>>> quite some time ago
>>> and has shaped this patch.
>>>
>>> To me we are in a state that is clean and avoids branching in the hdmi
>>> common code.
>>> Would you reconsider and allow the use of that virtual device?
>>>
>>> Thx,
>>> Guillaume.
>>>
>>
>> You can as well keep the DDC as a separated driver, but register in the HDMI v1 and
>> v2 driver at probe time.
>>
>> Doing that, you won't need any devicetree node specific to any virtual device :-)
>>
>> Cheers,
>> Angelo
>>
>>
> 
> Sure, but does it make any sense for HDMI v1?
> As the ddc in v1 is a real device which (in theory) can be reused by other IPs.
> 
> I would see either v1 and v2 ddc exposed as a devicetree node (which
> is what I favor).
> Or v1 as a devicetree node and v2 probed directly from the hdmi code base.
> 

The last option looks sensible, since v1 has an external ddc, but on v2 it's
integrated.

v1 -> dt probe
v2 -> driver probe

> Thx,
> Guillaume.



