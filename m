Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE40C04A95
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 01:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlzPHM5IdZ3/EuYV5AyJqFCsb1bC/0Wka2s9i6nHwUI=; b=JVvurpBH5nO48w0LB5cVlUDQ2v
	ePyiQZMEXAsXe2W25id3vcjEP2N6KShJxXOO7LkQi/SEqcu/YZnWMO+IZ/No08T0MdsGcoWBf2EY5
	6Pw0N000EzBXJmRBpkIbZCEKNEYEII7YhoGSeIZe781z+SR4WLSASFv35/IMrpUDSY/Rxgi1n+SZR
	BzbkO22L6pZtLndqtOftz+PuI7F67RmFJ7ovXs3Dgd8Q5BOpisDzlhdAlt9xfECNVfcuYZfI49ES1
	T5rBqz24wlXgyi2YNteJfWf8M3/lPqq7z5zzqFrMDdZNqn11GZ5phsRQxvZMqWr0qbK98VEN5SYEY
	roB6iDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocdN5-000tmG-AM; Mon, 26 Sep 2022 01:57:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocdMr-000tiJ-Mj; Mon, 26 Sep 2022 01:57:11 +0000
X-UUID: b947aaca91944caaa4608af048d90788-20220925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=NlzPHM5IdZ3/EuYV5AyJqFCsb1bC/0Wka2s9i6nHwUI=;
	b=Q2pwbNoIugprk6L+lJCWEIA43OtHZXUbCBOEnhe8mSCgsub7uFMk6p3OTHIuhhf7WVL+bQWZ9fWKMEUQDg67UlHkXXycBWOQvvH5/fo1h8a5gHa4S6C/OEoBOTM/X/UYKp34T405zLMwh2IG1o98x+oCAhX1t4wHDMOF0MYjX2E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b773e7a4-2a17-4f9e-841a-60015a0d0a2e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.11,REQID:b773e7a4-2a17-4f9e-841a-60015a0d0a2e,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:39a5ff1,CLOUDID:99ac2ae4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:220923192911ZIWII079,BulkQuantity:68,Recheck:0,SF:38|28|17|19|48,TC:
	nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: b947aaca91944caaa4608af048d90788-20220925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 863274480; Sun, 25 Sep 2022 18:56:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 26 Sep 2022 09:56:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 09:56:22 +0800
Message-ID: <f0b80a0d60172e9c286c0cd3b599875a345ae4f0.camel@mediatek.com>
Subject: Re: [V14,08/15] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec
 compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Irui Wang <irui.wang@mediatek.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, Rob Herring
	<robh@kernel.org>
Date: Mon, 26 Sep 2022 09:56:22 +0800
In-Reply-To: <3bbdfb31-2ba2-7345-54c7-82a67d95e30f@kernel.org>
References: <20220915064337.2686-1-irui.wang@mediatek.com>
	 <20220915064337.2686-9-irui.wang@mediatek.com>
	 <3bbdfb31-2ba2-7345-54c7-82a67d95e30f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_185709_776017_56076CC1 
X-CRM114-Status: GOOD (  28.16  )
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

On Fri, 2022-09-23 at 13:28 +0200, Krzysztof Kozlowski wrote:
> On 15/09/2022 08:43, Irui Wang wrote:
> > From: kyrie wu <kyrie.wu@mediatek.com>
> > 
> > Add mediatek,mt8195-jpgdec compatible to binding document.
> 
> Use scripts/get_maintainers.pl to CC all maintainers and relevant
> mailing lists.
> 
> > 
> > Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> > Signed-off-by: irui wang <irui.wang@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../media/mediatek,mt8195-jpegdec.yaml        | 169
> > ++++++++++++++++++
> >  1 file changed, 169 insertions(+)
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
> > index 000000000000..9135cf889d1e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegdec.yaml
> > @@ -0,0 +1,169 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml*__;Iw!!CTRNKA9wMg0ARbw!yu00-_vltBz3bkDyzkeH2PENGyfi_megjPx815JiqrNVa28ZU7kcFYidMEos_id7$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!yu00-_vltBz3bkDyzkeH2PENGyfi_megjPx815JiqrNVa28ZU7kcFYidMAikt6uh$
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
> 
> You do not have more than one item. Skip items.

Hello Krzysztof,

The device node has the compatible of "mediatek,mt8195-jpgdec",
if skip this item, it may case dt-binding checking error.
For another, we may extend this items in the future.
> 
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
> > +  dma-ranges:
> > +    maxItems: 1
> > +    description: |
> > +      Describes the physical address space of IOMMU maps to
> > memory.
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
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        jpgdec_master {
> 
> No underscores in node names.
> 
> Node names should be generic.
> 
https://urldefense.com/v3/__https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html*generic-names-recommendation__;Iw!!CTRNKA9wMg0ARbw!yu00-_vltBz3bkDyzkeH2PENGyfi_megjPx815JiqrNVa28ZU7kcFYidMDjBqHu7$
>  
Thanks for your kindly reminding, I will fix it in the next version.

Thanks.

Regards,
Kyrie.
> 
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
> > +                dma-ranges = <0x1 0x0 0x0 0x40000000 0x0
> > 0xfff00000>;
> > +                #address-cells = <2>;
> > +                #size-cells = <2>;
> > +                ranges;
> 
> Mess up indentation.
> 
> 
> Best regards,
> Krzysztof
> 


