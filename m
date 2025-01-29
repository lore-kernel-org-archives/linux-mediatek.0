Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8336FC02193
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2025 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7Wno81VDmAC8LZxebVHqmFv78aV+GntC7UloBA6wQA=; b=ltKEwT8o8373OBOLlayTOlZ8BM
	LgX9MXq3o9BvuUXXU70qUoTXY6fLo7DKiqHaV1ajWALsToOA3xfstM+7tTGHyUQAoidfhwFFmnIAf
	ArwJ+EnHN6wMnl1vlVFE7q4LwLH+c4jr9RbDoswcQ+IdC5utSNVaEnJgYL0pDHVO6B5yB5J4urBgQ
	tmDzxYiBVgiTw3XOKoLal6cRlA5YL9hMStBV+MUIGJaoMK803e/d+RFJ0NV7T/1crbVxHc1nNux5t
	+00aCzNWpDYjbwk72l6Ky/JxYXR+Q6/5VqpBOoOxmc90N8hWQU5mcpM+XDy+DgNfIVeUCzxquzBqx
	bm+e/Afg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAAk-00000007HLu-2BDZ;
	Wed, 29 Jan 2025 15:40:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAAh-00000007HJx-1DQY;
	Wed, 29 Jan 2025 15:40:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CE8C5C5DB8;
	Wed, 29 Jan 2025 15:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54A4C4CED3;
	Wed, 29 Jan 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738165205;
	bh=H7Wno81VDmAC8LZxebVHqmFv78aV+GntC7UloBA6wQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blVJU1tBuGlKF4p47SaFusm9eG5WZSgkALpUADxFuWuQiIFr9qF7DNpOhnbEUeXbs
	 7viGrnwFOcJSwLPYI+Ehdw7eY23dv9mEQ7o9fqlXjrbnP3pst1omLXvrGlE1aBm30m
	 Bi7pbYb1UPpMvMHUuyONufYRLOO7ZVEBsAkaSFoyED0QRRyozXtecJBokIiLtaVWOO
	 q0djJLUSg4eE2yATE1o5zFnBrTEQd2LiyidKL5wQWTiQ5Taf9QVxZKqyI4HsxEX9wi
	 K7GNZwBmVTPWfpazFvFm2ldBBFkDsVN11cDjiMvXt+chOhLgfReDoepEnSHIosPwoR
	 O1uHFNJcIFiaA==
Date: Wed, 29 Jan 2025 16:40:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 06/14] drm/mxsfb: move to
 devm_platform_ioremap_resource() usage
Message-ID: <ivwhzbasvxnnnzoqpqd6w24d6wma6pufcrc6jl7b6gsyzrnup2@r36hiijgac7m>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-6-0d1609a29587@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="j6fxajocgelt3kwa"
Content-Disposition: inline
In-Reply-To: <20250128-cocci-memory-api-v1-6-0d1609a29587@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_074007_523308_55DFFBCD 
X-CRM114-Status: GOOD (  10.52  )
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


--j6fxajocgelt3kwa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/14] drm/mxsfb: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 05:29:30PM -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource(pdev,...);
> -ioremap_res =3D devm_ioremap_resource(...);
> +ioremap_res =3D devm_platform_ioremap_resource(pdev,0);
>=20
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--j6fxajocgelt3kwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pL0QAKCRAnX84Zoj2+
dpu8AX92mKVtYr4NesUkaNaAZLgSW9h3CZMfohWW2Hi3OHXPAvC1LmJnp0Zowbq8
4FFBL/wBf2VL8YqmcT3T9+XhphtMFWv/+85mR4/YE14rKn4brg9xZxj2nw0jIWJ5
ZU3psZFZbg==
=rMo6
-----END PGP SIGNATURE-----

--j6fxajocgelt3kwa--

