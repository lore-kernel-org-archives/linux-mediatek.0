Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 10:18:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1DB8610A0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 10:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1DB8610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVQs2qFlD+rHloI1dpdkfbqrF8NLYhbGFxlppCXMwVo=; b=VJRYsPTnKWRBVY
	iFnx3DHV7cPz5SxLCcvBd96pXBmiJeFt/op/UV8yfATdAcRe+1XdhlOcwN+vv6hbgl1eV5Gk4BjpV
	cTavFSHLhwxlJk5tG+dqx3D9D29w8S+pqAp5VvtGnYb2pFSoSSxps7QShuOVRhRhElHe7/8uWZKCY
	8k3HKjkYQNNPY8SPM9BbSnZYU/+8KZXbKONM8E6RnkJLgLeiL5jIwrrl8XvbQo1//s+BzUNZGMJ+/
	In48yBoQ1/HTiTrLLG333SJo9OJ9naIZhlj789F0Nqle0LWSN/NZXru5/E9JyPIUz/edaOG+1m/cW
	Fd5Z0LsSz++vGvssicDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOCO-001TOR-4T; Tue, 09 Nov 2021 10:17:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkOC7-001TJF-53; Tue, 09 Nov 2021 10:17:38 +0000
X-UUID: 91c2518b58c54fada28fb4bc8faf7074-20211109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lgB+CIAMiDCYGzfWesKt4W7X6tkU7sdlFZm48/brg6M=; 
 b=KtHJuKZbTzNu91BPI8HimRXt6LLiLXrE8q/t5jzGj9l8lVuUbsUF/93IOTfV9sWY0NAf+douT5Fj033/7ihpOTQyANOqWz/ReWmD0TY9HUwJtqN83gvgAHbyeWUF7ibYvm+O7+gAZSkc7qwMN+84vF+olADrtJGebYnsBhSZH3U=;
X-UUID: 91c2518b58c54fada28fb4bc8faf7074-20211109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1846846993; Tue, 09 Nov 2021 03:17:30 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 02:17:28 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 18:17:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Nov 2021 18:17:24 +0800
Message-ID: <b9943a8ab54deb7aacc74dd101f7a3a98998dcdd.camel@mediatek.com>
Subject: Re: [PATCH v8, 07/17] dt-bindings: media: mtk-vcodec: Separate
 video encoder and decoder dt-bindings
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rob Herring
 <robh@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "Collabora Kernel ML" <kernel@collabora.com>
Date: Tue, 9 Nov 2021 18:17:24 +0800
In-Reply-To: <cbda45ed-b4a2-2f33-6e98-8120aa56b2f2@collabora.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-8-yunfei.dong@mediatek.com>
 <cbda45ed-b4a2-2f33-6e98-8120aa56b2f2@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_021735_220224_61EB1AB8 
X-CRM114-Status: GOOD (  23.50  )
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

Hi Dafna,

