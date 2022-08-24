Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A517C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 03:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1nIimLu3wQjF4qga7/eWi7jjBBWlPMJ7WVfpggKY10=; b=WyRMhijNfh0xrCnT2mfmf/qv/2
	U6ArVi5fFQaADX+nViTLJ4NCFdxjSNgMHM/HzFbB4NerW8SvrNekbjIi/hBno1eu7RKlnyDM07e94
	GXVvn4+Nd4uwcBPsxXtpcjmUrw21Rvxx7rn5lYPQmhfAEp7XzAsFLEvPeSq9n9EKiZaxcsnmZGaPP
	yTyAjbq1bUJr/2uUJcKPtmU6wjJRRhb1OmLeeKjQCqpa26K8T1oK2dyHIVd0itK6NXOHkYgl2ve5S
	u5Prr7zv61Vbp8g1tzRfXYb53RSBjGmHqWes7P91jnq2hO4MWYzquJy2E7J5WGu1QSbxogzvGmDx0
	apF4f08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQhCA-00AHLK-Ju; Wed, 24 Aug 2022 03:36:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQhC6-00AHKE-RM; Wed, 24 Aug 2022 03:36:45 +0000
X-UUID: b953857492a64212839c15177f660645-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=X1nIimLu3wQjF4qga7/eWi7jjBBWlPMJ7WVfpggKY10=;
	b=QPGL54ps29j+L+NAH50wwtTdG5HN7mmMssXTwItIy+w6i/bV8rrraGMLm9Tjzn945HbYMCX/3XnIL7KBQnzzKm6di+S3SFHkQFKD7WYfukQSZp1qAYKCm1COhhir/yTQ8G6ddEX+UHmZALjYaX3jfT9QF2yR6PJnhqtUNZZwu8I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:52dd86e9-58b3-4abe-ab55-52a82bea545c,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:34d91e68-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b953857492a64212839c15177f660645-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1866675053; Tue, 23 Aug 2022 20:36:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 10:55:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 10:55:47 +0800
Message-ID: <3bfcb67122985c64f9f4c7fae5d158d3e6dffa65.camel@mediatek.com>
Subject: Re: [V6,1/8] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec
 compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Irui Wang <irui.wang@mediatek.com>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>
Date: Wed, 24 Aug 2022 10:55:47 +0800
In-Reply-To: <20220816162605.GA2315090-robh@kernel.org>
References: <20220729062603.5533-1-irui.wang@mediatek.com>
	 <20220729062603.5533-2-irui.wang@mediatek.com>
	 <20220816162605.GA2315090-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_203642_909312_725D25EF 
X-CRM114-Status: GOOD (  25.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-08-16 at 10:26 -0600, Rob Herring wrote:
> On Fri, Jul 29, 2022 at 02:25:56PM +0800, Irui Wang wrote:
> > From: kyrie wu <kyrie.wu@mediatek.com>
> > 
> > Add mediatek,mt8195-jpgdec compatible to binding document.
> > 
> > Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> > Signed-off-by: irui wang <irui.wang@mediatek.com>
> > ---
> >  .../media/mediatek,mt8195-jpegdec.yaml        | 160
> > ++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegdec.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegdec.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegdec.yaml
> > new file mode 100644
> > index 000000000000..ebda0ade8153
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegdec.yaml
> > @@ -0,0 +1,160 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml*__;Iw!!CTRNKA9wMg0ARbw!wMCZMPkHo2OpWyVWzw9r160qgCEZs9n6F3asqUcb2OqKXlrHCEAZCbpdjjhXD0JV$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!wMCZMPkHo2OpWyVWzw9r160qgCEZs9n6F3asqUcb2OqKXlrHCEAZCbpdjlBqY8-5$
> >  
> > +
> > +title: MediaTek JPEG Encoder Device Tree Bindings
> > +
> > +maintainers:
> > +  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> > +
> > +description:
> > +  MediaTek JPEG Decoder is the JPEG decode hardware present in
> > MediaTek SoCs
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt8195-jpgdec
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 6
> > +    description:
> > +      Points to the respective IOMMU block with master port as
> > argument, see
> > +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > for details.
> > +      Ports are according to the HW.
> > +
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 2
> > +
> > +  ranges: true
> > +
> > +# Required child node:
> > +patternProperties:
> > +  "^jpgdec@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      The jpeg decoder hardware device node which should be added
> > as subnodes to
> > +      the main jpeg node.
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mt8195-jpgdec-hw
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      iommus:
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
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
> > +          - const: jpgdec
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
> > +      - power-domains
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - power-domains
> > +  - iommus
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
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        jpgdec_master {
> > +                compatible = "mediatek,mt8195-jpgdec";
> > +                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
> > +                iommus = <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA0>,
> > +                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA0>,
> > +                     <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA1>,
> > +                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA1>,
> > +                     <&iommu_vpp
> > M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
> > +                     <&iommu_vpp
> > M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
> > +                #address-cells = <2>;
> > +                #size-cells = <2>;
> > +
> 
> Missing ranges.
> 
> Presumably at least 1 child node is required because there's no
> 'reg' 
> property in the parent to access the h/w. So 'ranges', "#address-
> cells', 
> and '#size-cells' should all be required.

Hello Rob,
Thanks for explanation why needs ranges.
I will add it in the next version.

Regards,
Kyrie.
> 
> > +                jpgdec@1a040000 {
> > +                    compatible = "mediatek,mt8195-jpgdec-hw";
> > +                    reg = <0 0x1a040000 0 0x10000>;/* JPGDEC_C0 */
> > +                    iommus = <&iommu_vdo
> > M4U_PORT_L19_JPGDEC_WDMA0>,
> > +                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
> > +                        <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
> > +                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
> > +                        <&iommu_vdo
> > M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
> > +                        <&iommu_vdo
> > M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
> > +                    interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +                    clocks = <&vencsys CLK_VENC_JPGDEC>;
> > +                    clock-names = "jpgdec";
> > +                    power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDEC0>;
> > +                };
> > +
> > +                jpgdec@1a050000 {
> > +                    compatible = "mediatek,mt8195-jpgdec-hw";
> > +                    reg = <0 0x1a050000 0 0x10000>;/* JPGDEC_C1 */
> > +                    iommus = <&iommu_vdo
> > M4U_PORT_L19_JPGDEC_WDMA0>,
> > +                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
> > +                        <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
> > +                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
> > +                        <&iommu_vdo
> > M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
> > +                        <&iommu_vdo
> > M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
> > +                    interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +                    clocks = <&vencsys CLK_VENC_JPGDEC_C1>;
> > +                    clock-names = "jpgdec";
> > +                    power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDEC1>;
> > +                };
> > +
> > +                jpgdec@1b040000 {
> > +                    compatible = "mediatek,mt8195-jpgdec-hw";
> > +                    reg = <0 0x1b040000 0 0x10000>;/* JPGDEC_C2 */
> > +                    iommus = <&iommu_vpp
> > M4U_PORT_L20_JPGDEC_WDMA0>,
> > +                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
> > +                        <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
> > +                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA1>,
> > +                        <&iommu_vpp
> > M4U_PORT_L20_JPGDEC_BUFF_OFFSET1>,
> > +                        <&iommu_vpp
> > M4U_PORT_L20_JPGDEC_BUFF_OFFSET0>;
> > +                    interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +                    clocks = <&vencsys_core1
> > CLK_VENC_CORE1_JPGDEC>;
> > +                    clock-names = "jpgdec";
> > +                    power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDEC2>;
> > +                };
> > +        };
> > +    };
> > -- 
> > 2.18.0
> > 
> > 


