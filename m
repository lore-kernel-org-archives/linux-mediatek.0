Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB79C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQBvnBipF0jBYBuu1EcKJlR/pd4YO5GJfr3JHPYqAq8=; b=O6CQeROsjVfO2fa25+xkLgRegI
	UtzaLuWSZtatoRO1M4Pl8bpUS2/hyt41VFeJ7Ph141jd71ILRvdI+Y3VqOdpTgqLP0DtSnZdnNaDT
	EyI7xv4xSZVqknUCYZIRQjh3+El61KfJeRP5hKVNOYDoBEfXAKINr8+XzX4nEFzM4QTQC3+0RM2kL
	4GXnMupMcjtQV2+WcgRw7MmucrUnHYHWdqFz7d8gBNZ1R4TmNVRKkhEy3kmsEBAZQFk8eUUAoqvm0
	uf89OcCeyOz24Fni3fdh9PRznfIFSCDKOR0xZjw98GYnrQ+Fn7J/qfH2hwVZ0CyooobSPtog4uAz0
	gIRDI6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DiD-00BUtw-6l; Thu, 08 Dec 2022 10:01:05 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Dhx-00BUdN-Sd; Thu, 08 Dec 2022 10:00:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0607420003;
	Thu,  8 Dec 2022 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670493641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQBvnBipF0jBYBuu1EcKJlR/pd4YO5GJfr3JHPYqAq8=;
	b=nHcSa8RDjNx8DzhiTHdnU62FP/U3JJFVD/kHc9FRwYndvpGihZr8KVG5P3UdSF/xTo4u2v
	+5JyQUxoQvDH5LFHTBxynsI7WZm+tjoremxnDBAN29LIip92uhp2yPPoYAFk6naOyHqako
	vrCPsn27kC0s95MhEALjy8UeHjE9LZzUO19D+K6X3KM7TMIaZAdVR+fQAO2npW0ycNH54L
	U2VADhsqdaMr3hdyuVrwoqMT3t6MdCwV6Ok2YX0960rhpZXhuViLxqyX2uUnMAHZlRB7IA
	UjJOAQ+XxF0KOCp1d6WHagxXOghUylxmnaity+qqz1a+81FqR2bNqC825po7DQ==
Date: Thu, 8 Dec 2022 11:00:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo
 <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, benliang.zhao@mediatek.com,
 bin.zhang@mediatek.com
Subject: Re: [PATCH v3 7/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Message-ID: <20221208110035.5649a051@xps-13>
In-Reply-To: <fe70d964-229a-8bda-a414-e009dd955e5e@linaro.org>
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
	<20221208062955.2546-8-xiangsheng.hou@mediatek.com>
	<fe70d964-229a-8bda-a414-e009dd955e5e@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_020050_246472_9AC0E4EB 
X-CRM114-Status: GOOD (  17.89  )
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

Hi Krzysztof,

krzysztof.kozlowski@linaro.org wrote on Thu, 8 Dec 2022 10:44:17 +0100:

> On 08/12/2022 07:29, Xiangsheng Hou wrote:
> > Split MediaTek ECC engine with rawnand controller and convert to
> > YAML schema.
> >=20
> > Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > ---
> >  .../bindings/mtd/mediatek,mtk-nfc.yaml        | 154 +++++++++++++++
> >  .../mtd/mediatek,nand-ecc-engine.yaml         |  62 ++++++
> >  .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
> >  3 files changed, 216 insertions(+), 176 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-=
nfc.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand=
-ecc-engine.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yam=
l b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
> > new file mode 100644
> > index 000000000000..eb1a44c7ae4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
> > @@ -0,0 +1,154 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek(MTK) SoCs raw NAND FLASH controller (NFC)
> > +
> > +maintainers:
> > +  - Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt2701-nfc
> > +      - mediatek,mt2712-nfc
> > +      - mediatek,mt7622-nfc
> > +
> > +  reg:
> > +    items:
> > +      - description: Base physical address and size of NFI.
> > +
> > +  interrupts:
> > +    items:
> > +      - description: NFI interrupt
> > +
> > +  clocks:
> > +    items:
> > +      - description: clock used for the controller
> > +      - description: clock used for the pad
> > +
> > +  clock-names:
> > +    items:
> > +      - const: nfi_clk
> > +      - const: pad_clk
> > +
> > +  ecc-engine:
> > +    description: device-tree node of the required ECC engine.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +patternProperties:
> > +  "^nand@[a-f0-9]$":
> > +    type: object =20
>=20
> This should be instead:
>     $ref: nand-chip.yaml#
>     unevaluatedProperties: false
>=20
> and then properties below (due to current dtschema limitations) should
> list properties from nand-controller.yaml:
>=20
>       nand-on-flash-bbt: true
>=20
> Optionally, we could create additional schema - nand-controller-chip,
> which would be referenced directly by nand-controller and itself would
> ref nand-chip.

Isn't this enough? (in linux-next)
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/Document=
ation/devicetree/bindings/mtd/nand-controller.yaml?h=3Dmtd/next#n54

Thanks,
Miqu=C3=A8l

