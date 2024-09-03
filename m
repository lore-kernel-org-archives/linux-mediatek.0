Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF73CD37AA
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 17:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOtMdI/pXteLBcjEnRHOPnypTmqhN4BLZTDiPNlDdtQ=; b=Uy/eaqMjA6oXMadyP6LYXQpycM
	vlJVLEYogSt9anBT0+0tcVIwzaUg0056tTjPd1t4WJSB8D9JBrr6+vldEGTWn1iztujMhT1YndoWF
	/QTYPej7KhLw/16muj0uHbyGxVimXbefbMAPEuBv5LfVDdTU2h/bAa/Nue463xlTmTZgGidoyKjVw
	Jj0T1JrcBicU7jDRRjaqrGSedT7KOYSUciLjJuwNIegLa5sx4msOoaoqU2JZjGZuTbUGVGqN+x402
	GX6gD3kgXrlLoUlVLyxfvp6q6bp3t80yBe0mOCAyNNPOhtz04Rm8KAormQ2pP1QcMih7DFR0lSrTJ
	lzb33JIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slX8V-00000001GJb-3IXP;
	Tue, 03 Sep 2024 17:16:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slX79-00000001Fry-27RA;
	Tue, 03 Sep 2024 17:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4CF73A429C2;
	Tue,  3 Sep 2024 17:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238D9C4CEC4;
	Tue,  3 Sep 2024 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725383686;
	bh=qW0RktGoVkbp3dbELJ0XnlGsWcBLW434fwCOzn74Vkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GuRAngMw4FtK7TyflROsYBV1lYCTKtUT1bir8ZZY8wNReUFtnfddZvBvkFwjVTRym
	 b0Ao6qM8UI9rNBWicO+BMdEQMpNhOj1Rvbvou5lenbKL5r7AYzNMtp66G4GV83QiO4
	 ySeux05NNkyQIkpAOs/iEeofWo4KInG6x3Kb53MbNhZYux9jHVNuAzD9w56B3eHRb1
	 1wMjoqQy7sVJedE2hizsg2pd5hE7tb8i9AZ/dzRaIFxBNpWbiTBRKHnvhdoNgvgS8q
	 +5FSuI3B0GX3tCbf6hjjFEbar8JPcn2SRQOGe3JJw7ivrMWZk+JHr9Gz0KhHSqDJcH
	 b1fj3m/Ktu8gg==
Date: Tue, 3 Sep 2024 18:14:38 +0100
From: Mark Brown <broonie@kernel.org>
To: amergnat@baylibre.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH v7 12/16] ASoC: codecs: add MT6357 support
Message-ID: <c386c74c-9008-48ea-ad79-524eb85c370b@sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <20240226-audio-i350-v7-12-6518d953a141@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OMC7w3ub4Px9anag"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v7-12-6518d953a141@baylibre.com>
X-Cookie: Please take note:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_101447_632332_B414B4A4 
X-CRM114-Status: GOOD (  11.04  )
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


--OMC7w3ub4Px9anag
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 08:53:41AM +0200, amergnat@baylibre.com wrote:
> From: Nicolas Belin <nbelin@baylibre.com>
>=20
> Add the support of MT6357 PMIC audio codec.

This breaks the build:

/build/stage/linux/sound/soc/codecs/mt6357.c: In function =E2=80=98mt6357_p=
latform_driver_probe=E2=80=99:
/build/stage/linux/sound/soc/codecs/mt6357.c:1824:55: error: too many argum=
ents for format [-Werror=3Dformat-extra-args]
 1824 |                 return dev_err_probe(&pdev->dev, ret, "Failed to pa=
rse dts\n", __func__);
      |                                                       ^~~~~~~~~~~~~=
~~~~~~~~~~
cc1: all warnings being treated as errors

--OMC7w3ub4Px9anag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXQ/0ACgkQJNaLcl1U
h9CpOQf/TZgfm5Me95NAaeAf3HC8+QtPbX8C2nII9zKTnbEfLCDi/g1gWoJoK6ge
FBcp4NuLABoPKK/c0mXC0iSzZ8mjHoHX08LBYnh3Q+BZFvOy+6hXTs/cr6/RMtDR
OQ7lNNGHEhH5YZvCMPrt+3p2BnWcLGvbreX+xIa1PfT91BvUGpEhxPMkPe/UQKkk
+sGgJdVgQRZgjtoaqZXWBsVYD2fUK6CJwb4w14Gm+BwFYwvrIj7Tq8FpnDdmUawg
SYP7QBsvrhWdYaAOAfRi0cpusU8wgwSjvUOu2md93uMVLke+S0T+8dkw/tkPnJcS
XvtVy+qXZ/rNyGhr44XT3XZmwXdOTw==
=ZHfg
-----END PGP SIGNATURE-----

--OMC7w3ub4Px9anag--

