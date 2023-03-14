Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58972C74A4B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 16:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2+H7wt3YGMoJy1kI08Oezx1jFQC9X+jtLDpoYMlXss=; b=hn1Mi/HkEzxoX1SivgiQzbgigO
	VySdUQITYbPZ9eJnqsOwzlRZhmpRN7quUqvL5hRO7Gfhc8p5KfAtSN60cB77cyAaugbmhnTEZOw1D
	DpC2K14JePoKP1YT4H4wrmmcbjmw22h6vGi3cJds2f6jN8kH0BdicRwPQ4E+fYO4/T+7C5GlnWX6S
	bJKohnw9rjrh6w5cKx2hcwe3di/MvmMpbGggZC9i+ZWfhVnYYmTVimIJ2UOi1HNIghIyQoGCMHm9T
	b/EdT++53qg8qClSpedoAN+Ze8RqfKXIixs0a1Xm/DdYZ7/pLQardrpe+tJ4kzgnvHECw9s7G0wnx
	yDCE8O6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc795-00AjW1-0j;
	Tue, 14 Mar 2023 16:05:03 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc78z-00AjQf-0g;
	Tue, 14 Mar 2023 16:04:58 +0000
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5259EE000A;
	Tue, 14 Mar 2023 16:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678809893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c2+H7wt3YGMoJy1kI08Oezx1jFQC9X+jtLDpoYMlXss=;
	b=ohgih14REmXqm2YF0JReNRyzYFa6p8DeLxCOosBOjCP69WgwLl4SrXk9XakcXKF0kd9xwy
	iMCvNea8EW5AtPT1hqpXjAuy/hc08syMWVHptjb3t3f/VlI/gwsFTpM/GkF3gADXnCx7Sa
	heStzYo3ZsO4uFShLISuSNrbNPDvvUn/SwHvbVuXlTsShQXYB2aIQPMGAR3hifMfAzym1f
	vvExPpy3d7rvd/a5XYG/A7SnTG3bNwlMZpT47oWKVFLprwab4fy8qdRnSHXwrSrhA3RsMQ
	HriELQR7raePfh3IEayUhBeiw+dLQhEZAA6NXmgA3hYX14DWwAULtDN/5eNAeg==
Date: Tue, 14 Mar 2023 17:04:48 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 18/28] media: platform: sun8i-a83t-mipi-csi2: drop
 of_match_ptr for ID table
Message-ID: <ZBCbIILFhcDMIg+h@aptenodytes>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-18-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VxKfudML6kIseEz3"
Content-Disposition: inline
In-Reply-To: <20230312131318.351173-18-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_090457_517618_24996FC7 
X-CRM114-Status: GOOD (  18.16  )
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


--VxKfudML6kIseEz3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sun 12 Mar 23, 14:13, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>=20
>   drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.=
c:818:34: error: =E2=80=98sun8i_a83t_mipi_csi2_of_match=E2=80=99 defined bu=
t not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks good to me:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks !

Paul

> ---
>  .../platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c
> index cd2e92ae2293..1f0cc7b1ba47 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c
> @@ -826,7 +826,7 @@ static struct platform_driver sun8i_a83t_mipi_csi2_pl=
atform_driver =3D {
>  	.remove	=3D sun8i_a83t_mipi_csi2_remove,
>  	.driver	=3D {
>  		.name		=3D SUN8I_A83T_MIPI_CSI2_NAME,
> -		.of_match_table	=3D of_match_ptr(sun8i_a83t_mipi_csi2_of_match),
> +		.of_match_table	=3D sun8i_a83t_mipi_csi2_of_match,
>  		.pm		=3D &sun8i_a83t_mipi_csi2_pm_ops,
>  	},
>  };
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--VxKfudML6kIseEz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmQQmyAACgkQ3cLmz3+f
v9FJ+wf/Vs+zvL4HtIgKv1HYr45R/bI+XzRQ4edLJ+86siTyMIe6/xFs4hPJqnc/
Kuop0jFCkE6h2zK7PLMPUxXZrLAThJRzd6YcMHKFN2JutU93IMSmu5Uz6R7NvnOd
a0EpxMMQ8VZw+1bth4K5ttM6ZOI7uNuhD6ipUvXq7QLifzs9UJ7392zOtafnn0Sd
vHbZ+ADRZzdCYpp4MjkR5rMxMyxBUpQ8PchA4eANo+Uq+gCKQWkoWGW9DSQ84eJN
I8+xB1hddqMNyazPRNC+r01B6GydbodK+KdDjbE8xgLGy7Q1V4NPbmV1UkH+p+Oa
pO1TUIhFzI6T+zb/bNmkmLiKPBkdmA==
=crX/
-----END PGP SIGNATURE-----

--VxKfudML6kIseEz3--

