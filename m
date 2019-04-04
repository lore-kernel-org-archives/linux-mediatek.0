From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH 5/5] usb: chipidea: msm: get optional clock by
 devm_clk_get_optional()
Date: Thu, 4 Apr 2019 07:28:57 +0000
Message-ID: <VI1PR04MB53271D981843769FEFDD60E78B500@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <2ec86ffd7de45dabaa7257019a79f1e80751934c.1553937592.git.chunfeng.yun@mediatek.com>
 <2f4b8d77c6ec99ef6cc8e71155d820e080ad9af5.1553937592.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2f4b8d77c6ec99ef6cc8e71155d820e080ad9af5.1553937592.git.chunfeng.yun@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

=20
>  drivers/usb/chipidea/ci_hdrc_msm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c
> b/drivers/usb/chipidea/ci_hdrc_msm.c
> index 880009987460..b8b3caad889c 100644
> --- a/drivers/usb/chipidea/ci_hdrc_msm.c
> +++ b/drivers/usb/chipidea/ci_hdrc_msm.c
> @@ -205,12 +205,9 @@ static int ci_hdrc_msm_probe(struct platform_device
> *pdev)
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
>=20
> -	ci->fs_clk =3D clk =3D devm_clk_get(&pdev->dev, "fs");
> -	if (IS_ERR(clk)) {
> -		if (PTR_ERR(clk) =3D=3D -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -		ci->fs_clk =3D NULL;
> -	}
> +	ci->fs_clk =3D clk =3D devm_clk_get_optional(&pdev->dev, "fs");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
>=20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	ci->base =3D devm_ioremap_resource(&pdev->dev, res);
> --
> 2.20.1

Acked-by: Peter Chen <peter.chen@nxp.com>
