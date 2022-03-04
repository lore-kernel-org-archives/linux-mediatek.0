Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 02:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yc1EQnfB6SxDfUnKzbd4hsXJQfevjZQrn4ZdANSGte8=; b=JNFDImegxqzf5J
	j5JvGTXBlZoOrQaPVEhWAYkgzcWlwnco0gtw3WQR6VtCB80PeeY8huXRtz9SiV5F8+2FQ8LLqueeV
	TMr88InYkKNPSRq3pe/fuMd4ax9daOW2PtU2vrPOQDPu/Ai5glWd+imdOjc4iHSFY7e0xhHZZCRUV
	P14JCiDgSmJCpBkeIYFzKyv3RBxa2jmLbk066cJv9kC7kk4uMYBkzh97zpi6mEJp/iZTE4c28pnZ3
	Tu12jd8W90HBrfmpvLm2eNJGqfT41GjPC6kyBnVYe4+Ake35YknCve+E2a8La+AgV+V2jtRU7APyZ
	bGq5TMqd5bj50PXoP/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPxRF-008J5j-Tm; Fri, 04 Mar 2022 02:13:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPxRB-008J3C-KE; Fri, 04 Mar 2022 02:13:01 +0000
X-UUID: 18bff75c3b114126accb0ac343d6747b-20220303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UGXKAHAovdHF/HEOv6N/p8vmDyVT4VFMhBnMFboHhnE=; 
 b=DUF6DpCF/MMT1Zx7NYFWt3Lh5k0ZqyuAVYcBNqVu5EpRH8fDHv0K0K4WksRnz2+DHP20iUKuN+wGXauY2Bweo9uEb1dlK1rMtVx+syj8Fa83Ou9EvSN60QDFTaoY6zfj2DnAHV0izWPAk/wxZL9IzixQ7E+gqmpxqUV1B9Q78/E=;
X-UUID: 18bff75c3b114126accb0ac343d6747b-20220303
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 60789451; Thu, 03 Mar 2022 19:12:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 18:12:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 10:12:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 10:12:47 +0800
Message-ID: <070c86db605e60eafd53520b1d93644b2bdb2d96.camel@mediatek.com>
Subject: Re: [PATCH v2, 03/10] dt-bindings: media: mtk-vcodec: Adds encoder
 cores dt-bindings for mt8195
From: Irui Wang <irui.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, Tiffany
 Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 Yong Wu <yong.wu@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 4 Mar 2022 10:12:45 +0800
In-Reply-To: <0a867f1c-330b-16ac-6c87-42a181e50e1e@collabora.com>
References: <20220117120615.21687-1-irui.wang@mediatek.com>
 <20220117120615.21687-4-irui.wang@mediatek.com>
 <0a867f1c-330b-16ac-6c87-42a181e50e1e@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_181259_121478_849757A2 
X-CRM114-Status: GOOD (  28.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello, Angelo,

Many thanks for your review.

On Thu, 2022-03-03 at 15:53 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/01/22 13:06, Irui Wang ha scritto:
> > Adds encoder cores dt-bindings for mt8195
> > 
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > ---
> >   .../media/mediatek,vcodec-encoder-core.yaml   | 214
> > ++++++++++++++++++
> >   1 file changed, 214 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> > core.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> > core.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> > core.yaml
> > new file mode 100644
> > index 000000000000..d1e7bfa50bce
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder-core.yaml
> > @@ -0,0 +1,214 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: "
> > http://devicetree.org/schemas/media/mediatek,vcodec-encoder-core.yaml#
> > "
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Mediatek Video Encoder Accelerator With Multi Core
> > +
> > +maintainers:
> > +  - Irui Wang <irui.wang@mediatek.com>
> > +
> > +description: |
> > +  Mediatek Video Encode is the video encode hardware present in
> > Mediatek
> > +  SoCs which supports high resolution encoding functionalities.
> > Required
> > +  parent and child device node.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8195-vcodec-enc
> > +
> > +  mediatek,scp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description: |
> > +      The node of system control processor (SCP), using
> > +      the remoteproc & rpmsg framework.
> > +
> > +  iommus:
> > +    minItems: 1
> > +    maxItems: 32
> > +    description: |
> > +      List of the hardware port in respective IOMMU block for
> > current Socs.
> > +      Refer to bindings/iommu/mediatek,iommu.yaml.
> > +
> > +  dma-ranges:
> > +    maxItems: 1
> > +    description: |
> > +      Describes the physical address space of IOMMU maps to
> > memory.
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
> > +
> > +# Required child node:
> > +patternProperties:
> > +  "venc_core0@1a020000":
> 
> This should be a pattern, venc-coreN where N is a number between 0
> and 9,
> and any iostart should be allowed, not just 1a020000; doing it that
> way
> allows you to do a spec for all the core subnodes in one.

I will fix it.
> 
> 
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mtk-venc-core0
> > +
> 
> ..snip..
> 
> > +
> > +required:
> > +  - compatible
> > +  - mediatek,scp
> > +  - iommus
> > +  - dma-ranges
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/memory/mt8195-memory-port.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +
> > +    venc {
> > +        compatible = "mediatek,mt8195-vcodec-enc";
> > +        mediatek,scp = <&scp>;
> > +        iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>;
> > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> 
> What about doing instead...
> 
> #address-cells = <2>;
> #size-cells = <2>;
> (or fix your dma-ranges property)

cells=2 may cause some unexpected errors, I will check it again.
> 
> and...
> 
> ranges = <0 0 0 0x1a020000 0 0x1020000>;
>      venc-core0@0 {
>          compatible = "mediatek,mtk-venc-hw";
>          reg = <0 0 0 0x10000>;
>          mediatek,hw-leader;
>           ..... other properties .....
>      };
> 
>      venc-core1@1000000 {
>          compatible = "mediatek,mtk-venc-hw";
>          reg = <0 0x1000000 0 0x10000>;
>           ..... other properties .....
>      }
> 
> Regards,
> Angelo

I will rewrite the examples.

Thanks
Best Regards
> 
> > +
> > +        venc_core0@1a020000 {
> > +            compatible = "mediatek,mtk-venc-core0";
> > +            reg = <0x1a020000 0x10000>;
> > +            iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>,
> > +                     <&iommu_vdo M4U_PORT_L19_VENC_REC>,
> > +                     <&iommu_vdo M4U_PORT_L19_VENC_BSDMA>,
> > +                     <&iommu_vdo M4U_PORT_L19_VENC_SV_COMV>,
> > +                     <&iommu_vdo M4U_PORT_L19_VENC_RD_COMV>,
> > +                     <&iommu_vdo M4U_PORT_L19_VENC_CUR_LUMA>,
> > +                     <&iommu_vdo M4U_PORT_L19_VENC_CUR_CHROMA>,
> > +                     <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
> > +                     <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
> > +            interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            clocks = <&vencsys CLK_VENC_VENC>;
> > +            clock-names = "MT_CG_VENC0";
> > +            assigned-clocks = <&topckgen CLK_TOP_VENC>;
> > +            assigned-clock-parents = <&topckgen
> > CLK_TOP_UNIVPLL_D4>;
> > +            power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
> > +        };
> > +
> > +        venc_core1@1b020000 {
> > +            compatible = "mediatek,mtk-venc-core1";
> > +            reg = <0x1b020000 0x10000>;
> > +            iommus = <&iommu_vpp M4U_PORT_L20_VENC_RCPU>,
> > +                     <&iommu_vpp M4U_PORT_L20_VENC_REC>,
> > +                     <&iommu_vpp M4U_PORT_L20_VENC_BSDMA>,
> > +                     <&iommu_vpp M4U_PORT_L20_VENC_SV_COMV>,
> > +                     <&iommu_vpp M4U_PORT_L20_VENC_RD_COMV>,
> > +                     <&iommu_vpp M4U_PORT_L20_VENC_CUR_LUMA>,
> > +                     <&iommu_vpp M4U_PORT_L20_VENC_CUR_CHROMA>,
> > +                     <&iommu_vpp M4U_PORT_L20_VENC_REF_LUMA>,
> > +                     <&iommu_vpp M4U_PORT_L20_VENC_REF_CHROMA>;
> > +            interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            clocks = <&vencsys_core1 CLK_VENC_CORE1_VENC>;
> > +            clock-names = "MT_CG_VENC1";
> > +            assigned-clocks = <&topckgen CLK_TOP_VENC>;
> > +            assigned-clock-parents = <&topckgen
> > CLK_TOP_UNIVPLL_D4>;
> > +            power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
> > +        };
> > +    };
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
