Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD22C3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cb2kMyUZz+09TPxC7XSnOt+aHqAq3RB1JfOHowI1lTM=; b=ShHN5MQtrkRnVGj3YxQBY67yv5
	KtbbgYPYK/g+lv5hC52fkG8XOEyV778mfa3f3C4BPyIMgMLlkbegupST6Y6t2U7A3JdC4Bvm4arVD
	Mp9GPHTGnERkUv5EQ3kQ/cjt4ySKi6qVKskzmGJOf4xOBsupd3YXnbIjloo2zLwG+X6diY/Dsh3h2
	RBycToSNBF0Hj2ykdrrhqoFkrEsBpbJaSM4PqCxOWypWnxIDQIp8wKjTuK0pdTteufTXwoE7oLKAo
	BKMPZMZDfK28YuOHIBsMFyxYECo6ZMcDQytLE1ojJvDl6AeT96VakMZLIABXHRxzSs+CVanMG8Hkm
	n6vjLi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTeit-00000009vLj-49XJ;
	Tue, 16 Jul 2024 09:43:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTeiq-00000009vJS-11uB;
	Tue, 16 Jul 2024 09:43:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 593B060304;
	Tue, 16 Jul 2024 09:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C0DC116B1;
	Tue, 16 Jul 2024 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721123027;
	bh=cb2kMyUZz+09TPxC7XSnOt+aHqAq3RB1JfOHowI1lTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqcYY9TUYD+gO1X/TCX0AUvnR4331B3UHqHC1W0kpktTNHpNsjf3Dp4YhLrqN9TkH
	 PnBMqFqjM2H5F6O8v93th0cgBhzqMFZNFBaF5MbxY2qlckU6RkhM9Je0AqwhEO/lpb
	 p2AhLDbcTzNI+wGb39KK8K573p/4ttCA92iEqW7F1Si7UanKBNm4uyCS+9w5vKkYl5
	 9nTZi2UQhaDPrj3pnDIHA2AZLRLMdGunPZSIfJgKGE2KIYq7D6tQKaOdcFimxp0nLp
	 As1I1B8WZsCguk8p+p3nnPMM7Uh1tBqwSjIArMzLbPk6uRAtouQYKRFi2nQRMG+pj4
	 esxa//Keq3dSQ==
Date: Tue, 16 Jul 2024 11:43:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 3/5] drm/connector: automatically set immutable flag
 for max_bpc property
Message-ID: <20240716-majestic-vermilion-hornet-fd1cfb@houat>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
 <20240715-drm-bridge-connector-fix-hdmi-reset-v4-3-61e6417cfd99@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fdsfmxhl5wgvjiuk"
Content-Disposition: inline
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-3-61e6417cfd99@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_024348_491984_D2C938EB 
X-CRM114-Status: GOOD (  11.63  )
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


--fdsfmxhl5wgvjiuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 09:33:03AM GMT, Dmitry Baryshkov wrote:
> With the introduction of the HDMI Connector framework the driver might
> end up creating the max_bpc property with min =3D max =3D 8. IGT insists
> that such properties carry the 'immutable' flag. Automatically set the
> flag if the driver asks for the max_bpc property with min =3D=3D max.
>=20
> Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connecto=
r state")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Assuming that someone on the uapi sides agrees to patch 3:

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--fdsfmxhl5wgvjiuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZpZA0AAKCRAnX84Zoj2+
dtNdAX9Ax2E/pR1JgBzBrUF/uMPOl1sAEeevA2aoMOeQhKfGs2BZhGJ77abapFvP
xuT5sK8Bfjqe28CP8kHlRvXG2ER2YP8NG+nrxaw4u1WdmauMPDTJzHoGi2MW4dkH
Czrtx7ncfw==
=AL/r
-----END PGP SIGNATURE-----

--fdsfmxhl5wgvjiuk--

