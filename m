Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F6AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 08:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9VGFRznzUx1kqeZPvBRbVX/Qo+lOxtO36hZ38LAE6A=; b=aaZXCclRzZQjPL
	LN87Kd3ie7MJUdbaXGA4XPmyspUlYOloiXZ12tHUs5gM60q6bJMDSTg+ZWjBF/x1gsiNiatphIBdx
	uCnmibMuVlx9iI16YIZfk2ebwDZ/EnA1D/Xur9ETaEOrbTyNfv9x9EDBKglQ/xOYkfuWGYyULTxpp
	qsllt/+I2/H0smwnHe7NMDYF98Ta7ByiHlQbVWNxuf4YLdlzvQexqYppBJXif8GpFv7So+jZM6yYv
	ELVt9hnhGOZb2I3JiG2uAnJJeW61nUk/elWWJMVXQ/utNDYq36MuKcgH8Bzqb+tDTvWY+mN7PGVZ6
	PELjZx8gwigg+U+RXIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwgln-008J1f-2Y; Mon, 13 Dec 2021 08:33:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwglX-008IxL-Qc; Mon, 13 Dec 2021 08:33:01 +0000
X-UUID: 5f1dad273cd84438862d4d68eac425b4-20211213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VqN44xeo5LvrcQCH8nOqwMnATk8LRZ9hZSYuxrOxs8k=; 
 b=TTkU3R5KHlKSJJrJGQqbs9DPcXKcXIGppsKLc9S8q560++UFLPK7vBRcsFr4FX/9EkvD6dzgkxicBiwnIxIxBq08J/v++DIGBKw4sWjihoLGCqr9WTddMQn4bEbLPtckwSyEL4d5deO3bKaqg3/mMsC3DXO9QObr5ITxMoinHUU=;
X-UUID: 5f1dad273cd84438862d4d68eac425b4-20211213
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 48505186; Mon, 13 Dec 2021 01:32:54 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Dec 2021 00:32:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Dec 2021 16:32:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Dec 2021 16:32:38 +0800
Message-ID: <46fa090f9d6f02a0dea8bc3043777faff46bdf10.camel@mediatek.com>
Subject: Re: [PATCH v12, 15/19] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 13 Dec 2021 16:32:40 +0800
In-Reply-To: <YbOFBMyABgTfTMM7@robh.at.kernel.org>
References: <20211202034544.2750-1-yunfei.dong@mediatek.com>
 <20211202034544.2750-16-yunfei.dong@mediatek.com>
 <YbOFBMyABgTfTMM7@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_003259_880234_4DE650F8 
X-CRM114-Status: GOOD (  27.62  )
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

Hi Rob,

