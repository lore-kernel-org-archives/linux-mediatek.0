From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 3/3] mfd: mt6397: check the EPROBE_DEFER from
 platform_get_irq.
Date: Mon, 11 Apr 2016 09:50:39 +0100
Message-ID: <20160411085039.GL4592@x1>
References: <1460098729-25549-1-git-send-email-henryc.chen@mediatek.com>
 <1460098729-25549-3-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460098729-25549-3-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <blogic@openwrt.org>, Sascha Hauer <s.hauer@pengutronix.de>, Flora Fu <flora.fu@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 08 Apr 2016, Henry Chen wrote:

> If get the -EPROBE_DEFER from platform_get_irq, it should return back=
 directly.
>=20
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 15050cb..b9b1e28 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -271,6 +271,8 @@ static int mt6397_probe(struct platform_device *p=
dev)
>  	}
> =20
>  	pmic->irq =3D platform_get_irq(pdev, 0);
> +	if (pmic->irq =3D=3D -EPROBE_DEFER)
> +		return -EPROBE_DEFER;

if (ret < 0)
   return ret;

=2E.. is more common, as it covers more bases, etc.

>  	switch (id & 0xff) {
>  	case MT6323_CID_CODE:

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
