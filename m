Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94771C3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 15:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pMDF+LsTD/iBTbXNEpVt3s5aczAsdOLMMbKgkXR3BM=; b=SW7oOUVos10204Q2DIOD4TKXBM
	DE2MGzMUGmlOtnurdyPvvN8+xDTO9XnKQgcHHQa6w9KH05PYX+jc327Jo+ejq+2qdxLAf94JzQHSf
	EJMr//QlhuRNrl9TUA04xQmi492Y1hScydHskdPjpO+LZk0X2a7cF5dAmUG5X+mXz8pvLyW6dTv9I
	y9bpi7m1wEP3mXUQl9W4l2H6MGk9Jw4t/gzWs/wPTeU+9OHZaremb1PJc1D5I6lDyJoTlD9pulXhF
	AgbfGtApobOFELmIBZn7LrTgXlDMFCrRblWxxBsnK1xhLPdncCgQsaIaypXcDb++QVI2pRW+KVRMy
	d+yeQ2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrSy-0000000Awk7-0OUL;
	Thu, 27 Jun 2024 15:55:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrSo-0000000Awg1-1fD4;
	Thu, 27 Jun 2024 15:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAC3460CE8;
	Thu, 27 Jun 2024 15:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25E5C2BBFC;
	Thu, 27 Jun 2024 15:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719503709;
	bh=9pMDF+LsTD/iBTbXNEpVt3s5aczAsdOLMMbKgkXR3BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+Uut/Wt9ADdwIp7mwKF5gVeKXfcgyrdlzltjciB4aCsgjQYT4XjH95VEGKypJhPJ
	 CRhnXj58LqLZCHFmnqKqHHEr0kxuflHifqjzgziQ72TE2vtjtJdgrOXlxPgJ73Q961
	 XDuSekCpy1f+hoR2vwBK3hI+F/fJIc4+ccbBinorYMO4DQF9InBnJWcxIc62Y5hItR
	 p8TALs/nL+wqdXLLzNyd8yleq1fXwUqabmjVqEFrbGvjVZ6nwFP8Dt7ieZOhd1Pqoe
	 JZsgxtErgHl92YWYNGxBdcDEtl5d2NDn2EOJc+OCtSrh8phR256bsdFsSuYFl8VSVV
	 WYbfj0m4w0Qsw==
Date: Thu, 27 Jun 2024 16:55:03 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: Add MediaTek MT6735 clock and
 reset bindings
Message-ID: <20240627-deranged-yard-c84283135fbc@spud>
References: <20240626202406.846961-1-y.oudjana@protonmail.com>
 <20240626202406.846961-2-y.oudjana@protonmail.com>
 <96b436c1-50c3-4091-9577-c00187518779@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8CP9nh8xoEAPoXZZ"
Content-Disposition: inline
In-Reply-To: <96b436c1-50c3-4091-9577-c00187518779@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_085510_524960_E2172E3A 
X-CRM114-Status: GOOD (  11.30  )
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


--8CP9nh8xoEAPoXZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 10:37:03AM +0200, AngeloGioacchino Del Regno wrote:
> Il 26/06/24 22:24, Yassine Oudjana ha scritto:
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >=20
> > Add DT bindings for for the main clock and reset controllers of MT6735
> > (apmixedsys, topckgen, infracfg and pericfg).
> >=20
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>=20
> This commit needs just one small nit to be fixed before being ready to be=
 picked,
> check below...

You say "one small nit" and follow it with "you *shall*", dunno if
that's really a nit! With the namings fixed up

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--8CP9nh8xoEAPoXZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2LVwAKCRB4tDGHoIJi
0nEKAP9yR5y++DNT8wYwjg3zQzQhwqljNZNTjvB5Hdghil7ztQEAlMDvABPPZ4jg
vkp0P5ZlpPE0zRVgChCAysGnRoyg+gU=
=Agy2
-----END PGP SIGNATURE-----

--8CP9nh8xoEAPoXZZ--

