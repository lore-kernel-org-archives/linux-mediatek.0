Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BF8C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJGwKOeQsUHRg2J/cY90GV1pE8muC/1KH0Jr5iICesU=; b=tbFhF5HCMS72VaPUoDwXwukZKE
	oeVaoQmTmbj7AT6h+qU6lnypz4svV2sDDjen8vHA18pCIVAlCLHf68gitUe/sFUzue+mp3St/Kfq3
	nHiCcnyCP9uMkEp4PQZRAaUNDxOuLWnqUZ2jMf/76srUQoB40q7zbwPe6wRoPj+ZDQAseFRzvGW54
	d1kfW5FqIb0xx+ode7FyI4IXLxl/eLmEeqPaMdeCa7kqopXA17a/Kadz0X/sELGUE9jCqVW989oZm
	SyiGBuxXhtkOslyS9TB3gLpTzWgKdS5i3OoHz1fdqXSfei6+5psYV5Mw98aeeZFuczNdlI8yfsfXk
	XNHaI4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0C0-0000000F78z-0apw;
	Wed, 17 Apr 2024 07:58:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0Bv-0000000F76T-2BbE
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 07:58:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rx0BW-0006cy-IA; Wed, 17 Apr 2024 09:58:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rx0BU-00Ckm6-DJ; Wed, 17 Apr 2024 09:58:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rx0BU-002e2n-0y;
	Wed, 17 Apr 2024 09:58:24 +0200
Date: Wed, 17 Apr 2024 09:58:24 +0200
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
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 00/18] Add display support for the MT8365-EVK board
Message-ID: <afetelidcystq4avtmfcvf6h4l5zdthwozwbhjica6jjybkiln@oxx2fqk65psx>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nkhfub2sueyozzkj"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_005851_608463_8E2BC5E6 
X-CRM114-Status: GOOD (  12.60  )
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


--nkhfub2sueyozzkj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 16, 2024 at 05:53:01PM +0200, Alexandre Mergnat wrote:
> Alexandre Mergnat (16):
>       [...]
>       dt-bindings: pwm: mediatek,pwm-disp: add power-domains property
>       dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
> [...]
> base-commit: 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e
> change-id: 20231023-display-support-c6418b30e419

I cannot find 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e, neither in next
nor in stable nor in drm-misc nor in Linus' repository.

For sure it's not based on next, because otherwise you'd have noticed
that the power-domains property is already documented there. (Currently
as fb7c3d8ba039df877886fd457538d8b24ca9c84b.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nkhfub2sueyozzkj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYfgR8ACgkQj4D7WH0S
/k7mIQf+PbzquhwUkWhMaS47IM1H6SK1o8TJsEIaR6wb6Yy4bRV+XUEXe+POTalM
BhknR+V0xm/DcBuQivWKRYfDF/jZUJ/DZ60ila73u0xZRbJhLQLY27RNP/URC3uj
OdBwmD7H6JXYaFs1Rb0oYIyl8lpNtoIJIBDqh/tO7sXYWZtXTr6SXQeEPdhuPn3U
mhZhnfOgESFdC6P41I2AP/MJ/lxTo+k8l0rZ7iD1TiimDtziKX/uH/bPNr/NVS7D
qcL/ItrLaC0O7HA8uuUjxTIpbkPRPKFQKYrCYo0FzOYwv78RwW3qu4bVofMmbx1u
JAVxhSAOAKBafJzgDfONyOIB6du9XA==
=C88w
-----END PGP SIGNATURE-----

--nkhfub2sueyozzkj--

