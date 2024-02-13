Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0534C48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 17:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwK0ZRdw+ZZP+NmaRIfgCMzdM4hH0LCJ4MMtwdvGUQs=; b=EkSJIfdlGX+m0seQOGLhyBpLo5
	t32D8iSkXO88ooaEgZvspIfhxPJgZcI8/5vOdUH8j+3EmMHNOLJaiHAtL/lEUlzeRvpVN0ILJPluN
	yjjI1aqeHzq8EFQs8OpRfdcD4/wZDAYc/G7z2De9RpAvpsPfli+RVXIKmp3ZREtynTsK90di4h6FM
	VQ52PuGUYdLQt0Q2ruemkcF9Z3kibXKJ8BObzAc4w5Zu9uGjAAOMnDpbY5CFBJ6hKlO5FZspfZHLT
	0ttjyMH+kLQMXJoirAwiCktEyoYsRFwLrQ21VA4BZdvklxEFZD/rJ6h+SCpBq5qt1P+zY3Ioj0kyA
	udzige3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwu8-0000000AC1c-2Cni;
	Tue, 13 Feb 2024 17:49:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwu5-0000000AC05-1GN8
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Feb 2024 17:49:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rZwtm-0007eB-T1; Tue, 13 Feb 2024 18:48:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rZwtk-000Wtk-TI; Tue, 13 Feb 2024 18:48:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rZwtk-0046pb-2d;
	Tue, 13 Feb 2024 18:48:48 +0100
Date: Tue, 13 Feb 2024 18:48:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible
 for MT7988
Message-ID: <onnokyq7ciza7i7jzc74cun2khpst5iocuccks2cm433ux3za3@dou4oacrvuxj>
References: <20240213164633.25447-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jhwaxkndpklwhxal"
Content-Disposition: inline
In-Reply-To: <20240213164633.25447-1-zajec5@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_094909_367390_1710C119 
X-CRM114-Status: GOOD (  11.99  )
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


--jhwaxkndpklwhxal
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Rafa=C5=82,

On Tue, Feb 13, 2024 at 05:46:32PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> MT7988 has on-SoC controller that can control up to 8 PWMs.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

please make sure that the email address used for sending the patch
matches the Signed-off-by line.

(It depends on the pickyness of the relevant maintainer if that is a
stopper or not.)

Assuming this patch will go in via a mediatek tree:

Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jhwaxkndpklwhxal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXLq38ACgkQj4D7WH0S
/k5Yxgf+MGDk4UWSSThMXzK6DjwTQdURT3za9jTq2ls/OQIHoQfyaw902waKPjVr
mPIVGTESq0AvIpQNcZQQH8WUjNfI7at0cWPaTA/iZD07h9nMOEztTp4wP3rYwBp5
yicKjx5McHb1nR5poDAXFudd+7v/gOgXBLPxABfx4FiOLWqnNuDJF2xwmge8mKHp
NKlYSZk+kiCbBwsZk3LBwLqKv45TnPI2yuayws+r1jYLnmXMyRUkVQqCpX2/CUGq
wESqm70l9ty5FmyiE86YbJkgx+b5o9Z/nJt223FluL3Ftnxfc0sABjdCI9IxmFCg
sWhDm4LJVkrMbtBmn8VK5huxt/BXmw==
=o3gj
-----END PGP SIGNATURE-----

--jhwaxkndpklwhxal--

