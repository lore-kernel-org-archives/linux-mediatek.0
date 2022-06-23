Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2730CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uXSZHdS3mJpQ7ecdn7ixmyaAYanZgmJ20U9iKB3LvM=; b=TOyHmWtaxnPglA3S5THVSSgeUX
	DtM/lyi7T1ro+kCmA0IG0R8Pv+8dXhTPWBCcTPGUJFvcIh0GqHkl+QjzKpAlq/S/ilarSn38c5d2V
	MxxVAThpQiPuNCcf111BPlbmoZzOV3CQofcIcROFq9bO4LesVew63TJnHFgNaFB4vJiRSNqLmUh64
	Vokvcnk0TEzdWqJu0CadY0MUs426e/6TrDa0rOF/1FyRKDvFRVYZOPwSDP6wU1diiUrC2dLe9jnQA
	Vl4BLY2lhbgIerYPdAU05aCPkoao/d5Vm1neBVJAUbLjrgjI+X9SItRXywtQxjBJVJ1eh0OjyCHmK
	lqWl+KdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4S0i-00GOso-Mk; Thu, 23 Jun 2022 18:57:00 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4S0W-00GOns-Mm; Thu, 23 Jun 2022 18:56:50 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ej4so267838edb.7;
        Thu, 23 Jun 2022 11:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0uXSZHdS3mJpQ7ecdn7ixmyaAYanZgmJ20U9iKB3LvM=;
        b=FqD779LMhl6ZXXPI+YNjr+WVLo9W4neYkIeUS2q9scpUhb/MJ5Wy8Ao0Qg0FJpaJ+t
         uOkV3nBwCI/RA0oiO53gNqpaZBlKcfcudajWmGUow3OEyErMDToEMcBU6CtoED0uvZKx
         RwYZiks9bKE/9SlYHs3OyWJqCmg5TU6CDPyPlZ9eCZcz6RleyuDcLhnXb4k0QCZMcwcJ
         RY/+wYPvzAo192SLwWyBkGRZse9PovdAQaeEBC23Y/d4A0fA2Ue8oObgemI4GySj84RS
         hlD+1ZWuMdfA8b38t4lpEpx3UG1buNlGfIar4YHj2bNgvOXYQhcwB+StNIKY7+h24Boq
         IxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0uXSZHdS3mJpQ7ecdn7ixmyaAYanZgmJ20U9iKB3LvM=;
        b=DDBXJFe1xX4Xbm3+WrDTE4wwIp8bF906HkWrvYpxdKEmal8a1Gj9t40srfYrwRSBxy
         tBNH+Il6pZwPbp+HwIxLT7Q55yvs7qmUwXiL+fcHumki5IuwKvfsqSYxvayNuXV9iKC9
         5xJ4gm8i3s/XhDna1t8O5bDTPfidNZIyEyQCjEvCMpsVrXaeO9wJnPxopsA98wRiSih2
         vEV09OORzxHaREUb48Wh0vKZKaiu8WMQ/kL0Pj4SNtK9q8qonXsfTXHpnN6yTykGcdfF
         +bVvrFOvXg46XGS7I5rpEbKDxGLtyHyDo32zg9+q2OYUs3M4zFHzmx0719uDjPxsLcgh
         DrJA==
X-Gm-Message-State: AJIora8HqhDWAofon9JWod2OJJQI/nsebwl2kHJ5hfCnCn7sU+KCpe2G
	P7Acx3wJ1n0vK5LgbHWxGNSGYJ9dtnaigmxr2X0=
X-Google-Smtp-Source: AGRyM1ubOzPazlKC5O9uY0fImpvLLf0ZLaU77Nrk9qWMXcLmh4hjsWTNf6/AOmeMsPByWzgewSmWWaXsLkwODbUFAW0=
X-Received: by 2002:a05:6402:249e:b0:42d:bb88:865b with SMTP id
 q30-20020a056402249e00b0042dbb88865bmr12356084eda.141.1656010606271; Thu, 23
 Jun 2022 11:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-12-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-12-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Jun 2022 20:56:09 +0200
Message-ID: <CAHp75Vf2UAVgWS1nu8iwNjESWHQGOMWcNMUFShZ8Q_Qp3fssdQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] power: supply: mt6370: Add Mediatek MT6370
 charger driver
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, chiaen_wu@richtek.com, 
	alice_chen@richtek.com, cy_huang <cy_huang@richtek.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_115648_795951_DA0C89D8 
X-CRM114-Status: GOOD (  30.24  )
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

On Thu, Jun 23, 2022 at 2:00 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Add Mediatek MT6370 charger driver.

...

> +config CHARGER_MT6370
> +       tristate "Mediatek MT6370 Charger Driver"
> +       depends on MFD_MT6370
> +       depends on REGULATOR
> +       select LINEAR_RANGES
> +       help
> +         Say Y here to enable MT6370 Charger Part.
> +         The device supports High-Accuracy Voltage/Current Regulation,
> +         Average Input Current Regulation, Battery Temperature Sensing,
> +         Over-Temperature Protection, DPDM Detection for BC1.2.

Module name?

...

> +#include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>

