From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3] mfd: mt6397: Implement wake handler and
 suspend/resume to handle wake up event.
Date: Mon, 10 Aug 2015 14:47:47 +0100
Message-ID: <20150810134747.GI3249@x1>
References: <1439212245-18935-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439212245-18935-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 10 Aug 2015, Henry Chen wrote:

> Implement .irq_set_wake() to get who is wakeup source and setup on su=
spend/reumse. Enable
> mt6393_irq as wake up source properly to pinctrl by enable_irq_wake()=
/enable_irq_wake().
>=20
> Reviewed-by: Lee Jones <lee.jones@linaro.org>

I don't think this means what you think it means.

In future, please don't add {Acked,Reviewed,Tested,etc}-bys unless
someone explicitly sends you one, for example:

"Acked-by: Lee Jones <lee.jones@linaro.org>"

I'll remove this and apply the correct tags.

Patch applied, thanks.

> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
> Changes since v2:
> Remove the filename of title.
> Remove irrelevant change.
>=20
> Chandes since v1:
> Used enable_irq_wake()/disable_irq_wake to handle irq wakeup source.
>=20
>  drivers/mfd/mt6397-core.c       | 49 +++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/mt6397/core.h |  1 +
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 03929a6..e7d5a67 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -93,12 +93,31 @@ static void mt6397_irq_enable(struct irq_data *da=
ta)
>  	mt6397->irq_masks_cur[reg] |=3D BIT(shift);
>  }
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned i=
nt on)
> +{
> +	struct mt6397_chip *mt6397 =3D irq_data_get_irq_chip_data(irq_data)=
;
> +	int shift =3D irq_data->hwirq & 0xf;
> +	int reg =3D irq_data->hwirq >> 4;
> +
> +	if (on)
> +		mt6397->wake_mask[reg] |=3D BIT(shift);
> +	else
> +		mt6397->wake_mask[reg] &=3D ~BIT(shift);
> +
> +	return 0;
> +}
> +#else
> +#define mt6397_irq_set_wake NULL
> +#endif
> +
>  static struct irq_chip mt6397_irq_chip =3D {
>  	.name =3D "mt6397-irq",
>  	.irq_bus_lock =3D mt6397_irq_lock,
>  	.irq_bus_sync_unlock =3D mt6397_irq_sync_unlock,
>  	.irq_enable =3D mt6397_irq_enable,
>  	.irq_disable =3D mt6397_irq_disable,
> +	.irq_set_wake =3D mt6397_irq_set_wake,
>  };
> =20
>  static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int re=
g,
> @@ -183,6 +202,35 @@ static int mt6397_irq_init(struct mt6397_chip *m=
t6397)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static int mt6397_irq_suspend(struct device *dev)
> +{
> +	struct mt6397_chip *chip =3D dev_get_drvdata(dev);
> +
> +	regmap_write(chip->regmap, MT6397_INT_CON0, chip->wake_mask[0]);
> +	regmap_write(chip->regmap, MT6397_INT_CON1, chip->wake_mask[1]);
> +
> +	enable_irq_wake(chip->irq);
> +
> +	return 0;
> +}
> +
> +static int mt6397_irq_resume(struct device *dev)
> +{
> +	struct mt6397_chip *chip =3D dev_get_drvdata(dev);
> +
> +	regmap_write(chip->regmap, MT6397_INT_CON0, chip->irq_masks_cur[0])=
;
> +	regmap_write(chip->regmap, MT6397_INT_CON1, chip->irq_masks_cur[1])=
;
> +
> +	disable_irq_wake(chip->irq);
> +
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_irq_suspend,
> +			mt6397_irq_resume);
> +
>  static int mt6397_probe(struct platform_device *pdev)
>  {
>  	int ret;
> @@ -237,6 +285,7 @@ static struct platform_driver mt6397_driver =3D {
>  	.driver =3D {
>  		.name =3D "mt6397",
>  		.of_match_table =3D of_match_ptr(mt6397_of_match),
> +		.pm =3D &mt6397_pm_ops,
>  	},
>  };
> =20
> diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt63=
97/core.h
> index cf5265b..45b8e8a 100644
> --- a/include/linux/mfd/mt6397/core.h
> +++ b/include/linux/mfd/mt6397/core.h
> @@ -57,6 +57,7 @@ struct mt6397_chip {
>  	int irq;
>  	struct irq_domain *irq_domain;
>  	struct mutex irqlock;
> +	u16 wake_mask[2];
>  	u16 irq_masks_cur[2];
>  	u16 irq_masks_cache[2];
>  };

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
