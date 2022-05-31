Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1156C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stLjgsQMCYe94VNZSEt9z6cnQDGck0KEEl8oxK6gIRU=; b=tpr8kdA9rqX4vJ9hZVw28B5zao
	NAsqYLUo6skjbeUnsHjh3ONYmzzpXCMxBfn3rdEuBtin8nxH34vKxAu1fu7ceL/+KVkOuyS1B1l89
	dpE7vF2ok5EreiVatreI04gldGbn633DGKnDJ48TFOfBEsBnciTkuR38gUTU/BR+kjeJXV9ivxPwI
	bCgaZPsHu9mzO/Z358qjOFz/+M9LO5l3DPs0hT3Qvj9hQl+haSCpeZ/ebPXhp4UoIMW6b0HCtfdFg
	ka+qUEjMuUPwq0TqoJR/Xyx1IXLa8QC5UClyZQJdZG3BfoeB9oLCI7tJCqcQ8DOrUk6AggxO3Ksx2
	WleR1f3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1r7-00B46N-JN; Tue, 31 May 2022 13:24:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1op-00B2tY-B9
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:21:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nw1oi-0000fa-7H; Tue, 31 May 2022 15:21:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nw1oi-005efT-S7; Tue, 31 May 2022 15:21:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nw1og-00DJcI-RM; Tue, 31 May 2022 15:21:46 +0200
Date: Tue, 31 May 2022 15:21:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabien Parent <fparent@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/2] pwm: mediatek: add MT8365 support
Message-ID: <20220531132146.2zgqda4krzinpnjz@pengutronix.de>
References: <20220530205038.917431-1-fparent@baylibre.com>
 <20220530205038.917431-2-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220530205038.917431-2-fparent@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_062155_426968_75C183BB 
X-CRM114-Status: GOOD (  12.44  )
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
Content-Type: multipart/mixed; boundary="===============5993001216168885098=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5993001216168885098==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vghzb7bo5uqxchra"
Content-Disposition: inline


--vghzb7bo5uqxchra
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 10:50:38PM +0200, Fabien Parent wrote:
> Add support for PWM on MT8365
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

looks reasonable

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vghzb7bo5uqxchra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKWFmgACgkQwfwUeK3K
7Alc5wgAhtJ1RC3404iVoUzmztvxCsqFqWXCCs7ABL7F4nca8vj+sLX6wtYzYwLR
o1Jxc8nRei/tSuMbWz0XEUS479GGdFs3+XATIdc1QzSGsR9cXShBtec+cywRSNrN
uRAJMb+BSx0exbP8LyUx4zDNkrL1HHsd3nwKtR8FGf0FrQxe+Qtv63o/BMpdhWr6
LZ3Qq3qg5bZ+DdJlqnlXDNC7AYxmE5e+Hl1nZs0g0oSxG628nJ5MbGhoL6ubmPhk
FEMNgX35Fr9Kz6IHYfSWeBU2RAeU/xHCZRpaLq0JZx5i1L/GKOeTatx3yaWk4HQZ
Yl7UcqI+LDiOEWSeNs+RuGSpZbfu1w==
=4/fJ
-----END PGP SIGNATURE-----

--vghzb7bo5uqxchra--


--===============5993001216168885098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5993001216168885098==--