This usually goes after linux/*

> +#include <linux/atomic.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/iio/consumer.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/of.h>


> +#include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/workqueue.h>

...

> +#define MT6370_MIVR_IBUS_TH            100000          /* 100 mA */

Instead of comment, add proper units.

...

> +       MT6370_USB_STAT_DCP,
> +       MT6370_USB_STAT_CDP,
> +       MT6370_USB_STAT_MAX,

No comma for a terminator line.

...

> +static inline u32 mt6370_chg_val_to_reg(const struct mt6370_chg_range *range,
> +                                       u32 val)
> +static inline u32 mt6370_chg_reg_to_val(const struct mt6370_chg_range *range,
> +                                       u8 reg)

I'm wondering if you can use the
https://elixir.bootlin.com/linux/v5.19-rc3/source/include/linux/linear_range.h
APIs.

...

> +       int ret = 0;

This seems a redundant assignment, see below.

> +       rcfg->ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(of),
> +                                                "enable", 0,

For index == 0 don't use _index API.

> +                                                GPIOD_OUT_LOW |
> +                                                GPIOD_FLAGS_BIT_NONEXCLUSIVE,
> +                                                rdesc->name);
> +       if (IS_ERR(rcfg->ena_gpiod)) {
> +               dev_err(priv->dev, "Failed to requeset OTG EN Pin\n");

request

> +               rcfg->ena_gpiod = NULL;

So, use _optional and return any errors you got.

> +       } else {
> +               val = MT6370_OPA_MODE_MASK | MT6370_OTG_PIN_EN_MASK;
> +               ret = regmap_update_bits(priv->regmap, MT6370_REG_CHG_CTRL1,
> +                                        val, val);
> +               if (ret)
> +                       dev_err(priv->dev, "Failed to set otg bits\n");
> +       }

...

> +       irq_num = platform_get_irq_byname(pdev, irq_name);

> +

Unwanted blank line.

> +       if (irq_num < 0) {

> +               dev_err(priv->dev, "Failed to get platform resource\n");

Isn't it printed by the call?

> +       } else {
> +               if (en)
> +                       enable_irq(irq_num);
> +               else
> +                       disable_irq_nosync(irq_num);
> +       }

...

> +toggle_cfo_exit:

The useless label.

> +       return ret;
> +}

...

> +       ret = mt6370_chg_get_online(priv, val);
> +       if (!val->intval) {

No error check?

> +               val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
> +               return 0;
> +       }

...

> +static int mt6370_chg_set_online(struct mt6370_priv *priv,
> +                                const union power_supply_propval *val)
> +{
> +       int attach;
> +       u32 pwr_rdy = !!val->intval;
> +
> +       mutex_lock(&priv->attach_lock);
> +       attach = atomic_read(&priv->attach);
> +       if (pwr_rdy == !!attach) {
> +               dev_err(priv->dev, "pwr_rdy is same(%d)\n", pwr_rdy);
> +               mutex_unlock(&priv->attach_lock);
> +               return 0;
> +       }
> +
> +       atomic_set(&priv->attach, pwr_rdy);
> +       mutex_unlock(&priv->attach_lock);
> +
> +       if (!queue_work(priv->wq, &priv->bc12_work))
> +               dev_err(priv->dev, "bc12 work has already queued\n");
> +
> +       return 0;

> +

Unwanted blank line.

> +}

