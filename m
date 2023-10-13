Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C53CDB483
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 17:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4pXwvC7L3TcoRa/I7CPrKJwmMxTwKYKe13IVdcGA7w=; b=K4PO78C+nptbmBSK2G6zhfld9t
	D8QmL+7MfwdXLkHHoUqZIflyiDjYZ17lbLn4h8TeueDYteFJRtG1dK566zRCk9EyKqzJuTNw01ugL
	fAntuMTjaUhd//ePZHn786xYt4CtUHRLG2N8rRbdxjxa7DDc0iiw/pDcL4OSGwRYJBk0VKi4rTpNZ
	gxpZBkve2E9w6DlZAA67clZSIaaxVL7jnRuiSNzZI2eDSupdzxNOkJqjunH1RgtdF5iM/q8rlCwSd
	ncEe2HV6kzF5MWzLm7K654H9WLmQ8iN7FZ7n7ReJh8YF4+E4p5tTj4PN6FBnxBdlE6MUvtWajK+HN
	ipkkO7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrMNS-0040RQ-24;
	Fri, 13 Oct 2023 17:55:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrMNP-0040Qc-1q;
	Fri, 13 Oct 2023 17:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1DC78B82ADF;
	Fri, 13 Oct 2023 17:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661EBC433C7;
	Fri, 13 Oct 2023 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697219705;
	bh=7IamPXTmz8rMuid6Tr9dVZoV3lmTXmDMvdIcBzXdT7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjET7qMd2cdxkddUY8YlBjojhX6lMYkx7Y805KW6478kUEPfy0tZ/vzU1kh+HH2wB
	 hKXl/GuHRBBYoeENwBoPanwRT9cha7kYXprM82kqBQOg/kP0nzja9Yj+DaXy8yiEkb
	 uEzQ9Q/tqJbXdS1Nnqzrdx0SBnyIrDAwhP9z5Fx/Z7S+jOGnqBGTC4klhWb0V/A6Le
	 6bQR+y3cgLTZToI3cIE0bg8uIs1wSdWpvRANW1l2QCyNlL8JXc6ai5fYC+32N6yubA
	 8cvYEdy/LZTx9J2cHHZ7ZKEbD8sB//rXEQmMS4sKrlqzZfPTKBXw6Qeems1Xk859pd
	 003wY0EBdRxRA==
Date: Fri, 13 Oct 2023 18:55:01 +0100
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
Message-ID: <20231013-panic-vaseline-350c10e7d585@spud>
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-3-wenst@chromium.org>
 <20231013-washer-mortally-b27c196ac50f@spud>
 <CAGXv+5GF7HfQSOg9c=G+c4DPUW24Ax7LX4raTynDbE3xc8iCdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9NYY4vQdb9ornYDu"
Content-Disposition: inline
In-Reply-To: <CAGXv+5GF7HfQSOg9c=G+c4DPUW24Ax7LX4raTynDbE3xc8iCdg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_105507_911957_A240E30F 
X-CRM114-Status: GOOD (  32.46  )
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


--9NYY4vQdb9ornYDu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 10:29:25AM -0700, Chen-Yu Tsai wrote:
> On Fri, Oct 13, 2023 at 8:11=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Fri, Oct 13, 2023 at 07:02:28AM +0800, Chen-Yu Tsai wrote:
> > > Add entries for MT8186 based Tentacruel / Tentacool Chromebooks. The =
two
> > > are based on the same board design: the former is a convertible device
> > > with a touchscreen, stylus, and some extra buttons; the latter is a
> > > clamshell device and lacks these additional features.
> > >
> > > The two devices both have two variants. The difference is a second
> > > source touchpad controller that shares the same address as the origin=
al,
> > > but is incompatible.
> >
> > > The extra SKU IDs for the Tentacruel devices map to different sensor
> > > components attached to the Embedded Controller. These are not visible
> > > to the main processor.
> >
> > Wha? Given your ordering, is a "google,tentacruel-sku262144" a super-set
> > of "google,tentacruel-sku262145"? If not, this compatible ordering
> > doesn't make sense. I can't tell from your description, and the
> > absence of a
> > items:
> >           - const: google,tentacruel-sku262145
> >           - const: google,tentacruel-sku262146
> >           - const: google,tentacruel-sku262147
> >           - const: google,tentacruel
> >           - const: mediatek,mt8186
> > suggests that there is no google,tentacruel-sku262145
> > device?
>=20
> AFAIK all four SKUs exist. And as far as the main processor is concerned,
> they look completely identical, so they should share the same device tree.
> As mentioned in the commit message, the differences are only visible to
> the embedded controller, which fuses the sensor inputs.

