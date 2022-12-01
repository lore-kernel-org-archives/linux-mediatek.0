Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE267C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 11:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DpeR0fOlb5PAMGmnpXX+od9r16gR+9q1pKLo2N9KRI=; b=rwz/tDx7i07JRMrP6pag0COpO3
	PMH8o0cI+Ag0L1nE2xMuxqlVQrjbWUEYC2Sg8ESBQQF7MUPX82VvBH2dTPLz4c9lIP0Iu/ndpxr1s
	Fh45dhRY2TK12ZjQaPt/9CmorlkhcQDfLxMTe7ZtQ6CCjTSi8qHludzYAl1MFs1suKk9wrKcyfjed
	vp16Sq+J3IwqHO9X8pE52CBy+EYiG71Xf+ZNTLdDeTFaSGMU6+O7/qnAKI+NqtD3KSDuqFp1ZtY7A
	gS8hh4xNVLt87fC/FsGz8ps3QsEtTYrHR8nhAFWc80AI/TjYMFaMcFztoQO810H8g0o3TIsZ7gQU/
	zWAIKEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hxl-0077hM-Jt; Thu, 01 Dec 2022 11:42:45 +0000
Received: from mail-40141.protonmail.ch ([185.70.40.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hxj-0077f8-8f
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 11:42:44 +0000
Date: Thu, 01 Dec 2022 11:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1669894957; x=1670154157;
	bh=1DpeR0fOlb5PAMGmnpXX+od9r16gR+9q1pKLo2N9KRI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=yDI7s0HlJ4McXxo+2ufuGpE4pXDth5CZgcjcV3rSuMzzH6q3wJU2Tk8xl6O17cNkC
	 HGXaHumIUcAtIEKBNwYce9+vZ6SE7uaW92ikgpJXsWAVzP2llfPOvr8KTm04XlizD+
	 qqmrGlCY6Vr+H0QkM3W/9jf6/hOxA26eKCS8YCl+DJk0go0urf5JB+gwEDYNDa+OO5
	 1T8hQYX7JoMQ/eCuypvX3exrqCVOMjP+g6FcbGegvHOS8NPTUhCiVXC8ifRf/Od0W+
	 SNowSPaq79Rn4U19KPuffPal7gPFjk3PQGZv2gIZTRDFaB0Mv+3fBjN1Wz7ItilgIJ
	 mhsl3c7GMLCkg==
To: Rob Herring <robh@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Message-ID: <OlpG9EaFtnZPPSHGKPeAj0wrG-hceDitxke8L1MrF58nBbOf4Q8bsw1FC8O12qj_3GFxNpM4p_LeKwbCzchvZGaD0a_S56_uKhg7YWszZ9A=@protonmail.com>
In-Reply-To: <20221130152041.GA2183918-robh@kernel.org>
References: <20221118113028.145348-1-y.oudjana@protonmail.com> <20221118113028.145348-2-y.oudjana@protonmail.com> <20221130152041.GA2183918-robh@kernel.org>
Feedback-ID: 6882736:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_034243_491638_550246F1 
X-CRM114-Status: GOOD (  23.89  )
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

On Wednesday, November 30th, 2022 at 6:20 PM, Rob Herring <robh@kernel.org>=
 wrote:

> On Fri, Nov 18, 2022 at 02:30:22PM +0300, Yassine Oudjana wrote:
>=20
> > From: Yassine Oudjana y.oudjana@protonmail.com
> >=20
> > mediatek,pinctrl-mt6795.yaml has different node name patterns which mat=
ch
> > bindings of other MediaTek pin controllers, ref for pinmux-node.yaml wh=
ich
> > has a description of the pinmux property, as well as some additional
> > descriptions for some pin configuration properties. Pull those changes
> > into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match i=
n
> > preparation to combine the MT6795 document into it.
> >=20
> > Signed-off-by: Yassine Oudjana y.oudjana@protonmail.com
> > ---
> > .../pinctrl/mediatek,mt6779-pinctrl.yaml | 38 ++++++++++++++-----
> > 1 file changed, 28 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-=
pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pi=
nctrl.yaml
> > index a2141eb0854e..d6231d11e949 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl=
.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl=
.yaml
> > @@ -111,19 +111,21 @@ allOf:
> > - "#interrupt-cells"
> >=20
> > patternProperties:
> > - '-[0-9]*$':
> > + '-pins$':
> > type: object
> > additionalProperties: false
> >=20
> > patternProperties:
> > - '-pins*$':
> > + '^pins':
> > type: object
> > description: |
> > A pinctrl node should contain at least one subnodes representing the
> > pinctrl groups available on the machine. Each subnode will list the
> > pins it needs, and how they should be configured, with regard to muxer
> > configuration, pullups, drive strength, input enable/disable and input =
schmitt.
> > - $ref: "/schemas/pinctrl/pincfg-node.yaml"
> > + allOf:
> > + - $ref: pinmux-node.yaml
> > + - $ref: pincfg-node.yaml
> >=20
> > properties:
> > pinmux:
> > @@ -134,9 +136,25 @@ patternProperties:
> >=20
> > bias-disable: true
> >=20
> > - bias-pull-up: true
> > -
> > - bias-pull-down: true
> > + bias-pull-up:
> > + oneOf:
> > + - type: boolean
> > + - enum: [100, 101, 102, 103]
> > + description: Pull up PUPD/R0/R1 type define value.
> > + description: |
> > + For normal pull up type, it is not necessary to specify R1R0
> > + values; When pull up type is PUPD/R0/R1, adding R1R0 defines
> > + will set different resistance values.
> > +
> > + bias-pull-down:
> > + oneOf:
> > + - type: boolean
> > + - enum: [100, 101, 102, 103]
>=20
>=20
> 'bias-pull-down' is defined to be in Ohms. This doesn't look like it's
> Ohms.

That's right, these numbers appear to correspond to MTK_PUPD_SET_R1R0_*
values defined in include/dt-bindings/pinctrl/mt65xx.h, and work similar
to mediatek,pull-down-adv as defined in mediatek,mt8183-pinctrl.yaml.

Now I think the easiest thing to do in order to sort this out would be
be to stop supporting bias-pull-[up/down] properties and replace them
with mediatek,pull-[up/down]-adv, but I guess that would break old DT.
Changing the supported values to represent ohms and modifying drivers
to accommodate for that would be quite tedious since every pin group
on every SoC has different supported pull resistances, and it would
still break compatibility with old DT anyway.

Does anyone have a better idea on this? Or perhaps we could leave fixing
this for another time since issues with these bindings seem to never end
and this patch series just keeps growing.


