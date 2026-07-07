Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E6CC43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCciVIAgFYNh8iiCE6A1FVMN5+3AnpIFscEXkkxF9ew=; b=PGGXw6YZLvZSu29Qph9H6PcLoh
	E3ZYdfF1ngVCc4vclEHlYgRQ9p4dQWufzn80Fi0yLnt3qUVb3/ogpqd11qvozA3XiDF/sT63H9b6m
	9mI9oDDyrylX4iTeiYUFQ2vrIl+9PDYwHN3JCKAf/5F/G+BfTP8XqUVHPsaqtCCNAp6Yrqsuz0qW5
	WyhoTVb2PdgzDipNrsziDWdMbb4oQvFGW7ubqYFu7qaj0kSEtm3If3Tam4E7JVqfZ9+/X6nzK9iK1
	L5FGUMxH4ZnJFbb2y8idTG2pk6ovaypIiYYCetsWfMANWLieZpDKO7njJA5eo98ByAr3G0z64FtQl
	RI8IpB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6RK-0000000F77V-2U5z;
	Tue, 07 Jul 2026 14:06:22 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6RF-0000000F76N-3Rf5;
	Tue, 07 Jul 2026 14:06:20 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id F01F33700312;
	Tue,  7 Jul 2026 14:05:37 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8FFE1AE5EC3; Tue,  7 Jul 2026 14:05:31 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id B6432AE5EB6;
	Tue,  7 Jul 2026 14:05:21 +0000 (UTC)
Date: Tue, 7 Jul 2026 16:05:19 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eddie James <eajames@linux.ibm.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ge Gordon <gordon.ge@bst.ai>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
	kernel@collabora.com, linux-tegra@vger.kernel.org,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 30/42] staging: media: cedrus: Use
 devm_of_reserved_mem_device_init()
Message-ID: <ak0HnzMzGT_WZ9u1@shepard>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-31-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L/gXhcj/KYS6Adou"
Content-Disposition: inline
In-Reply-To: <20260703193855.110619-31-mukesh.ojha@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_070618_192798_3D665E6E 
X-CRM114-Status: GOOD (  23.04  )
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

--L/gXhcj/KYS6Adou
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mukesh,

On Sat 04 Jul 26, 01:08, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.

Thanks for your work!

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 444fb53878d1..7b5aa94064a1 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>  		return ret;
>  	}
> =20
> -	ret =3D of_reserved_mem_device_init(dev->dev);
> +	ret =3D devm_of_reserved_mem_device_init(dev->dev);
>  	if (ret && ret !=3D -ENODEV) {
>  		dev_err(dev->dev, "Failed to reserve memory\n");
> =20
> @@ -341,8 +341,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>  err_sram:
>  	sunxi_sram_release(dev->dev);
>  err_mem:

Could you also remove this label and switch the goto user to a regular
return ret?

Thanks!

All the best,

Paul

> -	of_reserved_mem_device_release(dev->dev);
> -
>  	return ret;
>  }
> =20
> @@ -353,6 +351,4 @@ void cedrus_hw_remove(struct cedrus_dev *dev)
>  		cedrus_hw_suspend(dev->dev);
> =20
>  	sunxi_sram_release(dev->dev);
> -
> -	of_reserved_mem_device_release(dev->dev);
>  }
> --=20
> 2.53.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--L/gXhcj/KYS6Adou
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmpNB58ACgkQhP3B6o/u
lQyTjg//fLyoug7RFssI1dop/066e79975deN6blykU3a96LxKKn7ru6j0LCnfu4
VTSFjvO7qjkf2yQeXqxnQWvrXBT/JiPMb/nPvBW0MGDi1M1+4kT7238LR5fuNLU0
eBAuY181rHDg+ftoXP7Rzj0XZlZ/dck0119WsWFEUk9gP0Q8BlgTs7QTUu3k2E+E
VUftOitNophkc0JUvgUi5wKODfIgzgp/nj9ZnCsjF9QSDjcr3Wjn2qwvdS4hG43H
m8QkFdiim8NX6PKzgqcjLNOUEXjjphI6+onlAT3qREs2ThXycXu0m5/+r+5IP6AT
OeVpkJQ9zrx91+tL94Yi4iXPERdq1zcnpUsiE1YhOnlB/KfCAXX3WeS6ZjLfF5aW
7/5j2Bd/rTlqCSH25ek2EQKZj476WJUgYplyAGFpLb/3iXyV89VpkdIk2VEc7ynK
V99TGimHONG+iiDOl/z3pn+MX5RzXeMWhmevSrfiTJzsG5Kb+mOKr86er3oTehf0
g8NOS3ITmO5IGHbfJSUx236uPw58QMEWKmKyZ/Sx7nDhhhskPBSgCJSvSPn0cbz9
cXejK2y8wLRj1RaSjCGUdM9ZoZPlNDoyqDrWZDxI2tzgXFYDbcuFEHM19GIDPTTY
2iujg05WmAKMP0jVtjzc7NoSbdBmeZG2atzsSP6M76kSPNdEJvI=
=0n6x
-----END PGP SIGNATURE-----

--L/gXhcj/KYS6Adou--

