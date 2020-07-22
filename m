Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DC0C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 11:26:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6149B20771
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 11:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DviwetOj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Btsx+F+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6149B20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WFC3uwGycvvknK3zyQyZieatnu07T8l0eK1NDQ0D4u8=; b=DviwetOjjC59bKZJHbjLSpblQ
	m4uYiM1QI6sY38WHH56wHSdwXGf9E3iCQJXBxGD6HX7gZtRk6DkGMRmbNAkRF+W9rQv30hZ+fQApV
	/zoF23qejsBsTLc9T8vWHymytmEsUj/c2N7cWaYjnFmOKsNb0SlqBqU5SXtwuwJinCwCwRi9kKnG5
	9qum639IaQWTsLy8i6LbSJaM6DfRQOi5HK3qpXVdw7p2t0xSPjNz8jo33sm2rTD4CdRvzjF/PU4As
	eIl3V0SNTC9rZMEftzRAnaD9r4oaqAjlebGRHcQEvSJAJBkrXq3MujQCL/83LFERfQWsmvaj+puX1
	P3IpHljjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyCtT-00008e-7u; Wed, 22 Jul 2020 11:26:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyCtP-00006z-I5; Wed, 22 Jul 2020 11:26:36 +0000
X-UUID: 49829000f2244d61a6b0df659b497b61-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RSwgljTRgkEcHXir5exEiZR1FuMb9nTNQg3w4yYtvsM=; 
 b=Btsx+F+KyUSA8K3exfGSEFiLNCxRXvx4B6aMA5/yeyPYKcEg4b5yzxLhruNrmujxi0pusrprDcOYbLc6363LRL90YAbfQN49UgtCNIC4Dl0pjGkyjXR/gybKNTIJH/aLtIrt5y5w2hR/jOXGKRzb3zRmKnNexPA7cgBfNsPDW6g=;
X-UUID: 49829000f2244d61a6b0df659b497b61-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2007003815; Wed, 22 Jul 2020 03:23:20 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 04:19:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:19:21 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 19:19:22 +0800
Message-ID: <1595416762.22392.5.camel@mtkswgap22>
Subject: Re: [PATCH v6 1/4] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
From: EastL <EastL.Lee@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 22 Jul 2020 19:19:22 +0800
In-Reply-To: <20200709205915.GA865123@bogus>
References: <1593673564-4425-1-git-send-email-EastL.Lee@mediatek.com>
 <1593673564-4425-2-git-send-email-EastL.Lee@mediatek.com>
 <20200709205915.GA865123@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 64B4CD0E11C60C63EEBAC5E16AB7A324C9F7C8C5961F0971A8F21997C7A4088F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_072635_731447_8152B13F 
X-CRM114-Status: GOOD (  27.19  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, cc.hwang@mediatek.com,
 wsd_upstream@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-09 at 14:59 -0600, Rob Herring wrote:
> On Thu, Jul 02, 2020 at 03:06:01PM +0800, EastL Lee wrote:
> > Document the devicetree bindings for MediaTek Command-Queue DMA controller
> > which could be found on MT6779 SoC or other similar Mediatek SoCs.
> > 
> > Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
> > ---
> >  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 113 +++++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > new file mode 100644
> > index 0000000..83ed742
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/dma/mtk-cqdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!1P_if3RiZOVpzN8n4EQI0IxZq0d07UksSgeHYA0h6HLylU9l4pu2eggq7eeVsF2H$ 
> > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1P_if3RiZOVpzN8n4EQI0IxZq0d07UksSgeHYA0h6HLylU9l4pu2eggq7ZMPow23$ 
> > +
> > +title: MediaTek Command-Queue DMA controller Device Tree Binding
> > +
> > +maintainers:
> > +  - EastL Lee <EastL.Lee@mediatek.com>
> > +
> > +description:
> > +  MediaTek Command-Queue DMA controller (CQDMA) on Mediatek SoC
> > +  is dedicated to memory-to-memory transfer through queue based
> > +  descriptor management.
> > +
> > +allOf:
> > +  - $ref: "dma-controller.yaml#"
> > +
> > +properties:
> > +  "#dma-cells":
> > +    minimum: 1
> > +    maximum: 255
> > +    description:
> > +      Used to provide DMA controller specific information.
> 
> No, for a specific binding like this, it should be 1 defined value.
OK.I'll fix it to const 1
> 
> > +
> > +  compatible:
> > +    oneOf:
> > +      - const: mediatek,mt6765-cqdma
> > +      - const: mediatek,mt6779-cqdma
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 5
> > +    description:
> > +        A base address of MediaTek Command-Queue DMA controller,
> > +        a channel will have a set of base address.
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 5
> > +    description:
> > +        A interrupt number of MediaTek Command-Queue DMA controller,
> > +        one interrupt number per dma-channels.
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: cqdma
> > +
> > +  dma-channel-mask:
> > +    $ref: /schemas/types.yaml#definitions/uint32
> 
> Alreay has a type, don't redefine it here.
OK
> 
> > +    description:
> > +       For DMA capability, We will know the addressing capability of
> > +       MediaTek Command-Queue DMA controller through dma-channel-mask.
> 
> This sounds like the kernel's DMA masks which is not what this property 
> is.
Yes, this is for kernel's DMA mask.
Do I need to declare this member again?
> 
> > +    items:
> > +      minItems: 1
> > +      maxItems: 63
> 
> An array of 63 elements?
> 
> I think you want:
> 
> minimum: 1
> maximum: 63
> 
> Or:
> 
> enum: [ 1, 3, 7, 0xf, 0x1f, 0x3f ]
> 
> (Though if this works, then just 'dma-channels' is enough.)
> 
> > +
> > +  dma-channels:
> > +    $ref: /schemas/types.yaml#definitions/uint32
> > +    description:
> > +      Number of DMA channels supported by MediaTek Command-Queue DMA
> > +      controller, support up to five.
> 
> Is it 5 or 6 channels? You're off by one somewhere.
Currently chip CQDMA only has three channels at most, I'll fix it to
maxnum 3
> > +    items:
> > +      minItems: 1
> > +      maxItems: 5
> > +
> > +  dma-requests:
> > +    $ref: /schemas/types.yaml#definitions/uint32
> > +    description:
> > +      Number of DMA request (virtual channel) supported by MediaTek
> > +      Command-Queue DMA controller, support up to 32.
> > +    items:
> > +      minItems: 1
> > +      maxItems: 32
> 
> You are describing how many elements in an array and this is a scalar.
OK I;ll fix to minnum & maxnum
> 
> > +
> > +required:
> > +  - "#dma-cells"
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - dma-channel-mask
> > +  - dma-channels
> > +  - dma-requests
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt6779-clk.h>
> > +    cqdma: dma-controller@10212000 {
> > +        compatible = "mediatek,mt6779-cqdma";
> > +        reg = <0x10212000 0x80>,
> > +            <0x10212080 0x80>,
> > +            <0x10212100 0x80>;
> > +        interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>,
> > +            <GIC_SPI 140 IRQ_TYPE_LEVEL_LOW>,
> > +            <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> > +        clocks = <&infracfg_ao CLK_INFRA_CQ_DMA>;
> > +        clock-names = "cqdma";
> > +        dma-channel-mask = <63>;
> > +        dma-channels = <3>;
> > +        dma-requests = <32>;
> > +        #dma-cells = <1>;
> > +    };
> > +
> > +...
> > -- 
> > 1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