Thanks for your suggestion.
On Fri, 2021-12-10 at 10:49 -0600, Rob Herring wrote:
> On Thu, Dec 02, 2021 at 11:45:40AM +0800, Yunfei Dong wrote:
> > Adds decoder dt-bindings for mt8192.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 266
> > ++++++++++++++++++
> >  1 file changed, 266 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > new file mode 100644
> > index 000000000000..67cbcf8b3373
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > subdev-decoder.yaml
> > @@ -0,0 +1,266 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: "
> > http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
> > "
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Mediatek Video Decode Accelerator With Multi Hardware
> > +
> > +maintainers:
> > +  - Yunfei Dong <yunfei.dong@mediatek.com>
> > +
> > +description: |
> > +  Mediatek Video Decode is the video decode hardware present in
> > Mediatek
> > +  SoCs which supports high resolution decoding functionalities.
> > Required
> > +  parent and child device node.
> > +
> > +  About the Decoder Hardware Block Diagram, please check below:
> > +
> > +    +---------------------------------+---------------------------
> > ---------+
> > +    |                                 |                           
> >          |
> > +    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW
> > -> output |
> > +    |            ||                   |                     ||    
> >          |
> > +    +------------||-------------------+---------------------||--
> > -----------+
> > +              lat workqueue           |              core
> > workqueue     <parent>
> > +    -------------||-----------------------------------------||--
> > ----------------
> > +                 ||                                         ||    
> >       <child>
> > +                 \/ <----------------HW index-------------->\/
> > +           +----------------------------------------------------
> > --+
> > +           |                    enable/disable                    
> > |
> > +           |           clk     power    irq    iommu              
> > |
> > +           |                 (lat/lat
> > soc/core0/core1)            |
> > +           +----------------------------------------------------
> > --+
> > +
> > +  As above, there are parent and child devices, child mean each
> > hardware. The child device
> > +  controls the information of each hardware independent which
> > include clk/power/irq.
> > +
> > +  There are two workqueues in parent device: lat workqueue and
> > core workqueue. They are used
> > +  to lat and core hardware deocder. Lat workqueue need to get
> > input bitstream and lat buffer,
> > +  then enable lat to decode, writing the result to lat buffer,
> > dislabe hardware when lat decode
> > +  done. Core workqueue need to get lat buffer and output buffer,
> > then enable core to decode,
> > +  writing the result to output buffer, disable hardware when core
> > decode done. These two
> > +  hardwares will decode each frame cyclically.
> > +
> > +  For the smi common may not the same for each hardware, can't
> > combine all hardware in one node,
> > +  or leading to iommu fault when access dram data.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8192-vcodec-dec
> > +
> > +  reg:
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
> > +  mediatek,scp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description: |
> > +      The node of system control processor (SCP), using
> > +      the remoteproc & rpmsg framework.
> > +      $ref: /schemas/remoteproc/mtk,scp.yaml
> 
> '$ref' is not valid here. Just 'See remoteproc/mtk,scp.yaml'
> 
Remove this line.
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
> > +  vcodec-lat:
> 
> '^vcodec-lat@[0-9a-f]+$':
> 
Fix in v13.
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mtk-vcodec-lat
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      iommus:
> > +        minItems: 1
> > +        maxItems: 32
> > +        description: |
> > +          List of the hardware port in respective IOMMU block for
> > current Socs.
> > +          Refer to bindings/iommu/mediatek,iommu.yaml.
> > +
> > +      clocks:
> > +        maxItems: 5
> > +
> > +      clock-names:
> > +        items:
> > +          - const: sel
> > +          - const: soc-vdec
> > +          - const: soc-lat
> > +          - const: vdec
> > +          - const: top
> > +
> > +      assigned-clocks:
> > +        maxItems: 1
> > +
> > +      assigned-clock-parents:
> > +        maxItems: 1
> > +
> > +      power-domains:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - interrupts
> > +      - iommus
> > +      - clocks
> > +      - clock-names
> > +      - assigned-clocks
> > +      - assigned-clock-parents
> > +      - power-domains
> > +
> > +    additionalProperties: false
> > +
> > +  vcodec-core:
> 
> Same here.
Fix in v13.

Thanks,
Yunfei Dong
> 
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mtk-vcodec-core
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      iommus:
> > +        minItems: 1
> > +        maxItems: 32
> > +        description: |
> > +          List of the hardware port in respective IOMMU block for
> > current Socs.
> > +          Refer to bindings/iommu/mediatek,iommu.yaml.
> > +
> > +      clocks:
> > +        maxItems: 5
> > +
> > +      clock-names:
> > +        items:
> > +          - const: sel
> > +          - const: soc-vdec
> > +          - const: soc-lat
> > +          - const: vdec
> > +          - const: top
> > +
> > +      assigned-clocks:
> > +        maxItems: 1
> > +
> > +      assigned-clock-parents:
> > +        maxItems: 1
> > +
> > +      power-domains:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - interrupts
> > +      - iommus
> > +      - clocks
> > +      - clock-names
> > +      - assigned-clocks
> > +      - assigned-clock-parents
> > +      - power-domains
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - iommus
> > +  - mediatek,scp
> > +  - dma-ranges
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/memory/mt8192-larb-port.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/mt8192-clk.h>
> > +    #include <dt-bindings/power/mt8192-power.h>
> > +
> > +    video-codec@16000000 {
> > +        compatible = "mediatek,mt8192-vcodec-dec";
> > +        mediatek,scp = <&scp>;
> > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges = <0 0x16000000 0x40000>;
> > +        reg = <0x16000000 0x1000>;		/* VDEC_SYS */
> > +        vcodec-lat@10000 {
> > +            compatible = "mediatek,mtk-vcodec-lat";
> > +            reg = <0x10000 0x800>;
> > +            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +                <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> > +                <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> > +                <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> > +                <&topckgen CLK_TOP_MAINPLL_D4>;
> > +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec",
> > "top";
> > +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > +            assigned-clock-parents = <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> > +        };
> > +
> > +        vcodec-core@25000 {
> > +            compatible = "mediatek,mtk-vcodec-core";
> > +            reg = <0x25000 0x1000>;
> > +            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +                <&vdecsys CLK_VDEC_VDEC>,
> > +                <&vdecsys CLK_VDEC_LAT>,
> > +                <&vdecsys CLK_VDEC_LARB1>,
> > +                <&topckgen CLK_TOP_MAINPLL_D4>;
> > +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec",
> > "top";
> > +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > +            assigned-clock-parents = <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> > +        };
> > +    };
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
