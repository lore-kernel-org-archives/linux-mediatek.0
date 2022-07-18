Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA4AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 08:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUvUySPFulLpJMe6eEU3YtP+k2lXPFdi238dz02/TnA=; b=iDkB8mAQ7IhLOIOWzOzoKTz1xa
	JqEGpGWEBFBJ7KAxrpQOtDtOZ9lwA09AtU7UibiZGuJr0Xtzz/B5NXtgMfGenbWphN6J+aUUFaVLR
	mkmuSIYez8k3PqBJkA50Q1yqkdv0xopz5mG0q/Al4q3xdaMSs8K72iVS/kxrAHldmR7Tz102ruu8P
	RnpM43LGZk9aSVg6NooiywIKpMInjLC/iN3O3e8rAJPAtuGtIMK6c3Ylo4Cb0LwK/XaIwZYk6Bs+j
	SJz3yoOsD/n5GyeLzuSF4zGpoeDry8wjUtcbBJAdRJa1HGsWMlNz4DJRRQmNlECYtmoldv3ODsUlk
	VDoK/QFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLoW-00Be1B-DG; Mon, 18 Jul 2022 08:09:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLoD-00Bdrj-3t; Mon, 18 Jul 2022 08:08:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id v21so8337340plo.0;
        Mon, 18 Jul 2022 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CUvUySPFulLpJMe6eEU3YtP+k2lXPFdi238dz02/TnA=;
        b=pHUAhFihwGq4x+L9IFz64byctPKxMey+1jJrxWMXoIp6tYfspwIQNIMzp7YBTH00xn
         MRzfhJj8RY4NA4mFvpX/dCVWMpW27h/Njmzv7MmAtFUvpbbul8t5EAe192JoL/OYQ6/s
         zYjE+CbBzxnhn/cgTyA0Bs/GtDn+R9lbkor0iXsp+EmPI2KlVUjcMQTUQrIikQ8NHDMp
         I2FQM1xubPFVtXGRB4dZts8UYYxW5QU7vg2DfZS27wC41UjIJhTXDckFd8tPgOzwbvc4
         1cKXpRAi5A/FWLrXPzcBSgixvnKv1XZEewB7e2CcmvZHXmuVo8UORFDuotPcS3/M7CCo
         WblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CUvUySPFulLpJMe6eEU3YtP+k2lXPFdi238dz02/TnA=;
        b=p/0+ZPrLja4IcOt2ae6ShgNaK5B3+gtSoIHWkFO7kc+GF4wxOZYh4tSbayld8m0q4O
         L9lOgzmMZTA8iAmbZh6TSr2fE/jywgCrjbWgtGTJKpKrstQujlYDg823sLZH6n6Jn/dc
         jxR7x2eK7b267I7xR5A4uP58PGzb9cvO8cdxtV9hBXjBoSNtwkrg55m8xnPoXww3Xyw9
         7Bk3/QrIztVtHBrl78j6R7Hs/1588uEqfTz3NKzH6NJ9yunybIKUsarJ5Axf4ztRWTNr
         xUJJ3e0Vq23UMB8XDchfTgp8a6SYyvAO2XvOQi58B5SUcXdaUsxMby/THgxi6GNpbJm6
         XCqg==
X-Gm-Message-State: AJIora/CW3YekVJN24oo5OzipY4suV3UxQh7WuNzHIgpqcOYhmJNjmSK
	v0/+/Z25aezDjScWSwm8PGE=
X-Google-Smtp-Source: AGRyM1vhEQ3YQzNXVMn83J82E/AUt4UjMd+K2amzhrVvPs1pmkb06EqRlQYBGCtIVLv6eW+mUn8kbQ==
X-Received: by 2002:a17:902:e888:b0:16c:33f7:89cb with SMTP id w8-20020a170902e88800b0016c33f789cbmr27448255plg.2.1658131729130;
        Mon, 18 Jul 2022 01:08:49 -0700 (PDT)
Received: from cyhuang-hp-elitebook-840-g3.rt ([2402:7500:587:e7ad:4982:5f13:5219:614d])
        by smtp.gmail.com with ESMTPSA id u9-20020a170903124900b0016cabb9d77dsm8895028plh.169.2022.07.18.01.08.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jul 2022 01:08:48 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:08:35 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
	Helge Deller <deller@gmx.de>, ChiaEn Wu <chiaen_wu@richtek.com>,
	Alice Chen <alice_chen@richtek.com>,
	cy_huang <cy_huang@richtek.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux LED Subsystem <linux-leds@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	linux-iio <linux-iio@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	szuni chen <szunichen@gmail.com>,
	ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH v5 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
