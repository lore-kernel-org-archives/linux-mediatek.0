Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0F5C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 22:33:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3AE20709
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 22:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DDJmAoJ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3AE20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ehXAi6KGACgZkHF4/zNdDRZS2OKzAirNOmPp0bTnGlo=; b=DDJmAoJ7cg67YjkthlNPVEi8R
	YP5HZEJO/lbw2Jxb4FLUpyyzI6mXLsOUunHpNlWyvD/TuFkeFUWGQOsTCEBxX0tKNmhnk0xfX6wv3
	z1PW3v435x+/NpM1NM3SirWI2D6EsG1t2/TDHVODOospPIROX89xMvPCWbYYh75SLQBBg6ov07IU+
	uVqOGSPJGLNldcW48fw2OgDiLBDuauhpwK+fMh6gFapb6maggTVkIwpu6dXFei78HxAxN1vE9qPR7
	FhmQaxaYQHGS04AKm0wIxyMYgYAMOA7tNlO7HGtkP/3U+ykyeJWUVb0XmdMpwjTOYQis+6E5XECuM
	yWnEzrTCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4tsO-0007oC-1Y; Sun, 09 Aug 2020 22:33:12 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4tsJ-0007nN-Pm; Sun, 09 Aug 2020 22:33:08 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 2D58E1C0BD7; Mon, 10 Aug 2020 00:33:03 +0200 (CEST)
Date: Mon, 10 Aug 2020 00:33:02 +0200
From: Pavel Machek <pavel@ucw.cz>
To: trix@redhat.com
Subject: Re: [PATCH] leds: mt6323: move period calculation
Message-ID: <20200809223302.qdsv2ghuju5jrhvw@duo.ucw.cz>
References: <20200809163221.32413-1-trix@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200809163221.32413-1-trix@redhat.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_183307_954753_438D5EFD 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 jacek.anaszewski@gmail.com
Content-Type: multipart/mixed; boundary="===============5280362620604154251=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5280362620604154251==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6pmfl3utzqfdvq76"
Content-Disposition: inline


--6pmfl3utzqfdvq76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Setting the delay_on/off means period needs to be recalculated
> anyway.  So move the period statements after this check.
>=20
> Fixes: 216ec6cc4c19 ("leds: Add LED support for MT6323 PMIC")

Makes sense, thanks, applied.

Best regards,
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6pmfl3utzqfdvq76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXzB5ngAKCRAw5/Bqldv6
8uf3AKC8otj4qmrAy7nXmwkFnaclBh7UEQCgl72i78Bq13jVd6zxnZFWIzOE6vc=
=/+iR
-----END PGP SIGNATURE-----

--6pmfl3utzqfdvq76--


--===============5280362620604154251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5280362620604154251==--

