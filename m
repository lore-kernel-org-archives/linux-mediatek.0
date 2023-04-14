Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6997C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 05:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nZhdZWIh56xOaKDuPNTmmgR+9hidjIq+/5TwKmrPwo=; b=n8UuPcHClTJIGZas0OvWi84X/N
	CNs3vk6T399t7+lczVm2rNnEunqosIbaLwKwjuUqmQsufoNoPkDh4bzGNZ5ZUuq6ObzgCBaquQRfF
	CpCvLSvR5N1ASpyQzZmVcrvTwxod2rKcZlIWinIGQnp/haCsZzdZEjp390nETELG2QYPKEfQn1vQ2
	zOyfN1GGcrL5gF7tivIPtZvCYRNqsWb+JTpf8zXkK9otki+j6CiirKpHvpVGBl/PUIR6l1FqI/D12
	QHdl9xX4C46M9k/9/dE4KVGRII0x2oDDWZJIsy9Jm5r7/RdJvduMF8+9BtHq5jyLxHl0FTKaLlYRd
	080uK7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnCEK-008OQQ-0j;
	Fri, 14 Apr 2023 05:44:16 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnCEH-008OPg-16
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 05:44:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pnCDv-0006uh-5z; Fri, 14 Apr 2023 07:43:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pnCDr-00B80h-A8; Fri, 14 Apr 2023 07:43:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pnCDq-00D4Dy-F5; Fri, 14 Apr 2023 07:43:46 +0200
Date: Fri, 14 Apr 2023 07:43:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
	thierry.reding@gmail.com, chunkuang.hu@kernel.org,
	ck.hu@mediatek.com, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org,
	kernel@collabora.com, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
Message-ID: <20230414054345.ip3ug53ivr3elbpy@pengutronix.de>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="djepqqx6bag6dot5"
Content-Disposition: inline
In-Reply-To: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_224413_382994_FBABCD2A 
X-CRM114-Status: GOOD (  11.78  )
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


--djepqqx6bag6dot5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 12, 2023 at 01:27:13PM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> block: this is the same as MT8173.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I assume this patch will go in together with the other patches in this
series via an ARM tree? (I.e. not via pwm.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--djepqqx6bag6dot5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ46BAACgkQj4D7WH0S
/k4/QQf+J7sRk5oREfd1w/lHSb4KN9o1xa9cQH4vB6vzHNViu1aEltOjUr7KA5SA
tTJlHyGa+J+Kkdu2A4m4XXQyFN0cp7GcEVUwXzaCzyMbdc4Vs5J7XGkMbhqiqN7/
hECv2dFZr/HfpjI2j32TB1y80TYxrqPzkosZiOWnw0AKa8wVeTgI8M7Rsnc7lFG7
DgW6W75MH1kB6EzYjKUIP9PIXgy7AbM/tnzYf5PItKPiyr+xh6cjeTjcrOHJ+GyF
MRckk8KLWlqIHTfwE5U4lctY5vXAUUrew6K33WHC9eu+3CMs2Tod4G3SrJE7jUCe
EPSYz+vtL3CWQv8IlUJAYPzaNgBcBQ==
=k4oe
-----END PGP SIGNATURE-----

--djepqqx6bag6dot5--

