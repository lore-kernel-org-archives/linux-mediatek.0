Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41909C19F2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHjlHlFrYDBOwuuo+sXlw3FfX9ljGUkXJfpNmORShao=; b=noQW9m+JyQFa2gV5T3t0ApqRhr
	HcxtMcIzSBO557ceiL7W+nkXCCBg0+QlZF73aR8Ms4zOndcwLKdIJPgJ07Nqig+jDknp8E+HBwr3j
	ZHdOGDHck5AZFS4oWekKuTMwQ/b7PexRxODdbdvzq7o5RZDhL2l6V605w0yYtul66FgR3aKlIN1dR
	PnGS/6P0TzEt2785EjfnnoQZUNiJUH/id4yt2QsrCufu/np/7L0iuOlaIbI8bJiojaJ9zo2b9zQ3B
	UI48M5yAx70e2zEtwsIbphnZrU3LNqkhLV6WkyN3DFYB6uZZ+gXMxbZabwAmHYeHE03i4dpXfUdaY
	dEwlexbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM7V8-00CCkd-So; Thu, 11 Aug 2022 12:41:26 +0000
Received: from pokefinder.org ([135.181.139.117])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM7Uu-00CCUD-8p; Thu, 11 Aug 2022 12:41:14 +0000
Received: from localhost (dynamic-046-114-180-205.46.114.pool.telefonica.de [46.114.180.205])
	by pokefinder.org (Postfix) with ESMTPSA id A2272A42806;
	Thu, 11 Aug 2022 14:34:09 +0200 (CEST)
Date: Thu, 11 Aug 2022 14:34:08 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: kewei.xu@mediatek.com
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
	qii.wang@mediatek.com, liguo.zhang@mediatek.com,
	caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
	yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com,
	david-yh.chiu@mediatek.com
Subject: Re: [PATCH v5 1/2] dt-bindngs: i2c: update bindings for mt8188 soc
Message-ID: <YvT3QLUy8uAhXL9H@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, kewei.xu@mediatek.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
	leilk.liu@mediatek.com, qii.wang@mediatek.com,
	liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
	housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
	ryan-jh.yu@mediatek.com, david-yh.chiu@mediatek.com
References: <20220806100249.12375-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oJ0A9glfvOseagF4"
Content-Disposition: inline
In-Reply-To: <20220806100249.12375-1-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_054112_521237_7CD0DA2F 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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


--oJ0A9glfvOseagF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 06, 2022 at 06:02:48PM +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
>=20
> Add a DT binding documentation for the mt8188 soc.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to for-current, thanks!


--oJ0A9glfvOseagF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL09zsACgkQFA3kzBSg
KbYntQ//eg9wrHGBn57xXarTYXfwt20eCl5kw8+z+tbQgnnzmjLf6PQgtJO/Vr+9
z1rXnMu+SUy7rFPhYt5IG5Ph6a+yI3cin2Pmv14xSxC2lWaTJQol3SK1YGxKgzqd
vAsiBoxGupNteESyHKsk0NLYuzuzC2XrMFnfrFFAnnSPEpZRnRfzYrkHOf8oJbbI
Z5Zw+ge3FR9z1Qnv+Q2lhWnCechxttWzoCgSNyBOBJmTh/gevjLz/3XFIxcaaXAZ
UAYSE0vC9uu5zHSle1DMpu+ORNmaUv+cFvmn9gFHhe0Un8SM6EB3vxTQ0mynT9wm
uJy99KBBWHSGBle7pQSFV5WMSX7pNjf5YizEHm/9glpTy8fop1LZxgBXYz33IOgE
4518LARC7XnN+qD1rCjR71h05YLlEFa6VW3Y3Ej24qw5zo7U4U2aWKhutswYJpZ7
857LkJCsz49OZCe3n3qvhpyelajT13jgHPACYaV/9BiiwUFShotOnzbYuEqL40e9
+OEdftfIYX6CJ0Fi+ry3Fm9+smN9Y8txx7dmdsjnYiws+MIkHwR2PTiG/gFt8GYc
OJPnAK53fGHOlgDF4Zdt4NFijhihnOKSt4LstygrHUsHBwJyYUQF9RhCikGdgwVc
JusHQKkZZt1Gohi3sCYaCo+6a108mlQwMgOAslJxK7Et//JM1V8=
=+seE
-----END PGP SIGNATURE-----

--oJ0A9glfvOseagF4--

