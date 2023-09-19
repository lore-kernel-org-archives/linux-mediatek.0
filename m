Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585A2CE79AA
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 20:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBHFcggJxfr9oVyoIAK0o3aPJKqRcii1MV+oGVQdXZ8=; b=jcZUMfrhfRRSdiFaJ7siKpxa5O
	bzjjHfwPwnp0Py817j+/9ufo632/R9zVk6aoeDI5VelN9xggtDl/+muxYphEwY1emqo56YGyOxwgN
	1pPi7cG+3vYwSuelw5Ra2w9iFzX0VVFa4wetvmVXSXQaxPrEbZzGlt48QkJkUR+vx5fp24/DncEjI
	2VradmXlHM6pp2ev5m1o67/BoqCRVuzP5IuVwvYaCaIagJ5epM+7gV1oBrGfAGKRmXv3DwsOVbMuX
	qMktJU7Aj0Wr2vaXWFj2cWEbp9PtSP4irr/SduhEJeyTxscpYxXZ0hPppoDWTbdS2Rqsof2CRk6o4
	yws1+1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qigtm-001CR6-0P;
	Tue, 19 Sep 2023 20:00:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qigti-001CPy-1l;
	Tue, 19 Sep 2023 20:00:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DC2F2CE1411;
	Tue, 19 Sep 2023 20:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86024C433C7;
	Tue, 19 Sep 2023 20:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695153635;
	bh=yBHFcggJxfr9oVyoIAK0o3aPJKqRcii1MV+oGVQdXZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9GnttkX6pnlKaOvdIWEdiYttOsa//ixBKxQcYdRUKBhDPiPd+gPE3ScJGJcWUk45
	 KOiFT/R1BUeRa2fBQhdm9Ms9ZqoEhxbgd/EFQwmQOpEQRrEgeAPuneyqJICSwLNsSG
	 wHFW1jc/GvdbHm0LIGvztT0waf5WZAQ4S7CACQBzMjGuBXRTcXj3S+faHGq8wYv2X+
	 QuAYKB14Xk+d7GmWiICflEGaSQAUfB5zEXTPIdcksxNl7zDDTPNNm6eKrg15+gVNxs
	 QOAHZwlsdPD3/KYT9ZMUHxzW4v/5smxYxxw/zY1pvZmbXXnGIV/Ay6vSayZ065dc21
	 cJnzbNGL++SYA==
Date: Tue, 19 Sep 2023 22:00:31 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH] i2c: mt65xx: allow optional pmic clock
Message-ID: <ZQn93wz9fndNWh2Q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
References: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r7tFlyNNSHuH/Tsi"
Content-Disposition: inline
In-Reply-To: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_130038_958387_8733BD0D 
X-CRM114-Status: GOOD (  17.67  )
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


--r7tFlyNNSHuH/Tsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2023 at 03:13:30AM +0100, Daniel Golle wrote:
> Using the I2C host controller on the MT7981 SoC requires 4 clocks to
> be enabled. One of them, the pmic clk, is only enabled in case
> 'mediatek,have-pmic' is also set which has other consequences which
> are not desired in this case.
>=20
> Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
> is not present and the bus is not used to connect to a pmic, but may
> still require to enable the pmic clock.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Applied to for-next, thanks!


--r7tFlyNNSHuH/Tsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJ/d8ACgkQFA3kzBSg
KbZP/g/8Dv1fJqUjSajNDpfl/NUL4+PviUZe6O6Z8+AZ7hfmvNQOu0xnUs+13G5u
NDk1tEiaFfhhrzgHRxgZyQfwyqPV3JCmEnu2sAWyDMA6MebIIoyF0TJLvqGZSZa6
pwTwI1dJ6ZB2rqvuLvGs2lxYGquMacY4jX+iZ5RCch6jXCZy8oj4VYMn5GNPdOls
Og84v8KQJgsbx76LG7wk3daJb5sKMkP+MTqVw9uty6jgcFRk/OorwDoHNjAQYMRM
1FVJ9W0pu78S0klNaySzlP0YXFnM8Jr+DVQSTgA9p2sbXpwbJm1hZ/z0IJUW9Rdv
B9Rt4GdQz8J01XKWAtNtlRU/BdJiMI6+IuLM7vssV/eZcJYtmSOpYdR0DJ3Hv8fL
rxHQe1ol2nCNtoBH6ih19L+f2sRMXnQaSx99YJguNBZC6OqT1HqwX3qSEPr35ofV
9ICJ8x1nbzjrTDvEGcty4MeV2ijGy4zeBJi3cyJyXsLFYJIixDZHmB6l4y7eyHei
6ky1JM0+7fg6LtDQqYc9jAF2/dYcMBTlLCcqgyIiEyUId6fE7fr/91aSokRx5QPU
PXi/vwktQWPQ+5xGPudJ7MO0JXSkOcvFQiC5c7Fuv65sas75diN0+hmIqmKP5eWI
cNteSvLwQml4fNdW0hk8SzyB7A2tN7mPVfRvHNywYLmeGKVltKY=
=Hdch
-----END PGP SIGNATURE-----

--r7tFlyNNSHuH/Tsi--

