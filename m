Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049A2C001CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+t8Uh+wclM2LIEEyffDGj4POwyHC7I1wDJtREadFIA=; b=CrqHU6IC7/e4rk/B4Cm/HDilmz
	jLe3VYthj9NTlvIPGIKZS9O0elIDDQ0xZO49Y4HuQMFis3dLjjJum+eMada2X5cA7ZaCIdeyqQyNO
	kFGNvP+PqAQayNo1Hyf6h9H1CvYx+Mdlh2zljl0t4CFiMBIgOakQddWQLKG1fzZRcgyqVvWO2oA40
	GrVrN+goFpo0AKWdYYJsmIJL/I/oscQyKH5nimzWr62Gse8PQiHVmJLhZWy7urIaE5i5KddWgNNmr
	dK+BaY/62hWNCvkbnAgUE0VEUnVRo04KbRdwhXHQ46Pnc8LKWxsdopxTa74I6wHtIhhpByVuFVCyd
	zx1aMUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5Iw-0000000G8bK-1ihk;
	Wed, 17 Apr 2024 13:26:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5It-0000000G8Z5-0uM1
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 13:26:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rx5IP-0007GI-7I; Wed, 17 Apr 2024 15:25:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rx5IM-00CnkN-Su; Wed, 17 Apr 2024 15:25:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rx5IM-002rHj-2Y;
	Wed, 17 Apr 2024 15:25:50 +0200
Date: Wed, 17 Apr 2024 15:25:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
Message-ID: <5vqnkgp77tir5j5cumo62pm2cw4xjabexu7nk3kze4gk4ri5dn@g3pee2beuuco>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
 <1db01bd8-0936-40e5-9f1b-7ea34746bef1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2mhwzpvshnycjgzu"
Content-Disposition: inline
In-Reply-To: <1db01bd8-0936-40e5-9f1b-7ea34746bef1@collabora.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_062623_276168_EFDAE36B 
X-CRM114-Status: GOOD (  15.60  )
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


--2mhwzpvshnycjgzu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 17, 2024 at 12:19:19PM +0200, AngeloGioacchino Del Regno wrote:
> Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> > According to the Mediatek MT8365 datasheet, the display PWM block has
> > a power domain.
> >=20
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>=20
> It's the same for at least MT8195, MT8183 and I think MT8192 as well... so
> not having that from the beginning is actually a mistake.
>=20
> Please add a Fixes tag and resend, after which:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

You mean similar to:

	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit=
/?id=3Dfb7c3d8ba039df877886fd457538d8b24ca9c84b

? It seems someone you know well was quicker :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2mhwzpvshnycjgzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYfzd0ACgkQj4D7WH0S
/k644QgApZcXCwxXpE1GPvpexO/Vc5AFPTJkm7FRBnwJJkvRZ1ycT6cFchMCCuDk
54zNsJAXca62uylo+g0umyShBTdJtfK1/jrxOFPvuA+8sdm6j2zXdQGxrq2QozhU
52gFI/sNHpKkYT/ky/xaUHOpbw/BK8bc/6mkaCoKcZg3aB3U/lJsgIX1x9d/Uqo6
70f0ssIQn1KRrZj66GjL2o9m9A8aZ5shpR3TTBtnjw1/K6I2aAU7VUX4R5Uda7ol
bdrw0/GGO0IuYZ+q+F2LLbRTFE2oHy3ZzNQlJ8HBj2e160g1Mo+AQqfqcEwZe8C6
4qWjBjl/FQQtdEludY7c04KB7u+YSg==
=3M09
-----END PGP SIGNATURE-----

--2mhwzpvshnycjgzu--

