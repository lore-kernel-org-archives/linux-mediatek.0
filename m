Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB04606A31F
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=efkn6570;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LItuOnU2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l/x9oNCSaYQ0fFo4ifv7WcmGtt7Q6tbfnPKrA7iq6qw=; b=efkn6570k9MCgfxDNpC6jTOTPF
	Qm5VyMxykM57YdHzZRO2x5i0UncvFuy5ivoJ+y0uVahrPQVG1T270xkl0Nx8xufS0+7Ai6hV9ezYg
	btHnhY5Cp1SksnAsGfXMDca8iesr711USRJ3TfXfQ5YBdKElB+RSpY/VFBh2M1E1qWGJPflTy8GHN
	JTYw6MZARawxDeXSxFm9Hr5QVfPOgweAWPv1+LLZ5v9rw2RE17GdVPNvK+IsGifeau0p2wXU81WKo
	vf3nrEDrbdv59lVOnIB/jAPkQe0aDgbpBP17pdbdGrftqpLuFcaESQH4vpT/673oBthb33N//PBe7
	rwQzeB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJMf-00000000qzB-42Cl;
	Sat, 28 Nov 2026 14:25:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJMd-00000000qys-36ez;
	Sat, 28 Nov 2026 14:25:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DCA2D612A0;
	Sat, 28 Nov 2026 14:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C0E1F000C1;
	Sat, 28 Nov 2026 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795875918;
	bh=l/x9oNCSaYQ0fFo4ifv7WcmGtt7Q6tbfnPKrA7iq6qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LItuOnU2oUvls841zaj/BO/k/B5OcyAVHfvri3ObuXh+WSwdcpGCfv5lGz0Rj5MYb
	 R6+qho0AsiRjll511xnmAtooDqesEAO4X9KJaScmNIRdFd9QTJbdX+2d37lNAxL46Q
	 Tz8mu1c01HsfsC8K1P8JzfABDt2OY6x3F4L3JnVVeUItgk28M+r2hGJA6n8E5Mn1kw
	 sE0FV8S0dBogZBr6lAey8W9l4Kvkqc04Bneze7vGI4fRgJyKeB0MSZ1fdPk7XqlduS
	 ZBV9cOlvs+hwUeKT0+yx8/b5x0bFpi/UHbAXjar4STF7fkXxSRlBpCt2VYPPH15sd0
	 OgWLEI5JLeALw==
Date: Sat, 28 Nov 2026 14:25:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: spi: mediatek,spi-mt65xx: Add MT8189
Message-ID: <fdf1327b-0a79-4dbf-81ba-f4da0dc6dd2b@sirena.org.uk>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
 <20261128141443.13065-2-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8aFEQ7wAC57vafI"
Content-Disposition: inline
In-Reply-To: <20261128141443.13065-2-sinha.aryan03@gmail.com>
X-Cookie: I'm a Lisp variable -- bind me!
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


--+8aFEQ7wAC57vafI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 28, 2026 at 07:44:25PM +0530, Aryan Sinha wrote:
> The SPI controllers on MT8189 use the same IPM design as MT6991, so add
> the MT8189 compatible with mediatek,mt6991-spi as the fallback, the same
> way MT8196 does.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--+8aFEQ7wAC57vafI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsK5EgACgkQJNaLcl1U
h9AX8Qf/e7espGUJCU23sN2ejhjOraYZoYRG5IEKfmroYjUkZaboYuyFOjz4rmMK
DYBRQpXresUYUlFYjj+s1IcSPQxDo57SRWkpyRSe6nPOK3mXpntPOx69B4G11oP0
c3ZJC3rv639N+y36pGtB/o2W/b2HYemnpn4G5GB7+jpn1VNPV061A6js1Ue/Mpdg
Qo4+UPCZa7W+IyzKM/4p1Z1S3Y0NeB8SUsjRbeaVD0aD3yu2zwE1YSUIzsXW9n0/
vRFQJ6xHt+bmWqCApAEKt6k+/C1wjbkSgO7Tf/z54tcqTJbdAvbO3eZV+7PZHb1o
1kOgnJ8sqN0oA6GXLDItXITnSvIqJg==
=POvc
-----END PGP SIGNATURE-----

--+8aFEQ7wAC57vafI--

