Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9114CDB465
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Oct 2023 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ky4ubGdae57/mX733GGuOGuQ1eSOHRJvBQy5KYpFo3k=; b=EMEup+ojBc6h+CuffdBlG0TKMi
	KVAmCqhmSkuaAR95Z+x4XhaL4arVNxseM1H2FOt7vvNrPig8Mz60/OtW/xFtuSX0VhnhY46otc8l8
	EmZvmTJcWjEHDnoE/P8BjNTUKRmDf/EmE4xpgsMJN27hfcp3mneqR8ge9pldvpcM95kF6EzTLOE6t
	cyy8HI+Tx6FVmbHCTERT9jQIsjPW21cg3aLHLmn6LOId/VE+aANurGIKwc0nXTCxqqV5cXxjxb44s
	7XkJ2ewGz8AIioWWWnJ+EB7rYLAuEYT0tbMlugfwddyo3N0gkwR8kQWfiT6J3TnFghoTwM1AFiZ4b
	ihtYZzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qresg-005QeN-0P;
	Sat, 14 Oct 2023 13:40:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qresc-005QdU-22;
	Sat, 14 Oct 2023 13:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4700BB80950;
	Sat, 14 Oct 2023 13:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB91C433C7;
	Sat, 14 Oct 2023 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697290830;
	bh=Q7S8F6R40H3dp08d7ADufCqrKm/jY9RVIY4yJv03XpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtudWUdmOGkVZtuiMPkUlH9w655ewkgWloSW/vKAAHZOQb/Fk4hOeLKUfEdclV9cY
	 BgRkM2JuqYi5QupGSUBgz2DvztSR7eec8+kmsuJSx66RcbvjQRsR5ouuopPHsiQ7By
	 rjch+xdUi2+R/DD5B4+ooHAWT4ALKKCPsxb6SDt754iMuAkm9v5+Zc5FkfOQ/CN8Ex
	 nUm3sEATd4YHyD97ADgGpH65wYyZb/+3D++euAQhIrvl2YkSp4LB79Owbzkl6ohLom
	 QYdHstofKuESfC2rdpe+Z0CsYJeqHc5VTc2dP4UjWWP2LzbIk6QM8VdCHWXWEw4Uwd
	 DKJ7bHXXcxzGQ==
Date: Sat, 14 Oct 2023 14:40:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel /
 Tentacool Chromebooks
Message-ID: <20231014-proud-levers-eb03f30a0a9a@spud>
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-3-wenst@chromium.org>
 <20231013-washer-mortally-b27c196ac50f@spud>
 <CAGXv+5GF7HfQSOg9c=G+c4DPUW24Ax7LX4raTynDbE3xc8iCdg@mail.gmail.com>
 <20231013-panic-vaseline-350c10e7d585@spud>
 <CAGXv+5EmLDWi3Lnca1vPft=9z9Cp2L2ee08in_b_21hipf9ieQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b4w+Q0lAZjVdrBkg"
Content-Disposition: inline
In-Reply-To: <CAGXv+5EmLDWi3Lnca1vPft=9z9Cp2L2ee08in_b_21hipf9ieQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231014_064034_938745_A6A5E0BD 
X-CRM114-Status: GOOD (  37.50  )
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


--b4w+Q0lAZjVdrBkg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 11:19:16AM -0700, Chen-Yu Tsai wrote:
> On Fri, Oct 13, 2023 at 10:55=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Fri, Oct 13, 2023 at 10:29:25AM -0700, Chen-Yu Tsai wrote:
> > > On Fri, Oct 13, 2023 at 8:11=E2=80=AFAM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Fri, Oct 13, 2023 at 07:02:28AM +0800, Chen-Yu Tsai wrote:
> > > > > Add entries for MT8186 based Tentacruel / Tentacool Chromebooks. =
The two
> > > > > are based on the same board design: the former is a convertible d=
evice
> > > > > with a touchscreen, stylus, and some extra buttons; the latter is=
 a
