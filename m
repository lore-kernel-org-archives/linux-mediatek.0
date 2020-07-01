Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7C6C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 08:46:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6582074D
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 08:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TRGu3QI1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KnjZVl3s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6582074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n4DzJ/q6/EUEOpOtHHhuOnmKhKTJHsEHNG2Ft6hsZRg=; b=TRGu3QI1D5zuo+pL6zbZtgUyM
	KvZ3Ry1uCFuMpSzQ1e7Xe4qIQ6a5kAPaEBQXN1i4lDum/c58G7JNq03qW1IKcHgjNUFut0C7eyQV7
	Ua61iFAL/xfyGHdiRj+exbyWMav0IViPlmpB6oMQhD0LC2ExODsYKJysZ3eHqwptxWNuz5sfUbHUk
	YvuRbhAi7Mg7hTNXe1bo2FZwl5QmxhhM6X484J1MSWHWYDs5jKXRSH+ORK1JeY268s0Xmsxx+aVup
	wRZDq2iYTHFD4LHXGfWEfOMJktbfGH80lNyWKdQFsMs3++ObcirjRMtchqbtNwq7zv9bxZ7A7XzyL
	YAq3Dj/kQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYNz-0003Ec-Ib; Wed, 01 Jul 2020 08:46:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqYNt-0003At-VA; Wed, 01 Jul 2020 08:46:27 +0000
X-UUID: 8792758cab6843a4a6075ee7014f3a8b-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=igFdgcx2s3gfCplnw7sG3p3l3ThRmpVgSyIt4O3OtUA=; 
 b=KnjZVl3seTn9jlwAbyb4TuEP+i3aa03XcU4RhNuyDMJ0+AGVDlRo0QInm3VHNIN8KT6M5ulzWaw2YaIOumcD6BJPv3y6aA3aNk94NMaewDSJsc/e/+ENfJFDyVXHGjbG4u8avKdhxXZgy3lvtn28VZftcvq9HZ5FDrOr0zMb8/0=;
X-UUID: 8792758cab6843a4a6075ee7014f3a8b-20200701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1731167686; Wed, 01 Jul 2020 00:42:09 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 01:38:38 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 16:38:33 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 16:38:35 +0800
Message-ID: <1593592716.26931.1.camel@mtkswgap22>
Subject: Re: [PATCH v5 1/4] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
From: EastL <EastL.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 1 Jul 2020 16:38:36 +0800
In-Reply-To: <4fc5f4b9-8f03-74b4-8bc9-bf86a6246ff0@gmail.com>
References: <1592553902-30592-1-git-send-email-EastL.Lee@mediatek.com>
 <1592553902-30592-2-git-send-email-EastL.Lee@mediatek.com>
 <4fc5f4b9-8f03-74b4-8bc9-bf86a6246ff0@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D711C6660C810BC27EF666CFA21813D99FC0E271555793C3BE824F4B0A190992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_044626_197609_FF036F2F 
X-CRM114-Status: GOOD (  23.80  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-06-19 at 11:36 +0200, Matthias Brugger wrote:
> 
> On 19/06/2020 10:04, EastL wrote:
> > Document the devicetree bindings for MediaTek Command-Queue DMA controller
> > which could be found on MT6779 SoC or other similar Mediatek SoCs.
> > 
> > Signed-off-by: EastL <EastL.Lee@mediatek.com>
> 
> Still missing the full name.

Sorry I thought it was only needed in the yaml file
I will fix in next version.
> 
> > ---
> >  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 114 +++++++++++++++++++++
> >  1 file changed, 114 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > new file mode 100644
> > index 0000000..e6fdf05
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > @@ -0,0 +1,114 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> 
> You missed the brackets ().
OK
> 
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
> > +  "#dma-cells":
> > +    minimum: 1
> > +    maximum: 255
> > +    description:
> > +      Used to provide DMA controller specific information.
> > +
> > +  compatible:
> > +    oneOf:
> > +      - const: mediatek,common-cqdma
> 
> What is the common-cqdma for if we have only one compatible specifying the SoC.
> Actually I'm not a great fan of the common-cqdma thing. I'd prefer a fallback
> compatible that has the name of the first SoC implementing the same device.
> 
> Regards,
> Matthias
> 
OK, I'll remove common compatible.

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
> > +    description:
> > +       For DMA capability, We will know the addressing capability of
> > +       MediaTek Command-Queue DMA controller through dma-channel-mask.
> > +    items:
> > +      minItems: 1
> > +      maxItems: 63
> > +
> > +  dma-channels:
> > +    $ref: /schemas/types.yaml#definitions/uint32
> > +    description:
> > +      Number of DMA channels supported by MediaTek Command-Queue DMA
> > +      controller, support up to five.
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
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
