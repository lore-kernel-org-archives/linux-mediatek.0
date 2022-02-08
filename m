Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E679FC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ewZe3aOOM8I23XQYvS1qDmAPOLljm3lKS0oOA7L/ok=; b=bw87rQZI2tV6guxvGct/oj6e2d
	DqPvJU+INxbbk7zmxjdzGUyLbVgr5L69E0xTyFyi26s4sMzIp0m4s5Qoegb+sO07kP1xB2oAK0zTd
	qFVjYx5W05pbIkouCmLG5LZtj+ulDcW+oLzZh7Re+bWIFqDP6FTXTWcu94i+Vlo8QgEoms2kM662c
	lDDZrdUy3UIj6sHPmpmZerCInYscqvEEhRWLhcvCWiodeIzgzK4pIod0zfjPs9h1mVHS4fkX1oeFF
	XK0xu58k3Svvh3OtjYJ/xCrbpNHJOyT5oHeMV2Rot6xT0Fe3QrvCdChONKwss6tNKBj1UgcdPsCV7
	57KkJwSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHMWL-00DAW3-Op; Tue, 08 Feb 2022 09:10:45 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHMWJ-00DAVI-BS
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 09:10:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nHMWB-00066l-R3; Tue, 08 Feb 2022 10:10:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nHMW9-00FGoZ-RX; Tue, 08 Feb 2022 10:10:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nHMW8-00BiId-Hq; Tue, 08 Feb 2022 10:10:32 +0100
Date: Tue, 8 Feb 2022 10:10:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] dt-bindings: pwm: mtk-disp: add compatible string for
 MT8183 SoC
Message-ID: <20220208091029.iwnepc343djtcvq5@pengutronix.de>
References: <20220207112657.18246-1-allen-kh.cheng@mediatek.com>
 <20220207125158.t5362u2dddccdmsq@pengutronix.de>
 <f6633fc82c4fa899c7f4ca27d9751d9e61fb90ac.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <f6633fc82c4fa899c7f4ca27d9751d9e61fb90ac.camel@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_011043_411099_B61C785F 
X-CRM114-Status: GOOD (  13.71  )
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
Content-Type: multipart/mixed; boundary="===============2752571408611242274=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2752571408611242274==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ocriqvydtskbnony"
Content-Disposition: inline


--ocriqvydtskbnony
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Feb 08, 2022 at 12:28:23PM +0800, allen-kh.cheng wrote:
> Thank you for your suggestions.
> We will send another patch for .yaml format.
>=20
> About the last reminder, sorry, I don=E2=80=99t get that.=20
> Do you mean upper/lower case letters in an email address?

exactly. I don't know how picky Thierry (who is responsible to pick up
this patch or not) is, but a 100% match is the safe bet.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ocriqvydtskbnony
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmICM4IACgkQwfwUeK3K
7AkomwgAjyvexLDj4KWf4AnFi96ZKatrTB7IwOyT7pD0vBcRoKsvunPSnHJsjIIP
dK9UYjAorC9HvWd0TkFBxdELweyiX2jalzEFQqmrNh09L7JMyslk0VKeikzxT9kr
/V4YccfXY11ip6iE5zjF2Rr8qQHfHPWzIni3+RFN8S87sR55P3UInnYfq6WFzPwV
in2gAhYdOL0/Wfx+t9CxB7ayyywSMjl/clmr3Bv1gdI9okfu53zF9RTShzLe9Hug
FktAFjXQoUoe/kU6Qll2eKiFSJkIP88amXjOGvPhdekZ14i7qsGRNseyl4pAHTvB
1x+gQ4/a0uoQdNQGr0Rt7TVG7T/VxA==
=FP1F
-----END PGP SIGNATURE-----

--ocriqvydtskbnony--


--===============2752571408611242274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2752571408611242274==--

