Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D280C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0vyJYRQjadQ0hhQKJG67ZMhwvfurAj1AzLMyKVvFDI=; b=JGEypNwQ9/YzpV
	jJxAOl2KxAVivpX209SAFMLELQ4nsRFD+i/tWcdJAKdCozL3qwBjYAgLMCF7Jy+x8gQDnkJWaLw8S
	JSmpYUp+rkMvCEim7vmVlTM1u6G8MbxHTVh53DPO40ndmIYR130i1/t5Mn7g9430b0Epn7nTtECsH
	8bvkxEzQ0rpSYfUW7Z+FjMUY+YyYFk8jMQ+itkBNQBLpwWOlIyXPfxmoAPLcF7SDQxLbLW4BNv87c
	50IqRyW1PCicg7P1/LsAZ0Zofve32o1YI2BDA5gxVcE1Rd/d/UpROuUYvmieDK3QQFlRj5xFEPD3d
	3rRdJ9/tzlAP6v3h4ELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKKON-007Boz-2n; Wed, 16 Feb 2022 13:30:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKKO4-007Bj4-DC; Wed, 16 Feb 2022 13:30:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 09C711F44F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645018225;
 bh=6TNpGK8zWpLJR4SWBSz6HDHFqS/9HoJTweDutJs2r+s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bZl6VkU23kDApqPl22M6OdeZgLwPmwnZVWnPYDYSAXq/kV+2erzIBtg5HL7q+IKjg
 qxKUosxylyJq+GQ6Db5nOCIY2FVkNc4TWtE4potHevzKGSgNhLatcZPuDecltJ7Idt
 ciTgiKKJ3+EYoVWBvo+5OSCxjbGoOwUboicbdkByV+52jS9nOo9D8BpHTsvwqANvJq
 TSTnx60JX+pj/eBInRC4GGcSJApV7S03hBhO6J1jLIxvBswHXU8mUMWWMyYdqTGf9Z
 14nmrQjpa32BO5MV6D4cwwAMaZl5EmJ0cNGhQZFPtGAUaqrG9vTEoqANLdLo1ODqEL
 EFB3E368NyWNQ==
Message-ID: <dc523c4f-e625-7651-2621-fe1aab574a5f@collabora.com>
Date: Wed, 16 Feb 2022 14:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] dt-bindings: dma: Convert mtk-uart-apdma to DT schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, vkoul@kernel.org
Cc: robh+dt@kernel.org, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 long.cheng@mediatek.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220216114054.269656-1-angelogioacchino.delregno@collabora.com>
 <79a47f67-bb66-bad4-b6bc-c6a8c0ef25dc@canonical.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <79a47f67-bb66-bad4-b6bc-c6a8c0ef25dc@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_053028_617626_7D3719DE 
X-CRM114-Status: GOOD (  19.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/02/22 14:26, Krzysztof Kozlowski ha scritto:
> On 16/02/2022 12:40, AngeloGioacchino Del Regno wrote:
>> Convert the MediaTek UART APDMA Controller binding to DT schema.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/dma/mediatek,uart-dma.yaml       | 112 ++++++++++++++++++
>>   .../bindings/dma/mtk-uart-apdma.txt           |  56 ---------
>>   2 files changed, 112 insertions(+), 56 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
>> new file mode 100644
>> index 000000000000..4583c8f535b2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
>> @@ -0,0 +1,112 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/dma/mediatek,uart-dma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek UART APDMA controller
>> +
>> +maintainers:
>> +  - Long Cheng <long.cheng@mediatek.com>
>> +
>> +description: |
>> +  The MediaTek UART APDMA controller provides DMA capabilities
>> +  for the UART peripheral bus.
>> +
>> +allOf:
>> +  - $ref: "dma-controller.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt2712-uart-dma
>> +              - mediatek,mt8516-uart-dma
>> +          - const: mediatek,mt6577-uart-dma
>> +      - enum:
>> +          - mediatek,mt6577-uart-dma
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 16
>> +
>> +  interrupts:
>> +    description: |
>> +      TX, RX interrupt lines for each UART APDMA channel
>> +    minItems: 1
> 
> It would be useful to have an "if:" block constraining the interrupts
> (and reg array?), if the dma-requests is missing. If you need an
> example, see length of "max8997,pmic-buck1-dvs-voltage" array in
> relation to presence of max8997,pmic-buck1-uses-gpio-dvs.
> https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml#L259
> 
> The best would be to restrict number of interrupts to number of
> requests, but I think dtschema cannot express this.
> 

Thank you for the very much appreciated example!

I don't think that dtschema can express that without an if block... so, I'll
use that.

>> +    maxItems: 32
>> +
>> +  clocks:
>> +    description: Must contain one entry for the APDMA main clock
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: apdma
>> +
>> +  "#dma-cells":
>> +    const: 1
>> +    description: |
>> +      The first cell specifies the UART APDMA channel number
>> +
>> +  dma-requests:
>> +    description: |
>> +      Number of virtual channels of the UART APDMA controller
>> +    maximum: 16
>> +
>> +  mediatek,dma-33bits:
>> +    type: boolean
>> +    description: Enable 33-bits UART APDMA support
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - "#dma-cells"
> 
> No need for requiring dma-cells. It is coming from dma-common.yaml.

Right. Forgot about that, will fix!

> 
>> +
> 
> Best regards,
> Krzysztof




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
