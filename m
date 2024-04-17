Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36964C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tzmSBQJKJudyndihK7DXvOrKAdHLmgGsLV1mcLFdjo=; b=Y2NuUqy4Nnk9p2utAaFBPFRbfv
	ahdrVb2Odw8TJNa7rC3Xc3o49j+zbvkU4LcfNJTRGDQ3xEvhY+5K/ac/61v72BrHzbPiFcJeQleOO
	Vu65igb/c+N/cXC16owYVXBQBUp27Z0RayYrUhLC5xNfGAO0EqSk/VtKEu7rfGs/4Ak/5kIYk6rz9
	Qw0bPrC/obqEhFCrE9eISijjIgObsfkM0ZtP+pg4qzPBxBmu9ozXqmeo0lqpuMj5Hn2EhjHz+WY4T
	WbHpnQ4voOQ/IePrQ0I598ry6e0ZgqEh0w1NObrGaRaFpz4W1R4m7StnqwTENFFxMOTxWOVYB0hZP
	Wfs6G7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0F8-0000000F81h-3qGT;
	Wed, 17 Apr 2024 08:02:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0F1-0000000F7yJ-2r9n
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 08:02:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rx0EY-0001q9-4l; Wed, 17 Apr 2024 10:01:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rx0EW-00CkmG-Qv; Wed, 17 Apr 2024 10:01:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rx0EW-002e73-2K;
	Wed, 17 Apr 2024 10:01:32 +0200
Date: Wed, 17 Apr 2024 10:01:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
Message-ID: <22yeoik77sdhmg43odjftzjn2douq74zhxwy6qx3hsrvr53r5e@7w3f3zbgxult>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yebn7lkzwjt2edcd"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_010203_746107_29F3A4DC 
X-CRM114-Status: GOOD (  12.02  )
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


--yebn7lkzwjt2edcd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 16, 2024 at 05:53:12PM +0200, Alexandre Mergnat wrote:
> According to the Mediatek MT8365 datasheet, the display PWM block has
> a power domain.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

I already pointed that out in reply to the cover letter, so just to make
it more easily to spot for people considering to apply this patch:

This is already fixed in next.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yebn7lkzwjt2edcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYfgdsACgkQj4D7WH0S
/k6aiQf8DDht8BJdwLA/chC/kqidSgtlv6qxFC1XbFLhIfSvyp8eqaLoaQk+lLDt
9WdQ2VOkHggnHje1S9Gj34fqnvGuJZcZkOnlXI7z6T19ngA1JzvAiKWtVuZbV6bC
Co9nKH9suzuEmBXk3SXdR2WILBaYxqP2UxfZ05BW26JCB+5JKxIMUH0c2tBKP5l3
3LmMOO36eJ95y3iHp8Q8I93qPZDYJhXDkFPehtepPzK30J3XeLct+6tQZUHAzyeP
BBLmoTFgotLZLsDeBpfMlGlgFKqibDM72G/Fh0vVgR1qCRUKFpiE6/xipzch5F3d
IbSttwKcXx3F0YSgQjx223hlA4c2yg==
=1L1v
-----END PGP SIGNATURE-----

--yebn7lkzwjt2edcd--

