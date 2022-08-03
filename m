Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8306C19F28
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gwlj269ms03qSTKnNSXxZz0vYstlo6yEbsr1TgZf0og=; b=a1fbDJTz+1ZyjQYUM+87UmJuu6
	zf3kupn4QAy2BILiR0pPhnoRsv7RNlXOmS4PWtxN1cXin65we0b8PSRGeEOV0bNDYDRgbFbTJWawZ
	pXR7leIYFZitxcuPykvJSbjRv0Bo+aHZahSwh+Dgy/JpEiLRNPnqaEQouJLVg0y3is1HXPaJQcZvC
	7mAb0/RejzOXmkqg1mKffrI1+ffZSFGnA2WalI9tNxhLVC9Ndu2GnVq8sW2JZ/gykn8KfPfb7hIzv
	J8Zn5GxLzQ5OP15oXQ/0skmI8r2FpEuL8g4qvXq9bAG8JidqPP97cDD1Yp3LTYrihKOT5DQVKEiyw
	9Qq6cq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJBNl-004hQK-4a; Wed, 03 Aug 2022 10:13:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJBLV-004fmx-DG; Wed, 03 Aug 2022 10:11:23 +0000
X-UUID: 718b6fed200349cca5023402c97ecfc2-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:fd4cdcf0-b646-4aa4-b11d-81b14d5485ab,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:90272ed0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 718b6fed200349cca5023402c97ecfc2-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1905212058; Wed, 03 Aug 2022 03:11:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 3 Aug 2022 17:50:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 3 Aug 2022 17:50:40 +0800
Message-ID: <3d97d4c46467909739b8b69662412fe162dbe613.camel@mediatek.com>
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Zhiyong Tao
 =?UTF-8?Q?=28=E9=99=B6=E5=BF=97=E5=8B=87=29?= <Zhiyong.Tao@mediatek.com>,
	"lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, Eddie Huang
 =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang@mediatek.com>,
	"a.zummo@towertech.it" <a.zummo@towertech.it>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"fshao@chromium.org" <fshao@chromium.org>
CC: Sen Chu =?UTF-8?Q?=28=E5=82=A8=E6=A3=AE=29?= <Sen.Chu@mediatek.com>, Hui
 Liu =?UTF-8?Q?=28=E5=88=98=E8=BE=89=29?= <Hui.Liu@mediatek.com>, Allen-KH
 Cheng =?UTF-8?Q?=28=E7=A8=8B=E5=86=A0=E5=8B=B3=29?=
	<Allen-KH.Cheng@mediatek.com>, Hsin-Hsiung Wang
 =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E9=9B=84=29?=
	<Hsin-Hsiung.Wang@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>, Macpaul
 Lin =?UTF-8?Q?=28=E6=9E=97=E6=99=BA=E6=96=8C=29?= <Macpaul.Lin@mediatek.com>,
	Wen Su =?UTF-8?Q?=28=E8=98=87=E5=86=A0=E6=96=87=29?= <Wen.Su@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, zhiyong tao <zhiyong.tao@mediatk.com>
Date: Wed, 3 Aug 2022 17:50:40 +0800
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
X-CRM114-CacheID: sfid-20220803_031121_558272_8CDA5CCE 
X-CRM114-Status: GOOD (  27.83  )
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

On Thu, 2022-07-28 at 18:46 +0800, Krzysztof Kozlowski wrote:
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

Hello Krzysztof,

I am Rex from MediaTek chrome project team.
We noticed your complain of our upstream mail.

First of all, sorry for the inconvenience.
We really want to fix this SPAM issue.

From our side, we can make sure mails for kernel upstream from MediaTek
is clear and these mails pass the verification of DMARC/DKIM/SPF.
Therefore, to identify the root cause, could you please provide us some
mails that seen as SPAM from MediaTek?
It's more useful if you can use the form of attachment. In that case,
we can analyze whole mails including mail headers.

We really appreciate your big support, and we hope we can fix this
issue to reduce the inconvenience for reviewing series from MediaTek.
If you can spare some time to help us for this, it would very helpful!!

Our IT also adjust the DKIM setting today. If the situation of this
issue it much better, please also let us know.

Many thanks!!

BRs,
Rex
> 
> > 
> > Signed-off-by: zhiyong tao <zhiyong.tao@mediatk.com>
> > ---
> >  .../regulator/mediatek,mt6366-regulator.yaml  | 375
> > ++++++++++++++++++
> >  1 file changed, 375 insertions(+)
> 
> Subject does not match subsystem.
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
> > https://urldefense.com/v3/__http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator.yaml*__;Iw!!CTRNKA9wMg0ARbw!3B-3NHQAsJc6ov022NnUIctYLEyx-BfxG5s85TBBvEfGjc4DdYDIqG_Ka_5D7scVo8CRtzLqokEX_thhM7XK_S90wg$
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3B-3NHQAsJc6ov022NnUIctYLEyx-BfxG5s85TBBvEfGjc4DdYDIqG_Ka_5D7scVo8CRtzLqokEX_thhM7Un6TPZdw$
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
> 
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern:
> > "^v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$"
> 
> Why do you enforce specific regulator-name? Remove.
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
> 
> 
> 
> Best regards,
> Krzysztof


