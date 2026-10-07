Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF39CA6007
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JDCl8OrL+mKV42Pt6NN+0hbgXtTIi+Z0eAqdjwBzyw=; b=Xh1xx27b3X4HgRSqaHoHfI61WW
	SyNtZ/bxv/IAop8CREJGV2teR5ZrWopTuPs5T8YemdE+bzbUG0bL1rmgKN7UzDj/eu1jFFAxefJ5d
	70t/mH5rwgygiWHrqs2vlI9oN965C0R4fWvIe6P6Dtapz8ek+cm7tSYMone5RV5b+66eBhGo6vxx8
	VUzGrkEnQoD5+xnRiAjG9sZZ76PRN0EJyUjqLK0EGxjrod8s+bECB20pyf6cbCkCs1ARJtcLGHtAC
	/RKAaUq1KP3s6PI3Jb7wp2B547C6yniDXF01nA5Z/a9+OkfdphqaCA2wAWjCrtsoK9MwEyPd+b6yA
	oHvt7zlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOMa-000000026fm-207h;
	Wed, 07 Oct 2026 09:55:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOMZ-000000026fE-0Utr;
	Wed, 07 Oct 2026 09:55:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70F3C60210;
	Wed,  7 Oct 2026 09:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E6E1F0089E;
	Wed,  7 Oct 2026 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366902;
	bh=8JDCl8OrL+mKV42Pt6NN+0hbgXtTIi+Z0eAqdjwBzyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ny1lOyzE2RwWpchdltjmSQrwfW0ie34h908cxxMrEkbATAaqzTa3i7wVAYW2cgzKJ
	 GyWtZJ18tFh9CBXdU/QhZuNEn0eYnlS6I8Kh3TFBiPGJxJ4ubbVt6kQ91Y0sXRwTdT
	 Hoy5BAemJEgRiBA34YSPb3BY78WM7r0xFFVsq+A+iAazU9Yx8bgS7y0I3g+yz1fdC3
	 Wt0g9X0yTkw2bT1MaDkX7Dce4S7zpUanapN8ZQJqKJaOOVDH2stEknH7dYTh4wncno
	 cOSNd/CKKuGfFP3m94LO+QbIwaLCm5cs9ExdOdseUA6lIJ7w8vtv8VVZSc1Y3hLcIT
	 dy5JYSAu1tmBA==
Date: Wed, 7 Oct 2026 10:54:56 +0100
From: Conor Dooley <conor@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: himax,hx8279: add
 vddp-supply
Message-ID: <asYW8MysZdSHdiZo@squawk>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
 <20261006-panel-himax-hx8279-vddp-v1-1-50d884b42aae@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MMrK/lZdGg9SD1J/"
Content-Disposition: inline
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-1-50d884b42aae@baylibre.com>
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

--MMrK/lZdGg9SD1J/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 03:25:01PM -0500, David Lechner wrote:
> Add a vddp-supply property and make it required for the Startek
> KD070FHFID078 panel.
>=20
> The Startek KD070FHFID078 panel has a separate VDDP power input, which
> feeds its DC-DC converter, in addition to VDD and IOVCC. On the MediaTek
> Genio 520 and 720 EVKs, VDDP is switched by its own GPIO-controlled
> regulator, and on the Genio 1200 EVK it comes from its own PMIC LDO.
> In both cases it is separate from the other two supplies, so it needs to
> be described to power the panel.
>=20
> Making it required means existing device trees with this panel without
> it no longer validate. This is ok since the Linux driver will still work
> with them because the regulator core uses a dummy regulator for any
> missing supply. And anyone who sees the warning about the missing
> supply should add it to their device tree.
>=20
> It stays optional for the Aoly SL101PM1794FOG-V15 panel, as it is not
> known whether that panel has a VDDP input.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--MMrK/lZdGg9SD1J/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYW8AAKCRB4tDGHoIJi
0vXbAP9Pa+6o9Kvfp8rFOQt+MoySArv1ZxQQvEAhhO5aRzql7wEAsA3Sa8wW8ZfX
tpdF/lVwu2hYNt2s6KZ1TfaX77j5rgw=
=Mwgg
-----END PGP SIGNATURE-----

--MMrK/lZdGg9SD1J/--

