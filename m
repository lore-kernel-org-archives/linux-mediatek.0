Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A88C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 09:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vflIV5M0EoTjggvNF5uq/jbSoDHp/fTcZ9C5pWyqaBk=; b=CMpQfsPYG+2Rcq
	77h5CV5NoX4JjkMrWGzsVJ093AfhIJf9LZjYhLIlKhjP4sFPBWVO7ddiVZ4ADmBGgE4ur2m5Re0nq
	GMVwwu92ay/6dKxEYLC3c/kCAKeca4aA5SeKEgObn0+zggBVBqw+mbUSc3yIZh0yOKVX82omokwPi
	KZIHcfJ6osx8HMOOa3qxWej7wwVPdoemiIQnHtTqa2uttspPvbBrrcT6v4LykZqXrCPARMRFEoP6f
	oWZDrtATxWHTCOhlb7PGveG9YdcsKCaDp3IhS5tTWpIUTU2tv5Ukj21vJCysFlt78z5QnYYWqWYdW
	Jb7TRvKx/wSAA1oMcYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nivS1-0090wv-Ls; Mon, 25 Apr 2022 09:56:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nivRQ-0090f8-JG; Mon, 25 Apr 2022 09:55:40 +0000
X-UUID: 95f8e2dac9984ae6891dd4e030e2ab12-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f8d41921-367b-404a-a119-35177e221527, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:b95d05f0-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 95f8e2dac9984ae6891dd4e030e2ab12-20220425
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 123620975; Mon, 25 Apr 2022 02:55:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 02:54:17 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 25 Apr 2022 17:54:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 17:54:16 +0800
Message-ID: <ab2dd657f0902b16fa755cedf93bdc5d507f85d5.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: Convert binding to YAML
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Mon, 25 Apr 2022 17:54:16 +0800
In-Reply-To: <b852a9d2-8d83-fa9f-52b3-32c9f2ca1e66@linaro.org>
References: <20220422123823.24577-1-allen-kh.cheng@mediatek.com>
 <b852a9d2-8d83-fa9f-52b3-32c9f2ca1e66@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_025538_173122_23B07777 
X-CRM114-Status: GOOD (  33.24  )
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

Hi Krzysztof,

On Mon, 2022-04-25 at 11:36 +0200, Krzysztof Kozlowski wrote:
> On 22/04/2022 14:38, Allen-KH Cheng wrote:
> > Convert Mediatek EFUSE devicetree binding to YAML.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ------------
> >  .../devicetree/bindings/nvmem/mtk-efuse.yaml  | 69
> > +++++++++++++++++++
> 
> Same comments as usual, so "vendor,device-name", e.g.
> "mediatek,efuse"
> if this is going to match all possible future MediaTek chips or
> "mediatek,mt7622-efuse"
> 
> 
> Folks in MediaTek: it would be useful if we did not have to repeat
> same
> review to all of you for every patch. If you keep forcing the
> reviewers
> to repeat the same and the same, eventually they become grumpier and
> grumpier. :)
> 

I apologize any inconvenience caused.

I send PATCH v2 about efuse yaml about file naming and will correct the
below suggestion in next version (v3).


Thanks,
Allen

> >  2 files changed, 69 insertions(+), 43 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-
> > efuse.txt
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-
> > efuse.yaml
> > 
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
> > diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.yaml 
> > b/Documentation/devicetree/bindings/nvmem/mtk-efuse.yaml
> > new file mode 100644
> > index 000000000000..307c05f69cb9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/nvmem/mtk-efuse.yaml*__;Iw!!CTRNKA9wMg0ARbw!wc1yfopXxX52S6WVI7AaQOt9pyfWpI84LB7x7UHj-1JTUFXqolhboZm8pPKiQBw__GKGfw$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!wc1yfopXxX52S6WVI7AaQOt9pyfWpI84LB7x7UHj-1JTUFXqolhboZm8pPKiQByiHIvwkg$
> >  
> > +
> > +title: Mediatek eFuse device tree bindings
> 
> s/device tree bindings//
> 
> Folks in MediaTek: it would be useful if we did not have to repeat
> same
> review to all of you for every patch.
> 
> > +
> > +maintainers:
> > +  - Lala Lin <lala.lin@mediatek.com>
> > +  - Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > +
> > +allOf:
> > +  - $ref: "nvmem.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: mediatek,efuse
> 
> 1. Please add a comment for which compatible this is valid. Such
> generic
> compatibles should not be used standalone. The binding was accepted
> (without DT review), so it's done, but let's not spread it over new
> DTS.
> 
> Actually I would prefer to deprecate it in second patch.
> 
> 2. Same comments as usual - this is enum.
> Folks in MediaTek: it would be useful if we did not have to repeat
> same
> review to all of you for every patch.
> 
> > +      - const: mediatek,mt8173-efuse
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt7622-efuse
> > +              - mediatek,mt7623-efuse
> > +              - mediatek,mt8183-efuse
> > +              - mediatek,mt8192-efuse
> > +              - mediatek,mt8195-efuse
> > +              - mediatek,mt8516-efuse
> > +          - const: mediatek,efuse
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":
> > +    type: object
> 
> No need, it comes from nvmem.yaml.
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +        description:
> > +          Offset and size in bytes within the storage device.
> > +
> > +    required:
> > +      - reg
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +
> 
> Unneeded blank line.
> 
> > +    efuse: efuse@10206000 {
> > +            compatible = "mediatek,mt8173-efuse";
> > +            reg = <0x10206000 0x1000>;
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +
> > +            /* Data cells */
> > +            thermal_calibration: calib@528 {
> > +                reg = <0x528 0xc>;
> > +            };
> > +    };
> > +...
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
