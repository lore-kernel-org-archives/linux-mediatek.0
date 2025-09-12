Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611C3CA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHgYFxyt/x0LvCQXJlMzwJ/JmEjfE3Gdv04Yg+b0WO8=; b=cDUD4aovTQzJA4n0HyKD/vKQKZ
	NeLpRDi/XL4yEHDelqrT2LH09GIzNF4DrZsXD3iH0pa8f8KFbwCbwGfFwx54FW6o3Gk9FfQWFKAIe
	gO9+kO9C3iWOxLsJFGLf4ZapKb/yklMaMmbN7nhNvhhPFyLe7LOPTi7nUVo6n5URn/A253a+YCg+q
	Rn5vc18FGD+QAn9O+ekvM/KsYgrUs9cG6nbBCw67KLT+qpdkqJiKRpeXHS8sHMFxDRphOVrzUL+hh
	rPXjOBcXk82gM9BgocFcwAy/iyo1nPWr4IXIBr6b38m2uTmCxb52fnQ7rd3goSqeM+BOrFhxUbUde
	HNILgA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzTR-000000081VU-2faC;
	Fri, 12 Sep 2025 08:49:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzTO-000000081UK-3tpF;
	Fri, 12 Sep 2025 08:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757666976;
	bh=t2CbprpuSHyhZVsAXOvVA2HQNj6MCqFKJW6RdhauD7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b9k6Y/jYHYRf1lBd3IVQs8MHuAF8Lp6WToReTrp1ENuOHC572Yy8h6K04o261v7Ua
	 4yW19LAPpuImfWtnGkwQ0AI++cysclzDjM48otKS6QWxc3huIGYnfsD2EIhixgRlnB
	 DASIixfeR12WRXjgbBInSPg9IQsTxZ3yVzg7gkK97V+olG00bTvwQxVTAQNjgQjLX8
	 BuV3duQibBT6UOIh8+w26DohRm5Zwb+2dqew+bmZTDDDfA5DyuNbhJDKNQWRtzO5s7
	 rixyPQa88tYz+a/WjvMPdPxtN1tP4M3Azs1f15mTHQRrIsynehoHJn87WgBxnP8tJx
	 h179TIG0hlXKg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E66317E05BE;
	Fri, 12 Sep 2025 10:49:35 +0200 (CEST)
Message-ID: <181e1668-6efc-4dce-91e4-7b535e17dd46@collabora.com>
Date: Fri, 12 Sep 2025 10:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
To: Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-2-ariel.dalessandro@collabora.com>
 <20250912-alluring-turaco-of-conversion-dca193@kuoka>
 <CAGXv+5GovP7NuG042AwfmtC-sPJMGuFAm6iZ0iqNZgU0VE+qmQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5GovP7NuG042AwfmtC-sPJMGuFAm6iZ0iqNZgU0VE+qmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_014939_114345_EAC8C38F 
X-CRM114-Status: GOOD (  20.62  )
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

Il 12/09/25 10:27, Chen-Yu Tsai ha scritto:
> On Fri, Sep 12, 2025 at 2:06 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Thu, Sep 11, 2025 at 12:09:50PM -0300, Ariel D'Alessandro wrote:
>>> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
>>> Path to a DT schema.
>>>
>>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>> ---
>>>   .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>>>   .../bindings/media/mediatek-mdp.txt           |  95 ----------
>>>   2 files changed, 169 insertions(+), 95 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>> new file mode 100644
>>> index 0000000000000..8ca33a733c478
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>> @@ -0,0 +1,169 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek MT8173 Media Data Path
>>> +
>>> +maintainers:
>>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>> +
>>> +description:
>>> +  Media Data Path is used for scaling and color space conversion.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - enum:
>>> +          - mediatek,mt8173-mdp-rdma
>>> +          - mediatek,mt8173-mdp-rsz
>>> +          - mediatek,mt8173-mdp-wdma
>>> +          - mediatek,mt8173-mdp-wrot
>>
>> Why there is no mediatek,mt8173-mdp here? What does this compatible
>> represent?
>>
>>> +      - items:
>>> +          - const: mediatek,mt8173-mdp-rdma
>>
>> Still suspicious. Device cannot be simulatanously: compatible and not
>> compatible. This is not a well known cat that has superposition of two
>> states, whenenver you look the other way.
>>
>> Maybe the old binding was incorrect, maybe the in-tree DTS is incorrect.
>> Whichever the reason, this must be investigated and documented, because
>> by standard rules this is wrong. Each wrong code needs very clear
>> explanations (and "someone did it" is not a good enough explanation).
> 
> My guess is that "mediatek,mt8173-mdp" is meant to serve as a single
> entry point for the implementation to bind the driver to. The MDP is
> a Data Pipeline and there could be multiple instances of the same
> IP block, as seen in the original example.
> 

Yeah your guess is right.

Cheers,
Angelo

> The datasheet I have doesn't cover the "RDMA" block specifically, so
> I can't say whether there is an actual difference between the two RDMA
> blocks.
> 
> 
> ChenYu
> 
>>> +          - const: mediatek,mt8173-mdp
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  mediatek,vpu:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      phandle to Mediatek Video Processor Unit for HW Codec encode/decode and
>>> +      image processing.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - power-domains
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: mediatek,mt8173-mdp-rdma
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: Main clock
>>> +            - description: Mutex clock
>>> +    else:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: Main clock
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - mediatek,mt8173-mdp-rdma
>>> +              - mediatek,mt8173-mdp-wdma
>>> +              - mediatek,mt8173-mdp-wrot
>>> +    then:
>>> +      required:
>>> +        - iommus
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: mediatek,mt8173-mdp
>>> +    then:
>>> +      required:
>>> +        - mediatek,vpu
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/mt8173-clk.h>
>>> +    #include <dt-bindings/memory/mt8173-larb-port.h>
>>> +    #include <dt-bindings/power/mt8173-power.h>
>>> +
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        mdp_rdma0: rdma@14001000 {
>>> +            compatible = "mediatek,mt8173-mdp-rdma",
>>> +                         "mediatek,mt8173-mdp";
>>> +            reg = <0 0x14001000 0 0x1000>;
>>> +            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
>>> +                     <&mmsys CLK_MM_MUTEX_32K>;
>>> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>>> +            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
>>> +            mediatek,vpu = <&vpu>;
>>> +        };
>>> +
>>> +        mdp_rdma1: rdma@14002000 {
>>> +            compatible = "mediatek,mt8173-mdp-rdma";
>>> +            reg = <0 0x14002000 0 0x1000>;
>>> +            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
>>> +                     <&mmsys CLK_MM_MUTEX_32K>;
>>> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>>> +            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
>>> +        };
>>
>> My previous comment applies.
>>
>> Keep one or two examples.
>>
>> Best regards,
>> Krzysztof
>>


