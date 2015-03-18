From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] mfd: provide RTC resource in MT6397 MFD
Date: Wed, 18 Mar 2015 07:30:45 +0000
Message-ID: <20150318073045.GE3318@x1>
References: <1426657537-41414-1-git-send-email-eddie.huang@mediatek.com>
 <1426657537-41414-2-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426657537-41414-2-git-send-email-eddie.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie Huang <eddie.huang@mediatek.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Uwe =?iso-8859-1?Q?Kleine-K=C3=B6nig?= <kernel@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 18 Mar 2015, Eddie Huang wrote:

> Provide MT6397 RTC interrupt, base address, and register in
> MT6397 MFD.
>=20
> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index b61c4eb..ef431d8 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -21,9 +21,24 @@
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6397/registers.h>
> =20
> +static const struct resource mt6397_rtc_resources[] =3D {
> +	{
> +		.start =3D 0xe000,
> +		.end   =3D 0xe03e,

I'd like to see these defined please.

> +		.flags  =3D IORESOURCE_MEM,
> +	},
> +	{
> +		.start =3D MT6397_IRQ_RTC,
> +		.end   =3D MT6397_IRQ_RTC,
> +		.flags  =3D IORESOURCE_IRQ,
> +	},
> +};
> +
>  static const struct mfd_cell mt6397_devs[] =3D {
>  	{
>  		.name =3D "mt6397-rtc",
> +		.num_resources =3D ARRAY_SIZE(mt6397_rtc_resources),
> +		.resources =3D mt6397_rtc_resources,
>  		.of_compatible =3D "mediatek,mt6397-rtc",
>  	}, {
>  		.name =3D "mt6397-regulator",

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
