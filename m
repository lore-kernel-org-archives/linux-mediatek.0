Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BA1CFA466
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Nov 2025 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/Lbe37vMKbCoD3B1IHrIgiyNh/UXWfW7MEqdxBBZqg=; b=E8qDsvlvmJwZ32hoQDxrOKroBT
	H96Zvo8se21sEliFDLq9G14HDmxLXiJAiY6iwsAXNjmpfVRdp6gZoy2GNVsnK6Q4XjuS3BT1rQYCp
	am/AQLF70AK5wyEYdUk0NbjakAnKEocwn5PtXM5YD8xd7H06U1m+LbdJigVEUuqVWsTva50WUhT3n
	Wi84O1wfrKnFUltKLsyxKf6p92vU2WmSSblAGpWo4nXaFD8RaE4osmoHx48wT9HtfnWak8rn9c6in
	0cEKgiHVQs1hYWG9tmpxiEvOzYA1WWKD7ZDlkSoiWCmOKYkMIu+GfpPYc2iZH8dP4XKR6YaZfZe/0
	liHSNi8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTh2-0000000BPsC-2nVu;
	Mon, 24 Nov 2025 10:21:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTh1-0000000BPru-0ZJ9;
	Mon, 24 Nov 2025 10:21:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5898601D0;
	Mon, 24 Nov 2025 10:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A31C4CEF1;
	Mon, 24 Nov 2025 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763979669;
	bh=OBgvU/HewE7AURcZkSTPDenefoBU8HiGHjgeE2JDZV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCFjtwHQ3V/pAkrHapvA+lllHrksyj0zfU/WZePoxPbbd8/fOMCfLEoE8Sfr/Hl5x
	 wE+ZWjH5UoGzuGsysGziP14rgy2tPRwbBEGMpIiuY4WDYaq71697kYXYU/Dezdyx5i
	 FlfICETC6R5HjGYmjb9NQIpIFNapyvhxh/gRBgDJyfQ/o0LNxUZAGksWZs8wUa2piR
	 UVlMvWDFyhQNfYgK74HS9fmGGYBT1gGraQpnKezQdx6EzdrajqwclHxsp44VnlHxqh
	 hUhG0Hx6fQTUyCMELPvKav+U9kKEbdIkhbLMfYRkBhzVqUYTbaCpfg+K7XXgykZQo2
	 qfheB/yQc+XVQ==
Date: Mon, 24 Nov 2025 11:21:06 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 03/26] drm/todo: add entry about converting to
 drm_of_find_bridge()
Message-ID: <lpu5lms6rk53xfgot2dltkcoa4m7gdckjow5khr7hppvpfieq6@fs5zzomieuzd>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-3-0db98a7fe474@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4r6yluq4gkkddnih"
Content-Disposition: inline
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-3-0db98a7fe474@bootlin.com>
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


--4r6yluq4gkkddnih
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 03/26] drm/todo: add entry about converting to
 drm_of_find_bridge()
MIME-Version: 1.0

On Wed, Nov 19, 2025 at 02:05:34PM +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated, but converting some users is very
> complex and should be reasonably doable only after the DRM panel bridge
> lifetime rework. Add a TODO to track this.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a=
18ad@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  Documentation/gpu/todo.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 9013ced318cb..1a4a11dee036 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -506,6 +506,22 @@ Contact: Maxime Ripard <mripard@kernel.org>,
> =20
>  Level: Intermediate
> =20
> +Convert users of of_drm_find_bridge() to drm_of_find_bridge()
> +-------------------------------------------------------------
> +
> +Taking a struct drm_bridge pointer requires getting a reference and putt=
ing
> +it after disposing of the pointer. Most functions returning a struct
> +drm_bridge pointer already call drm_bridge_get() to increment the refcou=
nt
> +and their users have been updated to call drm_bridge_put() when
> +appropriate. of_drm_find_bridge() does not get a reference and it has be=
en
> +deprecated in favor of drm_of_find_bridge() which does, but some users
> +still need to be converted.
> +
> +Contact: Maxime Ripard <mripard@kernel.org>,
> +         Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +Level: Intermediate
> +

My understanding is that there's no users left after this series, so do
we really need a todo?

Maxime

--4r6yluq4gkkddnih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSQxkgAKCRAnX84Zoj2+
duD+AX9u2+TlkBeWYDhuk1Qks7O5LoJ/GJqUOWRWKucMSXXG0m3tGsfi6Epgaucu
bMpMP0gBgNzc3zm3QAihjM2NTWEx34nH5O6aoFpidyWNuv3rPcavDF7sK9120U7j
b/qTCRAFUQ==
=KQqV
-----END PGP SIGNATURE-----

--4r6yluq4gkkddnih--

