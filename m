Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 01:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHgRrKezH6gSxCJeZDE5GNTpQxFdIs1sXn1XHEiGjw8=; b=rUBCtCsCX3EYZH
	5z4yKB2rcc58kVuZ5XWNHyyK/PXm1whWHjyWiY1k3dzeij4NKeXADP7GxaIEFAJvc1ZtZZxAzs1G/
	uRb/5gYFiOaldEICSKu8qMqg23GOXlDC+t/aN9SzOLuthyoHtE2TKMmJidSficUOxsFR8uHD7nipx
	rCmBzMb7/8ZPFJf2BFORbn85xrFuDl+ZEUeecdpbBBrwLlyRGcnVcLCmdwkKsUWmL663ZJGljUwpi
	qQkAiNpaCqv05Q1dlrdKbG+hJWH2wlMA8SA+To5/yplsxanEwT5uIITW4j1rGx9AYV3lrEvjMdTjm
	qDClQH0OQ45UL38eykeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njWZb-00GtfD-R8; Wed, 27 Apr 2022 01:34:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njWZP-00Gte8-8X; Wed, 27 Apr 2022 01:34:22 +0000
X-UUID: 68078042ad5c403ab68aa65e2753fe79-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:441f64a6-1fbd-4b3a-a9f2-c0414c99f9eb, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:f57bcf2e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 68078042ad5c403ab68aa65e2753fe79-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1643746812; Tue, 26 Apr 2022 18:34:12 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 18:34:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 09:34:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 09:34:02 +0800
Message-ID: <30b00fffe6f3398edc6d94679cbfba55ddafc57f.camel@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Rex-BC Chen <rex-bc.chen@mediatek.com>
CC: <krzysztof.kozlowski+dt@linaro.org>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Apr 2022 09:33:57 +0800
In-Reply-To: <YmhVKw/FQ/iQfLLD@robh.at.kernel.org>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-4-rex-bc.chen@mediatek.com>
 <YmhVKw/FQ/iQfLLD@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_183419_333549_AA9F06E5 
X-CRM114-Status: GOOD (  29.53  )
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

Thanks for the review.

On Tue, 2022-04-26 at 15:25 -0500, Rob Herring wrote:
> On Tue, Apr 19, 2022 at 11:32:35AM +0800, Rex-BC Chen wrote:
> > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > 
> > Add vdosys1 RDMA definition.
> 
> How does this compare to the mediatek,mt8183-mdp3-rdma or 
> mediatek,mt8195-disp-rdma?
> 

1. The mediatek,mt8195-vdo1-rdma is a completely different HW engine
with mediatek,mt8195-disp-rdma.
2. The mediatek,mt8195-vdo1-rdma is similar to mt8183-mdp3-rdma but
with different compression support and tile size.

Regards,
Nancy

> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../display/mediatek/mediatek,mdp-rdma.yaml   | 86
> > +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > new file mode 100644
> > index 000000000000..6ab773569462
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mdp-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!2wDOMpaEiBxKqnxB_Ocy9EiZEBgMnMmhgp0QxtKsUv2WjEbcBxe1P0gILWVkqZ2k$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2wDOMpaEiBxKqnxB_Ocy9EiZEBgMnMmhgp0QxtKsUv2WjEbcBxe1P0gILfySwMCt$
> >  
> > +
> > +title: MediaTek MDP RDMA
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +
> > +description: |
> > +  The mediatek MDP RDMA stands for Read Direct Memory Access.
> > +  It provides real time data to the back-end panel driver, such as
> > DSI,
> > +  DPI and DP_INTF.
> > +  It contains one line buffer to store the sufficient pixel data.
> > +  RDMA device node must be siblings to the central MMSYS_CONFIG
> > node.
> > +  For a description of the MMSYS_CONFIG binding, see
> > +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya
> > ml for details.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: mediatek,mt8195-vdo1-rdma
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    description: A phandle and PM domain specifier as defined by
> > bindings of
> > +      the power controller specified by phandle. See
> > +      Documentation/devicetree/bindings/power/power-domain.yaml
> > for details.
> > +
> > +  clocks:
> > +    items:
> > +      - description: RDMA Clock
> > +
> > +  iommus:
> > +    description:
> > +      This property should point to the respective IOMMU block
> > with master port as argument,
> > +      see
> > Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
> > details.
> > +
> > +  mediatek,gce-client-reg:
> > +    description:
> > +      The register of display function block to be set by gce.
> > There are 4 arguments,
> > +      such as gce node, subsys id, offset and register size. The
> > subsys id that is
> > +      mapping to the register of display function blocks is
> > defined in the gce header
> > +      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - power-domains
> > +  - clocks
> > +  - iommus
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +    #include <dt-bindings/gce/mt8195-gce.h>
> > +    #include <dt-bindings/memory/mt8195-memory-port.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        vdo1_rdma0: mdp-rdma@1c104000 {
> > +            compatible = "mediatek,mt8195-vdo1-rdma";
> > +            reg = <0 0x1c104000 0 0x1000>;
> > +            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> > +            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > +            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> > +            mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX
> > 0x4000 0x1000>;
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
