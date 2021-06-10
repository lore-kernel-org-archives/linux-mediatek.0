Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8582CC47094
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 12:03:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40846613E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 12:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40846613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/ORzn7xWtT2w+shXXJ6Gp1FIZ1IkHPqzgyGRGnNI/c=; b=Q/c2t6Ru5qvT1C
	K0GxPb3gSzAjPInOmNMhjjkf2QKFQ2rWPboG5gdFxBhSBFZfQtiWp2ZI4OQTPZr3XLmBA0FAg60e7
	/FfyFBW4Z4QDXmfjIjF6+8GrHHOIbgRzOCqmmXicjhuVXumoTkbazpNQZzGm5DEwkAvpO59YoyUjW
	lFHflfcrUmIKYDKpSP4J3detzPt2F45EiuFYX/pqcD+Pg6HMsDfrv7bqeIMA7im2CkB72URCwVdC5
	CD0egkBxAPG35ZVHSqGQQsVhp4bXLZNgpTP5QqQI5YLLUAwhN7QXEG2oYs0WHhruYowMKKMrTCoIy
	5C9UvWF2xnuALIJgpA+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrJOc-000cAF-2I; Thu, 10 Jun 2021 12:02:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrJOK-000c4t-CJ; Thu, 10 Jun 2021 12:02:34 +0000
X-UUID: e3e6a05a19134bb8995b0a5dc5f9ac6b-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=elJ9YOjsWZi/CCl9FuG5SvQqldYPlUBku3yqU/pScuY=; 
 b=pftvq2X5i4XCwLgWFMCWvFzXhka7jEmLnlY5nMhBIOhOuhKMcZhIjhGwsCe6nJz3VmRg+ukItsGe8bt57F3ISvWKbjeyHrdY0HTfftx6+wcOtNpo1dU6ZykcovoJ4AcJw4VHmYgC9TLvGAXSPXdwW81TnMvt9RmkYUKOiJKSXsQ=;
X-UUID: e3e6a05a19134bb8995b0a5dc5f9ac6b-20210610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 703497719; Thu, 10 Jun 2021 05:02:28 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 04:57:20 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Jun 2021 19:57:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Jun 2021 19:57:17 +0800
Message-ID: <1623326237.23717.15.camel@mhfsdcap03>
Subject: Re: [PATCH v2] dt-bindings: mediatek: convert mtk jpeg
 decoder/encoder to yaml
From: Yong Wu <yong.wu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <maoguang.meng@mediatek.com>
Date: Thu, 10 Jun 2021 19:57:17 +0800
In-Reply-To: <c324de79-9a07-2f2c-e29a-dcd448da29f8@gmail.com>
References: <20210609180130.693944-1-hsinyi@chromium.org>
 <c324de79-9a07-2f2c-e29a-dcd448da29f8@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 73A1C0BC2E8DD718376B7BC09E60E8F00CCCB19571270216A0D526E592F538382000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_050232_447012_ACF0F631 
X-CRM114-Status: GOOD (  23.93  )
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

On Thu, 2021-06-10 at 10:37 +0200, Matthias Brugger wrote:
> Hi Hsin-Yi,
> 
> On 09/06/2021 20:01, Hsin-Yi Wang wrote:
> > Convert mediatek jpeg decoder and encoder bindings to yaml.
> > 
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v2: fix dt_binding_check errors
> > ---
> >  .../bindings/media/mediatek-jpeg-decoder.txt  | 38 ----------
> >  .../bindings/media/mediatek-jpeg-decoder.yaml | 76 +++++++++++++++++++
> >  .../bindings/media/mediatek-jpeg-encoder.txt  | 35 ---------
> >  .../bindings/media/mediatek-jpeg-encoder.yaml | 68 +++++++++++++++++
> >  4 files changed, 144 insertions(+), 73 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
> > deleted file mode 100644
> > index 39c1028b2dfb4..0000000000000
> > --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -* Mediatek JPEG Decoder
> > -
> > -Mediatek JPEG Decoder is the JPEG decode hardware present in Mediatek SoCs
> > -
> > -Required properties:
> > -- compatible : must be one of the following string:
> > -	"mediatek,mt8173-jpgdec"
> > -	"mediatek,mt7623-jpgdec", "mediatek,mt2701-jpgdec"
> > -	"mediatek,mt2701-jpgdec"
> > -- reg : physical base address of the jpeg decoder registers and length of
> > -  memory mapped region.
> > -- interrupts : interrupt number to the interrupt controller.
> > -- clocks: device clocks, see
> > -  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> > -- clock-names: must contain "jpgdec-smi" and "jpgdec".
> > -- power-domains: a phandle to the power domain, see
> > -  Documentation/devicetree/bindings/power/power_domain.txt for details.
> > -- mediatek,larb: must contain the local arbiters in the current Socs, see
> > -  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> > -  for details.
> 
> We miss the mediatek,larb in the yaml.

Hi Hsin-Yi,

I will rebase this one when removing mediatek,larb.

> 
> > -- iommus: should point to the respective IOMMU block with master port as
> > -  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > -  for details.
> > -
> > -Example:
> > -	jpegdec: jpegdec@15004000 {
> > -		compatible = "mediatek,mt2701-jpgdec";
> > -		reg = <0 0x15004000 0 0x1000>;
> > -		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> > -		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
> > -			  <&imgsys CLK_IMG_JPGDEC>;
> > -		clock-names = "jpgdec-smi",
> > -			      "jpgdec";
> > -		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> > -		mediatek,larb = <&larb2>;
> > -		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
> > -			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> > new file mode 100644
> > index 0000000000000..821e6b480901a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek JPEG Decoder Device Tree Bindings
> > +
> > +maintainers:
> > +  - Xia Jiang <xia.jiang@mediatek.com>
> > +
> > +description: |-
> > +  Mediatek JPEG Decoder is the JPEG decode hardware present in Mediatek SoCs
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: mediatek,mt8173-jpgdec
> > +      - items:
> > +          - const: mediatek,mt2701-jpgdec
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt7623-jpgdec
> > +          - const: mediatek,mt2701-jpgdec
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 2
> > +    minItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      - const: jpgdec-smi
> > +      - const: jpgdec
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - iommus
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt2701-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/memory/mt2701-larb-port.h>
> > +    #include <dt-bindings/power/mt2701-power.h>
> > +    jpegdec: jpegdec@15004000 {
> > +      compatible = "mediatek,mt2701-jpgdec";
> > +      reg = <0x15004000 0x1000>;
> > +      interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> > +      clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
> > +                <&imgsys CLK_IMG_JPGDEC>;
> > +      clock-names = "jpgdec-smi",
> > +                    "jpgdec";
> > +      power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> > +      iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
> > +               <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> > deleted file mode 100644
> > index 5e53c6ab52d01..0000000000000
> > --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -* MediaTek JPEG Encoder
> > -
> > -MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> > -
> > -Required properties:
> > -- compatible : "mediatek,mt2701-jpgenc"
> > -  followed by "mediatek,mtk-jpgenc"
> > -- reg : physical base address of the JPEG encoder registers and length of
> > -  memory mapped region.
> > -- interrupts : interrupt number to the interrupt controller.
> > -- clocks: device clocks, see
> > -  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> > -- clock-names: must contain "jpgenc". It is the clock of JPEG encoder.
> > -- power-domains: a phandle to the power domain, see
> > -  Documentation/devicetree/bindings/power/power_domain.txt for details.
> > -- mediatek,larb: must contain the local arbiters in the current SoCs, see
> > -  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> > -  for details.
> 
> Same here.
> 
> Regards,
> Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