Then it makes very little sense to write a binding like this.
If this was just for the 252144 SKU, this would be fine.
For the other SKUs, there is no way to uniquely identify them, as
all four of google,tentacruel-sku262144, google,tentacruel-sku262145,
google,tentacruel-sku262146 and google,tentacruel-sku262147 must be
present.
Given that, why even bother including the SKUs in the first place,
since no information can be derived from them that cannot be derived
=66rom google,tentacruel?
There's something that I am clearly missing here...

Also, why is the order inverted, with the lower SKUs being super-sets of
the higher ones? The Hana one you show below makes a little more sense
in that regard.

> Writing it this way avoids having four identical device tree files.
>=20
> We also do this for many other device families, though those cover
> different revisions, such as:
>=20
>       - description: Google Hana (Lenovo Chromebook N23 Yoga, C330, 300e,=
=2E..)
>         items:
>           - const: google,hana-rev6
>           - const: google,hana-rev5
>           - const: google,hana-rev4
>           - const: google,hana-rev3
>           - const: google,hana
>           - const: mediatek,mt8173
>=20
>=20
> ChenYu
>=20
> > Cheers,
> > Conor.
> >
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  .../devicetree/bindings/arm/mediatek.yaml     | 26 +++++++++++++++++=
++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Do=
cumentation/devicetree/bindings/arm/mediatek.yaml
> > > index 60337b439744..aa7e6734b336 100644
> > > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > @@ -206,6 +206,32 @@ properties:
> > >            - enum:
> > >                - mediatek,mt8183-pumpkin
> > >            - const: mediatek,mt8183
> > > +      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM=
1402F)
> > > +        items:
> > > +          - const: google,tentacruel-sku262144
> > > +          - const: google,tentacruel-sku262145
> > > +          - const: google,tentacruel-sku262146
> > > +          - const: google,tentacruel-sku262147
> > > +          - const: google,tentacruel
> > > +          - const: mediatek,mt8186
> > > +      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM=
1402F)
> > > +        items:
> > > +          - const: google,tentacruel-sku262148
> > > +          - const: google,tentacruel-sku262149
> > > +          - const: google,tentacruel-sku262150
> > > +          - const: google,tentacruel-sku262151
> > > +          - const: google,tentacruel
> > > +          - const: mediatek,mt8186
> > > +      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
> > > +        items:
> > > +          - const: google,tentacruel-sku327681
> > > +          - const: google,tentacruel
> > > +          - const: mediatek,mt8186
> > > +      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
> > > +        items:
> > > +          - const: google,tentacruel-sku327683
> > > +          - const: google,tentacruel
> > > +          - const: mediatek,mt8186
> > >        - items:
> > >            - enum:
> > >                - mediatek,mt8186-evb
> > > --
> > > 2.42.0.655.g421f12c284-goog
> > >

--9NYY4vQdb9ornYDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSmEdQAKCRB4tDGHoIJi
0vjhAP9fKNGUBz2HMnG2ILJzOr0cgfze+4tqoryOMOIyWAjHDAEAwCbqZBVwT61j
WfBudZ6XiijDWDUaS2LAIEvxmyMGzAs=
=TciW
-----END PGP SIGNATURE-----

--9NYY4vQdb9ornYDu--

