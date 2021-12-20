Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B860BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqvSYGoSxhQnKZxOtxAJ3EQFRpzJsnjMHyTHATYnzIM=; b=plHrmbXJn94Ylc
	j9shffCVR7OrONdu8JLH6SbRTXLpeiwY7Pkkgq/y8EJwqvOj2Takp5rAkuSubylCThiRdIEfxy3rw
	kmUPvJh3SG6X4hIoHj1SvvdScOgQbIsBVeIi76MbR1ckG+jsNxZtetXxXSBfHakDY19gY4tqpLByW
	wTScJqq3YQ2ENPaFFRVH/RqgcZ7j9X0MyL/e9A8qHHe8l7khP3qEp4q9KQKqmefc5JyyP07/ByFNC
	w1sBsBLJ1OHXCPdZDYXgYzi1g3XnY55teRRiLNhiA/CR6V3xxt+DleKCTH67KHz3AF8LCki1ywa6y
	Bwd/eSJ8gE+eQbeGrOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzK2k-002wPq-B3; Mon, 20 Dec 2021 14:53:38 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzK2W-002wIe-ND
 for linux-mediatek@lists.infradead.org; Mon, 20 Dec 2021 14:53:26 +0000
Received: by mail-ed1-x535.google.com with SMTP id m21so12172018edc.0
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Dec 2021 06:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=osYow0Z4FtarWbqouNAiloIRjz33QJVN/wDnBHpJQAQ=;
 b=u+fWV4AwKoO5nd9qB8ZQzxBYaeIwky2uftlTpeiprAnb70JuhYQ0AGJZh7RnNpefjO
 6Auf7zTSbOJ5MqKZfRX3pV30zvpD74fOkCuRP+9MtoRPgM41/nt3h5e/r/9Hu+GbQo6o
 7OSv1zgjKVNk3gpWPhI42RA9n2iI+aqyUxIT5bzIBXzGz/c3FH0BBH6jGVOXShOzMv5M
 VKB1vYGK3/wp9s5cqx5luRkp6oPfmNlvslb8ZbNF0BeMmPcAm2uiy/XMDfNfQj3Ex19+
 U+Az5RiebfO+kucbZI0v+J9YnIa7zNxyCMeas5BYHSaGYRptWFMcVKhHtf2Wnazlx6kO
 oKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=osYow0Z4FtarWbqouNAiloIRjz33QJVN/wDnBHpJQAQ=;
 b=tUAc1uKDkAxvAqrvphlTUs3nvIU7oFECh+kmXANX06J+2FyaB7ymRBvNQmk4mSmi5I
 Ty6J6DIg7G0SLcEDVYdPs3dBgRP9xghJrnDXEL+YMIxQ8m+Bd5w/F47Phu9uyYPxcnFo
 Q7NWD847CGH5R5ojOmR48XmqQGDvQ9byKgGkIrpzhWkmgjyLIP5ryPPPAMwL0te2tm0W
 59Ibk4AAHO6zu6a4mAOpPodi14ytBW6i8W0Hc8FiLOKXK1kSuJPLqONFh/mTHMtLJAho
 mHvEM0B47DwdxwLUtQTM0PNcxwSupNla1E0C/WPQmxIs7ZAPJDuLeYqato6EuLE59UJ7
 Ldug==
X-Gm-Message-State: AOAM531wQ4HCLTVKmxut/BpVhFMpeeaUuf5CNxfDKO9JBdTAy57KwXLj
 3YrzvjO/H7Pgw3+4k7NveCaEP1JZch/4X+HtPOoJ8w==
X-Google-Smtp-Source: ABdhPJxRvigwrIgp8akaTrOk1HwmYqHU28i9Of/EY1zZ1YWSUhhMuMilQfeKVZiftSanmJ7IPRp3+gFTXn8As15Wr6A=
X-Received: by 2002:a05:6402:2813:: with SMTP id
 h19mr2339554ede.365.1640012002871; 
 Mon, 20 Dec 2021 06:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20211220132439.1194-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211220132439.1194-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 20 Dec 2021 15:53:12 +0100
Message-ID: <CAMRc=Md3bpCJe_eFBjiKuhCRO_xqnFxSc1sw100fgNmajy6gaw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused local OF node pointers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Marc Zyngier <maz@kernel.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 linux-unisoc@lists.infradead.org, 
 Gregory Fong <gregory.0xf0@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_065324_769434_423E5030 
X-CRM114-Status: GOOD (  20.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 20, 2021 at 2:24 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> After the commit 448cf90513d9 ("gpio: Get rid of duplicate of_node
> assignment in the drivers") the OF node local pointers become unused.
> Remove them for good and make compiler happy about.
>
> Fixes: 448cf90513d9 ("gpio: Get rid of duplicate of_node assignment in the drivers")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-brcmstb.c | 2 +-
>  drivers/gpio/gpio-gw-pld.c  | 1 -
>  drivers/gpio/gpio-mt7621.c  | 5 ++---
>  drivers/gpio/gpio-rda.c     | 1 -
>  4 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 176c264bb959..74ef89248867 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -704,7 +704,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>                 }
>
>                 gc->owner = THIS_MODULE;
> -               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", dev->of_node);
> +               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);

This is unrelated though. Can you make it a separate patch?

Bart

>                 if (!gc->label) {
>                         err = -ENOMEM;
>                         goto fail;
> diff --git a/drivers/gpio/gpio-gw-pld.c b/drivers/gpio/gpio-gw-pld.c
> index 77a3fbd46111..2109803ffb38 100644
> --- a/drivers/gpio/gpio-gw-pld.c
> +++ b/drivers/gpio/gpio-gw-pld.c
> @@ -71,7 +71,6 @@ static int gw_pld_probe(struct i2c_client *client,
>                         const struct i2c_device_id *id)
>  {
>         struct device *dev = &client->dev;
> -       struct device_node *np = dev->of_node;
>         struct gw_pld *gw;
>         int ret;
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index 52b49e7a0a80..ccaad1cb3c2e 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -205,8 +205,7 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
>  }
>
>  static int
> -mediatek_gpio_bank_probe(struct device *dev,
> -                        struct device_node *node, int bank)
> +mediatek_gpio_bank_probe(struct device *dev, int bank)
>  {
>         struct mtk *mtk = dev_get_drvdata(dev);
>         struct mtk_gc *rg;
> @@ -310,7 +309,7 @@ mediatek_gpio_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, mtk);
>
>         for (i = 0; i < MTK_BANK_CNT; i++) {
> -               ret = mediatek_gpio_bank_probe(dev, np, i);
> +               ret = mediatek_gpio_bank_probe(dev, i);
>                 if (ret)
>                         return ret;
>         }
> diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
> index 0d03f525dcd3..62ba18b3a602 100644
> --- a/drivers/gpio/gpio-rda.c
> +++ b/drivers/gpio/gpio-rda.c
> @@ -197,7 +197,6 @@ static void rda_gpio_irq_handler(struct irq_desc *desc)
>
>  static int rda_gpio_probe(struct platform_device *pdev)
>  {
> -       struct device_node *np = pdev->dev.of_node;
>         struct device *dev = &pdev->dev;
>         struct gpio_irq_chip *girq;
>         struct rda_gpio *rda_gpio;
> --
> 2.34.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
