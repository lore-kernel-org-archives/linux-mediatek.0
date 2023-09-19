Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586CECD5BAA
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9pqCXoYKmZIxNp4ZZfVXcfKIkNgbZXV1xvjTr2DFE4=; b=AcvmizEwBPk6mQATC7YXH2TYc/
	MjdHM3x2tghIfGfvONrRi9g8EqkQ9Uj84BGwP01h3wF6N8kc3eELoLi/WqfcZPMcxf45FzQHDWkCM
	OxwS1OXWKzQWTxqnGblsiRHKmbQmuxPmWX6tROzpfk+dEBfnfeP3o9sV9SG9x1we20XWA9F3Yf8F4
	feW0xIlQm8qTFc2SsW63nzKbBvpTlWiY4KNqMl5FQtTCt9uJY583RfRR62cXzT09ECl4X8DwFyDep
	dBZPkirg4PfhBhTxCx6A9UO/QGj0NdrSX/CH+1LvKdfv2zf36N8a1hjJjMiIFOZUZyPjYnOiieg9j
	zeVy/ljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZoN-000PcQ-0t;
	Tue, 19 Sep 2023 12:26:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZoK-000Pb7-1g;
	Tue, 19 Sep 2023 12:26:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9A3C615EB;
	Tue, 19 Sep 2023 12:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82091C433C7;
	Tue, 19 Sep 2023 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695126395;
	bh=U9pqCXoYKmZIxNp4ZZfVXcfKIkNgbZXV1xvjTr2DFE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECC/8mJECW5aRwAQxAierixo6cuXLcZY1jNtJp6QbQHfL9dyYX8ETWjYNFUXwiZj9
	 DR50g46oPPnN6LrKD9z8xnt45VY6Tvm5Lwt1LQnAcGY/axO9jbCS3N+HkqIiWZG96W
	 Dy18dLygzfAHOZQKydVO3W4ivV5ZzppMbzbISp7ZJUZG3h/vdhks5m1KsuOeYKtCxa
	 EwHc1LdqvmHT+6FXuPQvdwAHtHNLOzc6zp8s5aq6pGed1ZXYyeyv6xwej/ZpzM5izJ
	 Ad0jToNH3ft4xlUjEClqJioZdzcWa8IW8NAZBChVt4EQO4Gj5dxnIBOembLbdZuKWE
	 dorqB1hxPFZmA==
Date: Tue, 19 Sep 2023 13:26:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] regulator: mt6358: return error for get/set mode op on
 linear range LDO
Message-ID: <d81640db-010f-49a9-8485-4442ba857a94@sirena.org.uk>
References: <20230919083647.3909889-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QwwjSc6QhijmvlPO"
Content-Disposition: inline
In-Reply-To: <20230919083647.3909889-1-wenst@chromium.org>
X-Cookie: You buttered your bread, now lie in it.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_052636_601481_1A9E0A5C 
X-CRM114-Status: GOOD (  16.69  )
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


--QwwjSc6QhijmvlPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 04:36:46PM +0800, Chen-Yu Tsai wrote:
> The buck and linear range (VSRAM_*) regulators share one set of ops.
> This set includes support for get/set mode. However this only makes
> sense for buck regulators, not LDOs. The callbacks were not checking
> whether the register offset and/or mask for mode setting was valid or
> not. This ends up making the kernel report "normal" mode operation for
> the LDOs.
>=20
> Instead, make the callbacks return -EINVAL if the mode register mask is
> not set, signaling that it is not supported.

It would be better to use separate ops for the two cases, that way the
core knows that the operations aren't supported and can handle things
better.

--QwwjSc6QhijmvlPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUJk3UACgkQJNaLcl1U
h9Dglgf9Gt6tPZBfcx38Whb5fZ2laULepfxlbfnu+Inb7vXr3cn/rfHzZKy/hIjY
zKQnkZOT1OLcw7TFaJ7ogJoHbgZr/2uMHCUu9Omfyx9KPW2GYmwP1MWiQTPFYq0g
n71QZ+7jsXXxtO4Vqqh1JFNLbfUKrWIJYyBWA2KSVfASjJQSmUkyXFdEsgJKU08x
gjlKwIROF0VVrGiegc6cN6SWYSMYLb8n5CIvm9OpqXWoOqDNaARrFddvilOOa6rM
VSIBzIfILarJTnM81Do1p4YjVbOaHKjNN1H8ZIb2ww2QHXrqMEmrByBnD65va6VT
GI0gzH+oo2RLTX5vRuIvFFcdDmVPTA==
=Jj59
-----END PGP SIGNATURE-----

--QwwjSc6QhijmvlPO--

