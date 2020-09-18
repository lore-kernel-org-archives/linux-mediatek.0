Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958F5C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:45:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC60208DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w01BEkkd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC60208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LaA8E3aB9n7uL/b5KhzM08U1WHTuqENg5rfnsbjqS54=; b=w01BEkkdv8Vc/CI+ankVu1EfE
	N1axY6iJD4700sLEnvJ7P7GHJ7CANcvg+HBSe5yzxu1pMCDJXJKnl4VtyYVrpmdBNL8FI/xGG1Akj
	ZEREZfUm1XUCdC/rdY3FbuQ2zANv080NkIKshr7E3aYH096dJfrTM4K1qBDwVmSJ5KzjBSzz0d0h8
	bCnJmT+9opoG+Fsnr8N6Ohg5HgF9i8PGjHyoMCvF3As7QUVGmXDYKG96aKhNUKWBbm9IFYDh709zt
	kVEzi0G6ApkLJ7/ryY0lkrTMZNxZpZJszhbdeyFClIpQN6TogMiB66shlIgYjZO1exIlVEkoW8K6C
	2/ChltYGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJNGI-0001yc-LX; Fri, 18 Sep 2020 20:45:42 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJNGE-0001xD-DY; Fri, 18 Sep 2020 20:45:39 +0000
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 by pokefinder.org (Postfix) with ESMTPSA id 73B1B2C079A;
 Fri, 18 Sep 2020 22:45:35 +0200 (CEST)
Date: Fri, 18 Sep 2020 22:45:35 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] i2c: mediatek: Fix generic definitions for bus frequencies
Message-ID: <20200918204535.GA52206@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, qii.wang@mediatek.com,
 linux-i2c <linux-i2c@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Leilk Liu <leilk.liu@mediatek.com>
References: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
 <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_164538_594337_5197B70A 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: devicetree <devicetree@vger.kernel.org>, qii.wang@mediatek.com,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Leilk Liu <leilk.liu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============3337177418922981047=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3337177418922981047==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -       if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
> > -               target_speed =3D I2C_MAX_FAST_MODE_PLUS_FREQ;
> > +       if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
> > +               target_speed =3D I2C_MAX_HIGH_SPEED_MODE_FREQ;
>=20
> Thanks for fixing this. Indeed, somehow I messed these up.

I read this as Rev-by for v2. Thanks!


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lHGsACgkQFA3kzBSg
Kbb8+Q//d12J/hP68UWUVx1wF2vUsU24vGA8FJZMSyvSlrcOD6QZRalGsA6LR8k1
w6G70LEDSRlDVe1Q/9NuYJT6enGqXhGKs2up0qnGHAB14N6S5WS7hMQJXSFvc6Mm
xXnNV4gFGcXfcqZMRgl3er6mDeMKJh+Sa5mnmaDhViT11VegGYkAr+VjFOyg5qLh
EzR4ZO8NoMCi/hvTkiIu3MQNyKPQy33Xq4SdQqGC/x1ew7DWAwopPmQsooL7zQv2
dqYd7X4FN6qcd/oF0K6tMyY6bbUVf/XiCfruyJjRf7hSESw/fc8HkFjF4oN8oIKR
x/sVPceOiMjHpu186UGBK8ieupBQduP5PgewXmFM6Xgsj2hOBV/lwIFF2JoV7wO4
ETFZJVJUNbLb8XjavbTVRbfaVSHTEa4pR1dGjOARj5sUdpEV6jOGY1ziRGntUh0u
7DTZK0uZym8qms+6SB2dmHakkkXISGeAi/RNjx7vrmhShh1C4auluXWO8/SbIkGU
Nm6lrKP4hmEXTAdvAcivMwnLHHZ+MgaWGaAZtSJv3EfqoYpnZRSNTCkFTLiRyAh/
nkZn0naZnd5tO7jMr7U/43ZSHi7sTDBcPNnmx+e/qE+EZakkDBTXO107YHnks69E
CQRE6DyZ3jdjeTjG301Y65dMW3n+gJq7ZlpE+pUJZVQUyW9zyz0=
=/Aw9
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


--===============3337177418922981047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3337177418922981047==--

