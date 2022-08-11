Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F48C25B06
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h73cpNgcYVpkycjl2AyiZTsyT//nNDQtK1bO51TH7u4=; b=a4Iex62qO71TMyxs5jOBKHPoCk
	AtZWGQs4q/rYmwPOMUngxSGdYDfo2FjGGarvfGug5HDadI3UPbd0ybOZeKazOtY1JweFNwbsv+Zf2
	YqOvy3fRBqRCmg9jdQ/DpsuZ5o/Cb8V+taLrpES8r5He5EFfw6ISRoH16y8tLwOc8b8kLrN0tokHa
	1Js4AZAv31/ayoqduu0MqKqRv9yaEnFvUDPJfhP5o1ssdwYCsbWizaOIars7TD0JzHSAYjKoU/rDr
	uvHjqi0b2ViyxqKpzVZDwuCNL6e+y6qGXwSBsvckHLpalqsmVnyXsFykPBDujDwVGI2NtQyzU68cb
	fdKPEZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3n2-00APcq-24; Thu, 11 Aug 2022 08:43:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3my-00APbM-7B; Thu, 11 Aug 2022 08:43:38 +0000
X-UUID: 00cc69e29c0749a6b6d4342dcb9f0d2f-20220811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:6dc43b00-fcf8-4813-9734-e9ab4eb5239b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:810e5f9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 00cc69e29c0749a6b6d4342dcb9f0d2f-20220811
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 468364409; Thu, 11 Aug 2022 01:43:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 11 Aug 2022 16:42:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Aug 2022 16:42:52 +0800
Message-ID: <111e1073e1ce689e289e52c645a1be2e7dc7fe12.camel@mediatek.com>
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <sen.chu@mediatek.com>, <hui.liu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
	<sean.wang@mediatek.com>, <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	zhiyong tao <zhiyong.tao@mediatk.com>
Date: Thu, 11 Aug 2022 16:42:52 +0800
In-Reply-To: <03a13ed4-e7cd-6f7d-f8f7-9b1e6193e202@linaro.org>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
	 <20220728062749.18701-2-zhiyong.tao@mediatek.com>
	 <03a13ed4-e7cd-6f7d-f8f7-9b1e6193e202@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_014336_302374_08120005 
X-CRM114-Status: GOOD (  25.10  )
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

On Thu, 2022-07-28 at 12:46 +0200, Krzysztof Kozlowski wrote:
> On 28/07/2022 08:27, Zhiyong Tao wrote:
> > From: zhiyong tao <zhiyong.tao@mediatek.com>
> > 
> > Add mt6366 regulator document
> 
> As usual with Mediatek your emails fail to properly pass modern SMTP
> checks and you end up in spam.
> 
> I reported it months ago to folks in Mediatek. No improvements since
> that time.
> 
> I stopped checking my spam folder for Mediatek stuff and all will be
> ignored. I will also stop complaining about it - just ignore
> Mediatek.
> 
> Fix your systems, instead of putting additional effort on community
> and
> on reviewers.
> 
> 
> > 
> > Signed-off-by: zhiyong tao <zhiyong.tao@mediatk.com>
> > ---
> >  .../regulator/mediatek,mt6366-regulator.yaml  | 375
> > ++++++++++++++++++
> >  1 file changed, 375 insertions(+)
> 
> Subject does not match subsystem.

Hi Krzysztof,

Do you mean that we should change the title like this:
regulator: dt-bindings: mediatek: add mt6366 regulator document
is it right?

> 
> 
> >  create mode 100755
> > Documentation/devicetree/bindings/regulator/mediatek,mt6366-
> > regulator.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/regulator/mediatek,mt6366-
> > regulator.yaml
> > b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-
> > regulator.yaml
> > new file mode 100755
> > index 000000000000..eb72c64757cf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-
> > regulator.yaml
> > @@ -0,0 +1,375 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator.yaml*__;Iw!!CTRNKA9wMg0ARbw!ziK5XN37dRWX7n6kijp_JwH57ILy3rqwOZZmvARTQ2MuIKSEZOW_ERZ5io2IBghFlHQ$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!ziK5XN37dRWX7n6kijp_JwH57ILy3rqwOZZmvARTQ2MuIKSEZOW_ERZ5io2IAO1d7DQ$
> >  
> > +
> > +title: MT6366 Regulator from MediaTek Integrated
> > +
> > +maintainers:
> > +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
> > +
> > +description: |
> > +  List of regulators provided by this controller. It is named
> > +  according to its regulator type, buck_<name> and ldo_<name>.
> > +  MT6366 regulators node should be sub node of the MT6397 MFD
> > node.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6366-regulator
> > +
> > +  regulators:
> > +    type: object
> > +    description: List of regulators and its properties
> > +
> > +    patternProperties:
> > +      "^buck-
> > v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> 
> No need for quotes.
==>
We will remove the line "$ref: "regulator.yaml#"" in next verison, is
it right?

> 
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern:
> > "^v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$"
> 
> Why do you enforce specific regulator-name? Remove.
==>
we will remove the regulator-name in next version.
> 
> > +
> > +      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern:
> > "^v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$"
> > +
> > +      "^ldo-v(xo22|efuse|mch|vcama1|emc|a12|vcama2|mc)$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern:
> > "^v(xo22|efuse|mch|vcama1|emc|a12|vcama2|mc)$"
> > +
> > +      "^buck-(vcore)-sshub$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^vcore-sshub$"
> > +
> > +      "^ldo-vcn(28|33)-bt$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^vcn(28|33)-bt$"
> > +
> > +      "^ldo-vcn(33)-wifi$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^vcn33-wifi$"
> > +
> > +      "^ldo-vsram-(others)-sshub$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^vsram-others-sshub$"
> > +
> > +      "^ldo-vsram-(proc11|others|gpu|proc12)$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^vsram-(proc11|others|gpu|proc12)$"
> > +
> > +      "^ldo-v(aud|bif|io|ldo)28$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^v(aud|bif|io|ldo)28$"
> > +
> > +      "^ldo-v(io|aux|rf)18$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^v(io|aux|rf)18$"
> > +
> > +      "^ldo-vsim[2]$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^vsim2$"
> > +
> > +        required:
> > +          - regulator-name
> > +
> > +required:
> > +  - compatible
> > +  - regulators
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pmic {
> > +      compatible = "mediatek,mt6366-regulator";
> > +
> > +      regulators {
> > +        mt6366_vdram1_reg: buck-vdram1 {
> > +            regulator-name = "vdram1";
> 
> Messed up indentation. Use only one, so 4 space for DTS example.
==>
we will fix it by 4 space for DTS example in next version.

Thanks.
> 
> 
> 
> Best regards,
> Krzysztof


