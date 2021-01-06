Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEACC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 09:26:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110592310B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 09:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 110592310B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b/MwaF/nuJ1jwGp2nFihe9oH6js34vQCgKjFeQBRbOk=; b=W5ijOgTKpbvUqGnWpNMD5c+MN
	uAN0dkkOa5xurcDdTN7gXmm6/ZvdW+WAlIHSnA+XQEN77gT5/GdzZNBTNPFV9oo0S6fkQUh1HwH9m
	vBHi7y2M6riXmwIsJabS7b8547pOCJfCPxtNe1GWN6ailC0aN8D7x+gkkVml56j7ngeJyHnua8/b9
	VlVi/Moixxaw3YpFtfb5OVaKrE9SUDj4ya16PhG+F8tF9ptyMuxVlGXueCNySjpivGZFMrBAwHSy7
	DNNnFy0wcNsQkbwzq0/iv+pojFQZMlq/3U7MNhO5+f2I3OB2iPANVNj+1gFiU4uhpMl6RhnnMeBoR
	LrKaIXfTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx54k-0001PS-2W; Wed, 06 Jan 2021 09:25:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx54e-0001O0-Gh; Wed, 06 Jan 2021 09:25:50 +0000
X-UUID: 8a99c76b29544e2abb8ee21e87238365-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zOuLnq2988VcCoJP2KaUOG1UC0p7HGPhxsgATLl5fuU=; 
 b=q1aDPvqbJEz8uedknKGYXsOPVx3xFNpHppP5FHHAOdz7kfe8Qd3WkTCG/zaIeFlr0HH30f8CgWVBQjb5Rv1LAiTXDbo3IsLQM2pe5E07rgfQ+GGcbojW5S9I2kewCYW56Z5W45Aj9nRfE2TRgCRe9b5v10zlrC9ZCTACIxmBkIA=;
X-UUID: 8a99c76b29544e2abb8ee21e87238365-20210106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1365285091; Wed, 06 Jan 2021 01:25:43 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 01:25:42 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 17:25:40 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Jan 2021 17:25:40 +0800
Message-ID: <1609925140.5373.5.camel@mtkswgap22>
Subject: Re: [PATCH v8 1/4] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
From: EastL <EastL.Lee@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 6 Jan 2021 17:25:40 +0800
In-Reply-To: <20210103165842.GA4024251@robh.at.kernel.org>
References: <1608715847-28956-1-git-send-email-EastL.Lee@mediatek.com>
 <1608715847-28956-2-git-send-email-EastL.Lee@mediatek.com>
 <20210103165842.GA4024251@robh.at.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_042549_323492_0F8CA166 
X-CRM114-Status: GOOD (  27.65  )
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

On Sun, 2021-01-03 at 09:58 -0700, Rob Herring wrote:
> On Wed, Dec 23, 2020 at 05:30:44PM +0800, EastL Lee wrote:
> > Document the devicetree bindings for MediaTek Command-Queue DMA controller
> > which could be found on MT6779 SoC or other similar Mediatek SoCs.
> > 
> > Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
> > ---
> >  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 104 +++++++++++++++++++++
> 
> Use compatible string for filename:
OK
> 
> mediatek,cqdma.yaml
> 
> >  1 file changed, 104 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > new file mode 100644
> > index 0000000..a76a263
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > @@ -0,0 +1,104 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/dma/mtk-cqdma.yaml#
> 
> Don't forget to update this.
OK
> 
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
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
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt6765-cqdma
> > +          - mediatek,mt6779-cqdma
> > +      - const: mediatek,cqdma
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
> > +    description:
> > +       For DMA capability, We will know the addressing capability of
> > +       MediaTek Command-Queue DMA controller through dma-channel-mask.
> > +      minimum: 1
> > +      maximum: 63
> 
> Indentation is wrong here so this has no effect.
I'll fix it
> 
> A mask of 63 is 6 channels...
In my opinion, kernel dma mask if for 32/64 bit capability...
If I don't set dma mask I will get fail on DMATEST.
> 
> > +
> > +  dma-channels:
> > +    description:
> > +      Number of DMA channels supported by MediaTek Command-Queue DMA
> > +      controller, support up to five.
> > +      minimum: 1
> > +      maximum: 5
> 
> Same here.
OK
> 
> Do you really need both dma-channels and dma-channel-mask? You should be 
> able to get one from the other.
> 
> > +
> > +  dma-requests:
> > +    description:
> > +      Number of DMA request (virtual channel) supported by MediaTek
> > +      Command-Queue DMA controller, support up to 32.
> > +      minimum: 1
> > +      maximum: 32
> 
> And here.
> 
> You are missing '#dma-cells' also.
OK I'll fix it.
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
> 
> This should fail validation because it doesn't match the schema. You ran 
> 'make dt_binding_check', right?
Yes, but I got other fail on kernel-5.10...
> 
> > +        reg = <0x10212000 0x80>,
> > +            <0x10212080 0x80>,
> > +            <0x10212100 0x80>;
> > +        interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>,
> > +            <GIC_SPI 140 IRQ_TYPE_LEVEL_LOW>,
> > +            <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> > +        clocks = <&infracfg_ao CLK_INFRA_CQ_DMA>;
> > +        clock-names = "cqdma";
> > +        dma-channel-mask = <63>;
> 
> 6 channels or...
> 
> > +        dma-channels = <3>;
> 
> 3?
3 channel, the mask is for DMATEST PASS.
> 
> > +        dma-requests = <32>;
> > +        #dma-cells = <1>;
> > +    };
> > +
> > +...
> > -- 
> > 1.9.1
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
