Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE5EC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB3V+u7Q9YEV4g1kg7EbZ66mk5ndHbNPZ0M8bUvZ31c=; b=BcTTpuP03GMmZY2FA15dB5yOGv
	/Dr34/BC0UwzkObnXXKMwZZyw7hfmHyT7ZdU9IPDPwiMckiP1NlC/hS4LW66OfTF9jQHJhUf/w2zJ
	6/iLNgGlHMFEsmkObcY8AHrR4k+Kroa0rYEJC6TN1x6QLyfyta1hF0d9IuilKZifLY1jjxHiRmcUS
	Sx5v0itKvC9ekyYppapDqeSXnpziYxGXhvq6arRwMOnIdl2LoZb8ms2aTe5oiLfVjf+1vC/4U+gfY
	4GJnuDvFvlNWCUnj+rQt0XRmXhKHn8+ui3fa3rD57fb4ayqrnHmVE2loB8oIRSUJhWNQsRAPWiMYJ
	WXEhJHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFsMM-0060ux-Ij; Mon, 25 Jul 2022 07:18:34 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFsM9-0060ji-Ry; Mon, 25 Jul 2022 07:18:23 +0000
Received: by mail-qk1-x72f.google.com with SMTP id o21so7989160qkm.10;
        Mon, 25 Jul 2022 00:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qB3V+u7Q9YEV4g1kg7EbZ66mk5ndHbNPZ0M8bUvZ31c=;
        b=frxGvyzEIET2Q9oamPsAyfvyxiHFszbSm+YZf+q19HvyBYnjUOXE8i/JekhyOSh64P
         NuEvpSpUhDz/BhJiwSRd75Y6UtNbqf7NW+KfaF0dfs8Obhpw+vcJgNG57EKHOoII2jdQ
         HYyrOm0dGlLP0sPeZST5RWci8/jgvK3CFWZuh1lsxsh8hwlgCZuBNuXRjvhswOQQTEAB
         3rlJOEbvccVK2akIaqG/1XRBhbOdRjG1qPD4O0+PbLCNF7cH+iflKkB2kX7dr9OWm1I3
         mdCEW/de3IEZV/Eg1waqWcY8PkkcuDTuCCyPJY+jRIYLOHYdwckvkuD3kTHEqlylXRDS
         +QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qB3V+u7Q9YEV4g1kg7EbZ66mk5ndHbNPZ0M8bUvZ31c=;
        b=gklsnBOP+1pD5JEmDIVJ5S8DwZaY51iQJykn+ebqUhC69XYJWPuObqqOG4BBuz6Q28
         0OINu3QxQdW4Ndfl1/20InVOrvG6QNqXGoU/eUvY24YztSMPfTb9ZQn/t+5GCZSl4JDu
         ONpbXuQfEf1tXWZKHsQ+bhIhWXZI3KaQy4pPci/8gm7VOCH+dG/kJT9V9GR0bq2t/vY1
         bvQClTflOTQ77Zfdb0yG4KYXKoTXoPgxK3P95G4z8+ObTCydrA1KD7rph60+ttJ6RRt2
         SacniW2HFRYTQcSu/5uVElUTt7veSSDx6+d5Hci8h4i0VOrD1z7U/LVQL6k8Af56NW+n
         7aQA==
X-Gm-Message-State: AJIora8ISLHwZNXKvIGNUlTHze/K/+b9aIvFhkiNsH0c03y93O5nu4tN
	oxNFyw1FgETaHmdb+7469F7M+X02EHO3QUPzQXM=
X-Google-Smtp-Source: AGRyM1sQr7cmb1Qkot+at32rNTVJswRBvZY4pUgBSQNZDPiar1y7xPCOx+VU9hPTE62sYGu2Tpo3yBaHpFdE1K1jlX0=
X-Received: by 2002:a37:80c2:0:b0:6b5:e9e4:c4c1 with SMTP id
 b185-20020a3780c2000000b006b5e9e4c4c1mr7981575qkd.129.1658733499240; Mon, 25
 Jul 2022 00:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-9-peterwu.pub@gmail.com>
 <1f1a37daf6f3c19a2506f53689c8efbed2b716c3.camel@mediatek.com>
In-Reply-To: <1f1a37daf6f3c19a2506f53689c8efbed2b716c3.camel@mediatek.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 25 Jul 2022 15:17:43 +0800
Message-ID: <CABtFH5KwY_1EtXHHuiD8we-4RKvzQkueqTF_AQFEeDDv-66EYQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	ChiYuan Huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_001821_977403_22185DD5 
X-CRM114-Status: GOOD (  42.22  )
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

