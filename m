Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AD1C0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8LCmvk0SXiK2y1ToQ68zjhYsoeD3iuvdRmz0k44Qh4=; b=S9iiYwB2mpwvJ6aS0yA5QLxNIN
	Ze3qBjQdxdvnKW/KGl6TtRWPcqagHZFUl81BOXwnh9lcUCYG2nJOcBAKy8acpNNgR8pYbJb7Tv5PX
	LgmcS2FDdB12hFkeXyFEpWr62YchL+LV1bYYbj0nYsGdfxzIMTNccu4OMM56oKAZ+nbP1xp5QndP6
	GZgCGDr+M3LtHmv2PUnJHoRNCmsVMkMr5WPZtGIo2rWye3ebnHUxXzkvKu2D+Sz0NbgRrmoc+USzA
	fO5AjoHIjmO200j4QYfQc08tLyRLsqbRmteMow+f2ccbjj3z6LsxseFMIUWE5MYDd/tMvnb9nNiBJ
	IqLvC9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfCW-00CYNo-2Y;
	Wed, 25 Oct 2023 14:49:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfCS-00CYMo-23;
	Wed, 25 Oct 2023 14:49:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA2BA630BF;
	Wed, 25 Oct 2023 14:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5ECC433C8;
	Wed, 25 Oct 2023 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698245374;
	bh=g8c0ZqXEd+5miVwaaQEwfnrYYAhfuPmdWpJQcdlsakE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvuYL0CkCqKmU8kEiF8yK/BtZZR7hOAaiJ2a2gYPUHteYQ6YOZey5rLFET4OueViT
	 MXbzzmDscQU5O6f+R/kV3rfcUCJxQJHV1ElJF56953GXqTyfBJ0XHzbXValfLXc5Ql
	 FB2R8+PzCtwp4y7awD1H26vEjCodXSR3GTmsrpPQOc52bf5US7wNT/ZztcsSn9P2/4
	 r2bypPZVFR+vZTWi9RAbRdy4Cam+I1HGY6+BFiQlxeW9ee1PASJy7FTAlT68VPW1tN
	 R3TpuzqoyoLi3j+PdSt7cczRvR3YQR7TUkZck/pm0lyXxjNdz26xnm97uYXPBDgf48
	 MystXecyzwGXg==
Date: Wed, 25 Oct 2023 15:49:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 3/6] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Message-ID: <20231025-charity-replica-9c9b03380d7f@spud>
References: <20231024000724.57714-1-hsinyi@chromium.org>
 <20231024000724.57714-4-hsinyi@chromium.org>
 <20231024-bobbed-although-06f341259ebb@spud>
 <CAJMQK-hvhjNGFUfgqb7pm=pAYjJ0wZAhkPGXxDCUJ5cnUDh2gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZJFVlm9+Zn/c9yF1"
Content-Disposition: inline
In-Reply-To: <CAJMQK-hvhjNGFUfgqb7pm=pAYjJ0wZAhkPGXxDCUJ5cnUDh2gw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_074936_760060_EC0172E3 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>, =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--ZJFVlm9+Zn/c9yF1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 11:22:00AM -0700, Hsin-Yi Wang wrote:
> On Tue, Oct 24, 2023 at 8:17=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Oct 23, 2023 at 05:02:26PM -0700, Hsin-Yi Wang wrote:
> > > Add makomo sku0 and sku1 which uses different audio codec.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/mediatek.yaml | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Do=
cumentation/devicetree/bindings/arm/mediatek.yaml
> > > index fe8c488a3207..b131e0bdbf01 100644
> > > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > @@ -250,6 +250,18 @@ properties:
> > >                - google,kodama-sku32
> > >            - const: google,kodama
> > >            - const: mediatek,mt8183
> > > +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen M=
TK 2)
> > > +        items:
> > > +          - const: google,makomo-rev4-sku0
> > > +          - const: google,makomo-rev5-sku0
> >
> > With these bindings, how does one describe a makomo-rev5-sku0?
> > What you have here is only suitable for describing the makomo-rev4-sku0.
> >
> makomo-rev5-sku0 and makomo-rev4-sku0 uses the same dts:
>=20
> compatible =3D "google,makomo-rev4-sku0", "google,makomo-rev5-sku0",
>                       "google,makomo", "mediatek,mt8183";
>=20
> In this case, can bindings be listed like that?

On a rev5-sku0, the first compatible should be the most specific one,
which would mean:

compatible =3D "google,makomo-rev5-sku0", "google,makomo", "mediatek,mt8183=
";

I said the same on other google laptop bindings before, but I'm not
really happy with these compatible configurations, that seem conjured up
to suit your firmware. It'd make far more sense to me to have a setup
that permitted:
compatible =3D "google,makomo-sku0-rev5", "google,makomo-sku0", "google,mak=
omo", "mediatek,mt8183";
and
compatible =3D "google,makomo-sku0-rev4", "google,makomo-sku0", "google,mak=
omo", "mediatek,mt8183";

Cheers,
Conor.

> > > +          - const: google,makomo
> > > +          - const: mediatek,mt8183
> > > +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen M=
TK 2)
> > > +        items:
> > > +          - const: google,makomo-rev4-sku1
> > > +          - const: google,makomo-rev5-sku1
> > > +          - const: google,makomo
> > > +          - const: mediatek,mt8183
> > >        - description: Google Willow (Acer Chromebook 311 C722/C722T)
> > >          items:
> > >            - enum:
> > > --
> > > 2.42.0.758.gaed0368e0e-goog
> > >

--ZJFVlm9+Zn/c9yF1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTkq+AAKCRB4tDGHoIJi
0rnGAP9ZabySIiA8SVpNMYulGM3x3bCMQhPDIuSRdNFrqvuBKgEApPdAFGmmDMNE
Pqyn5ngRg4/wRf9xVNi8zaqOYEf2ug0=
=ShOI
-----END PGP SIGNATURE-----

--ZJFVlm9+Zn/c9yF1--

