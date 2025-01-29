Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D145C02194
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2025 15:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9JE2Uq93Vh582IwVy3YUp9unCAPKme3G68FJGurUYw=; b=cNz+PaIJROp4Tc+newNqKPxZIH
	p18BAgDxtqPngSuVsv5G4uV/PiSsPhDIZ9IODvChY+DYafSZLV1TNpmJSr3SgF3DvfTet1LigxNnx
	jtARX0JQCF3TgJvGsEdhUsQTxJ1njHzrl/DLQV+E5fDnoxLbsOZM6em4ngHVF/dV01LhnhLGE0nwk
	s1fWkcy6xXu5+Ih9AZSM6ExYIvE5rsgDondr+13pWMIEpqIkOp4GiOv1dHfLs7AK1PE7znvM1IQyC
	SzkOvoFtqrILHvqyn1Eu7SkkQI7ZWWs+oA0+dpQ6vHpemvKYSF41cE6DgCTN4Febhsi+kt6kBaQP+
	FXRsr+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdACP-00000007Hqq-0yWA;
	Wed, 29 Jan 2025 15:41:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdACM-00000007Hpg-1q9H;
	Wed, 29 Jan 2025 15:41:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41005A41A33;
	Wed, 29 Jan 2025 15:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0D5C4CED1;
	Wed, 29 Jan 2025 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738165308;
	bh=x9FQ10F4P9ene0avOkX6SJRwE4duJpiylNTvH2FHki0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Doq+/rNzHg+crI9ZcWtKePHsQc6DCfqlblaynmX5rkNKoSR8aoRtfLCo8hlplQT8S
	 SszLnZ7/buZh6jfPwyw7MFwtzbCqliYr1x8R26ffuKILIzG4Dcrlo2vauyEx+ZCa7Q
	 fGMA+W95aCCNzgyEj0Sl5Hjc6GbfuxBPEg/1VR+9jrU8RajCzwLijwt9d05XfTVIdU
	 pXcYBPgl+if4aDVy8x6uvii+g9qXvXmGsdU6tc8eW1deajAWLklzKK93vVc7zEKfTM
	 LfkYLXOkbdJxFMvmKe1KH7TkEg/csOuMkrEGGxXdWVtbhKJsIm3GZwQaznV1b1oyxx
	 udzvX+QKPoOSw==
Date: Wed, 29 Jan 2025 16:41:45 +0100
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
Subject: Re: [PATCH 07/14] drm/rockchip: move to
 devm_platform_ioremap_resource() usage
Message-ID: <fkck6okku766yn4bpfbiykpvvsj5k7tgebko7pvybon3rctn7w@gkl5z2o3bcf2>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="n2rj4zmziwj6lmg7"
Content-Disposition: inline
In-Reply-To: <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_074150_618741_86D1A5A1 
X-CRM114-Status: GOOD (  18.48  )
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


--n2rj4zmziwj6lmg7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 07/14] drm/rockchip: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 05:29:31PM -0500, Anusha Srivatsa wrote:
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
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Heiko St=FCbner <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_vop.c
> index 57747f1cff26e444ef3569983d6a7f7922f03ff7..4c639f7c868907fc35ce22f2e=
f7e281ad85c2d9e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -2187,7 +2187,6 @@ static int vop_bind(struct device *dev, struct devi=
ce *master, void *data)
>  	const struct vop_data *vop_data;
>  	struct drm_device *drm_dev =3D data;
>  	struct vop *vop;
> -	struct resource *res;
>  	int ret, irq;
> =20
>  	vop_data =3D of_device_get_match_data(dev);
> @@ -2207,8 +2206,7 @@ static int vop_bind(struct device *dev, struct devi=
ce *master, void *data)
> =20
>  	vop_win_init(vop);
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	vop->regs =3D devm_ioremap_resource(dev, res);
> +	vop->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(vop->regs))
>  		return PTR_ERR(vop->regs);
>  	vop->len =3D resource_size(res);

This one will result in a compile failure too, you removed res but it's
still used on the last line.

Maxime

--n2rj4zmziwj6lmg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pMOAAKCRAnX84Zoj2+
dm9sAX95MxW28qLtlCcTTmdQkMrfL23sMFhwLQtAuxzLU6cNJTr4Laq62TyMz0tE
fkKBU/cBgOoSJ8YDN8x0kWdfzBz+S1fj4kdxPGLwpdkIMLxH7u1CgpGzqotO9jni
7iTsYM6fhw==
=I0Jf
-----END PGP SIGNATURE-----

--n2rj4zmziwj6lmg7--

