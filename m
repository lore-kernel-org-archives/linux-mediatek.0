Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E147C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEO7jKAKCPzDL8FtobZad8/84KpoEOayy5z47i0zBtQ=; b=1f3JQS/GhU6uB9qMcEGgvhRqKt
	9QVU4WPKus2BvUZIjHjHQqgV4pGtTsQur3vGjL7+jY4Jx/M6Y+PEdadqZbiiEm3wpEt0Q9Rj1wsDX
	n1KS8Q+UwluH9aTK+Nrp05OfKON+tOk0w22rXXV3tfoDWjHo8xSrMl6w8TatdJp1XP9RgRjD0MXZ8
	3tT2FlTmpy57v2Se3eaYKbE3E/KsU6rPXzQfvDdgoqBhdU5BRE9smBI1H9b41pZUrjHSonEYyNYiJ
	HtJExDSu3gYmauI9+V0k+Okd01Xlh+iWinvPPdd1X1NHANz9ucgfagCsSY7vZxKo1wd+mzUGsR/cO
	8mLjK4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8s3-0000000BZvq-3Erh;
	Fri, 26 Jun 2026 15:53:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8s3-0000000BZvg-08ep
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 15:53:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28F95600D8;
	Fri, 26 Jun 2026 15:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A1A1F00A3A;
	Fri, 26 Jun 2026 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782489213;
	bh=TEO7jKAKCPzDL8FtobZad8/84KpoEOayy5z47i0zBtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BziHvIyEYCAN2Wdp0fEhcRjUsDq/Gjo92fHTREZwOFosrFFY7LqHa4oRrQ3ZQdWiK
	 5xY6YurkSLO2/kanXHLF4ICHpm2proWTcWUT6sfR+KGYLY6PqHZVdzUDkNYWmWmENb
	 NpjqG/pcIkDnR31zHDgYMITuhG6obuFh44DoztFMEqxCbhAozfnBhaW79DnlNfW9bR
	 TmvC/h4ECtCDUt4sEbpwGHBgXzmqAnkRREJa/ytnYKdDJ9llR/3XTU5FMMHp23CWiV
	 cT/r2uqbm3FyoVdl8JKJY7r/LpnNqXVDmuhZBGgtvOfVUqQnkapG/AbAtXMtTSMEys
	 cCoSCadxhhk+w==
Date: Fri, 26 Jun 2026 16:53:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: peter.wang@mediatek.com, linux-kernel@vger.kernel.org, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
	linux-devicetree@vger.kernel.org, chun-hung.wu@mediatek.com,
	alice.chao@mediatek.com, naomi.chu@mediatek.com,
	ed.tsai@mediatek.com
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Message-ID: <20260626-rewrap-sediment-ad9449abd837@spud>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
 <20260626074820.2537772-2-peter.wang@mediatek.com>
 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SbwAaF4JR27ITmQ7"
Content-Disposition: inline
In-Reply-To: <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
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


--SbwAaF4JR27ITmQ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 10:33:20AM +0200, Philipp Zabel wrote:

> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    ufs0cfg_ao: syscon@16840000 {
> > +        compatible =3D "mediatek,mt8183-ufs0cfg_ao", "syscon", "simple=
-mfd";
>=20
> Where is the binding doc for mediatek,mt8183-ufs0cfg_ao? Is this
> simple-mfd just to load the reset driver?

It isn't going to exist, since we will chuck a fit at the underscore!

>=20
> > +        reg =3D <0x16840000 0x1000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        ufs0cfgao_rst: reset-controller {
> > +            compatible =3D "mediatek,syscon-reset";
>=20
> It looks to me like this is just two registers inside ufs0cfg_ao, not a
> separate device. Why don't you just add #reset-cells to the parent
> node?

I concur, seems like it should be in the parent.
pw-bot: changes-requested

>=20
> > +            #reset-cells =3D <1>;
> > +            mediatek,reset-bits =3D
> > +                <0x48  3  0x4c  3  100>,
> > +                <0x148 0  0x14c 0  100>,
> > +                <0x148 1  0x14c 1  100>,
> > +                <0x148 2  0x14c 2  0>;
> > +        };
>=20
> Why is this in DT? This should be a table in the reset driver.
>=20
> regards
> Philipp

--SbwAaF4JR27ITmQ7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6geAAKCRB4tDGHoIJi
0ghHAP989cBkqpm6xunHVMaoI6R3jsc+bhIIE55ueB2q4ezN4wD+NQP9qD+msJ7s
v74SVWF2FIl3dzq7t1BO+TJpeP6s+gs=
=/Xy/
-----END PGP SIGNATURE-----

--SbwAaF4JR27ITmQ7--

