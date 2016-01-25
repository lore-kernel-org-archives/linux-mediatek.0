From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 2/4] mfd: mediatek: int_con and int_status may vary in
 location
Date: Mon, 25 Jan 2016 12:33:53 +0000
Message-ID: <20160125123353.GE3368@x1>
References: <1453716887-38442-1-git-send-email-blogic@openwrt.org>
 <1453716887-38442-3-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453716887-38442-3-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 25 Jan 2016, John Crispin wrote:

> MT6323 has the INT_CON and INT_STATUS located at a different position=
=2E
> Make the registers locations configurable.
>=20
> Signed-off-by: John Crispin <blogic@openwrt.org>
> ---
>  drivers/mfd/mt6397-core.c       |   27 +++++++++++++++++----------
>  include/linux/mfd/mt6397/core.h |    2 ++
>  2 files changed, 19 insertions(+), 10 deletions(-)

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 1749c1c..75ad0fe 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -69,8 +69,10 @@ static void mt6397_irq_sync_unlock(struct irq_data=
 *data)
>  {
>  	struct mt6397_chip *mt6397 =3D irq_data_get_irq_chip_data(data);
> =20
> -	regmap_write(mt6397->regmap, MT6397_INT_CON0, mt6397->irq_masks_cur=
[0]);
> -	regmap_write(mt6397->regmap, MT6397_INT_CON1, mt6397->irq_masks_cur=
[1]);
> +	regmap_write(mt6397->regmap, mt6397->int_con[0],
> +		     mt6397->irq_masks_cur[0]);
> +	regmap_write(mt6397->regmap, mt6397->int_con[1],
> +		     mt6397->irq_masks_cur[1]);
> =20
>  	mutex_unlock(&mt6397->irqlock);
>  }
> @@ -147,8 +149,8 @@ static irqreturn_t mt6397_irq_thread(int irq, voi=
d *data)
>  {
>  	struct mt6397_chip *mt6397 =3D data;
> =20
> -	mt6397_irq_handle_reg(mt6397, MT6397_INT_STATUS0, 0);
> -	mt6397_irq_handle_reg(mt6397, MT6397_INT_STATUS1, 16);
> +	mt6397_irq_handle_reg(mt6397, mt6397->int_status[0], 0);
> +	mt6397_irq_handle_reg(mt6397, mt6397->int_status[1], 16);
> =20
>  	return IRQ_HANDLED;
>  }
> @@ -177,8 +179,8 @@ static int mt6397_irq_init(struct mt6397_chip *mt=
6397)
>  	mutex_init(&mt6397->irqlock);
> =20
>  	/* Mask all interrupt sources */
> -	regmap_write(mt6397->regmap, MT6397_INT_CON0, 0x0);
> -	regmap_write(mt6397->regmap, MT6397_INT_CON1, 0x0);
> +	regmap_write(mt6397->regmap, mt6397->int_con[0], 0x0);
> +	regmap_write(mt6397->regmap, mt6397->int_con[1], 0x0);
> =20
>  	mt6397->irq_domain =3D irq_domain_add_linear(mt6397->dev->of_node,
>  		MT6397_IRQ_NR, &mt6397_irq_domain_ops, mt6397);
> @@ -203,8 +205,8 @@ static int mt6397_irq_suspend(struct device *dev)
>  {
>  	struct mt6397_chip *chip =3D dev_get_drvdata(dev);
> =20
> -	regmap_write(chip->regmap, MT6397_INT_CON0, chip->wake_mask[0]);
> -	regmap_write(chip->regmap, MT6397_INT_CON1, chip->wake_mask[1]);
> +	regmap_write(chip->regmap, chip->int_con[0], chip->wake_mask[0]);
> +	regmap_write(chip->regmap, chip->int_con[1], chip->wake_mask[1]);
> =20
>  	enable_irq_wake(chip->irq);
> =20
> @@ -215,8 +217,8 @@ static int mt6397_irq_resume(struct device *dev)
>  {
>  	struct mt6397_chip *chip =3D dev_get_drvdata(dev);
> =20
> -	regmap_write(chip->regmap, MT6397_INT_CON0, chip->irq_masks_cur[0])=
;
> -	regmap_write(chip->regmap, MT6397_INT_CON1, chip->irq_masks_cur[1])=
;
> +	regmap_write(chip->regmap, chip->int_con[0], chip->irq_masks_cur[0]=
);
> +	regmap_write(chip->regmap, chip->int_con[1], chip->irq_masks_cur[1]=
);
> =20
>  	disable_irq_wake(chip->irq);
> =20
> @@ -237,6 +239,11 @@ static int mt6397_probe(struct platform_device *=
pdev)
>  		return -ENOMEM;
> =20
>  	mt6397->dev =3D &pdev->dev;
> +	mt6397->int_con[0] =3D MT6397_INT_CON0;
> +	mt6397->int_con[1] =3D MT6397_INT_CON1;
> +	mt6397->int_status[0] =3D MT6397_INT_STATUS0;
> +	mt6397->int_status[1] =3D MT6397_INT_STATUS1;
> +
>  	/*
>  	 * mt6397 MFD is child device of soc pmic wrapper.
>  	 * Regmap is set from its parent.
> diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt63=
97/core.h
> index 45b8e8a..d678f52 100644
> --- a/include/linux/mfd/mt6397/core.h
> +++ b/include/linux/mfd/mt6397/core.h
> @@ -60,6 +60,8 @@ struct mt6397_chip {
>  	u16 wake_mask[2];
>  	u16 irq_masks_cur[2];
>  	u16 irq_masks_cache[2];
> +	u16 int_con[2];
> +	u16 int_status[2];
>  };
> =20
>  #endif /* __MFD_MT6397_CORE_H__ */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
