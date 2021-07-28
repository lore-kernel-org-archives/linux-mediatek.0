Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36690C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 18:27:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED61E6101B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 18:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED61E6101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aggiPX9QCVZa0LQlLcPUK8Gs/zBUxAruUUjoGL8luyc=; b=uSHtc9m7sGgF3O
	f5ujZBK1zAjiPNRrnTLiXzgKhSqv2k5ZmCHfiY5Jm6c9PCtdYNR3sywucdSWnkCWIUJhk1GOvoKCX
	a6J8Vz999htACFk3TFtJhA4Z4hF57ZF29dTzYujNxkK3Y3KvQcNUeTDJAc5rWYD2XDFKcsjnnW0fB
	3bNJXddSBdHcf5W1PDWBZv4+/M1xmO+3JlVwdhkn3BLlT1qfSmrajZxf0bZ73VZEUpaFWaMgmisS1
	KdAw7l4W4nbqq4g4Kqjy27xtmQF+8GI6kA2myg2sQ9zCJzstQW3ofyf4RPRIGRHQ63rcCW3rYXxhD
	ff4bsx+ECULdWyR8jXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8oH9-0024ny-TM; Wed, 28 Jul 2021 18:27:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8oGv-0024mM-Om; Wed, 28 Jul 2021 18:27:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A1D061057;
 Wed, 28 Jul 2021 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627496832;
 bh=P7Nj61y10RxwtvDu8NSjNYumxT5Mu8ftk2gukjRAMpA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RtvVFUSN/PJopXn29kQL/ZCodQf6lPdbtlAQq5eOGXaHdYKTnAw7NQ3p2Kr8a3Nsq
 dFmVCUzbkdM1L9ol22nRp2rCSZqfBTCHUQoaOKnxm1eNFK4kW5j5u8ZI+W0wUX6EQo
 Zfy0zlnpbyhOudkVAQUMyGKUiIsNoDwxvSRt8tqm+m8Yv/CnZyfy7f5ohApS3yLIEJ
 H9ygJBb+kkk0am2jUnepTR4/GgSDOrbwKmKhT10hXpmR4zHXSyZYzi3ewvb1iAyOsi
 sB+PEX6ygpjA9pRwfqDVl1LLFj0ERle87t06SNXPw2pGhjTtedzf6Lr12gYEXcjFbJ
 B2QTzZ53/1/xw==
Received: by mail-ej1-f45.google.com with SMTP id nb11so6133354ejc.4;
 Wed, 28 Jul 2021 11:27:12 -0700 (PDT)
X-Gm-Message-State: AOAM533HSzPX8s7ovLJ/HWW7GUJCm6Dg/sPaz5uhCK50xLSvyQ1VZ6wR
 ewBjiHtwvhxt+WSb93ShK3ZuD1JJyejFbkV+IZg=
X-Google-Smtp-Source: ABdhPJwMW5TrgITkkwrO7xV+n72DQlxYsctwNVZtDNp+QCHzDRSCcI4DekRwXzXmKxU51+nQz47w8VSo+rzFf/tPNpE=
X-Received: by 2002:a17:906:c7c2:: with SMTP id
 dc2mr788351ejb.472.1627496831060; 
 Wed, 28 Jul 2021 11:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-5-sam.shih@mediatek.com>
In-Reply-To: <20210726071439.14248-5-sam.shih@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 28 Jul 2021 11:26:59 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqhseLhM=6aMxUJ2-YuU9sVk-u4gT=kem-o9RwXOAUwxA@mail.gmail.com>
Message-ID: <CAGp9LzqhseLhM=6aMxUJ2-YuU9sVk-u4gT=kem-o9RwXOAUwxA@mail.gmail.com>
Subject: Re: [PATCH 04/12] pinctrl: mediatek: moore: use pin number in
 mtk_pin_desc instead of array index