On Mon, Jul 25, 2022 at 3:06 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Fri, 2022-07-22 at 18:24 +0800, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual
> > Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> >
> > Add support for the Type-C & Power Delivery controller in
> > MediaTek MT6370 IC.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >
> > v6
> > - Convert tcpci as device resource managed with
> > 'devm_add_action_or_reset' API.
> > - Refine remvoe callback.
> > - Refine the commit text from 'This commit add' to 'Add'.
> > ---
> >  drivers/usb/typec/tcpm/Kconfig        |  11 ++
> >  drivers/usb/typec/tcpm/Makefile       |   1 +
> >  drivers/usb/typec/tcpm/tcpci_mt6370.c | 208
> > ++++++++++++++++++++++++++++++++++
> >  3 files changed, 220 insertions(+)
> >  create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c
> >
> > diff --git a/drivers/usb/typec/tcpm/Kconfig
> > b/drivers/usb/typec/tcpm/Kconfig
> > index 073fd2e..e6b88ca 100644
> > --- a/drivers/usb/typec/tcpm/Kconfig
> > +++ b/drivers/usb/typec/tcpm/Kconfig
> > @@ -35,6 +35,17 @@ config TYPEC_MT6360
> >         USB Type-C. It works with Type-C Port Controller Manager
> >         to provide USB PD and USB Type-C functionalities.
> >
> > +config TYPEC_TCPCI_MT6370
> > +     tristate "MediaTek MT6370 Type-C driver"
> > +     depends on MFD_MT6370
> > +     help
> > +       MediaTek MT6370 is a multi-functional IC that includes
> > +       USB Type-C. It works with Type-C Port Controller Manager
> > +       to provide USB PD and USB Type-C functionalities.
> > +
> > +       This driver can also be built as a module. The module
> > +       will be called "tcpci_mt6370".
> > +
> >  config TYPEC_TCPCI_MAXIM
> >       tristate "Maxim TCPCI based Type-C chip driver"
> >       help
> > diff --git a/drivers/usb/typec/tcpm/Makefile
> > b/drivers/usb/typec/tcpm/Makefile
> > index 7d499f3..906d9dc 100644
> > --- a/drivers/usb/typec/tcpm/Makefile
> > +++ b/drivers/usb/typec/tcpm/Makefile
> > @@ -6,4 +6,5 @@ typec_wcove-y                         := wcove.o
> >  obj-$(CONFIG_TYPEC_TCPCI)            += tcpci.o
> >  obj-$(CONFIG_TYPEC_RT1711H)          += tcpci_rt1711h.o
> >  obj-$(CONFIG_TYPEC_MT6360)           += tcpci_mt6360.o
> > +obj-$(CONFIG_TYPEC_TCPCI_MT6370)     += tcpci_mt6370.o
> >  obj-$(CONFIG_TYPEC_TCPCI_MAXIM)              += tcpci_maxim.o
> > diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> > b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> > new file mode 100644
> > index 0000000..4f53319
> > --- /dev/null
> > +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> > @@ -0,0 +1,208 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2022 Richtek Technology Corp.
> > + *
> > + * Author: ChiYuan Huang <cy_huang@richtek.com>
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_wakeup.h>
> > +#include <linux/pm_wakeirq.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/usb/tcpm.h>
> > +#include "tcpci.h"
> > +
> > +#define MT6370_REG_SYSCTRL8  0x9B
> > +
> > +#define MT6370_AUTOIDLE_MASK BIT(3)
> > +
> > +#define MT6370_VENDOR_ID     0x29CF
> > +#define MT6370_TCPC_DID_A    0x2170
> > +
> > +struct mt6370_priv {
> > +     struct device *dev;
> > +     struct regulator *vbus;
> > +     struct tcpci *tcpci;
> > +     struct tcpci_data tcpci_data;
> > +};
> > +
> > +static const struct reg_sequence mt6370_reg_init[] = {
> > +     REG_SEQ(0xA0, 0x1, 1000),
> > +     REG_SEQ(0x81, 0x38, 0),
> > +     REG_SEQ(0x82, 0x82, 0),
> > +     REG_SEQ(0xBA, 0xFC, 0),
> > +     REG_SEQ(0xBB, 0x50, 0),
> > +     REG_SEQ(0x9E, 0x8F, 0),
> > +     REG_SEQ(0xA1, 0x5, 0),
> > +     REG_SEQ(0xA2, 0x4, 0),
> > +     REG_SEQ(0xA3, 0x4A, 0),
> > +     REG_SEQ(0xA4, 0x01, 0),
> > +     REG_SEQ(0x95, 0x01, 0),
> > +     REG_SEQ(0x80, 0x71, 0),
> > +     REG_SEQ(0x9B, 0x3A, 1000),
> > +};
> > +
> > +static int mt6370_tcpc_init(struct tcpci *tcpci, struct tcpci_data
> > *data)
> > +{
> > +     u16 did;
> > +     int ret;
> > +
> > +     ret = regmap_register_patch(data->regmap, mt6370_reg_init,
> > +                                 ARRAY_SIZE(mt6370_reg_init));
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = regmap_raw_read(data->regmap, TCPC_BCD_DEV, &did,
> > sizeof(u16));
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (did == MT6370_TCPC_DID_A)
> > +             return regmap_write(data->regmap, TCPC_FAULT_CTRL,
> > 0x80);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mt6370_tcpc_set_vconn(struct tcpci *tcpci, struct
> > tcpci_data *data,
> > +                              bool enable)
> > +{
> > +     return regmap_update_bits(data->regmap, MT6370_REG_SYSCTRL8,
> > +                               MT6370_AUTOIDLE_MASK,
> > +                               !enable ? MT6370_AUTOIDLE_MASK : 0);
> > +}
> > +
> > +static int mt6370_tcpc_set_vbus(struct tcpci *tcpci, struct
> > tcpci_data *data,
> > +                             bool source, bool sink)
> @sink is not used in this function?

Hi Chunfeng,
The default HW binding is using the mt6370 switching charger.
Due to the switching charger design, 'src usb boost' and 'sink battery
charger', only one can be used at the same time.
Thanks.

>
> > +{
> > +     struct mt6370_priv *priv = container_of(data, struct
> > mt6370_priv,
> > +                                             tcpci_data);
> > +     int ret;
> > +
> > +     ret = regulator_is_enabled(priv->vbus);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (ret && !source)
> > +             return regulator_disable(priv->vbus);
> > +
> > +     if (!ret && source)
> > +             return regulator_enable(priv->vbus);
> > +
> > +     return 0;
> > +}
> > +
> > +static irqreturn_t mt6370_irq_handler(int irq, void *dev_id)
> > +{
> > +     struct mt6370_priv *priv = dev_id;
> > +
> > +     return tcpci_irq(priv->tcpci);
> > +}
> > +
> > +static int mt6370_check_vendor_info(struct mt6370_priv *priv)
> > +{
> > +     struct regmap *regmap = priv->tcpci_data.regmap;
> > +     u16 vid;
> > +     int ret;
> > +
> > +     ret = regmap_raw_read(regmap, TCPC_VENDOR_ID, &vid,
> > sizeof(u16));
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (vid != MT6370_VENDOR_ID)
> > +             return dev_err_probe(priv->dev, -ENODEV,
> > +                                  "Vendor ID not correct 0x%02x\n",
> > vid);
> > +
> > +     return 0;
> > +}
> > +
> > +static void mt6370_unregister_tcpci_port(void *tcpci)
> > +{
> > +     tcpci_unregister_port(tcpci);
> > +}
> > +
> > +static int mt6370_tcpc_probe(struct platform_device *pdev)
> > +{
> > +     struct mt6370_priv *priv;
> > +     struct device *dev = &pdev->dev;
> > +     int irq, ret;
> > +
> > +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->dev = dev;
> > +
> > +     priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
> > +     if (!priv->tcpci_data.regmap)
> > +             return dev_err_probe(dev, -ENODEV, "Failed to init
> > regmap\n");
> > +
> > +     ret = mt6370_check_vendor_info(priv);
> > +     if (ret)
> > +             return ret;
> > +
> > +     irq = platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return dev_err_probe(dev, irq, "Failed to get irq\n");
> > +
> > +     /* Assign TCPCI feature and ops */
> > +     priv->tcpci_data.auto_discharge_disconnect = 1;
> > +     priv->tcpci_data.init = mt6370_tcpc_init;
> > +     priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
> > +
> > +     priv->vbus = devm_regulator_get_optional(dev, "vbus");
> > +     if (!IS_ERR(priv->vbus))
> > +             priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
> > +
> > +     priv->tcpci = tcpci_register_port(dev, &priv->tcpci_data);
> > +     if (IS_ERR(priv->tcpci))
> > +             return dev_err_probe(dev, PTR_ERR(priv->tcpci),
> > +                                  "Failed to register tcpci
> > port\n");
> > +
> > +     ret = devm_add_action_or_reset(dev,
> > mt6370_unregister_tcpci_port,
> > +                                    priv->tcpci);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = devm_request_threaded_irq(dev, irq, NULL,
> > mt6370_irq_handler,
> > +                                     IRQF_ONESHOT, dev_name(dev),
> > priv);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to allocate
> > irq\n");
> > +
> > +     device_init_wakeup(dev, true);
> > +     dev_pm_set_wake_irq(dev, irq);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mt6370_tcpc_remove(struct platform_device *pdev)
> > +{
> > +     dev_pm_clear_wake_irq(&pdev->dev);
> > +     device_init_wakeup(&pdev->dev, false);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id mt6370_tcpc_devid_table[] = {
> > +     { .compatible = "mediatek,mt6370-tcpc" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, mt6370_tcpc_devid_table);
> > +
> > +static struct platform_driver mt6370_tcpc_driver = {
> > +     .driver = {
> > +             .name = "mt6370-tcpc",
> > +             .of_match_table = mt6370_tcpc_devid_table,
> > +     },
> > +     .probe = mt6370_tcpc_probe,
> > +     .remove = mt6370_tcpc_remove,
> > +};
> > +module_platform_driver(mt6370_tcpc_driver);
> > +
> > +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> > +MODULE_DESCRIPTION("MT6370 USB Type-C Port Controller Interface
> > Driver");
> > +MODULE_LICENSE("GPL v2");
>


-- 
Best Regards,
ChiaEn Wu

