Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5DBC77B6F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 10:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8W9jtbqN6xKguBZ7APq038DUQHbwahDOenGO1VwnTr8=; b=eGZLooNSW6wugYVcYbEouoW81X
	ntpXypCKqsGhrIvPLt2aynIZbWPCiabKnsOycCzjF4MfcEjKYANFllxBNdzgeOENtU+ZygsVtpajK
	arnVrQ0hfObVNL7sG8gp691MIdRV5Se6zwivlDsIVE+BreiYcAJueZX+2lY+PEgFAgPelHeuDV0zw
	AJbvwpvDmDY/Frj+H1ZO6+UKWwUDxDtv6gBsdABDhSBqy42/Kk+wbfif38uvFk4J1hSfbfk75snby
	I9HVqz0ff7pXmcwzxenUvNNMntbZr6ne+gki8m+ShhBJZLCDNbjAAm21S6jyA4DyhOLjYZ2Kup1oo
	d+u/lz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuW0-005vmA-06;
	Thu, 13 Apr 2023 10:49:20 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuVw-005vjq-0f;
	Thu, 13 Apr 2023 10:49:17 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id E6DA41C0AB3; Thu, 13 Apr 2023 12:49:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1681382954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8W9jtbqN6xKguBZ7APq038DUQHbwahDOenGO1VwnTr8=;
	b=RcUTqGeIixkfZkvr1yDh2531IFYd43KtEPj7Qbv8znxrAvCtVYgEnnZsfUUT0Se2NzBfkH
	xpa5IiBS7pdnKSPoUlQvmzxua3xJwJ8KswTSL2kij/5pCjozvgriT0/H09d07VO0VqqtLi
	qh1EZ2CaOFA8IsBpwoNm5xImBZzW7zk=
Date: Thu, 13 Apr 2023 12:49:14 +0200
From: Pavel Machek <pavel@ucw.cz>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 0/7] Add support for MT6331 and MT6332 LEDs
Message-ID: <ZDfeKhUvo5a9jd9E@duo.ucw.cz>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/vFl9uYmCyb8SBnI"
Content-Disposition: inline
In-Reply-To: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_034916_391569_0EF58F7C 
X-CRM114-Status: GOOD (  16.96  )
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


--/vFl9uYmCyb8SBnI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Changes in v2:
>  - Rebase over next-20230412
>=20
> NOTE: Since v1 of this series was sent in Semptember 2022 and got
> ignored for *7 months* with no feedback, I'm retrying the upstreaming
> of this same series.
> There are no changes, if not just a simple rebase and another test
> run on the same hardware.
>=20
>=20
> MT6323 is not the only PMIC that has a LEDs controller IP and it was
> found that the others do have a compatible register layout, except
> for some register offsets.
> The logic contained in this driver can be totally reused for other
> PMICs as well, so I can't see any reason to keep this specific to
> the MT6323 part.
>=20
> This series brings meaningful platform data to this driver, giving
> it flexibility and adding support for LED controllers found in the
> MT6331 and MT6332 PMICs.
>=20
> Tested on MT6795 Sony Xperia M5 smartphone.

Please cc phone-devel with phone related stuff.

Can I get ls /sys/class/leds on that machine?

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--/vFl9uYmCyb8SBnI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZDfeKgAKCRAw5/Bqldv6
8m7nAKCkhsGoT6c46SC0+xG2IjFSQVUhGQCcD9A0Yf4QeIcQ0stgUpEYAsAYh5I=
=5q7a
-----END PGP SIGNATURE-----

--/vFl9uYmCyb8SBnI--

