Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B97C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 07:18:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A564F20639
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 07:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A564F20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IjgTbmWzTah3LbdRE2kYWtmVZIBXjDLGRlrs+FRYHLk=; b=di9/Vsq87oq1xbmHMD8B+YxNU
	khrJQV2vVThcJKsaP97kr5vIsGHbFg+gI58/hA4hKXMxk7efF7HWL4HUeIiSsXIczXmS8jjZy+Usx
	cPJPewdCChECQvBBBVAldklSGng8SZXlgy5GmOy+H5vOIyGN03VyAX1/34YGZtSvxb1JxWN+xUYFM
	gpd4opWtMjkCjy1cEMQfcMK5Zif2VlIUYkLP4anfJyKEfwPPNpWuu4+u1UdGZ8GN6NxA1Ja0pXHEt
	5z1x/0X9r+1Rh2rP2HCg1N18jKRxiQsjLKYAD+eLlVR34knY8FWxGPk72pV4lAh+LobLPZtQDvmff
	pjyQeXz2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl5Lw-00076K-TB; Fri, 04 Dec 2020 07:18:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl5Lp-00071c-LR; Fri, 04 Dec 2020 07:18:00 +0000
X-UUID: fe6aeab552034927bfecac4ce0f36758-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MfX9eUXalM1ZT8YXJrCaneB0sCMHWJYVtYRI8EpgCfY=; 
 b=VP3AtIDTy3R2ZVrb1p9hTf5SVSKrhNb3v/opr0cLcCgR2gGrajrokJvUgKybkGGYLRgifXd8SDXxWwUA2HMvFL0JJSjD3QojtD4T9G3ZSSR7byGYbSu+6bzkbC4zHjIs24iiH7WVKGdbG4CxkzH/IKmPVaDV4QC8LbO6NPGeLmA=;
X-UUID: fe6aeab552034927bfecac4ce0f36758-20201203
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1358517965; Thu, 03 Dec 2020 23:17:43 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 23:17:45 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 15:17:44 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 15:17:43 +0800
Message-ID: <1607066264.18639.3.camel@mtkswgap22>
Subject: Re: [PATCH v7 1/4] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
From: EastL <EastL.Lee@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 4 Dec 2020 15:17:44 +0800
In-Reply-To: <20200818164718.GB3596085@bogus>
References: <1597719834-6675-1-git-send-email-EastL.Lee@mediatek.com>
 <1597719834-6675-2-git-send-email-EastL.Lee@mediatek.com>
 <20200818164718.GB3596085@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_021757_939328_8512B12E 
X-CRM114-Status: GOOD (  22.92  )
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

sorry for the delayed response.

On Tue, 2020-08-18 at 10:47 -0600, Rob Herring wrote:
> On Tue, Aug 18, 2020 at 11:03:51AM +0800, EastL Lee wrote:
> > Document the devicetree bindings for MediaTek Command-Queue DMA controller
> > which could be found on MT6779 SoC or other similar Mediatek SoCs.
> > 
> > Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
> > ---
> >  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 98 ++++++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > new file mode 100644
> > index 0000000..fe03081
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > @@ -0,0 +1,98 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/dma/mtk-cqdma.yaml#
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
> > +    oneOf:
> > +      - const: mediatek,mt6765-cqdma
> > +      - const: mediatek,mt6779-cqdma
> 
> Use enum instead of oneOf+const.
OK
> 
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
> > +  dma-channels:
> > +    $ref: /schemas/types.yaml#definitions/uint32
> 
> Common properties already have a type definition.
OK I'll remove
> 
> > +    description:
> > +      Number of DMA channels supported by MediaTek Command-Queue DMA
> > +      controller, support up to five.
> > +    items:
> 
> Not an array, so drop 'items'.
OK
> 
> > +      minimum: 1
> > +      maximum: 5
> > +
> > +  dma-requests:
> > +    $ref: /schemas/types.yaml#definitions/uint32
> > +    description:
> > +      Number of DMA request (virtual channel) supported by MediaTek
> > +      Command-Queue DMA controller, support up to 32.
> > +    items:
> > +      minimum: 1
> > +      maximum: 32
> 
> Same issues here.
OK
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
> 
> Need to list in properties to fix the check error:
> 
> dma-channel-mask: true

OK
> 
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
> > +        dma-channel-mask = <0x3f>;
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
