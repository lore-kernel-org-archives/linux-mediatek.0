Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F3AC48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjvEeWYAAAdi3LRoUmFoZXKC4PyvoRud+A1YX4Es5Ig=; b=vGKfzFKwv0DD498T4IiblRU11V
	2rJFE676JSJE9TzLynQuc+f5S+foVRV4o8fzbud6q/aHkZJY6Tc742GNdxUsq5Id5/RfjHD2e+As8
	x17IlPhcZvN1UrmwYsU9lb5RdUC6i8G1ZYYY+1Tr/zgw3SQmd2hQodI+0VnDS/ukW1X2jvKVSH6JG
	9a21HUInXoPtWZSxqpSzNHVWoehm5nqQBN1ZnFfcPXjTHPUcKBdVqtZUGBjANCqnYMv1qwq4aRBWy
	wdwa/Yb/fNwOZ9xszFaPY/7VtfvgnjHDHzCyXITDMrEzOR+yAOmfBTVctia8RR6qQY1DlMvTAp/IE
	UnorIQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raxzX-00000002O5y-36Xd;
	Fri, 16 Feb 2024 13:10:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raxzU-00000002O2F-2Wya
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Feb 2024 13:10:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raxzA-00013z-Eo; Fri, 16 Feb 2024 14:10:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raxz9-00151g-Rg; Fri, 16 Feb 2024 14:10:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raxz9-005zdK-2T;
	Fri, 16 Feb 2024 14:10:35 +0100
Date: Fri, 16 Feb 2024 14:10:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible
 for MT7988
Message-ID: <45i5wid2fcf3lyucfferraolnxmdwoulz35js7biuhitiy576j@l3pslrkeehvu>
References: <20240213164633.25447-1-zajec5@gmail.com>
 <onnokyq7ciza7i7jzc74cun2khpst5iocuccks2cm433ux3za3@dou4oacrvuxj>
 <2dac95be-b23a-4c42-ac67-241100c7a51b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrlyeofzr3gig4qw"
Content-Disposition: inline
In-Reply-To: <2dac95be-b23a-4c42-ac67-241100c7a51b@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_051056_698607_21467029 
X-CRM114-Status: GOOD (  20.20  )
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


--lrlyeofzr3gig4qw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 10:05:47AM +0100, Krzysztof Kozlowski wrote:
> On 13/02/2024 18:48, Uwe Kleine-K=C3=B6nig wrote:
> > Hello Rafa=C5=82,
> >=20
> > On Tue, Feb 13, 2024 at 05:46:32PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>
> >> MT7988 has on-SoC controller that can control up to 8 PWMs.
> >>
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >=20
> > please make sure that the email address used for sending the patch
> > matches the Signed-off-by line.
> >=20
> > (It depends on the pickyness of the relevant maintainer if that is a
> > stopper or not.)
>=20
> Does not have to... It must match From field which is correct here.

Rafa=C5=82's Signed-off matches the author, but not the sender. Together wi=
th
"the Signed-off-by: must always be that of the developer submitting the
patch." (from Documentation/process/submitting-patches.rst) I'd say it's
reasonable to request that there is a sign-off with the email matching
the sender. In my understanding the Sign-off line by the author isn't
really required because the sender can vouch for the author. Of course
this is a somewhat artificial discussion if the sender is the same
person as the author and only the email addresses differ. So this about
the strictness of the applying maintainer.

FTR:

	$  curl -s https://lore.kernel.org/linux-pwm/20240213164633.25447-1-zajec5=
@gmail.com/raw | grep -E '^(From|Signed-off-by):'
	From: =3D?UTF-8?q?Rafa=3DC5=3D82=3D20Mi=3DC5=3D82ecki?=3D <zajec5@gmail.co=
m>
	From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
	Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

the first From: is the sender, the second the author.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lrlyeofzr3gig4qw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXPXsoACgkQj4D7WH0S
/k5n6gf/bwjc8ajUTwW3zBdQjV2Uv2vtl5UgwtnUgkacqy/DYxOQytC2hJ59AZ1e
ZcR/Z00k1RIXoftOmHBcLsH1hOoZ0t6dc9N4MrAH+sL3HbsM9tl0QKvdtqsYA8UB
qcrGwKx3vkq2PNhARGXmJv8D6KVju2QzrM33wlw75BWXVzw6SN1lDg5r3D5oXoOh
OkVw5lmiKU98GoG+tC6Kr14ZNV5Ff5HIx62omGYNw4U927UsGIhIXyGsMw2VUa9t
iTKmrv1+QWMXqgPdchoHsABDnnNCNJjmU+DvjBvx3zAetjt/Tvzl4cLJIc0jZ9WX
2T+98AdX4mDu2RUmraghTQB+4kegEg==
=54H0
-----END PGP SIGNATURE-----

--lrlyeofzr3gig4qw--

