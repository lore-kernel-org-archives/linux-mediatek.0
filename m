Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8C4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 06:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcDP8j+ckyDp/og4TXNdoyyLp7luCKiEJEy+Z26JXWY=; b=FML/KqhXmgBAPd24mu6vhJPkl0
	0edfxonpPI+48/idMmRgSMCdN9CyAroUGoK47Vfn6dCpbWnip2NvoqNbJYIJj++d/V7j18tSMax2E
	ha2hsdOS8k2bv3+Wfh9QBVC3goRL2F6gi7CX+DNjbih6gMCLVsJHTSYvCrr1zKJ3Sqo4lV4+sqJpU
	HFIKaAwKXVPFM6sSCCMDTt5TA9DlL+gft/5BMVgXkDqm6kFHw8VxDmkXva0QsrhW5+cD9W8MRYuRi
	iZWJF0NP9q5VrjC+qFY/cdjlfbzUzEYJw0pH2NO66coMlU7xECUOxikqOq/mqUh68w2xKR2L+ssJM
	uc9PF0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMl3U-00Cxon-AX; Wed, 23 Feb 2022 06:23:16 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMl31-00CxdK-RT
 for linux-mediatek@lists.infradead.org; Wed, 23 Feb 2022 06:22:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nMl2t-0005cM-1S; Wed, 23 Feb 2022 07:22:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nMl2s-000lHS-6g; Wed, 23 Feb 2022 07:22:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nMl2q-004y0T-ML; Wed, 23 Feb 2022 07:22:36 +0100
Date: Wed, 23 Feb 2022 07:22:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-mediatek@lists.infradead.org,
 Douglas Anderson <dianders@chromium.org>,
 Lee Jones <lee.jones@linaro.org>, linux-pwm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Benson Leung <bleung@chromium.org>, linux-arm-msm@vger.kernel.org,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] mfd/pwm: dt-bindings: google, cros-ec:
 include generic pwm schema
Message-ID: <20220223062233.4m2xejozz4d47gmo@pengutronix.de>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <164557235424.1264579.14486504733557463529.b4-ty@sntech.de>
MIME-Version: 1.0
In-Reply-To: <164557235424.1264579.14486504733557463529.b4-ty@sntech.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_222247_920976_0D6253B4 
X-CRM114-Status: GOOD (  17.04  )
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
Content-Type: multipart/mixed; boundary="===============4300422839469480300=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4300422839469480300==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tz6kkjgucct6gsdy"
Content-Disposition: inline


--tz6kkjgucct6gsdy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 23, 2022 at 12:27:08AM +0100, Heiko Stuebner wrote:
> On Mon, 14 Feb 2022 09:19:12 +0100, Krzysztof Kozlowski wrote:
> > DTS patches are independent. Not tested, but I really hope no downstrea=
m kernel
> > depends on pwm node naming... If it does, please change it to compatibl=
e. :)
> >=20
> > Best regards,
> > Krzysztof
> >=20
> > Krzysztof Kozlowski (4):
> >   dt-bindings: pwm: google,cros-ec: include generic pwm schema
> >   arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
> >   arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
> >   arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [4/4] arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
>       commit: 474a84be692d893f45a54b405dcbc137cbf77949

I expected that all patches in this series go in together via an ARM
tree. Or are there expectations that this goes via PWM?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tz6kkjgucct6gsdy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIV0qYACgkQwfwUeK3K
7Al9mQgAhD+Y70LUATDqKKM6Uf5x8vV8s8vkHGeNWj6YC7RgYVH/gsKh2FZTHebB
13Z4Tmc+6U7nbvDhzVU3v+6p4QqjwRJO1dINTZZwkPXYBS1wopfnGkdrjJWcXSWL
i2pFlGJm9Sh/16uLjIUsGMr+/V4ftEHzphi9fAvKUcbLlGmOIVA4KkA1IM3kUUqM
QvrvXSxms4ktaL+IEnjtza+lr8VhuYyeLCnrapNYBQ8qzvlIEy77IQN7xTiaQ5KY
/jsRBUw82H0YuUxCx4pHX3b7Y17mOXBrWJtt5EWwsjNNEjAuGnyE/1WCxC8sht/6
p1Wso+Y/5o80Ph14XipAdR7uEVIEBQ==
=96Gc
-----END PGP SIGNATURE-----

--tz6kkjgucct6gsdy--


--===============4300422839469480300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4300422839469480300==--

