Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F1DC83F09
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFsVnUPNfmYGtY5BMOY1GKN5pf53Jp7jbtx1RI3CM6o=; b=zxVx2kibbv0VhGCcnQgRBiXIxv
	7CENr1XaexEhiLmFQzvrA3/ROfqxbUQ0YIiOTXOkPY4oO++ElY8vYBJGWbx9oN4D816duUslBFaXU
	W4hBnlVsQZO9od9RBe6+39v8RcN58fJvYKsOk2Ia5OqT94kh/cKywFyGaeg/K3hatS+cOplhcTqEj
	jnJZ6zix3Q6gboN7f+DhzuX/H/M6pTTqn8N8l3EPXjm1XqhNJhvry03CN62CtxD3CnBsDpO2jPB1k
	Q95cE5n/kS0gpeUZk/Bk8Zv9yVjYzhfIZVfyDfC9hCJrhK22IG2C6916dFv84yV3yPZ7EQ52JK7fb
	5VRBE/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjdp3-00000001pny-3bzt;
	Thu, 29 Aug 2024 12:00:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjdoC-00000001pgp-32Jq;
	Thu, 29 Aug 2024 11:59:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E57FDA43E8D;
	Thu, 29 Aug 2024 11:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF89C4CEC1;
	Thu, 29 Aug 2024 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724932763;
	bh=YFd78PLcLUlTsv1xyfZC0dEiahah4AcdXxRUBv9/tFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iILYfg97knk9/dSZWQnoya+5CUe3qU8wVCLg22no6/eeLRol1V/UL6My17VY5crjh
	 bhuiQt3eGIAvtZIreC2aV61PBt1G0O17Hu5+1cmxFIXdL9LVpMySOU5wf5ZfmtsJ7S
	 KO+xE38Q5BRoyCbo2EJY5el4S2RbmsGqldxJTPCpY+fUkqlFjA01HrkLhsusQpieIe
	 nM24xVx/7QrzZeUr1AiBhGf3Dggei9zvxSbXm92VjdaWNTZBJ9MULOcC/6fajSdyQR
	 ixmljoFYlBtWOCWZCIF77SFDQ8KOpqhJz7r+5JYLtaJ2TRpDZum9ZokM2n6LjCoI+O
	 sREjbbMs2FqKA==
Date: Thu, 29 Aug 2024 12:59:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Jian Hui Lee <jianhui.lee@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Axel Lin <axel.lin@ingics.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] regulator: mt6359: Fix UBSAN shift-out-of-bounds
Message-ID: <e28a620c-4b3b-49bb-aa15-ebaad597a76a@sirena.org.uk>
References: <20240829025807.2455823-1-jianhui.lee@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="478nJuTw7MTmaEjI"
Content-Disposition: inline
In-Reply-To: <20240829025807.2455823-1-jianhui.lee@canonical.com>
X-Cookie: Go 'way!  You're bothering me!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_045924_849338_617C6C79 
X-CRM114-Status: GOOD (  12.26  )
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


--478nJuTw7MTmaEjI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 10:58:07AM +0800, Jian Hui Lee wrote:
> A shift-out-of-bounds will occur as caught by LTP fs:read_all_sys, if
> modeset_mask has not been set for MT6359_LDO_LINEAR regulators.
>=20
> Example command on MediaTek Genio 1200-EVK:
>  # cat /sys/devices/platform/soc/10024000.pwrap/10024000.pwrap\:pmic/regu=
lator/regulator.28/opmode
>=20
> This patch initializes the member modeset_reg to zero, and checks it
> before any further actions.

It would be better to fix this by not registering any mode operations
for the relevant regulators, that will catch these and any other or
future issues.

--478nJuTw7MTmaEjI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbQYpUACgkQJNaLcl1U
h9CRIQf/Zo/aC6aUlz5o76RUr9hUzqtMd3T9bY67UcLQ34joOx8IYwO1sicwrbu7
SbYEiYW6IneVnHcmv9Q5xyS95UdQ+1qxhI0hrYctX0oLQntI0OEKe+Mh3HvYxhLi
T10qLw/3PkO0I+C7AhULEJjjFCJv8MQrljQ35a9iwThtMnI/0D40sacvbB29U767
ep/J7639Of3lwVr3cttNIAjZoyS7a7qSEld0nV/F1ke7WvnrvDuT5N/sDzldEwRI
+p1LTghJPA/EtWApi2b/RzH8ToH1TmeNkswoXpzmoTCLSAQv+BN5AIhiBGwAQ3dh
MFNXYaT9Y+wixhRXKkBN81RTKtP0FA==
=/dBK
-----END PGP SIGNATURE-----

--478nJuTw7MTmaEjI--

