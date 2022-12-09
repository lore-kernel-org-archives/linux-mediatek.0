Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66820C04FDE
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 09:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8RnLDoy8tp25SHwTkiovb8GWGbv3/sxicauJU19K4U=; b=mi6m2RBotNkCKa/Cq+iiJ+HWHD
	SSD8FQHAXicrkHzBjT/X63/xva50AyU+jzO+FlrUS5wtPcuq2tYrJPDZLTnH+OBF7sTBBwe4P8GQ0
	7F7nftrWe3nRp+xb2uIL4u+zhlh5b8FAtVg02kCEHy9hT7MK45HXyWvJUVFDtawxV/urnSQ341Zop
	IjuEF8r9Raw0OboRPytm91uucl2QoiwnoAQunJ16OCHgdcBMHvjs0pevpcYcjlz4xX8TUdUV+vZC1
	DYNXiQPhcvFze/3V5rswFfg2Fxc4CByH/E1UiuveU32i1J0MLcwbSrOLiuJqQwLJGyTdpex+hh48F
	C3aJyniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ZTG-00699l-0s; Fri, 09 Dec 2022 09:15:06 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ZT5-00696U-9t; Fri, 09 Dec 2022 09:14:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A05ECC000A;
	Fri,  9 Dec 2022 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670577288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8RnLDoy8tp25SHwTkiovb8GWGbv3/sxicauJU19K4U=;
	b=cYgNkYDoYt41DwhflXDt+gjhOooE64yqVPoCzTiMgMvWATWeW5f8DqUfY9O+zg65GnJTg0
	kiRvk5BIsHBLHDoVaH9iZm1nGSbiyGiCQapvdwb7kQUJpB46yNb6CiOI/6c3eR64OBfGgX
	HdXZZ5dOg2htbmcdAg5Tsh3oeA8wSdiXe1fk5rb1nWSEi46x8amCxtEUTObXHJn2Sv7yDl
	sgZRfzeg8/69B4/zGUo31ma2KUaftT0//Ncm9AENpQ8CsMApR8fUOW68Xxa2bJ+b575oM7
	iP+cLlJh4g+1kMoFuXGhUH4yXngrD+1Vinb5WGM4Y6Xhbtah1gpnmsQxSSROSQ==
Date: Fri, 9 Dec 2022 10:14:43 +0100
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
Message-ID: <20221209101443.77fbbe49@xps-13>
In-Reply-To: <f3e3a3d0-6d21-c782-38a2-c8b2c36242c3@linaro.org>
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
	<20221208062955.2546-8-xiangsheng.hou@mediatek.com>
	<fe70d964-229a-8bda-a414-e009dd955e5e@linaro.org>
	<20221208110035.5649a051@xps-13>
	<f3e3a3d0-6d21-c782-38a2-c8b2c36242c3@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_011455_634363_D2C07939 
X-CRM114-Status: GOOD (  24.43  )
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

krzysztof.kozlowski@linaro.org wrote on Thu, 8 Dec 2022 11:27:27 +0100:

> On 08/12/2022 11:00, Miquel Raynal wrote:
> > Hi Krzysztof,
> >=20
> > krzysztof.kozlowski@linaro.org wrote on Thu, 8 Dec 2022 10:44:17 +0100:
> >  =20
> >> On 08/12/2022 07:29, Xiangsheng Hou wrote: =20
> >>> Split MediaTek ECC engine with rawnand controller and convert to
> >>> YAML schema.
> >>>
> >>> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> >>> ---
> >>>  .../bindings/mtd/mediatek,mtk-nfc.yaml        | 154 +++++++++++++++
> >>>  .../mtd/mediatek,nand-ecc-engine.yaml         |  62 ++++++
> >>>  .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ----------------=
--
> >>>  3 files changed, 216 insertions(+), 176 deletions(-)
> >>>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mt=
k-nfc.yaml
> >>>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,na=
nd-ecc-engine.yaml
> >>>  delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.y=
aml b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
> >>> new file mode 100644
> >>> index 000000000000..eb1a44c7ae4e
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
> >>> @@ -0,0 +1,154 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: MediaTek(MTK) SoCs raw NAND FLASH controller (NFC)
> >>> +
> >>> +maintainers:
> >>> +  - Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - mediatek,mt2701-nfc
> >>> +      - mediatek,mt2712-nfc
> >>> +      - mediatek,mt7622-nfc
> >>> +
> >>> +  reg:
> >>> +    items:
> >>> +      - description: Base physical address and size of NFI.
> >>> +
> >>> +  interrupts:
> >>> +    items:
> >>> +      - description: NFI interrupt
> >>> +
> >>> +  clocks:
> >>> +    items:
> >>> +      - description: clock used for the controller
> >>> +      - description: clock used for the pad
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: nfi_clk
> >>> +      - const: pad_clk
> >>> +
> >>> +  ecc-engine:
> >>> +    description: device-tree node of the required ECC engine.
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +
> >>> +patternProperties:
> >>> +  "^nand@[a-f0-9]$":
> >>> +    type: object   =20
> >>
> >> This should be instead:
> >>     $ref: nand-chip.yaml#
> >>     unevaluatedProperties: false
> >>
> >> and then properties below (due to current dtschema limitations) should
> >> list properties from nand-controller.yaml:
> >>
> >>       nand-on-flash-bbt: true
> >>
> >> Optionally, we could create additional schema - nand-controller-chip,
> >> which would be referenced directly by nand-controller and itself would
> >> ref nand-chip. =20
> >=20
> > Isn't this enough? (in linux-next)
> > https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/Docu=
mentation/devicetree/bindings/mtd/nand-controller.yaml?h=3Dmtd/next#n54 =20
>=20
> No, I tested it and it does not work as intended. In this particular
> case. I think this is a limitation of dtschema, because binding itself
> looks fine. The problem is that you have:
> 1. mtk-nfc having nand@ children. mtk-nfc references nand-controller
> which brings these children.
> 2. However nand-controller while bringing these children does two things:
> a. ref: nand-chip
> b. add more propeties
>=20
> 3. The mtk-nfc must further extend the nand@ child.
> 4. If you add "unevaluatedProperties: false" you notice warnings of
> unevaluated propertie from nand-controller children.

Thanks for the details. Any chances this can eventually be fixed at
dt-schema level?

Thanks,
Miqu=C3=A8l

