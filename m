Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66644C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxi8G/+eal0M1foMyOtxX71Bqaf46N0VMrIn6HweAbE=; b=YYb0Q+zhtGFhov
	jNipPhIe1O9SPgp8DGEArD5VQbvnix5sBstwYr0NnuZKCB+GmGoe1qWWsOA87k1rAZCiTHSrcfuzq
	UoueTWIgCRe3nlToxWFdBU9fKdGtTxHkn+sO484yS1aWr/PhJbHsmbl/4qpTD/OB/KpLrv+lBY4U/
	/JzcKGdzN8Rh41ePYwsicHFhX7NPlKolLZUC/QoPMo7LXbI2Zebqvd73klHh7HdCeXjkPi3Xxlbre
	nMNB7gFPUo/1XEyd7qvKCpPn/ZqUMqkXFRO/rK5Drp0KiRXyQiNPppXoM8HGS1/pkV98rwqwma1Qv
	zz+0KrUZZPcLNA9+3BZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR9td-00GrJ2-8M; Mon, 07 Mar 2022 09:43:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR9sk-00Gr2H-UL; Mon, 07 Mar 2022 09:42:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A30B91F40C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646646141;
 bh=Z5Bh8tbOQLX1EfA0RcpYaH5EUxUZcouuntDZ3XEv3fc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i9X/5gNdFEOXi4isR9t0zI3JTqf3YNejZXCm1bXFgvqU7FXcK0IwSmvdXsgm5R2/G
 mV3bRHay2azztHKhU4f40ymQF4NKfy3z1pPs1Gjiv6sQ5xt/fygLUamqNbfFTD6aoO
 QcnRPKnm4lDlGBSTMv+q3Zln79GkQjd9FGn+U7aojuRqiWSVRH3TKjOoQHZd18xcGZ
 CcMggPDsJrvKFNlu5q5aqh0UVtYk9G3pcHq9P1jOfvz+GrNJmMNorB5rcJbSjWowR6
 azYQi0dacI4dX4a9sq5hZ/Jfm9CvdOsfBOIUeF3qlZW/JWTcIljovay+8BqjPROGK+
 1B02YtJo2lxdQ==
Message-ID: <9293b54f-a261-826d-146b-0b2e9f107132@collabora.com>
Date: Mon, 7 Mar 2022 10:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 03/23] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-4-nancy.lin@mediatek.com>
 <243c2a77-6fbf-6afa-b773-de9b58aa4997@collabora.com>
 <70f7c7bcf9d2b0596bd5f75444c6c12bd593e387.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <70f7c7bcf9d2b0596bd5f75444c6c12bd593e387.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_014223_306995_60786711 
X-CRM114-Status: GOOD (  23.42  )
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