To: Sam Shih <sam.shih@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-crypto@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-clk <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
 Ryder Lee <Ryder.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_112713_897204_572E64B4 
X-CRM114-Status: GOOD (  27.17  )
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

 Hi Sam,

On Mon, Jul 26, 2021 at 12:17 AM Sam Shih <sam.shih@mediatek.com> wrote:
>
> Certain SoC are missing the middle part gpios in consecutive pins,
> it's better to use pin number in mtk_pin_desc instead of array index
> for the extensibility

Now the driver pin number has to be consistent with the array index
because the driver would use pin number as the array index to fetch
the pin descriptor.

For those missing GPIOs, we could just fill out .name in struct
mtk_pin_desc as NULL to indicate the pin is unavailable for users (pin
not ballout) on the certain SoC and then allow us to reuse all of the
pinctrl operations with minimal modification.

>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c | 61 ++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
> index 3a4a23c40a71..16206254ec3d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -35,6 +35,19 @@ static const struct pin_config_item mtk_conf_items[] = {
>  };
>  #endif
>
> +static int mtk_pin_desc_lookup(struct mtk_pinctrl *hw, int pin)
> +{
> +       int idx;
> +
> +       for (idx = 0 ; idx < hw->soc->npins ; idx++)
> +               if (hw->soc->pins[idx].number == pin)
> +                       break;
> +       if (idx < hw->soc->npins)
> +               return idx;
> +
> +       return -EINVAL;
> +}
> +
>  static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
>                               unsigned int selector, unsigned int group)
>  {
> @@ -74,6 +87,13 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
>  {
>         struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
>         const struct mtk_pin_desc *desc;
> +       int err;
> +
> +       err = mtk_pin_desc_lookup(hw, pin);
> +       if (err >= 0)
> +               pin = err;
> +       else
> +               return err;
>

We can drop it and use the following snippet instead

desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];

/* !desc->name to show the pin is not ballout */
if (!desc->name)
         return -ENOTSUPP;

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
> @@ -87,6 +107,13 @@ static int mtk_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
>  {
>         struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
>         const struct mtk_pin_desc *desc;
> +       int err;
> +
> +       err = mtk_pin_desc_lookup(hw, pin);
> +       if (err >= 0)
> +               pin = err;
> +       else
> +               return err;
>

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
> @@ -102,6 +129,12 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>         int val, val2, err, reg, ret = 1;
>         const struct mtk_pin_desc *desc;
>
> +       err = mtk_pin_desc_lookup(hw, pin);
> +       if (err >= 0)
> +               pin = err;
> +       else
> +               return err;
> +

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
>         switch (param) {
> @@ -217,6 +250,12 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>         u32 reg, param, arg;
>         int cfg, err = 0;
>
> +       err = mtk_pin_desc_lookup(hw, pin);
> +       if (err >= 0)
> +               pin = err;
> +       else
> +               return err;
> +

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
>         for (cfg = 0; cfg < num_configs; cfg++) {
> @@ -434,6 +473,12 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>         const struct mtk_pin_desc *desc;
>         int value, err;
>
> +       err = mtk_pin_desc_lookup(hw, gpio);
> +       if (err >= 0)
> +               gpio = err;
> +       else
> +               return err;
> +

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
>         err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
> @@ -447,6 +492,15 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>  {
>         struct mtk_pinctrl *hw = gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
> +       int err;
> +
> +       err = mtk_pin_desc_lookup(hw, gpio);
> +       if (err >= 0) {
> +               gpio = err;
> +       } else {
> +               dev_err(hw->dev, "Failed to set gpio %d\n", gpio);
> +               return;
> +       }
>

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
> @@ -488,6 +542,13 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
>         struct mtk_pinctrl *hw = gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
>         u32 debounce;
> +       int err;
> +
> +       err = mtk_pin_desc_lookup(hw, offset);
> +       if (err >= 0)
> +               offset = err;
> +       else
> +               return err;
>

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
>
> --
> 2.29.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
