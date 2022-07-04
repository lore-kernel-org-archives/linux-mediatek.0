Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921D6C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 20:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/OYescpC12d20RwbBmj4WBQ3v7OC1u9RlDvkq13ckI=; b=y2xNzX5dZpmHmQTuGeaaJfecCO
	FIGRUUXcCGLqfpygPfn/kAGoQ/bglkdQgP04tHn+eCergQmgBBBnONq7Yazd80nf/Bq7C5JCXA+0C
	qm4d62IZoe14GhTghqbU9BCe2z5UPVVNgRpXpkCT/vALV6B7USOUhWltbHrhQrzD/n/30rRe42+K+
	ENqxitxviRqYu81QPmn3zmX9/AGCM9DEMFCq/Grl4WVjQsMPEE1f+6l8tGWQd1z3Mi6YrpLXtbl6a
	WIGDab4BA+jmGI+5eXCwnv28wQC0P17DGyaxp4y0gBgyjhLsr4WxDg0um9DmBRAVHz9hfz5Lvk+ON
	9YkRoqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8SYo-00CAKZ-Ox; Mon, 04 Jul 2022 20:20:46 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8SYd-00CAH8-4e; Mon, 04 Jul 2022 20:20:36 +0000
Received: by mail-yb1-xb34.google.com with SMTP id i7so18468535ybe.11;
        Mon, 04 Jul 2022 13:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6/OYescpC12d20RwbBmj4WBQ3v7OC1u9RlDvkq13ckI=;
        b=cegCCcDkUoo9P6FNcssziPe3wSPrKUvAGCjIOIIy9fhcj35RkgxKJl+LbBpnuq3wjU
         JtZm3oS9OqN+sojHrPwB50NIagpcab7QJIX1ILsQ1nJ3StpvjNnYljM49uisc2SiVCWu
         j+rtopNKTrfSTkSrCEj5pkG8bfUOxmoh6VMMD0Z3C7+zk3OYZ7p4bcaWrLSOEPhtwFjV
         ukHS++YJVwKW7lmRgBitYGThBKP4TMSFRMAMUNaen1amEPS1C+rGOUMq/TS5XsdgdxNa
         DPHYNnx/8ldISZwxJH+AJ4LPwa6A5JV5wzs0BLypkdYT38ysetCoOfRolw7meRpF0evK
         WYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6/OYescpC12d20RwbBmj4WBQ3v7OC1u9RlDvkq13ckI=;
        b=N8aHYR8soynAtgWsGekgvPSXALITfC+Hl1nR/sR8Zjw/eMYClbZs0P2TX695Z7re8T
         h0iXqJVnH13mFtK6X7bSBRolf07mzifu/mcjFuax5TcpAbNVT+sfHx338DaylbtOEiUa
         o1pYLH8I0cjFvWjnJLNnRbRbp93Bepl/K0wrLSjQzCCcR8VjJMJrwLJ4uhgK7AD7h2wn
         AP//nBeC5SKbIa7sAkRzScTypUdiLjf1TcBvakFH65h+GV47fHpOATcFVE4uk2U1Gm81
         cHZaN27Kx3w+kvSGVLXrYsS7FARsxLUN5T+ikveJXGcYOiQjP0YiDOACRxg0UJURqyef
         h1/Q==
X-Gm-Message-State: AJIora8Yrq956CkvoH+wasX/gYb+tbqlL/0b//OQ06JMCn6DmTMa6u17
	7OX6ApccJzMeTyyj1+Rd/STBvbe8VwYcKb55mo8=
X-Google-Smtp-Source: AGRyM1vGN87zp2vOQSkYPHdy4U3iFiPDyi3SOwkZWy9X2zeUnXbmXLO8oItZWKupT1Gp6nG69Gr+SrGEdJWU94cJNCE=
X-Received: by 2002:a5b:68a:0:b0:66e:472a:83f4 with SMTP id
 j10-20020a5b068a000000b0066e472a83f4mr8514627ybq.570.1656966032191; Mon, 04
 Jul 2022 13:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-9-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-9-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 22:19:55 +0200
Message-ID: <CAHp75VeNRVHr-LorfnWAkwfXzT+ix6S9sZ623OBA8+0Zi8Xucg@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] usb: typec: tcpci_mt6370: Add Mediatek MT6370
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
X-CRM114-CacheID: sfid-20220704_132035_223038_BD1C1D5C 
X-CRM114-Status: GOOD (  18.28  )
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

On Mon, Jul 4, 2022 at 7:42 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> Add chip level mt6370 tcpci driver.

...

> +static const struct reg_sequence mt6370_reg_init[] = {
> +       REG_SEQ(0xA0, 0x1, 1000),
> +       REG_SEQ(0x81, 0x38, 0),
> +       REG_SEQ(0x82, 0x82, 0),
> +       REG_SEQ(0xBA, 0xFC, 0),
> +       REG_SEQ(0xBB, 0x50, 0),
> +       REG_SEQ(0x9E, 0x8F, 0),
> +       REG_SEQ(0xA1, 0x5, 0),
> +       REG_SEQ(0xA2, 0x4, 0),
> +       REG_SEQ(0xA3, 0x4A, 0),
> +       REG_SEQ(0xA4, 0x01, 0),
> +       REG_SEQ(0x95, 0x01, 0),
> +       REG_SEQ(0x80, 0x71, 0),
> +       REG_SEQ(0x9B, 0x3A, 1000)

Keep a comma here in case something would be added later on.

> +};

...

> +       if (ret && !source)
> +               return regulator_disable(priv->vbus);
> +       else if (!ret && source)
> +               return regulator_enable(priv->vbus);
> +       else
> +               return 0;

'else' is redundant in both cases.

...

> +static int mt6370_check_vendor_info(struct mt6370_priv *priv)
> +{
> +       struct regmap *regmap = priv->tcpci_data.regmap;
> +       u16 vid;
> +       int ret;
> +
> +       ret = regmap_raw_read(regmap, TCPC_VENDOR_ID, &vid, sizeof(u16));
> +       if (ret)
> +               return ret;
> +
> +       if (vid != MT6370_VENDOR_ID) {
> +               dev_err(priv->dev, "Vendor ID not correct 0x%02x\n", vid);
> +               return -ENODEV;

return dev_err_probe(...);

> +       }
> +
> +       return 0;
> +}
> +
> +static int mt6370_tcpc_probe(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev = &pdev->dev;
> +       platform_set_drvdata(pdev, priv);
> +
> +       priv->tcpci_data.regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!priv->tcpci_data.regmap)

> +               return dev_err_probe(&pdev->dev, -ENODEV,
> +                                    "Failed to init regmap\n");

You may save some LoCs by introducing a temporary variable

  struct device *dev = &pdev->dev;

and here on a single line

  return dev_err_probe(dev, ...);

Ditto for the rest.

...

> +       ret = mt6370_check_vendor_info(priv);
> +       if (ret)

> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to check vendor info\n");

This duplicates (with less info given) the message from the callee.

...

> +       { .compatible = "mediatek,mt6370-tcpc", },

Inner comma is not needed.

-- 
With Best Regards,
Andy Shevchenko