Thanks for your suggestion,
On Fri, 2021-10-29 at 13:49 +0200, Dafna Hirschfeld wrote:
> 
> On 29.10.21 05:55, Yunfei Dong wrote:
> > Decoder will use component framework to manage hardware, it is big
> > difference with encoder.
> > 
> > Reviewed-by: Rob Herring<robh@kernel.org>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >   .../media/mediatek,vcodec-decoder.yaml        | 176
> > +++++++++++++++++
> >   .../media/mediatek,vcodec-encoder.yaml        | 187
> > ++++++++++++++++++
> >   .../bindings/media/mediatek-vcodec.txt        | 131 ------------
> >   3 files changed, 363 insertions(+), 131 deletions(-)
> >   create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,vcodec-
> > decoder.yaml
> >   create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> >   delete mode 100644
> > Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > decoder.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > decoder.yaml
> > new file mode 100644
> > index 000000000000..5de37065fbce
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > decoder.yaml
> > @@ -0,0 +1,176 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek Video Decode Accelerator With Component
> > +
> > +maintainers:
> > +  - Yunfei Dong <yunfei.dong@mediatek.com>
> > +
> > +description: |+
> > +  Mediatek Video Decode is the video decode hardware present in
> > Mediatek
> > +  SoCs which supports high resolution decoding functionalities.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8173-vcodec-dec
> > +      - mediatek,mt8183-vcodec-dec
> > +
> > +  reg:
> > +    maxItems: 12
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 8
> > +
> > +  clock-names:
> > +    items:
> > +      - const: vcodecpll
> > +      - const: univpll_d2
> > +      - const: clk_cci400_sel
> > +      - const: vdec_sel
> > +      - const: vdecpll
> > +      - const: vencpll
> > +      - const: venc_lt_sel
> > +      - const: vdec_bus_clk_src
> > +
> > +  assigned-clocks: true
> > +
> > +  assigned-clock-parents: true
> > +
> > +  assigned-clock-rates: true
> > +
> > +  power-domains:
> > +    maxItems: 1
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
> > +  mediatek,larb:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description: |
> > +      Must contain the local arbiters in the current Socs.
> > +
> > +  mediatek,vpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description:
> > +      Describes point to vpu.
> > +
> > +  mediatek,scp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description:
> > +      Describes point to scp.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - iommus
> > +  - assigned-clocks
> > +  - assigned-clock-parents
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8183-vcodec-dec
> > +
> > +    then:
> > +      required:
> > +        - mediatek,scp
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8173-vcodec-dec
> > +
> > +    then:
> > +      required:
> > +        - mediatek,vpu
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/memory/mt8173-larb-port.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/mt8173-power.h>
> > +
> > +    vcodec_dec: vcodec@16000000 {
> > +      compatible = "mediatek,mt8173-vcodec-dec";
> > +      reg = <0x16000000 0x100>,   /*VDEC_SYS*/
> > +          <0x16020000 0x1000>,  /*VDEC_MISC*/
> > +          <0x16021000 0x800>,   /*VDEC_LD*/
> > +          <0x16021800 0x800>,   /*VDEC_TOP*/
> > +          <0x16022000 0x1000>,  /*VDEC_CM*/
> > +          <0x16023000 0x1000>,  /*VDEC_AD*/
> > +          <0x16024000 0x1000>,  /*VDEC_AV*/
> > +          <0x16025000 0x1000>,  /*VDEC_PP*/
> > +          <0x16026800 0x800>,   /*VP8_VD*/
> > +          <0x16027000 0x800>,   /*VP6_VD*/
> > +          <0x16027800 0x800>,   /*VP8_VL*/
> > +          <0x16028400 0x400>;   /*VP9_VD*/
> > +      interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
> > +      mediatek,larb = <&larb1>;
> > +      iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
> > +             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
> > +             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
> > +             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
> > +             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
> > +             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
> > +             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
> > +             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
> > +      mediatek,vpu = <&vpu>;
> > +      power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
> > +      clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
> > +             <&topckgen CLK_TOP_UNIVPLL_D2>,
> > +             <&topckgen CLK_TOP_CCI400_SEL>,
> > +             <&topckgen CLK_TOP_VDEC_SEL>,
> > +             <&topckgen CLK_TOP_VCODECPLL>,
> > +             <&apmixedsys CLK_APMIXED_VENCPLL>,
> > +             <&topckgen CLK_TOP_VENC_LT_SEL>,
> > +             <&topckgen CLK_TOP_VCODECPLL_370P5>;
> > +      clock-names = "vcodecpll",
> > +                  "univpll_d2",
> > +                  "clk_cci400_sel",
> > +                  "vdec_sel",
> > +                  "vdecpll",
> > +                  "vencpll",
> > +                  "venc_lt_sel",
> > +                  "vdec_bus_clk_src";
> > +      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
> > +                      <&topckgen CLK_TOP_CCI400_SEL>,
> > +                      <&topckgen CLK_TOP_VDEC_SEL>,
> > +                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
> > +                      <&apmixedsys CLK_APMIXED_VENCPLL>;
> > +      assigned-clock-parents = <&topckgen
> > CLK_TOP_VCODECPLL_370P5>,
> > +                             <&topckgen CLK_TOP_UNIVPLL_D2>,
> > +                             <&topckgen CLK_TOP_VCODECPLL>;
> > +      assigned-clock-rates = <0>, <0>, <0>, <1482000000>,
> > <800000000>;
> > +    };
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > new file mode 100644
> > index 000000000000..94d67d40548c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > @@ -0,0 +1,187 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek Video Encode Accelerator With Component
> 
> 
Fix in v9.
> why is it "With Component" ?
> I guess it should be removed
> 
> Thanks,
> Dafna
> 
Thanks 
Yunfei Dong
> > +
> > +maintainers:
> > +  - Yunfei Dong <yunfei.dong@mediatek.com>
> > +
> > +description: |+
> > +  Mediatek Video Encode is the video encode hardware present in
> > Mediatek
> > +  SoCs which supports high resolution encoding functionalities.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8173-vcodec-enc-vp8
> > +      - mediatek,mt8173-vcodec-enc
> > +      - mediatek,mt8183-vcodec-enc
> > +      - mediatek,mt8192-vcodec-enc
> > +      - mediatek,mt8195-vcodec-enc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 5
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 5
> > +
> > +  assigned-clocks: true
> > +
> > +  assigned-clock-parents: true
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
> > +  mediatek,larb:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description: |
> > +      Must contain the local arbiters in the current Socs.
> > +
> > +  mediatek,vpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description:
> > +      Describes point to vpu.
> > +
> > +  mediatek,scp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description:
> > +      Describes point to scp.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - iommus
> > +  - assigned-clocks
> > +  - assigned-clock-parents
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8183-vcodec-enc
> > +              - mediatek,mt8192-vcodec-enc
> > +
> > +    then:
> > +      required:
> > +        - mediatek,scp
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8173-vcodec-enc-vp8
> > +              - mediatek,mt8173-vcodec-enc
> > +
> > +    then:
> > +      required:
> > +        - mediatek,vpu
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - mediatek,mt8173-vcodec-enc
> > +            - mediatek,mt8192-vcodec-enc
> > +            - mediatek,mt8173-vcodec-enc
> > +
> > +    then:
> > +      properties:
> > +        clock:
> > +          items:
> > +            minItems: 1
> > +            maxItems: 1
> > +        clock-names:
> > +          items:
> > +            - const: venc_sel
> > +    else:  # for vp8 hw decoder
> > +      properties:
> > +        clock:
> > +          items:
> > +            minItems: 1
> > +            maxItems: 1
> > +        clock-names:
> > +          items:
> > +            - const: venc_lt_sel
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/memory/mt8173-larb-port.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    vcodec_enc_avc: vcodec@18002000 {
> > +      compatible = "mediatek,mt8173-vcodec-enc";
> > +      reg = <0x18002000 0x1000>;
> > +      interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> > +      iommus = <&iommu M4U_PORT_VENC_RCPU>,
> > +             <&iommu M4U_PORT_VENC_REC>,
> > +             <&iommu M4U_PORT_VENC_BSDMA>,
> > +             <&iommu M4U_PORT_VENC_SV_COMV>,
> > +             <&iommu M4U_PORT_VENC_RD_COMV>,
> > +             <&iommu M4U_PORT_VENC_CUR_LUMA>,
> > +             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> > +             <&iommu M4U_PORT_VENC_REF_LUMA>,
> > +             <&iommu M4U_PORT_VENC_REF_CHROMA>,
> > +             <&iommu M4U_PORT_VENC_NBM_RDMA>,
> > +             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> > +      mediatek,larb = <&larb3>;
> > +      mediatek,vpu = <&vpu>;
> > +      clocks = <&topckgen CLK_TOP_VENC_SEL>;
> > +      clock-names = "venc_sel";
> > +      assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> > +      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> > +    };
> > +
> > +    vcodec_enc_vp8: vcodec@19002000 {
> > +      compatible = "mediatek,mt8173-vcodec-enc-vp8";
> > +      reg =  <0x19002000 0x1000>;	/* VENC_LT_SYS */
> > +      interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > +      iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> > +             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> > +             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> > +      mediatek,larb = <&larb5>;
> > +      mediatek,vpu = <&vpu>;
> > +      clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> > +      clock-names = "venc_lt_sel";
> > +      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> > +      assigned-clock-parents = <&topckgen
> > CLK_TOP_VCODECPLL_370P5>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-
> > vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-
> > vcodec.txt
> > deleted file mode 100644
> > index 665a9508708e..000000000000
> > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > +++ /dev/null
> > @@ -1,131 +0,0 @@
> > -Mediatek Video Codec
> > -
> > -Mediatek Video Codec is the video codec hw present in Mediatek
> > SoCs which
> > -supports high resolution encoding and decoding functionalities.
> > -
> > -Required properties:
> > -- compatible : must be one of the following string:
> > -  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
> > -  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
> > -  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
> > -  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> > -  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
> > -  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
> > -  "mediatek,mt8195-vcodec-enc" for MT8195 encoder.
> > -- reg : Physical base address of the video codec registers and
> > length of
> > -  memory mapped region.
> > -- interrupts : interrupt number to the cpu.
> > -- mediatek,larb : must contain the local arbiters in the current
> > Socs.
> > -- clocks : list of clock specifiers, corresponding to entries in
> > -  the clock-names property.
> > -- clock-names: avc encoder must contain "venc_sel", vp8 encoder
> > must
> > -  contain "venc_lt_sel", decoder must contain "vcodecpll",
> > "univpll_d2",
> > -  "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
> > "venc_lt_sel",
> > -  "vdec_bus_clk_src".
> > -- iommus : should point to the respective IOMMU block with master
> > port as
> > -  argument, see
> > Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > -  for details.
> > -- dma-ranges : describes the dma address range space that the
> > codec hw access.
> > -One of the two following nodes:
> > -- mediatek,vpu : the node of the video processor unit, if using
> > VPU.
> > -- mediatek,scp : the node of the SCP unit, if using SCP.
> > -
> > -
> > -Example:
> > -
> > -vcodec_dec: vcodec@16000000 {
> > -    compatible = "mediatek,mt8173-vcodec-dec";
> > -    reg = <0 0x16000000 0 0x100>,   /*VDEC_SYS*/
> > -          <0 0x16020000 0 0x1000>,  /*VDEC_MISC*/
> > -          <0 0x16021000 0 0x800>,   /*VDEC_LD*/
> > -          <0 0x16021800 0 0x800>,   /*VDEC_TOP*/
> > -          <0 0x16022000 0 0x1000>,  /*VDEC_CM*/
> > -          <0 0x16023000 0 0x1000>,  /*VDEC_AD*/
> > -          <0 0x16024000 0 0x1000>,  /*VDEC_AV*/
> > -          <0 0x16025000 0 0x1000>,  /*VDEC_PP*/
> > -          <0 0x16026800 0 0x800>,   /*VP8_VD*/
> > -          <0 0x16027000 0 0x800>,   /*VP6_VD*/
> > -          <0 0x16027800 0 0x800>,   /*VP8_VL*/
> > -          <0 0x16028400 0 0x400>;   /*VP9_VD*/
> > -    interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
> > -    mediatek,larb = <&larb1>;
> > -    iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
> > -             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
> > -             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
> > -             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
> > -             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
> > -             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
> > -             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
> > -             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
> > -    mediatek,vpu = <&vpu>;
> > -    power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
> > -    clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
> > -             <&topckgen CLK_TOP_UNIVPLL_D2>,
> > -             <&topckgen CLK_TOP_CCI400_SEL>,
> > -             <&topckgen CLK_TOP_VDEC_SEL>,
> > -             <&topckgen CLK_TOP_VCODECPLL>,
> > -             <&apmixedsys CLK_APMIXED_VENCPLL>,
> > -             <&topckgen CLK_TOP_VENC_LT_SEL>,
> > -             <&topckgen CLK_TOP_VCODECPLL_370P5>;
> > -    clock-names = "vcodecpll",
> > -                  "univpll_d2",
> > -                  "clk_cci400_sel",
> > -                  "vdec_sel",
> > -                  "vdecpll",
> > -                  "vencpll",
> > -                  "venc_lt_sel",
> > -                  "vdec_bus_clk_src";
> > -    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
> > -                      <&topckgen CLK_TOP_CCI400_SEL>,
> > -                      <&topckgen CLK_TOP_VDEC_SEL>,
> > -                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
> > -                      <&apmixedsys CLK_APMIXED_VENCPLL>;
> > -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
> > -                             <&topckgen CLK_TOP_UNIVPLL_D2>,
> > -                             <&topckgen CLK_TOP_VCODECPLL>;
> > -    assigned-clock-rates = <0>, <0>, <0>, <1482000000>,
> > <800000000>;
> > -  };
> > -
> > -vcodec_enc_avc: vcodec@18002000 {
> > -    compatible = "mediatek,mt8173-vcodec-enc";
> > -    reg = <0 0x18002000 0 0x1000>;
> > -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> > -    iommus = <&iommu M4U_PORT_VENC_RCPU>,
> > -             <&iommu M4U_PORT_VENC_REC>,
> > -             <&iommu M4U_PORT_VENC_BSDMA>,
> > -             <&iommu M4U_PORT_VENC_SV_COMV>,
> > -             <&iommu M4U_PORT_VENC_RD_COMV>,
> > -             <&iommu M4U_PORT_VENC_CUR_LUMA>,
> > -             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> > -             <&iommu M4U_PORT_VENC_REF_LUMA>,
> > -             <&iommu M4U_PORT_VENC_REF_CHROMA>,
> > -             <&iommu M4U_PORT_VENC_NBM_RDMA>,
> > -             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> > -    mediatek,larb = <&larb3>;
> > -    mediatek,vpu = <&vpu>;
> > -    clocks = <&topckgen CLK_TOP_VENC_SEL>;
> > -    clock-names = "venc_sel";
> > -    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> > -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> > -  };
> > -
> > -vcodec_enc_vp8: vcodec@19002000 {
> > -    compatible = "mediatek,mt8173-vcodec-enc-vp8";
> > -    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> > -    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > -    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> > -             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> > -             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> > -             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> > -             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> > -             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> > -             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> > -             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> > -             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> > -    mediatek,larb = <&larb5>;
> > -    mediatek,vpu = <&vpu>;
> > -    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> > -    clock-names = "venc_lt_sel";
> > -    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> > -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> > -  };
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