> +static int mt6370_chg_get_property(struct power_supply *psy,
> +                                  enum power_supply_property psp,
> +                                  union power_supply_propval *val)
> +{
> +       struct mt6370_priv *priv = power_supply_get_drvdata(psy);
> +       int ret = 0;
> +
> +       switch (psp) {
> +       case POWER_SUPPLY_PROP_ONLINE:
> +               ret = mt6370_chg_get_online(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_STATUS:
> +               ret = mt6370_chg_get_status(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_CHARGE_TYPE:
> +               ret = mt6370_chg_get_charge_type(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> +               ret = mt6370_chg_get_ichg(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
> +               ret = mt6370_chg_get_max_ichg(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
> +               ret = mt6370_chg_get_cv(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX:
> +               ret = mt6370_chg_get_max_cv(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +               ret = mt6370_chg_get_aicr(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
> +               ret = mt6370_chg_get_mivr(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_PRECHARGE_CURRENT:
> +               ret = mt6370_chg_get_iprechg(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
> +               ret = mt6370_chg_get_ieoc(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_TYPE:
> +               val->intval = priv->psy_desc->type;
> +               break;
> +       case POWER_SUPPLY_PROP_USB_TYPE:
> +               val->intval = priv->psy_usb_type;
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               break;
> +       }
> +
> +       return ret;

In all cases, return directly.

> +}

...

> +       switch (psp) {
> +       case POWER_SUPPLY_PROP_ONLINE:
> +               ret = mt6370_chg_set_online(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> +               ret = mt6370_chg_set_ichg(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
> +               ret = mt6370_chg_set_cv(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +               ret = mt6370_chg_set_aicr(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
> +               ret = mt6370_chg_set_mivr(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_PRECHARGE_CURRENT:
> +               ret = mt6370_chg_set_iprechg(priv, val);
> +               break;
> +       case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
> +               ret = mt6370_chg_set_ieoc(priv, val);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +       }
> +       return ret;

As per above.

...

> +       for (i = 0; i < F_MAX; i++) {
> +               priv->rmap_fields[i] = devm_regmap_field_alloc(priv->dev,
> +                                                              priv->regmap,
> +                                                              fds[i].field);
> +               if (IS_ERR(priv->rmap_fields[i])) {
> +                       dev_err(priv->dev,
> +                               "Failed to allocate regmap field [%s]\n",
> +                               fds[i].name);
> +                       return PTR_ERR(priv->rmap_fields[i]);

return dev_err_probe();

> +               }
> +       }

...

> +       mutex_init(&priv->attach_lock);
> +       atomic_set(&priv->attach, 0);

Why not atomic_init() ?
But yeah, usage of it and other locking mechanisms in this driver are
questionable.

...

> +       /* ICHG/IEOC Workaroud, ICHG can not be set less than 900mA */

Workaround

...

> +       return IS_ERR(priv->rdev) ? PTR_ERR(priv->rdev) : 0;

PTR_ERR_OR_ZERO()

...

> +               .of_node = priv->dev->of_node,

dev_of_node() ?

> +       };
> +
> +       priv->psy_desc = &mt6370_chg_psy_desc;
> +       priv->psy_desc->name = dev_name(priv->dev);
> +       priv->psy = devm_power_supply_register(priv->dev, priv->psy_desc, &cfg);
> +
> +       return IS_ERR(priv->psy) ? PTR_ERR(priv->psy) : 0;

PTR_ERR_OR_ZERO()

> +}

...

> +static irqreturn_t mt6370_attach_i_handler(int irq, void *data)
> +{
> +       struct mt6370_priv *priv = data;
> +       u32 otg_en;
> +       int ret;
> +
> +       /* Check in otg mode or not */
> +       ret = mt6370_chg_field_get(priv, F_BOOST_STAT, &otg_en);
> +       if (ret < 0) {
> +               dev_err(priv->dev, "failed to get otg state\n");
> +               return IRQ_HANDLED;

Handled error?

> +       }
> +
> +       if (otg_en)
> +               return IRQ_HANDLED;

> +       mutex_lock(&priv->attach_lock);
> +       atomic_set(&priv->attach, MT6370_ATTACH_STAT_ATTACH_BC12_DONE);
> +       mutex_unlock(&priv->attach_lock);

Mutex around atomic?! It's interesting...

> +       if (!queue_work(priv->wq, &priv->bc12_work))
> +               dev_err(priv->dev, "bc12 work has already queued\n");
> +
> +       return IRQ_HANDLED;
> +}

...

> +       for (i = 0; i < ARRAY_SIZE(mt6370_chg_irqs); i++) {
> +               ret = platform_get_irq_byname(to_platform_device(priv->dev),
> +                                             mt6370_chg_irqs[i].name);
> +               if (ret < 0) {
> +                       dev_err(priv->dev, "Failed to get irq %s\n",
> +                               mt6370_chg_irqs[i].name);

Isn't the same printed by the above call?

> +                       return ret;
> +               }
> +
> +               ret = devm_request_threaded_irq(priv->dev, ret, NULL,
> +                                               mt6370_chg_irqs[i].handler,
> +                                               IRQF_TRIGGER_FALLING,
> +                                               dev_name(priv->dev),
> +                                               priv);
> +
> +               if (ret < 0) {
> +                       dev_err(priv->dev, "Failed to request irq %s\n",
> +                               mt6370_chg_irqs[i].name);
> +                       return ret;

return dev_err_probe();

> +               }
> +       }

...

> +static int mt6370_chg_probe(struct platform_device *pdev)
> +{


Use return dev_err_probe(...); pattern.

> +probe_out:
> +       destroy_workqueue(priv->wq);
> +       mutex_destroy(&priv->attach_lock);

I don't see clearly the initialization of these in the ->probe().
Besides that, does destroy_workque() synchronize the actual queue(s)?

Mixing devm_ and non-devm_ may lead to a wrong release order that's
why it is better to see allocating and destroying resources in one
function (they may be wrapped, but should be both of them, seems like
you have done it only for the first parts).

> +       return ret;
> +}

...

> +static int mt6370_chg_remove(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv = platform_get_drvdata(pdev);
> +
> +       if (priv) {

Can you describe when this condition can be false?

> +               mt6370_chg_enable_irq(priv, "mivr", false);
> +               cancel_delayed_work_sync(&priv->mivr_dwork);
> +               destroy_workqueue(priv->wq);
> +               mutex_destroy(&priv->attach_lock);
> +       }
> +
> +       return 0;
> +}

...

> +static struct platform_driver mt6370_chg_driver = {
> +       .probe = mt6370_chg_probe,
> +       .remove = mt6370_chg_remove,
> +       .driver = {
> +               .name = "mt6370-charger",
> +               .of_match_table = of_match_ptr(mt6370_chg_of_match),

No good use of of_match_ptr(), please drop it.

> +       },
> +};

-- 
With Best Regards,
Andy Shevchenko

