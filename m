Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E37C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G78tbKsY34Jkv0NbT6vMTYdENqEuS8DWTZLrQZRdDH4=; b=HJNyXapYa24ICE
	o7uO2syN+OEzIBjY3gF882X02h52Iycy7jIk0r8b6uKvFogYE0RO5qGYhjEGpgQpIWh8zJ0MA0FLI
	nc9Y8+sx+OExm+998ukHlS8/5JbZdsyr0UM5C6z+g27l87h7eyJ7TSReRa7oB8zshBZk6xV08GblN
	7Qa7qgtbqRf3WTmklyKx15AAxtUuIsa2JKy6T67NwaF+Y37ePW4KT7EbmeeJvAIDqCPCSvxwM260R
	Qa7pcufaCHmXDlELw4g4Sfq9ZKlz4x1vw5v9Ty29Yvic2mDxs2Vh1TTl/+O8e0o4mz5UM1e+MJXrI
	aZopOEAlkFgI/Q/XkiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJwDP-002Zku-EO; Tue, 15 Feb 2022 11:41:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJwDL-002ZkU-Jd; Tue, 15 Feb 2022 11:41:49 +0000
X-UUID: 65da91ea6ca1475aac1ae6407dc47faa-20220215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AQ/QiiGwfcsqOnhEhtziyD3NlWpQb2Dd3UtsxOCu00Q=; 
 b=GfJlMsL6qb4v6hS+6wN8VYCr/WLQb/f+kMR/pIlaUkXaPhnFzIi1pn4H6uST1k+hk4l/MsYV+EAyN14+tJIsXpGioh9EX3rw3VpG1N8eF+6YBXQeEul2YAMJB/pvr3yhQJULMO/IEfS0NnDXc5cF7cRR1ybd4PilBInlMMWJWd0=;
X-UUID: 65da91ea6ca1475aac1ae6407dc47faa-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1308149837; Tue, 15 Feb 2022 04:41:45 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 03:31:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 19:31:41 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 19:31:40 +0800
Message-ID: <421013a38c3bb4452fefe83ffdcb4cbdb4c1e0e6.camel@mediatek.com>
Subject: Re: [PATCH v2, 03/10] dt-bindings: media: mtk-vcodec: Adds encoder
 cores dt-bindings for mt8195
From: Irui Wang <irui.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 Yong Wu <yong.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 15 Feb 2022 19:31:40 +0800
In-Reply-To: <YegV1SQ7V/F3GAFL@robh.at.kernel.org>
References: <20220117120615.21687-1-irui.wang@mediatek.com>
 <20220117120615.21687-4-irui.wang@mediatek.com>
 <YegV1SQ7V/F3GAFL@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_034147_685917_085FD14E 
X-CRM114-Status: GOOD (  32.62  )
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

Dear Rob,

Many thanks for your review comments.

On Wed, 2022-01-19 at 07:44 -0600, Rob Herring wrote:
> On Mon, Jan 17, 2022 at 08:06:08PM +0800, Irui Wang wrote:
> > Adds encoder cores dt-bindings for mt8195
> > 
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > ---
> >  .../media/mediatek,vcodec-encoder-core.yaml   | 214
> > ++++++++++++++++++
> >  1 file changed, 214 insertions(+)
> >  create mode 100644
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
> 
> 'phandle' is already 1 item. Drop.

Do you mean delete "maxItems: 1"? we will delete in next version.
>  
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
> Address should generally not be defined in the node name schema:
> 
> '^venc-core0@'
> 
> Though I think you should also drop the '0' here. The unit-address
> is 
> enough to distinguish each instance. Then the schemas for each child 
> node can be combined.

Thanks, we will rename it in next version.
> 
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mtk-venc-core0
> 
> Is the programming model for each core the same, but just different 
> codecs implemented? I'd just add a property to indicate which codec
> if 
> that's not discoverable.
> 
Core-0 and Core-1 are two different encoder hardware, they have their
own hardware, used irq/clock/power...So, we need add two model nodes, a
"property" may not distinguish the two encoder hardware.
> > +
> > +      reg:
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
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      clocks:
> > +        maxItems: 1
> > +
> > +      clock-names:
> > +        items:
> > +          - const: MT_CG_VENC0
> 
> The name is supposed to be local to the instance reflecting what the 
> clock drives rather than a top-level or clock controller name.
> Lowercase 
> is also the norm. Given there's only 1 clock, I'd just drop the name.
Thanks, we will rename it in next version, but we need parse clock info
by "clock-names"(of_property_count_strings), so maybe we can't drop it.
> 
> > +
> > +      assigned-clocks:
> > +        maxItems: 1
> > +
> > +      assigned-clock-parents:
> > +        maxItems: 1
> 
> These are always allowed and shouldn't be required.
Do you mean we can not write this two properties here? we will try to
delete them in next version.

Thanks
BRs
> 
> > +
> > +      power-domains:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - iommus
> > +      - interrupts
> > +      - clocks
> > +      - clock-names
> > +      - assigned-clocks
> > +      - assigned-clock-parents
> > +      - power-domains
> > +
> > +    additionalProperties: false
> > +
> > +  "venc_core1@1b020000":
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mtk-venc-core1
> > +
> > +      reg:
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
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      clocks:
> > +        maxItems: 1
> > +
> > +      clock-names:
> > +        items:
> > +          - const: MT_CG_VENC1
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
> > +      - iommus
> > +      - interrupts
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
> > -- 
> > 2.18.0
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
