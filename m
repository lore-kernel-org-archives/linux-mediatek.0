Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D7606A338
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UmV2Kx1m;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I5KR91DZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GPBJLsJh7gQ+qJXgr4h2BZwP0qjmmcfqj8Qsq6esC70=; b=UmV2Kx1mHAv/kTSCIsO5TpMxbi
	9OmAB9bshUfWUoor2VIDMq52KTRkKeHtLIPjrdK1hf7+PsdCAdjgLDB2IdVbFSd1D9217lImmojbd
	G+afOX1SkA5rsjDZxpw/ouEmTz1BJ90WMCGdInkgiZEzdOD0T/Uek7z7cOyfvXccAgUouT5YiXWOH
	rNBmnSxHXWQ0/Y0HoF4ErJClLdxcdm0C4MyP0b4X9PBfbLVJA2ly1TSe0aXkVNFSM1NFVB6kAYwuJ
	p6EO1wEuYtxnHehYgeWk6252+7gh+irYIWZEWXD5u08TQes61YFVtsAOPnbq3gJOtdZxvtSIGID9C
	krxXpvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXto-0000000D2t4-0QST;
	Thu, 26 Nov 2026 11:44:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXtn-0000000D2sh-0zwx;
	Thu, 26 Nov 2026 11:44:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 057A941196;
	Thu, 26 Nov 2026 11:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60BF1F000C6;
	Thu, 26 Nov 2026 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693462;
	bh=GPBJLsJh7gQ+qJXgr4h2BZwP0qjmmcfqj8Qsq6esC70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I5KR91DZ584LXSWHTtNd251Xc4KwiWYJ4AJRKVkJ1r0D3SY+CrS6hjK0ZdPxO5jcv
	 zAp9f0i9i1SS6WnX2UkCWgy5XqFkqWskW3j87+iGXSBDb+wi+llCR1rYKEjuIWV4PP
	 z61qtaLQefh0EyX7acLiYvq74cDIP+qycIP1IJMsHBh4Y30MYrHlmuxMbIE5UsJhN7
	 OKeGpvBVZBngzFO5O5QA4O3UjAq0DhLMCG0Dy21gA0PbqV7gMwsjkZX9jBijwXU1XI
	 +PkoElwyIKWl6JtcrzS0G6ZQ9OjM5Ylpoji0CCYNHI1Fi389eDBo8gi7PDPAxQdqDf
	 wbFqknnn+UOSw==
Date: Thu, 26 Nov 2026 11:44:17 +0000
From: Mark Brown <broonie@kernel.org>
To: iasnezhkov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	flora.fu@mediatek.com, amergnat@baylibre.com,
	leilk.liu@mediatek.com, me@adomerle.pw, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: spi: mediatek,spi-mt65xx: Add
 compatible for MT6789
Message-ID: <f42a3782-35d4-4bb1-8c72-0dc56b8e0642@sirena.org.uk>
References: <20261126000711.16163-1-iasnezhkov@gmail.com>
 <20261126000711.16163-4-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C66k9UD0zapb3tpO"
Content-Disposition: inline
In-Reply-To: <20261126000711.16163-4-iasnezhkov@gmail.com>
X-Cookie: Sank heaven for leetle curls.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--C66k9UD0zapb3tpO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:07:14AM +0000, Ilia Snezhkov via B4 Relay wrote:
> From: Arseniy Velikanov <me@adomerle.pw>
>=20
> Add the SPI controller compatible for the MediaTek MT6789 SoC with
> mediatek,mt6893-spi as its fallback compatible, addressing v1 review
> feedback that MT6789 SPI is programming-model compatible with MT6893
> without requiring a driver change.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--C66k9UD0zapb3tpO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIG5AACgkQJNaLcl1U
h9DVLgf9ESvlliyKURSSkiS05SjNzqq0K0AUAZ+Lw1hNyfPT1cQbMLU6KGxATUFk
aRW2i5ZdLBxZ/ZI75fPxOZpHGGX6yvY45i7bo8L66kHm5zk32j3zZGOJm6XT+O+H
k0sxzD0y3YOiSmF0ba7Nb0WTwNX9lS70ws5v4f6/CmrESq3U51r/vpEQfv3e25gb
sj4XZo7W9B2Bf2Bh48BLMfMZoWvHbw1k81oEw2pv7JY17v+s8zklfaL5ot4N3nwH
7XIuIpNiVMRb0gdHLWBCYavSy2+pM/KPRkgtzgcNXhHx8TUxTvzhyLevA9HY3Lky
LRlR90pFAqH7HtnmRnaTkE42bnRqRg==
=FF7l
-----END PGP SIGNATURE-----

--C66k9UD0zapb3tpO--

