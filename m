Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB062C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 02:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbwdDaroTdo1GXJdazAaqQwp1j9mDh2nFYYMy1dOxZY=; b=cbMbZ0Dc1BVKVQk1R/ksipVaGk
	Yl1tnXYGrcTc9D6uepq/or5zeZtFYr3FrYmesmiQHYrW7fckMbPgeJnMwh4bRkFzKI7FiI76ixJYp
	pUoJELaDrV9CQy8NtToBVZXettkTucyw2IMkS/JNz3Bsj/TtdQS52twT02i47IXiaZubcv+ulfiNE
	pnIOmU4torU6gnOzCOdXAZFSwuFFx8bwaU7pvDQ73ROJiBXSq41HpO/uwH1ShfBjDlIeJNJ+vi+aS
	dzKQBEzAFUBqcw8Id3krHIyO0VZ5hRJd5/6OFKl2vE6s6fereSmkTfuLk8WgRPNlEdl+UiJcypnt0
	InSd8HQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1dcU-00000004q4L-0jwX;
	Tue, 30 Apr 2024 02:53:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1dcP-00000004q3g-2YA6;
	Tue, 30 Apr 2024 02:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B639361281;
	Tue, 30 Apr 2024 02:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B59C116B1;
	Tue, 30 Apr 2024 02:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714445600;
	bh=ZbwdDaroTdo1GXJdazAaqQwp1j9mDh2nFYYMy1dOxZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2Ve/dkzHaZytY/7ZZi+2NJbXD1Qee6O59sRdhbrzt3zuAQ+AESp1ngA4+yvM1aA9
	 zJ/0FjGDr5IgGfo3qXJ6C42rZMKYl5UTpaJPpXxuO7iOfZoFP+oiqRJ0AHu/RmjizF
	 mqJSg8omO2zIPo4DLIUU9Qt7M1OFeJEaNfDN4GXlivAtNdfWE24mHue9oFm8IGhFJi
	 ZQIj167hQfOdkVlaVLxpF73ZapXS1kDtU3OX2FJ2mUQ5Tzrr3U3ASTkB90bgtIrXRt
	 FFIusSV0zUHIGy2dY7saGMrnzF+tRivpjkX9bDFTZC+niSqw70vRhn6kJbbzXbMPd2
	 Y8jlW/fpZapAw==
Date: Tue, 30 Apr 2024 11:53:17 +0900
From: Mark Brown <broonie@kernel.org>
To: "zoie.lin" <zoie.lin@mediatek.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/3] misc: eeprom: at24: add optional dovdd-supply
Message-ID: <ZjBdHdVUW9Q67nAC@finisterre.sirena.org.uk>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
 <20240426102949.23057-2-zoie.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZIh+FzWuFnJR7Nbu"
Content-Disposition: inline
In-Reply-To: <20240426102949.23057-2-zoie.lin@mediatek.com>
X-Cookie: lisp, v.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_195322_226537_D7A9B4D9 
X-CRM114-Status: GOOD (  12.03  )
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


--ZIh+FzWuFnJR7Nbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 06:29:47PM +0800, zoie.lin wrote:
> From: Zoie Lin <zoie.lin@mediatek.com>
>=20
> Incorporate support for the dovdd regulator, which supplies an
> additional power source to the EEPROM.

It would be helpful if you could supply some additional information
about what this supply is, why we can't tell if it's supposed to be
there or not and so on.

--ZIh+FzWuFnJR7Nbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYwXRcACgkQJNaLcl1U
h9BeJgf+KQ2qScakBicm2lPxwrL7sUMR4q3n03ty2aFii2oaAjfWmx3n7bfbHQB3
rMAz8iACiz36eaQsR0IYeuKcsSXCjgp8QQhqXU5nj3+8cvAn7G2gSYn9+EODx3Mr
n3ZCoDJxzcnuwpjuEKHuo7tFlD+kPRwmuc3z8TEowNosa5KpMUna/qvTk0z4ETIP
AERQFdjEyZVDV7EXjPAMBLt24M33PKPljlE0E/8jpOHCYsWg4zaWXae3zyvCOFoy
vD3NFlQ4eb+ITlUkRuaYwmFAAsvjiOwyM31/CeeIA3any2ybfk6S0e2yB8sGzQe7
HuMkGpgeXsfHaA3g0KANZ3jndjKC4A==
=Oyc6
-----END PGP SIGNATURE-----

--ZIh+FzWuFnJR7Nbu--

