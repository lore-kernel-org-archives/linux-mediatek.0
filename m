Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14267C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 13:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwb8vlhLVML0lrUnvOyrOajjq+NnRdyvZssc0F/mOhw=; b=H6ybrLc5aw/JY8PRGSppDCbaOf
	gSCixR5Sr1dVjP/aRaaRcUZjHy0kO63kUAIXfIUuIiUt/g+LGOzWgWpzbSCnHuTxWvRvDI6Fo2zf+
	1AsW/nScpM0g/MEvPQO0SKENih0X+LJdQBTHRb2y+omQVOhnfFvZCEPrCsvpLc+GpCGj1HuTFjypp
	grrtYsfvqyHMTH7Budldbek0WZiGefxsRuC4oOiuIBly04CkI6qPkPnVBR4bDzG/grcNBwBpZti5s
	7a7aOQ+P+dYrpwgb092OlP0dywKe4oxDGmboZC2+iqo0toAwfFhT5LHUHs2Z3YKxUkHTVzwjEzMBY
	pvk9uMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Gd3-0052pW-FT; Fri, 01 Jul 2022 13:24:13 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Gcv-0052nH-8z
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 13:24:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7Gcp-0005xu-GZ; Fri, 01 Jul 2022 15:23:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7Gck-003nLS-PU; Fri, 01 Jul 2022 15:23:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7Gcn-002KQZ-5J; Fri, 01 Jul 2022 15:23:57 +0200
Date: Fri, 1 Jul 2022 15:23:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabien Parent <fparent@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8195: add pwm node
Message-ID: <20220701132344.vy2w3tx5glmrgbya@pengutronix.de>
References: <20220531114544.144785-1-fparent@baylibre.com>
 <20220531114544.144785-2-fparent@baylibre.com>
 <20220701072500.3rgvscnulhjmjhb6@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xui4lo5jobfysqwp"
Content-Disposition: inline
In-Reply-To: <20220701072500.3rgvscnulhjmjhb6@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_062405_344182_708E6413 
X-CRM114-Status: GOOD (  12.69  )
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


--xui4lo5jobfysqwp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jul 01, 2022 at 09:25:00AM +0200, Uwe Kleine-K=F6nig wrote:
> I wonder why will pick up this patch? Will patch 1 then go the same

I think my question is clear, but in case it's not: s/why/who/

> path, or is that one supposed to go via the pwm tree?

Best regards
Uwe



--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xui4lo5jobfysqwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK+9V0ACgkQwfwUeK3K
7AlSrgf+P7HokPzYJcLz1i8OVvZtt/3C3sXTf3NXmiSxxegT3LP71x71/BIkYjoV
2PoXvxeAVv2/messCMQ6vP79SXVkQ1fTNQLrEcX7YHJyxT19K+0G0RTn82vf8SfJ
oxv2ADzLB6qziR02eFBIRGQiZ5ypOgK4AONG8mXQLtVPM7VzSJ79NUOrC4NsznLZ
T35JrwhDtVOAVWA7zZNwTAI2f8hPPOQFf6fvpmlklLq/JD11yQ5NU400UpY+z26b
SjrXLF2srqXdMFPOBkTy9xFjs6GtQc6fxbDgEVLNrXUMs4HvjxhTex0bmFvMh6ss
AFCi6yLd+CiVxnW2mTnhD9k3QAbFKA==
=+UjS
-----END PGP SIGNATURE-----

--xui4lo5jobfysqwp--