Il 07/03/22 03:33, Nancy.Lin ha scritto:
> Hi Angelo,
> 
> Thanks for the review.
> 
> On Wed, 2022-03-02 at 11:13 +0100, AngeloGioacchino Del Regno wrote:
>> Il 22/02/22 11:07, Nancy.Lin ha scritto:
>>> Add vdosys1 ETHDR definition.
>>>
>>> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>>> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> ---
>>>    .../display/mediatek/mediatek,ethdr.yaml      | 147
>>> ++++++++++++++++++
>>>    1 file changed, 147 insertions(+)
>>>    create mode 100644
>>> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
>>> aml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
>>> .yaml
>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
>>> .yaml
>>> new file mode 100644
>>> index 000000000000..131eed5eeeb7
>>> --- /dev/null
>>> +++
>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
>>> .yaml
>>> @@ -0,0 +1,147 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id:
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml*__;Iw!!CTRNKA9wMg0ARbw!y6qWSq3epOM61tyVt6ijw6CRNaNmcK382oF8TQ-a57UAcXvx8o1yIPd7pTKakQkU$
>>>   
>>> +$schema:
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!y6qWSq3epOM61tyVt6ijw6CRNaNmcK382oF8TQ-a57UAcXvx8o1yIPd7pTQVqP2v$
>>>   
>>> +
>>> +title: Mediatek Ethdr Device Tree Bindings
>>> +
>>> +maintainers:
>>> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> +  - Philipp Zabel <p.zabel@pengutronix.de>
>>> +
>>> +description: |
>>> +  ETHDR is designed for HDR video and graphics conversion in the
>>> external display path.
>>> +  It handles multiple HDR input types and performs tone mapping,
>>> color space/color
>>> +  format conversion, and then combine different layers, output the
>>> required HDR or
>>> +  SDR signal to the subsequent display path. This engine is
>>> composed of two video
>>> +  frontends, two graphic frontends, one video backend and a mixer.
>>> ETHDR has two
>>> +  DMA function blocks, DS and ADL. These two function blocks read
>>> the pre-programmed
>>> +  registers from DRAM and set them to HW in the v-blanking period.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: mediatek,mt8195-disp-ethdr
>>> +  reg:
>>> +    maxItems: 7
>>> +  reg-names:
>>> +    items:
>>> +      - const: mixer
>>> +      - const: vdo_fe0
>>> +      - const: vdo_fe1
>>> +      - const: gfx_fe0
>>> +      - const: gfx_fe1
>>> +      - const: vdo_be
>>> +      - const: adl_ds
>>> +  interrupts:
>>> +    minItems: 1
>>> +  iommus:
>>> +    description: The compatible property is DMA function blocks.
>>> +      Should point to the respective IOMMU block with master port
>>> as argument,
>>> +      see
>>> Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
>>> +      details.
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +  clocks:
>>> +    items:
>>> +      - description: mixer clock
>>> +      - description: video frontend 0 clock
>>> +      - description: video frontend 1 clock
>>> +      - description: graphic frontend 0 clock
>>> +      - description: graphic frontend 1 clock
>>> +      - description: video backend clock
>>> +      - description: autodownload and menuload clock
>>> +      - description: video frontend 0 async clock
>>> +      - description: video frontend 1 async clock
>>> +      - description: graphic frontend 0 async clock
>>> +      - description: graphic frontend 1 async clock
>>> +      - description: video backend async clock
>>> +      - description: ethdr top clock
>>> +  clock-names:
>>> +    items:
>>> +      - const: mixer
>>> +      - const: vdo_fe0
>>> +      - const: vdo_fe1
>>> +      - const: gfx_fe0
>>> +      - const: gfx_fe1
>>> +      - const: vdo_be
>>> +      - const: adl_ds
>>> +      - const: vdo_fe0_async
>>> +      - const: vdo_fe1_async
>>> +      - const: gfx_fe0_async
>>> +      - const: gfx_fe1_async
>>> +      - const: vdo_be_async
>>> +      - const: ethdr_top
>>> +  power-domains:
>>> +    maxItems: 1
>>> +  resets:
>>> +    maxItems: 5
>>> +  mediatek,gce-client-reg:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    description: The register of display function block to be set
>>> by gce.
>>> +      There are 4 arguments in this property, gce node, subsys id,
>>> offset and
>>> +      register size. The subsys id is defined in the gce header of
>>> each chips
>>> +      include/include/dt-bindings/gce/<chip>-gce.h, mapping to the
>>> register of
>>> +      display function block.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - interrupts
>>> +  - power-domains
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>
>> Please fix inclusions and address/size cells.
>>
>> Thanks,
>> Angelo
>>
> 
> Because the patch has been applied to mediatek-drm-next [1].
> I saw that you have a patch for fixing this issue [2]. I think I will
> just remove this patch in the next revision. Do you think this is OK?
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next
> [2]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220304095458.12409-4-
> angelogioacchino.delregno@collabora.com/
> 
> Best,
> Nancy
> 

Yes, this is ok.

Thank you,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