Message-ID: <20220718080831.GA31509@cyhuang-hp-elitebook-840-g3.rt>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-9-peterwu.pub@gmail.com>
 <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_010853_186860_FDD3DEF5 
X-CRM114-Status: GOOD (  26.21  )
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

On Fri, Jul 15, 2022 at 03:10:42PM +0200, Andy Shevchenko wrote:
> On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> 
> > The MT6370 is a highly-integrated smart power management IC, which
> > includes a single cell Li-Ion/Li-Polymer switching battery charger,
> > a USB Type-C & Power Delivery (PD) controller, dual Flash LED current
> > sources, a RGB LED driver, a backlight WLED driver, a display bias
> > driver and a general LDO for portable devices.
> >
> > This commit add support for the Type-C & Power Delivery controller in
> 
> This commit add -> Add
> 
Upper case? Or rewrite it as 'This commit is to add .....'?
> 
> > MediaTek MT6370 IC.
> 
> 
> > +static int mt6370_tcpc_probe(struct platform_device *pdev)
> > +{
> > +       struct mt6370_priv *priv;
> > +       struct device *dev = &pdev->dev;
> > +       int ret;
> > +
> > +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       priv->dev = dev;
> > +       platform_set_drvdata(pdev, priv);
> > +
> > +       priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
> > +       if (!priv->tcpci_data.regmap)
> > +               return dev_err_probe(dev, -ENODEV, "Failed to init regmap\n");
> > +
> > +       ret = mt6370_check_vendor_info(priv);
> > +       if (ret)
> > +               return ret;
> > +
> > +       priv->irq = platform_get_irq(pdev, 0);
> > +       if (priv->irq < 0)
> > +               return priv->irq;
> > +
> > +       /* Assign TCPCI feature and ops */
> > +       priv->tcpci_data.auto_discharge_disconnect = 1;
> > +       priv->tcpci_data.init = mt6370_tcpc_init;
> > +       priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
> > +
> > +       priv->vbus = devm_regulator_get_optional(dev, "vbus");
> > +       if (!IS_ERR(priv->vbus))
> > +               priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
> > +
> > +       priv->tcpci = tcpci_register_port(dev, &priv->tcpci_data);
> > +       if (IS_ERR(priv->tcpci))
> > +               return dev_err_probe(dev, PTR_ERR(priv->tcpci),
> > +                                    "Failed to register tcpci port\n");
> > +
> > +       ret = devm_request_threaded_irq(dev, priv->irq, NULL,
> > +                                       mt6370_irq_handler, IRQF_ONESHOT,
> > +                                       dev_name(dev), priv);
> > +       if (ret) {
> 
> > +               tcpci_unregister_port(priv->tcpci);
> 
> This is wrong.
> You mixed devm_ with non-devm. Either drop devm_ *after* the first
> non-devm_ call, or convert everything to be managed.
> 
How about to add 'devm_add_action_or_reset' for tcpci_unregister_port?
This will convert all as 'devm_' version.
> > +               return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> > +       }
> > +
> > +       device_init_wakeup(dev, true);
> > +       dev_pm_set_wake_irq(dev, priv->irq);
> > +
> > +       return 0;
> > +}
> > +
> > +static int mt6370_tcpc_remove(struct platform_device *pdev)
> > +{
> > +       struct mt6370_priv *priv = platform_get_drvdata(pdev);
> 
> > +       disable_irq(priv->irq);
> 
> Why?
> An ugly workaround due to ordering issues in ->probe()?
>
Yes, due to the ordering in probe.
'bus remove' will be called before device resource releases.

Like as you said, another way is to convert all as non-devm
version after 'tcpci_unregister_port'.

If to keep the original order, 'disable_irq' before
'tcpci_unregister_port' can make the flow more safe.

Or you can think one case if irq triggers after
'tcpci_unregister_port'. Null pointer occurs.

Anyway, in next revision, I'll convert all to be 'devm_' version.
For this remove callback, only 'dev_pm_clear_wake_irq' and
'device_init_wakeup' will be kept.

Is this better?

> > +       tcpci_unregister_port(priv->tcpci);
> > +       dev_pm_clear_wake_irq(&pdev->dev);
> > +       device_init_wakeup(&pdev->dev, false);
> > +
> > +       return 0;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko

