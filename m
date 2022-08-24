Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5E8C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 03:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjD3LogDmmdKOofit0hgff1su7/YYUzgpQbq+9yo7EU=; b=sfPz3yyT53EdiK9r1eT+uDW38D
	GC1jAkPVwjQiw8vKEo0zG977TaxwbLO4yafp0Tx3h80JWynCWLkoEiCfzvV1gh8tCm+CUphT9wgvf
	kP3bVd8qXV3lH4ccmNMRgog4f/8MYKEyGRDmlJFR21q+hke/axdTqMCU1BZjZ0eHmdYGravvNrxbF
	EBNdz+LSSXA4jof39esrsGlw8HPnlC06hKBsd77+BOQh+jiIFvi3wTe6FxoySeNYRRmH1qm+Be5zn
	d7+XrLUSJIf0nSdrLkk/bAnv0tR2MVEOLTZdmaaUYpW75QNlHg40WGbmYFikZnkHHsceqpGwDAX5n
	4yh0T6xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQhY5-00ANN6-RH; Wed, 24 Aug 2022 03:59:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQhY2-00ANKN-Gf; Wed, 24 Aug 2022 03:59:24 +0000
X-UUID: 8bb4091f1d2b486ebb847fce1fc41786-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=fjD3LogDmmdKOofit0hgff1su7/YYUzgpQbq+9yo7EU=;
	b=kmipYm27bZfpJ3X/PAdDsQyk8dY+ruwzKM1y3585IcVfePthEQ4qk9/8xTR95dSQjuX1UJY7aRKRB+PC9dHAFl8YaRu4S4csBfyAMBaZQKBSKYHH0XWrglLNxPpYB56DUZiFfpzndCVyiXbTQhJZs9lk9zDRC50uVMMK4ho/Rf8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:e2f85898-a92c-444a-bc59-841a53c97a4e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:375b9cc9-6b09-4f60-bf82-12f039f5d530,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8bb4091f1d2b486ebb847fce1fc41786-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1618619516; Tue, 23 Aug 2022 20:59:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 24 Aug 2022 10:57:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 10:57:06 +0800
Message-ID: <33c51b1486a590b1720e30e5ff0d536c1a869ebc.camel@mediatek.com>
Subject: Re: [V12,1/7] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc
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
Date: Wed, 24 Aug 2022 10:57:06 +0800
In-Reply-To: <20220816162700.GA2325543-robh@kernel.org>
References: <20220729062630.5592-1-irui.wang@mediatek.com>
	 <20220729062630.5592-2-irui.wang@mediatek.com>
	 <20220816162700.GA2325543-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_205922_585497_1EE867C3 
X-CRM114-Status: GOOD (  22.89  )
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

On Tue, 2022-08-16 at 10:27 -0600, Rob Herring wrote:
> On Fri, Jul 29, 2022 at 02:26:24PM +0800, Irui Wang wrote:
> > From: kyrie wu <kyrie.wu@mediatek.com>
> > 
> > Add mediatek,mt8195-jpgenc compatible to binding document.
> > 
> > Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> > Signed-off-by: irui wang <irui.wang@mediatek.com>
> > ---
> >  .../media/mediatek,mt8195-jpegenc.yaml        | 139
> > ++++++++++++++++++
> >  1 file changed, 139 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > new file mode 100644
> > index 000000000000..d9133e6a92f8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > @@ -0,0 +1,139 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml*__;Iw!!CTRNKA9wMg0ARbw!2Zllp66y0PU_FYmJ_GNToJz_QvY0NLV8Ke-7weYJKRlMc0K4_B3COEgdXU2rEvWz$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2Zllp66y0PU_FYmJ_GNToJz_QvY0NLV8Ke-7weYJKRlMc0K4_B3COEgdXW8-wxBQ$
> >  
> > +
> > +title: MediaTek JPEG Encoder Device Tree Bindings
> > +
> > +maintainers:
> > +  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> > +
> > +description:
> > +  MediaTek JPEG Encoder is the JPEG encode hardware present in
> > MediaTek SoCs
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt8195-jpgenc
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 4
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
> > +  "^jpgenc@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      The jpeg encoder hardware device node which should be added
> > as subnodes to
> > +      the main jpeg node.
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mt8195-jpgenc-hw
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
> > +          - const: jpgenc
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
> > +        jpgenc_master {
> > +                compatible = "mediatek,mt8195-jpgenc";
> > +                power-domains = <&spm
> > MT8195_POWER_DOMAIN_VENC_CORE1>;
> > +                iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
> > +                <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
> > +                <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
> > +                <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
> > +                #address-cells = <2>;
> > +                #size-cells = <2>;
> 
> Same issue here as the decoder.
Thanks.
It will be updated in the next version.



