Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCB0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwJGkBNXBS0HIJSRdGYwt3a4RG7BCh/zGC7GhVPOSMM=; b=ejEjBNS6yxuvYn
	KbTWhBumkSNDpadBNDp8haHRIGqlvlnpSKbu7mqJDhmqbzzlXlyQqRuXjwVkXsYzC8m/GzfF8An/d
	IRfXLmJySVHkoG4MfojJi0ku37pA6J0O1C6nauSkmZ8zXbKpMFyHVTJCRnAmuoS6HwMbhFXSArbjs
	5nQ1HoMJ52m6ZWiIY6rYjDDg36cFSA1opJ5fVhFFnrf9mlJrkLLpzz4HZHCDE7jGaEZ56gv1LU4nb
	+iOj71FO/d/bMORf+3jNCT0xVPUggLG2NGm1D/CDvDKQ5BWccd/CWSZqsE3DVuy8FzWdqSKPptHJI
	AK03wZ523X66WItpUVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAF2-009QHQ-HY; Fri, 17 Dec 2021 10:13:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAEV-009Q3k-1n; Fri, 17 Dec 2021 10:13:03 +0000
X-UUID: a71b20d216094af7b2bdc56bebae7e76-20211217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HUN21q7AmJHL7HLN5+p2io8f1jf3Mzl1xVuyGCioDeM=; 
 b=kvta8LCn3yt0tXBCHqRk3MxlYDtP7ij0shIOM+pIhBTcDkuAf2cHXeC9avM41sS0gwWKLEZ3MQzjmo+SYRoY8SFppZ3yrpqGZCPVrUUjV/T/7I8KSZCWBH5DJfaU1oO62FIjixUDhdpTO/cSW5s21xlSkZk3f3l/bNmNPeJPf8U=;
X-UUID: a71b20d216094af7b2bdc56bebae7e76-20211217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2018552705; Fri, 17 Dec 2021 03:12:57 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 02:12:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 18:12:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Dec 2021 18:12:53 +0800
Message-ID: <675c774ec23b1d541ea58a7307a6766bda314734.camel@mediatek.com>
Subject: Re: [next PATCH] dt-bindings: nvmem: convert mtk-efuse.txt to YAML
 schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 17 Dec 2021 18:12:55 +0800
In-Reply-To: <YboeNrekGcGOZES8@robh.at.kernel.org>
References: <20211209024213.16612-1-chunfeng.yun@mediatek.com>
 <YboeNrekGcGOZES8@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_021259_194385_135CB7E7 
X-CRM114-Status: GOOD (  22.30  )
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

On Wed, 2021-12-15 at 10:56 -0600, Rob Herring wrote:
> On Thu, Dec 09, 2021 at 10:42:13AM +0800, Chunfeng Yun wrote:
> > Convert mtk-efuse.txt to YAML schema mediatek,efuse.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  .../bindings/nvmem/mediatek,efuse.yaml        | 89
> > +++++++++++++++++++
> >  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ---------
> >  2 files changed, 89 insertions(+), 43 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-
> > efuse.txt
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > new file mode 100644
> > index 000000000000..7332195e7f00
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek efuse device tree bindings
> > +
> > +description: |
> > +  MediaTek's efuse is used for storing calibration data, it can be
> > accessed
> > +  on ARM devices usiong I/O mapped memory.
> > +
> > +maintainers:
> > +  - Andrew-CT Chen <andrew-ct.chen@mediatek.com>
> > +
> > +allOf:
> > +  - $ref: "nvmem.yaml#"
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^efuse@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt7622-efuse
> > +              - mediatek,mt7623-efuse
> > +              - mediatek,mt8173-efuse
> > +              - mediatek,mt8192-efuse
> > +              - mediatek,mt8195-efuse
> > +              - mediatek,mt8516-efuse
> > +          - const: mediatek,efuse
> > +      - const: mediatek,mt8173-efuse
> > +        deprecated: true
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> 
> All of: 
> 
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":
> > +    type: object
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +
> > +      bits:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - reg
> > +
> > +    additionalProperties: false
> 
> ...this is covered by nvmem.yaml and can be dropped.
Ok, thanks

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    efuse@10206000 {
> > +        compatible = "mediatek,mt8173-efuse";
> > +        reg = <0x10206000 0x1000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        u2_intr_p0: usb2-intr-p0@188 {
> > +            reg = <0x188 0x1>;
> > +            bits = <0 5>;
> > +        };
> > +
> > +        u2_intr_p1: usb2-intr-p1@188 {
> > +            reg = <0x188 0x2>;
> > +            bits = <5 5>;
> > +        };
> > +
> > +        thermal_calibration: calib@528 {
> > +            reg = <0x528 0xc>;
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> > b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> > deleted file mode 100644
> > index 39d529599444..000000000000
> > --- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
> > -= Mediatek MTK-EFUSE device tree bindings =
> > -
> > -This binding is intended to represent MTK-EFUSE which is found in
> > most Mediatek SOCs.
> > -
> > -Required properties:
> > -- compatible: should be
> > -	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
> > -	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
> > -	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
> > -	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
> > -	      "mediatek,mt8195-efuse", "mediatek,efuse": for MT8195
> > -	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
> > -- reg: Should contain registers location and length
> > -- bits: contain the bits range by offset and size
> > -
> > -= Data cells =
> > -Are child nodes of MTK-EFUSE, bindings of which as described in
> > -bindings/nvmem/nvmem.txt
> > -
> > -Example:
> > -
> > -	efuse: efuse@10206000 {
> > -		compatible = "mediatek,mt8173-efuse";
> > -		reg	   = <0 0x10206000 0 0x1000>;
> > -		#address-cells = <1>;
> > -		#size-cells = <1>;
> > -
> > -		/* Data cells */
> > -		thermal_calibration: calib@528 {
> > -			reg = <0x528 0xc>;
> > -		};
> > -	};
> > -
> > -= Data consumers =
> > -Are device nodes which consume nvmem data cells.
> > -
> > -For example:
> > -
> > -	thermal {
> > -		...
> > -		nvmem-cells = <&thermal_calibration>;
> > -		nvmem-cell-names = "calibration";
> > -	};
> > -- 
> > 2.18.0
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
