From: Minas Harutyunyan <minas.harutyunyan@synopsys.com>
Subject: Re: [PATCH 4/5] usb: dwc2: get optional clock by
 devm_clk_get_optional()
Date: Mon, 1 Apr 2019 08:47:47 +0000
Message-ID: <410670D7E743164D87FA6160E7907A56013A7FDF13@am04wembxa.internal.synopsys.com>
References: <2ec86ffd7de45dabaa7257019a79f1e80751934c.1553937592.git.chunfeng.yun@mediatek.com>
 <e14524a4e6b38140f41e55bb74aedb6599e963e1.1553937592.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Minas Harutyunyan <minas.harutyunyan@synopsys.com>
List-Id: linux-mediatek@lists.infradead.org

On 3/30/2019 1:28 PM, Chunfeng Yun wrote:=0A=
> Use devm_clk_get_optional() to get optional clock=0A=
> =0A=
> Cc: Minas Harutyunyan <hminas@synopsys.com>=0A=
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>=0A=
=0A=
Acked-by: Minas Harutyunyan <hminas@synopsys.com>=0A=
=0A=
> ---=0A=
>   drivers/usb/dwc2/platform.c | 6 +++---=0A=
>   1 file changed, 3 insertions(+), 3 deletions(-)=0A=
> =0A=
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c=0A=
> index c0b64d483552..9aa9682a5cd2 100644=0A=
> --- a/drivers/usb/dwc2/platform.c=0A=
> +++ b/drivers/usb/dwc2/platform.c=0A=
> @@ -284,10 +284,10 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg =
*hsotg)=0A=
>   	}=0A=
>   =0A=
>   	/* Clock */=0A=
> -	hsotg->clk =3D devm_clk_get(hsotg->dev, "otg");=0A=
> +	hsotg->clk =3D devm_clk_get_optional(hsotg->dev, "otg");=0A=
>   	if (IS_ERR(hsotg->clk)) {=0A=
> -		hsotg->clk =3D NULL;=0A=
> -		dev_dbg(hsotg->dev, "cannot get otg clock\n");=0A=
> +		dev_err(hsotg->dev, "cannot get otg clock\n");=0A=
> +		return PTR_ERR(hsotg->clk);=0A=
>   	}=0A=
>   =0A=
>   	/* Regulators */=0A=
> =0A=
=0A=
