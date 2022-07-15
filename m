Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F05C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LrkSO95PVy8bw27Iig3QT1GOG3G5eqBwe6wxhmR/uU=; b=eXFJxc8y14pliA+LzINDtWAawp
	JSVoAkLk7Crz1/UWeNPz2NQb7V5Z4OXhd1rfPy9RRojAfSm+q2jMsuAQxLttPd5W2Y3oe6Vt4+lH9
	56scqLJeiIs1E35CrIYgf8jPLZ5EjiETV4lzdmqBmqqEAO3BLtwHtzZUP3BGGCnuJLP3ikE6MHPT0
	yzUuTf+p67pK9F8egIvJLeiARMA8eSAObOg17M9ChOzn+J+edCj2dddzK1gLQN5gum4bX9FhD3Iou
	huqiKKQnqdSPqzm5MHcyFeMqoMtzjzr6okgzqWfU1xUJVCNhma/iPh0am9PWeCtBdoGiRmERmpzWV
	IRXP1dIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCL6R-007At8-UJ; Fri, 15 Jul 2022 13:11:31 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCL6F-007Aov-S3; Fri, 15 Jul 2022 13:11:21 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31c89653790so46079067b3.13;
        Fri, 15 Jul 2022 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+LrkSO95PVy8bw27Iig3QT1GOG3G5eqBwe6wxhmR/uU=;
        b=QWPiN1LWPmuijdMKT5AAJLiDd75nqTOhtxH5ERUnVqh8bmSoNBzZIgc24Y12QYZbiK
         ZZZ1bonJ6bNj4/7dxSkAiOrS74VCGiXGhWZIxtov9goqlOn5pRrD8dZwQ+LVOT0zjsij
         ZycSe0JZLJo499082g+stfHqVo3HUWmZ9oHqx7dbKQi8DMpwGjlvzsbhEjxZCPUX1VBE
         Uc1tcbJmyRqjXmP4pv/MISV2Q52lQXTzxZ5gH/ZSlXdpnNalR9OhXt02d2SnPVWsqiq1
         Uz2U49YRfc8nBIp8fjPbkLZZkI0e8nu+6vgIwXaucQUeg5o34WZ1leokFfUD1AZgptQc
         30zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+LrkSO95PVy8bw27Iig3QT1GOG3G5eqBwe6wxhmR/uU=;
        b=YhwluobBO9UzJrtN2sbLBLT7EhXoRNbkoRXAGy3drogd2dcK3XgKw0AEoLC1CdQSYP
         tnekvE28BJnB80paw6cAufAUCX4xvzFZ1PuDRYSDueARSw/+ejgnvOvCpcupRUR8fOOD
         WA4LGclgXyBShgHt+BGS9gbarv7Vlj6AB8v4NfUvtqz0VadKvh8EPX+SUhAW9XTgXv9K
         NewVRtBdXqrMURpM9jRQULmLBtYX5fZyP41OsXSECb6MUvpupFOlw7m6GCIYNT+UfuUj
         Zl7XpqzU83p5V15TqCgy5gEWYA8zBU2kCk9uNOm408+FjQeRM0mbATnkyT92F6dBNX86
         kZhA==
X-Gm-Message-State: AJIora9JPurN7hDyaaPQv/qBKmGLgyBIqcuEzx/SGkfqUwtbzEt6npj7
	ypzJC5Om5PHrMFyPRkT+3QvXRF2rcKVy/klMGmU=
X-Google-Smtp-Source: AGRyM1vwE3NLxsUuIe5Aj+Ad86KoIRk0zfg8IwPNre3toXOXDCYSWjHhTiLXCjbb3wl3KhuodPQdkjLVkGMg2Yk7hJQ=
X-Received: by 2002:a81:72c4:0:b0:31c:b309:c4e8 with SMTP id
 n187-20020a8172c4000000b0031cb309c4e8mr15864875ywc.520.1657890678612; Fri, 15
 Jul 2022 06:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com> <20220715112607.591-9-peterwu.pub@gmail.com>
In-Reply-To: <20220715112607.591-9-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Jul 2022 15:10:42 +0200
Message-ID: <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_061119_930136_5711BA9B 
X-CRM114-Status: GOOD (  20.09  )
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

On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> The MT6370 is a highly-integrated smart power management IC, which
> includes a single cell Li-Ion/Li-Polymer switching battery charger,
> a USB Type-C & Power Delivery (PD) controller, dual Flash LED current
> sources, a RGB LED driver, a backlight WLED driver, a display bias
> driver and a general LDO for portable devices.
>
> This commit add support for the Type-C & Power Delivery controller in

This commit add -> Add


> MediaTek MT6370 IC.


> +static int mt6370_tcpc_probe(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev = dev;
> +       platform_set_drvdata(pdev, priv);
> +
> +       priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
> +       if (!priv->tcpci_data.regmap)
> +               return dev_err_probe(dev, -ENODEV, "Failed to init regmap\n");
> +
> +       ret = mt6370_check_vendor_info(priv);
> +       if (ret)
> +               return ret;
> +
> +       priv->irq = platform_get_irq(pdev, 0);
> +       if (priv->irq < 0)
> +               return priv->irq;
> +
> +       /* Assign TCPCI feature and ops */
> +       priv->tcpci_data.auto_discharge_disconnect = 1;
> +       priv->tcpci_data.init = mt6370_tcpc_init;
> +       priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
> +
> +       priv->vbus = devm_regulator_get_optional(dev, "vbus");
> +       if (!IS_ERR(priv->vbus))
> +               priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
> +
> +       priv->tcpci = tcpci_register_port(dev, &priv->tcpci_data);
> +       if (IS_ERR(priv->tcpci))
> +               return dev_err_probe(dev, PTR_ERR(priv->tcpci),
> +                                    "Failed to register tcpci port\n");
> +
> +       ret = devm_request_threaded_irq(dev, priv->irq, NULL,
> +                                       mt6370_irq_handler, IRQF_ONESHOT,
> +                                       dev_name(dev), priv);
> +       if (ret) {

> +               tcpci_unregister_port(priv->tcpci);

This is wrong.
You mixed devm_ with non-devm. Either drop devm_ *after* the first
non-devm_ call, or convert everything to be managed.

> +               return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> +       }
> +
> +       device_init_wakeup(dev, true);
> +       dev_pm_set_wake_irq(dev, priv->irq);
> +
> +       return 0;
> +}
> +
> +static int mt6370_tcpc_remove(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv = platform_get_drvdata(pdev);

> +       disable_irq(priv->irq);

Why?
An ugly workaround due to ordering issues in ->probe()?

> +       tcpci_unregister_port(priv->tcpci);
> +       dev_pm_clear_wake_irq(&pdev->dev);
> +       device_init_wakeup(&pdev->dev, false);
> +
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko

