Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA7CC001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzTn9uUAGz3WxmJ/CW+t5whJwgb1Tqg4Do1JsOCeFpE=; b=2LxkNGSsK3blpZ5S77xt8zoLEm
	p8rX5gH+3kjeXtETYy2euF5O5SoOIwdyTMHxCzFy0SOz/pz2PsYPfe50Fso3cwTYEHq01McBOXsuU
	k6sLuR247OcNLKL2cLQ5R9d4kBHz1wKcUyVd9Bx25XuzvbkU1EY+pD2weX3ut6yAr0f6ZTaUEJnO1
	LaVlxcStDhB+PfMXhwOwBagjUdR82IuXkQ79+ubp6AFYXJL5WiIyXtm2zpDpzBOXOnVQRuJoS2Xzx
	gXhuk2wKOqXOqasKs6m3DG7p0WKs7IIbBS4PpxVv8hN2OuktMCcYGPiYV4bAepTUZ2vw7m5uzumyy
	MBecsJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ9Q-002Soy-0o;
	Fri, 28 Jul 2023 08:48:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ9A-002SgD-1h;
	Fri, 28 Jul 2023 08:48:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96C4362044;
	Fri, 28 Jul 2023 08:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ED6C433CA;
	Fri, 28 Jul 2023 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690534107;
	bh=MWYn0ZrD+F0fN2IJzgSEyyw2W5hXt/o/TWyWPk3BOWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3IxMP29Fvt2U/ljC8FoYM2aSfMb4zzVIXEdQ56M3YkhOqas3XdA+FVqC9ij+r478
	 vxEtmxmGKwWE4IFHmr4Uzq+l/M9WJHOIBLMDFe2mDqHhugB9Gj9vXaiFFs8sMM9hIW
	 7Ld4Gcoa2bCFQdEEDBw+W7sdJjmL7810LMK22AhHXbuTRGxB5NLu4w6KGzuygwVEmx
	 fjg6U4EHCWsA76AvETNxQNs+48uOc0WOJxneAy5YalDknBkjnOZpQnBfbMS2ZKka3Y
	 Wkohx2HEOkEQXXNN1yZrb3U6eBrT5HxiuoM6MNb6gIaA1geJWVU0AFY3aGDm4iex/2
	 UHfcK7Opo0cGA==
Date: Fri, 28 Jul 2023 10:48:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Helen Koike <helen.koike@collabora.com>, emma@anholt.net, linux-doc@vger.kernel.org, 
	david.heidelberg@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net, 
	khilman@baylibre.com, sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com, 
	linux-rockchip@lists.infradead.org, daniels@collabora.com, martin.blumenstingl@googlemail.com, 
	anholt@google.com, linux-mediatek@lists.infradead.org, robclark@freedesktop.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
	angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, guilherme.gallo@collabora.com, 
	linux-kernel@vger.kernel.org, tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
Message-ID: <5vmoxioppbrbw3tshfr37m3mvkfattkidhkhvqlyqsqh3tniwh@lhjbpdwl7bud>
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <CAF6AEGtXL5vjp3Uup6Mk19MiY8E26-tpyXVmxXYhMd3fiadykQ@mail.gmail.com>
 <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
 <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f2af24lhagcawgl4"
Content-Disposition: inline
In-Reply-To: <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_014828_652584_554B6F27 
X-CRM114-Status: GOOD (  23.38  )
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


--f2af24lhagcawgl4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 28, 2023 at 06:26:39AM +0100, Daniel Stone wrote:
> On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > > I did run into a bit of a chicken vs. egg problem with testing the "in
> > > tree" version (compared to earlier versions which kept most of the yml
> > > and scripts in a separate tree), is that it actually requires this
> > > commit to exist in the branch you want to run CI on.  My earlier
> > > workaround of pulling the drm/ci commit in via
> > > ${branchname}-external-fixes no longer works.
> >
> > After unwinding some more gitlab repo settings that were for the
> > previous out-of-tree yml setup, I have this working.
> >
> > Tested-by: Rob Clark <robdclark@gmail.com>
> > Acked-by: Rob Clark <robdclark@gmail.com>
>=20
> And it's also:
> Acked-by: Daniel Stone <daniels@collabora.com>
>=20
> It's been back and forth a few times by now and reviewed pretty
> heavily by all the people who are across the CI details. I think the
> next step is to answer all the workflow questions by actually getting
> it into trees and using it in anger. There was some discussion about
> whether this should come in from drm-misc, or the core DRM tree, or a
> completely separate pull, but I'm not sure what the conclusion was ...
> maintainers, thoughts?

I'd be ok with merging it through drm-misc

Maxime

--f2af24lhagcawgl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMOA2AAKCRDj7w1vZxhR
xVJwAQC7Egc+whFQ35hiIzHma3bPEJSg/s0UJDLuo9YxMSO3XgEAgjTU7f/m28jW
62zzrvNx2pZMQInhGhPSzUgYMtiQ7Q4=
=b4ll
-----END PGP SIGNATURE-----

--f2af24lhagcawgl4--

