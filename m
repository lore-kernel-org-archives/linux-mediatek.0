Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0A5C71133
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kz1XcnvmZcL7hMVZ4Qp9mCV+7aUd9WpCK7LfvT7kDSs=; b=qPvA7FIqi2gqfTCL0B0b1/YfNk
	T0xSxpEM9e8a3O8rVK8cBpthLM4OrUaS5YTboOm9iVu6tTqZrU4W6OGzZdVTAKXKB7ud2E7ttfeIx
	wy7ob8tSaR9Dd+qSxBF7TqRyhhLIqrf0uIV50b5mdOn6lYAHnAAL1qclJ3GKb4m3/2YLW5fU70Gq/
	B3kbsvAcFvEaODg0nkm50GNWdznEbR6AH5hsBajPRy2+vxgqrNGiQOiJyrkauWw+EKMNs5Y3EagND
	EOi4x4uafyu/b7XpwW0Lp68V0hm1ljojTLRzFCw2nDe8d5z77y8hSNF9wLDGiqxmrmUS1PKpe+hAW
	ujDOzCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXmy-005b60-2I;
	Fri, 25 Aug 2023 14:27:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXmt-005b56-32;
	Fri, 25 Aug 2023 14:27:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCB4E61B0D;
	Fri, 25 Aug 2023 14:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD22AC433C7;
	Fri, 25 Aug 2023 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692973666;
	bh=UksBdrJBzm/E55qDKqtkZMez6Zo0v+Z97iw2xCA3TEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LyZP72FBnStze+r9BnWyPApB1h7vLsXBKgwj5SOM62pRh892THuUfVJmFjcSERomT
	 UN2YBoMdNNbvaJGrPgGwj/Vw3PYx3amtGKZGeFHeU4Vpem/NFeFF7cH+YEazBTsx0T
	 +CSPYYEMxo9j9g0eEvFJRMcu4EaFjRP5fkAGCD1a8Cy7q1dKyN1cPrpWYagRTOHfjk
	 vBtgySlby3pkTX1E1zhiynTYIyxthE2T6nIwUZ6LElorgVPCr/89BkTNynwJ5IlzMx
	 SAi2tjLW9N7ZtthyI733S0lREiTHCTRbSfxxXaax4/HWXYgaSie6M6emrXmt2VjGxI
	 N7Zmo0VEOHb0A==
Date: Fri, 25 Aug 2023 16:27:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, emma@anholt.net, 
	linux-doc@vger.kernel.org, david.heidelberg@collabora.com, 
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net, 
	khilman@baylibre.com, sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com, 
	linux-rockchip@lists.infradead.org, daniels@collabora.com, martin.blumenstingl@googlemail.com, 
	robclark@freedesktop.org, anholt@google.com, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
	angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, guilherme.gallo@collabora.com, 
	linux-kernel@vger.kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH 2/6] drm: ci: Force db410c to host mode
Message-ID: <5xlfrdnutrncqdyal36222ka7qkgbtrixm3cpjk6reb7xu6zwu@nyiowsjng5k6>
References: <87pm3b2pkz.fsf@intel.com>
 <29c7-64e8b600-1-6afffd8@162524228>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uahdtp2khpso5z52"
Content-Disposition: inline
In-Reply-To: <29c7-64e8b600-1-6afffd8@162524228>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_072748_081602_206B0074 
X-CRM114-Status: GOOD (  29.39  )
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


--uahdtp2khpso5z52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Helen,

On Fri, Aug 25, 2023 at 03:09:04PM +0100, Helen Mae Koike Fornazier wrote:
> Hi Jani, thanks for your comments
>=20
> On Friday, August 25, 2023 10:56 -03, Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>=20
> > On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> > > Force db410c to host mode to fix network issue which results in failu=
re
> > > to mount root fs via NFS.
> > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c1=
5c80a54dda510743cefd1c4b65b8
> > >
> > > Since this fix is not sent upstream, add it to build.sh script
> > > before building the kernel and dts. Better approach would be
> > > to use devicetree overlays.
> > >
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > ---
> > >  drivers/gpu/drm/ci/build.sh | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > > index 7b014287a041..c39834bd6bd7 100644
> > > --- a/drivers/gpu/drm/ci/build.sh
> > > +++ b/drivers/gpu/drm/ci/build.sh
> > > @@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
> > >      fi
> > >  fi
> > > =20
> > > +# Force db410c to host mode to fix network issue which results in fa=
ilure to mount root fs via NFS.
> > > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b=
8c15c80a54dda510743cefd1c4b65b8
> > > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\tdr_mo=
de =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > > +
> >=20
> > It seems like a really bad idea to me to have the CI build modify the
> > source tree before building.
> >=20
> > The kernel being built will have a dirty git repo, and the localversion
> > will have -dirty in it.
>=20
> Is it bad?
>=20
> The other option was to work with device tree overlays (but we still
> need to spend some time to see how to fit it all together)

That would be much better. libfdt provides an fdtoverlay command to
merge a base device tree with an overlay.

Do that while setting up the DUT and you're done :)

Maxime

--uahdtp2khpso5z52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOi6XwAKCRDj7w1vZxhR
xSBKAQDfFOVdXMCZ/9a7sggeX0OzQ2xZtgSgfdTEVanD/QmKiAEAo93ffgaueCJa
HBQKGvHTkvdsjLQGuuPJdVW683tzXAU=
=kd8L
-----END PGP SIGNATURE-----

--uahdtp2khpso5z52--

