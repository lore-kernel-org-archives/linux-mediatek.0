Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231FBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3fEn7k6DEbC0BSZl5T1cKqr6t4t3jgvkJEo6o2VWJg=; b=2owVpEaI1fD/dwj6MWR3u0bTLe
	36KQDzvqedyMhyJhehPj6s5yyu3kyBbg1M3XR4kVQu1QjaUWfCFN6xIwTE/HlIRxNbn1FjRscN8Vh
	jLFfBlMhWsxhN8VEpJzhsvKCcMwi5sXiVyN2Vk8uAsEg5w0IDV9trx+tw/cULmq5xJqL/yRifNWoE
	wlMjNi8IypX3B9IEnjHSNqN6M/5nmpGRhkuBz4irw7XpgK9UZPIVXOQMKBe4vfSQeDI75qQJh1Qu6
	O542V5POGEPUarfJkpIh3S8f9HWRxiNzpeBapjA9IjDavhX/IpPFubP1k3ZtRHgelFYEXW32wWeV7
	lwrjLCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOY6-008wvB-Ly; Fri, 15 Jul 2022 16:52:18 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOXv-008wtC-Ra; Fri, 15 Jul 2022 16:52:09 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-31cf1adbf92so52659257b3.4;
        Fri, 15 Jul 2022 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y3fEn7k6DEbC0BSZl5T1cKqr6t4t3jgvkJEo6o2VWJg=;
        b=MXGzp2L91pEJL+AcTAycFNXQ1RlDsP6v+gpGIgwODuesPa+p9Vkg4kB7S9nocynJGw
         Z6eSLqvXs18KQxUaf2JoIzf80wNgEBx5lb8hmQls/pYl5cmqKU6ZV2U293CPRD7pHPxN
         oVoCyNl0NZggmwruE29B+fIK5bXDrw9tjgIG3C8Nq+6m6OWBSRplWoiH96JI+OT2GKU0
         e+tCPQwL8IYMCW95SAqKMM4ZmBlz4myO2waTWwKa21CY9s4W7s12O0mKU6NbZpFIBwjv
         WQndJpk7ul+2kIlNcx4SEPMyoKdY46YyQ2MP3qjPVvRdKZ8R3yH3WQfj2xLINnsHUnDO
         ZohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y3fEn7k6DEbC0BSZl5T1cKqr6t4t3jgvkJEo6o2VWJg=;
        b=okyHFHqcBMnw+IsttZFttM33goR3+NHYU+yjyK62O7BlA1g+vOyuqcao+oIuYWI3dU
         2sSqpxCn558F45jDkBb0Lzn1Oq0M91vXN7XzEyt+NH7RQUzUsc+x9r2HSDQEHQIflJRp
         egzww0/KABMqcEqc8u3y/ON3GCrB1G9bIh76GJwgJpr6CBJC30gqxF7i9ZdER9Q0oCIR
         i1On4V8K2rXjg6bTL/wMM7x7MwKtGygzDGIYqbNTbwRSZNJpa7g50NzXVoLgxWXr3mSv
         WZVoTzvA1KsSzdnKy6Co1dFI5tvp/DQT7XRGPd22027Q0CzaNc4EP9atukkR5TzaQVIQ
         l1Jg==
X-Gm-Message-State: AJIora+PMsV7fB3q5vPgL1IiZStflBMiwDEDdCHlmk4h2g7LtyJ0RxSG
	z4/XCvXa3r7xTmCC9BRTREi8pS3oH06oiMtov/w=
X-Google-Smtp-Source: AGRyM1sCY24F2pEPhG1uDrQQmbeNKcxn2P0g2UtmOwj7faRUDuEi5O71VSZCHL0+DLUg4GOwi/Ey7mykcBwsz36AuRU=
X-Received: by 2002:a81:54c1:0:b0:31d:ec18:fd5d with SMTP id
 i184-20020a8154c1000000b0031dec18fd5dmr7130568ywb.277.1657903923745; Fri, 15
 Jul 2022 09:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com> <20220715112607.591-11-peterwu.pub@gmail.com>
In-Reply-To: <20220715112607.591-11-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Jul 2022 18:51:27 +0200
Message-ID: <CAHp75Ve_WRAUyy=h9_F-tC1dDkb_=-F1uf7_h7R0p7xZgBAd-w@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] power: supply: mt6370: Add MediaTek MT6370
 charger driver
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
X-CRM114-CacheID: sfid-20220715_095207_953796_19AEA84B 
X-CRM114-Status: GOOD (  17.29  )
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

On Fri, Jul 15, 2022 at 1:29 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> This adds MediaTek MT6370 Charger driver support. The charger module
> of MT6370 supports High-Accuracy Voltage/Current Regulation,
> Average Input Current Regulation, Battery Temperature Sensing,
> Over-Temperature Protection, DPDM Detection for BC1.2.

...

> +static int mt6370_chg_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +       struct mt6370_priv *priv;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev = &pdev->dev;
> +
> +       priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!priv->regmap)
> +               return dev_err_probe(&pdev->dev, -ENODEV,
> +                                    "Failed to get regmap\n");
> +
> +       ret = mt6370_chg_init_rmap_fields(priv);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to init regmap fields\n");
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       priv->iio_adcs = devm_iio_channel_get_all(priv->dev);
> +       if (IS_ERR(priv->iio_adcs))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(priv->iio_adcs),
> +                                    "Failed to get iio adc\n");
> +
> +       ret = mt6370_chg_init_otg_regulator(priv);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to init otg regulator\n");
> +
> +       ret = mt6370_chg_init_psy(priv);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret, "Failed to init psy\n");
> +
> +       mutex_init(&priv->attach_lock);
> +       priv->attach = MT6370_ATTACH_STAT_DETACH;
> +
> +       priv->wq = create_singlethread_workqueue(dev_name(priv->dev));
> +       if (IS_ERR(priv->wq))

> +               return dev_err_probe(priv->dev, PTR_ERR(priv->wq),
> +                                    "Failed to create workqueue\n");

You need either wrap mutex to be deallocated by devm or don't use
dev_err_probe() here.

> +       INIT_WORK(&priv->bc12_work, mt6370_chg_bc12_work_func);
> +       INIT_DELAYED_WORK(&priv->mivr_dwork, mt6370_chg_mivr_dwork_func);
> +
> +       ret = mt6370_chg_init_setting(priv);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to init mt6370 charger setting\n");
> +               goto probe_out;
> +       }
> +
> +       ret = mt6370_chg_init_irq(priv);
> +       if (ret)
> +               goto probe_out;
> +
> +       mt6370_chg_pwr_rdy_check(priv);
> +
> +       return 0;
> +
> +probe_out:
> +       cancel_delayed_work_sync(&priv->mivr_dwork);
> +       flush_workqueue(priv->wq);
> +       destroy_workqueue(priv->wq);
> +       mutex_destroy(&priv->attach_lock);
> +
> +       return ret;
> +}
> +
> +static int mt6370_chg_remove(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv = platform_get_drvdata(pdev);
> +
> +       cancel_delayed_work_sync(&priv->mivr_dwork);
> +       flush_workqueue(priv->wq);
> +       destroy_workqueue(priv->wq);
> +       mutex_destroy(&priv->attach_lock);
> +
> +       return 0;
> +}


-- 
With Best Regards,
Andy Shevchenko