> > > > > clamshell device and lacks these additional features.
> > > > >
> > > > > The two devices both have two variants. The difference is a second
> > > > > source touchpad controller that shares the same address as the or=
iginal,
> > > > > but is incompatible.
> > > >
> > > > > The extra SKU IDs for the Tentacruel devices map to different sen=
sor
> > > > > components attached to the Embedded Controller. These are not vis=
ible
> > > > > to the main processor.
> > > >
> > > > Wha? Given your ordering, is a "google,tentacruel-sku262144" a supe=
r-set
> > > > of "google,tentacruel-sku262145"? If not, this compatible ordering
> > > > doesn't make sense. I can't tell from your description, and the
> > > > absence of a
> > > > items:
> > > >           - const: google,tentacruel-sku262145
> > > >           - const: google,tentacruel-sku262146
> > > >           - const: google,tentacruel-sku262147
> > > >           - const: google,tentacruel
> > > >           - const: mediatek,mt8186
> > > > suggests that there is no google,tentacruel-sku262145
> > > > device?
> > >
> > > AFAIK all four SKUs exist. And as far as the main processor is concer=
ned,
> > > they look completely identical, so they should share the same device =
tree.
> > > As mentioned in the commit message, the differences are only visible =
to
> > > the embedded controller, which fuses the sensor inputs.
> >
> > Then it makes very little sense to write a binding like this.
> > If this was just for the 252144 SKU, this would be fine.
> > For the other SKUs, there is no way to uniquely identify them, as
> > all four of google,tentacruel-sku262144, google,tentacruel-sku262145,
> > google,tentacruel-sku262146 and google,tentacruel-sku262147 must be
> > present.
> > Given that, why even bother including the SKUs in the first place,
> > since no information can be derived from them that cannot be derived
> > from google,tentacruel?
> > There's something that I am clearly missing here...
>=20
> There are incompatible variants of google,tentacruel. This is why this
> patch has four google,tentacruel based entries. Of them, two are Tentacoo=
l,
> which are clamshell laptops, and two of them are Tentacruel, which are
> convertibles.
>=20
> Within each group there are two variants: the second variant swaps out
> the I2C touchpad controller. These two controllers use the same I2C
> address but use different compatible strings, so it's not possible to
> have them coexist within the same device tree file like we do for many
> other second source components.
>=20
> So the relationship looks like the following:
>=20
> google,tentacruel --- Tentacruel --- google,tentacruel-sku26214[4567]
>                    |              |
>                    |              -- google,tentacruel-sku2621{48,49,50,5=
1}
>                    |
>                    -- Tentacool ---- google,tentacruel-sku327681
>                                  |
>                                  --- google,tentacruel-sku327683
>=20
> Also, the devices themselves only know their own SKU ID. The firmware
> will generate a list of compatible strings like:
>=20
>   google,tentacruel-rev4-sku262144
>   google,tentacruel-rev4
>   google,tentacruel-sku262144
>   google,tentacruel
>=20
> and try to find a match in the kernel FIT image. The method we currently
> use is to include all the applicable board compatible strings.

Then it seems like what you need is something like
oneOf:
  - items:
      - const: google,tentacruel-sku262144
      - const: google,tentacruel
      - const: mediatek,mt8186
  - items:
      - enum:
          - google,tentacruel-sku262145
          - google,tentacruel-sku262146
          - google,tentacruel-sku262147
      - const: google,tentacruel-sku262144
      - const: google,tentacruel
      - const: mediatek,mt8186

What you have at the moment just seems like a hack because you want to
stuff all of these compatible strings into a single dts.

--b4w+Q0lAZjVdrBkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSqaSgAKCRB4tDGHoIJi
0gbnAQDGQcQ7MJqo0/Jx5hbcdClD/QjvbaXEraD9NCdZaPFYMQD/Sa/mYcHlGnri
2n+JqH9dPz1y7uvoAvkEKszgdbYljQw=
=JYvf
-----END PGP SIGNATURE-----

--b4w+Q0lAZjVdrBkg--

