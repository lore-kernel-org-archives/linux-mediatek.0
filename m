Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A24D2CE0D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgtPIP5ghcxX8ennsjN+12y5HkQeQLWNBRhzT0K+ZsI=; b=v9eGz2eLM/ryGZ6a8pvtLwm02m
	qJnNW7wK882x47S7jKQRJpXB4I4bTLcxa/QOVHjdC5IGXiOTTiUcu4zLipNYWfIYOwBqIlv9AqVeA
	HiIIaaqmAQbkaao/tE1VLVPWqHX5BWcNEA6aFG+DJ1bKhmXEOAwELbzoUzrlCbnHIOpSsTIXmHHbw
	qKSBRzc35HNx/DmbbiWG60g09+9aXhBV2Noi7U6JldSMUeW01YcGatfaTOXfwX1abEk19P7J/WGmI
	jj51doiSOayUAxxHKhmQ9soAIbCrhhQQ2Ob3VuI1aUrehOtjkIFBJwiFR9aCP20tgQvwZFIvsXG+i
	vCIp5OKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Iv2-0000000BhJ1-1X5D;
	Tue, 22 Oct 2024 17:43:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ibv-0000000BdSH-1BUB;
	Tue, 22 Oct 2024 17:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E96365C58BC;
	Tue, 22 Oct 2024 17:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96122C4CEC3;
	Tue, 22 Oct 2024 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729617838;
	bh=u774XJNJoKaoO7NkJoZ6UrZ6tUzrujqv0gRuGOzw/hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fODqioL5YDB0GPyFq7GnX4U/RJwKQTIXdfMCHOpPXB8lT0AmCmjbsHBbvb+c33QCD
	 zxieNmT+ESorvyOEpKL6pHuvEKnZ3MXFamJiEA99iS3xUsBwKPOhAqL97AUNyLwosV
	 EJ9Pjg/d9ZmscmCFEqq+PdWyeJyReFUQViKwtf94yzzotdDwEzHu3ogziBN91mIpZQ
	 IDtkhHjrq2vFCLANnec6WtTzXUnky4VckPLJvJHzEs4QmiCTEMmbZXkQTVtTFL9RXT
	 Z8aEjr0NgfHNaHGjv1OeCuQOERkN3fSiSBL8eV3QJTAT2QCbATu2S8Udq07jlMPrwq
	 yxjxt6l6BLw2g==
Date: Tue, 22 Oct 2024 18:23:52 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: Add bindings for
 MT6735 syscon clock and reset controllers
Message-ID: <20241022-map-unsightly-fafb554b8f9b@spud>
References: <20241021121618.151079-1-y.oudjana@protonmail.com>
 <20241021121618.151079-2-y.oudjana@protonmail.com>
 <20241021-goatskin-wafer-7582dbcfe1d1@spud>
 <78f4da13-cbff-415b-a8eb-ec16108b5c00@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MGdtz8fU63TqFAKQ"
Content-Disposition: inline
In-Reply-To: <78f4da13-cbff-415b-a8eb-ec16108b5c00@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_102359_439418_EC8FE978 
X-CRM114-Status: GOOD (  17.87  )
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


--MGdtz8fU63TqFAKQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:36:20AM +0200, AngeloGioacchino Del Regno wrote:
> Il 21/10/24 18:56, Conor Dooley ha scritto:
> > On Mon, Oct 21, 2024 at 03:16:15PM +0300, Yassine Oudjana wrote:
> > > From: Yassine Oudjana <y.oudjana@protonmail.com>
> > >=20
> > > Add device tree bindings for syscon clock and reset controllers (IMGS=
YS,
> > > MFGCFG, VDECSYS and VENCSYS).
> > >=20
> > > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> > > ---
> > >   .../bindings/clock/mediatek,syscon.yaml           |  4 ++++
> > >   MAINTAINERS                                       |  6 ++++++
> > >   .../dt-bindings/clock/mediatek,mt6735-imgsys.h    | 15 ++++++++++++=
+++
> > >   .../dt-bindings/clock/mediatek,mt6735-mfgcfg.h    |  8 ++++++++
> > >   .../dt-bindings/clock/mediatek,mt6735-vdecsys.h   |  9 +++++++++
> > >   .../dt-bindings/clock/mediatek,mt6735-vencsys.h   | 11 +++++++++++
> > >   .../dt-bindings/reset/mediatek,mt6735-mfgcfg.h    |  9 +++++++++
> > >   .../dt-bindings/reset/mediatek,mt6735-vdecsys.h   | 10 ++++++++++
> >=20
> > Is it really necessary to have individual files foe each of these? Seems
> > a bit extra, no?
> >=20
>=20
> It's only good for including smaller headers in each driver (and/or DT, b=
ut
> then the SoC DT will anyway include them all).
>=20
> I'm fine with that, but I'm also fine with one header for clock and one f=
or reset.
>=20
> So.. Conor, it's however you prefer :-)

It's not worth respinning for, IMO, but I think having 8 and 9 line
header files for 2 definitions is silly.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--MGdtz8fU63TqFAKQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxffqAAKCRB4tDGHoIJi
0jppAQC3jp73TDDQ8ceo7QUcuVoccM5RURc39pRsxAGOCXGfdwEA/dA9MNvMdUWv
jSwY6hOKcpjb/PE5XD01uo3g0gxiBwE=
=3GWk
-----END PGP SIGNATURE-----

--MGdtz8fU63TqFAKQ--

