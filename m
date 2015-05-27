From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: mediatek: Add GPIO sub module support into mfd.
Date: Wed, 27 May 2015 11:32:10 +0100
Message-ID: <20150527103210.GI11677@x1>
References: <1432717835-16398-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432717835-16398-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, dandan.he@mediatek.com, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 27 May 2015, Hongzhou Yang wrote:

> Base on Lee Jones' comment, change pinctrl subnode name.
>=20
> ---
> Register pinctrl subnode into 6397 mfd cell.

Sascha already mentioned what's wrong here, so I'll not labour the
point.

I'm feeling generous, I'll apply this and make the necessary changes
myself.  Please bear the points in mind for next time however.

Applied, thanks.

> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mfd/mt6397-core.c |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 09bc780..e50a9bc 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -34,6 +34,9 @@ static const struct mfd_cell mt6397_devs[] =3D {
>  	}, {
>  		.name =3D "mt6397-clk",
>  		.of_compatible =3D "mediatek,mt6397-clk",
> +	}, {
> +		.name =3D "mt6397-pinctrl",
> +		.of_compatible =3D "mediatek,mt6397-pinctrl",
>  	},
>  };
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
