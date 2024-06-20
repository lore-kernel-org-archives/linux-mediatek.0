Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08B1C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlmWkVEKzTwzyTEHRJjRJM3FETRdl85oGzHJ0HQkxVg=; b=zEsaMAdO4TXjDcMj3F8jKX19eX
	exYU5/Nt3ZZxPlHORA5cU/kUdhl/8niNbGERsn7Xm4hXH365fu1s4InBCvwleuVdaJpZzaH7EjJWE
	8FxlNBXrITkuo7uwJjvwZDWWIOPAv1PTy17nR1nH7wnz1Aqi0oh8V+vNGa7rY//fwyAFz4R2GuDbX
	bfflBi4kFFcdyQKI8/yrofL1c2f57Ia10AaavT7a2at06qnp3sF/MpaRE3dDTmOCiRxE8V5ISiIDb
	Th/MzpjcKEb8haZxkdos9TVKzdqE0M2vwF7Un6IKbKBqStPJor6n58H4YSAo9xc8lqD8du2hlk4VK
	4Yu2cczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKT8-00000005nQX-1ZQI;
	Thu, 20 Jun 2024 16:17:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKSw-00000005nIz-3mZK;
	Thu, 20 Jun 2024 16:16:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67CC7CE26FF;
	Thu, 20 Jun 2024 16:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BA7C4AF07;
	Thu, 20 Jun 2024 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900206;
	bh=MlmWkVEKzTwzyTEHRJjRJM3FETRdl85oGzHJ0HQkxVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFr5LJbskoDfbvpN0PmNGIwnRLrx6lgUgzxwXrODA0+ngJDKTh6hyTFYU3x4Vn7Z0
	 g/QrWGCMv8hC7MYVpJfI+fJHWQaohBTaSXsEcavDwrfkIvinxEy3NIBwI/XLYg40Hr
	 u0qCsGjaUYtXt3ywzot+3gPptjbi5c6Uoy7d5YCQsoiLAdzco5WyuKtMYJUCi+sTfz
	 3OPp9gZRQaEsRaco717MH4O/smJ+3Gi1fJJu9RRUfru2hjczI1PfvOLQ5hl/IUTEqp
	 Lbd3/rkNlX16ixSzxH2gAmm+MBReO+ulBNh37fGfsilU5kM5nq+mqZIStbaWZgpHiO
	 X/OvA3s/0b+Pw==
Date: Thu, 20 Jun 2024 17:16:40 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, krzk+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	jassisinghbrar@gmail.com, garmin.chang@mediatek.com,
	houlong.wei@mediatek.com, Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com, Elvis.Wang@mediatek.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: mediatek: Avoid clock-names on
 MT8188 GCE
Message-ID: <20240620-prize-cavalier-01460bf50050@spud>
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
 <20240619085322.66716-3-angelogioacchino.delregno@collabora.com>
 <20240619-sleeve-citable-a3dc10e5cd4f@spud>
 <a7317981-8690-4d45-81b6-cc6a63c459e0@collabora.com>
 <20240620-district-bullring-c028e0183925@wendy>
 <c154527b-90c3-4834-a4a0-cff4524de5f1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jbOS/vXohNu3Z1I1"
Content-Disposition: inline
In-Reply-To: <c154527b-90c3-4834-a4a0-cff4524de5f1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_091651_454508_80A46B5A 
X-CRM114-Status: GOOD (  28.36  )
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


--jbOS/vXohNu3Z1I1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:32:36AM +0200, AngeloGioacchino Del Regno wrote:
> Il 20/06/24 10:22, Conor Dooley ha scritto:
> > On Thu, Jun 20, 2024 at 10:01:18AM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > Il 19/06/24 19:49, Conor Dooley ha scritto:
> > > > On Wed, Jun 19, 2024 at 10:53:22AM +0200, AngeloGioacchino Del Regn=
o wrote:
> > > > > Add mediatek,mt8188-gce to the list of compatibles for which the
> > > > > clock-names property is not required.
> > > >=20
> > > > Because, I assume, it has some internal clock? Why do either of the=
se
> > > > things have no clock? Doesn't the internal logic require one?
> > > >=20
> > >=20
> > > Because there's no gce0/gce1 clock, there's only an infracfg_AO clock=
 that is
> > > for one GCE instance, hence there's no need to require clock-names.
> >=20
> > clock-names, d'oh. I misread that completely yesterday.
> >=20
> > > I can't remove the clock-names requirement from the older compatibles=
 though,
> > > because the (sorry about this word) driver (eh..) gets the clock by n=
ame for
> > > the single GCE SoCs...
> > >=20
> > > ...and here comes a self-NACK for this commit, I have to fix the driv=
er and
> > > then stop requiring clock-names on all compatibles, instead of having=
 this
> > > ugly nonsense.
> >=20
> > Is it not worth keeping the clock names, even if ugly or w/e, because
> > things have been done that way for a while?
>=20
> It's worth allowing clock-names, but *requiring* that is unnecessary beca=
use
> there is, and there will always be, only one clock...!

Right, dunno if I misread you earlier or misunderstood. Fighting fires
at work and replying to mails mid bisection is what I am going to blame
;)

> > Also, what does U-Boot do on these systems to get the clocks?
> >=20
>=20
> U-Boot doesn't support GCE at all (no driver - at least upstream)...!

Running LIFO through my mailbox today, seeing this after the other
mail..

>=20
> > > Self-note: gce0/gce1 clocks lookup was implemented in the driver but =
never
> > > used and never added to the binding - luckily.
> > >=20
> > > Sorry Conor, I just acknowledged that there's a better way of doing t=
hat.
> > >=20
> > > Thank you for making me re-read this stuff, I'll send the proper chan=
ges
> > > later today, driver change + binding change in a separate series.
> > >=20
> > > As for the other two commits in this series, completely unrelated to =
GCE,
> > > those are still fine, and are fixing dtbs_check warnings.
>=20
>=20

--jbOS/vXohNu3Z1I1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRV6AAKCRB4tDGHoIJi
0iPkAP9KYQ34Wxhe6bOZwHhYtdnsKdrRh0kI6IDFCx77qgbTEAD+OG9IT9Zrd+R1
2LwxBUbA8JNIZOP3VtParnm8vK8h6wM=
=QiGH
-----END PGP SIGNATURE-----

--jbOS/vXohNu3Z1I1--

