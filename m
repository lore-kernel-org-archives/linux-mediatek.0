Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587CCE674B1
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2024 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3scpQG8rDPy7dccdvb0ggPZwR6YQSFTzxlSNspAAiI=; b=X+PRtMo0ObsTpDIqqzOCGAJ8oU
	lckAGZigpKggG6pM4GyD02XoCT1CnvEq19J1c/wTQLeOmoZ0hAoPUazQblq3llrnEQftKbLs1QEZu
	FJfTBdDGcgM8JltCuk3w+Jm02ZHA3rMmMUrfKI5DIYo3Ch1CGBhgtbt8wdQ9WPCtI6rvVpY8ePEVa
	SQcvHOWzEHdBXOz2yw2aOF3PVz/rcATRXY5rJAlsMj8yYhjcvgtkNSoXCuOgCip2eU4sDXbwgnKQh
	2xeTxNhYAl/3nU1Zrt2ZH0FXq5nATeh8FU8aF9FjO31wlVqsCvthvtTUJNNuYwU1XpKCmDIxpOycG
	MMbkXzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mZO-00000006BsJ-1Ovr;
	Fri, 01 Nov 2024 07:59:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mUy-00000006BIX-0Nu4
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Nov 2024 07:55:14 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so2890301e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Nov 2024 00:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730447710; x=1731052510; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3scpQG8rDPy7dccdvb0ggPZwR6YQSFTzxlSNspAAiI=;
        b=DnEskZ/yB2A5jHvzJR5xlRHsS8spCyFl9qnwFbJGE4P6ElDCfoMrVX0kvUsPTE7B0Q
         5SZIbEcdCxe5uwwnlrKPFORn3+Y/C4CZ7z+R0KGuUwKitVXkwNPPPowjxqlzcbyOt09z
         lLdTe6z08AIp/nTwHqYm6CDMOPF/XX8mFzqW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730447710; x=1731052510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3scpQG8rDPy7dccdvb0ggPZwR6YQSFTzxlSNspAAiI=;
        b=qeU0KxFguNPfJe7t2MMbQVBxBsF1JnSjtbeMCzUj5Ffqra+VRk1scqN/DavH2eM8cp
         6HEu29fPtUWS9uw3Wjn4/fSm6sKp5hJPtMsaIxmNbCnFSml9YFWMbsV/EbfZrhS5kTDo
         XWfiCzDXaPxhwyJZ76/3WPqXMqrU5mjs1V0Npvyd6WyXom4kwf8kVlN0wn8RDG73jPQl
         EIUdh+T78BsqIqPxe2Ppf3CCPtnoQcShp/uhABqfGmeX1WayM8AJUgdjaaPl+L2LNisb
         krXk1qpCLFnoZwB8LSMLtmk773HRKJBwh5Tdn33wxEmS/Ag8bf9lcERRUzIokchqNefp
         JVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0i6I2998LUWWVqRncm6gsIlnHYhnmawqHdvFEcYRIWgsZmOem8uObbcYQw2Z5gGYfknvcXu7STasqAwnKaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBHzAx7Ik3rTGDcVp57I/iyC0R9lYplwM3eOv7aglscGBkdztM
	yPLP37MhPCUF4gzZ35Wzr0w+nQuDzzCMhpP2Y7rwe73/eJuZt7rflsRdgOiIad5lkKAbexI2Y81
	DNj22ukxtaL7WlA1CqJqEK8Jx/HRIwShY6yx6
X-Google-Smtp-Source: AGHT+IFHp5ntUs0OfBYXAIVSOME07Jq9csDSpjBoDIGPyzJBlFKUtiIHFZznKS39Z4EjVqTm/HlKSNuPkafVheMa5iY=
X-Received: by 2002:a05:6512:3e1a:b0:539:ff5a:7ea5 with SMTP id
 2adb3069b0e04-53b7ecdea88mr6015521e87.15.1730447710300; Fri, 01 Nov 2024
 00:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-3-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-3-040d748840bb@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Nov 2024 15:54:58 +0800
Message-ID: <CAGXv+5H9OTCn033yoi6oxxRKG1G=vbrBK+aw+ZWwGPWbn=uWuA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/5] pinctrl: mediatek: common: Expose more
 configurations to GPIO set_config
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_005512_168552_649D99AD 
X-CRM114-Status: GOOD (  23.70  )
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

On Sat, Oct 26, 2024 at 5:16=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Currently the set_config callback in the gpio_chip registered by the
> pinctrl-mtk-common driver only supports configuring a single parameter
> on specific pins (the input debounce of the EINT controller, on pins
> that support it), even though many other configurations are already
> implemented and available through the pinctrl API for configuration of
> pins by the Devicetree and other drivers.
>
> Expose all configurations currently implemented through the GPIO API so
> they can also be set from userspace, which is particularly useful to
> allow testing them from userspace.

Missing signed-off-by?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 48 ++++++++++++++++-----=
------
>  1 file changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinc=
trl/mediatek/pinctrl-mtk-common.c
> index 91edb539925a49b4302866b9ac36f580cc189fb5..7f9764b474c4e7d0d4c3d6e54=
2bdb7df0264daec 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -62,13 +62,12 @@ static unsigned int mtk_get_port(struct mtk_pinctrl *=
pctl, unsigned long pin)
>                         << pctl->devdata->port_shf;
>  }
>
> -static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> -                       struct pinctrl_gpio_range *range, unsigned offset=
,
> -                       bool input)
> +static int mtk_common_pin_set_direction(struct mtk_pinctrl *pctl,
> +                                       unsigned int offset,
> +                                       bool input)
>  {
>         unsigned int reg_addr;
>         unsigned int bit;
> -       struct mtk_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
>
>         reg_addr =3D mtk_get_port(pctl, offset) + pctl->devdata->dir_offs=
et;
>         bit =3D BIT(offset & pctl->devdata->mode_mask);
> @@ -86,6 +85,15 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_d=
ev *pctldev,
>         return 0;
>  }
>
> +static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> +                       struct pinctrl_gpio_range *range, unsigned int of=
fset,
> +                       bool input)
> +{
> +       struct mtk_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       return mtk_common_pin_set_direction(pctl, offset, input);
> +}
> +
>  static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int va=
lue)
>  {
>         unsigned int reg_addr;
> @@ -363,12 +371,11 @@ static int mtk_pconf_set_pull_select(struct mtk_pin=
ctrl *pctl,
>         return 0;
>  }
>
> -static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
> +static int mtk_pconf_parse_conf(struct mtk_pinctrl *pctl,
>                 unsigned int pin, enum pin_config_param param,
> -               enum pin_config_param arg)
> +               u32 arg)
>  {
>         int ret =3D 0;
> -       struct mtk_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
>
>         switch (param) {
>         case PIN_CONFIG_BIAS_DISABLE:
> @@ -381,15 +388,15 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev =
*pctldev,
>                 ret =3D mtk_pconf_set_pull_select(pctl, pin, true, false,=
 arg);
>                 break;
>         case PIN_CONFIG_INPUT_ENABLE:
> -               mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
> +               mtk_common_pin_set_direction(pctl, pin, true);
>                 ret =3D mtk_pconf_set_ies_smt(pctl, pin, arg, param);
>                 break;
>         case PIN_CONFIG_OUTPUT:
>                 mtk_gpio_set(pctl->chip, pin, arg);
> -               ret =3D mtk_pmx_gpio_set_direction(pctldev, NULL, pin, fa=
lse);
> +               ret =3D mtk_common_pin_set_direction(pctl, pin, false);
>                 break;
>         case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> -               mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
> +               mtk_common_pin_set_direction(pctl, pin, true);
>                 ret =3D mtk_pconf_set_ies_smt(pctl, pin, arg, param);
>                 break;
>         case PIN_CONFIG_DRIVE_STRENGTH:
> @@ -421,7 +428,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pc=
tldev, unsigned group,
>         int i, ret;
>
>         for (i =3D 0; i < num_configs; i++) {
> -               ret =3D mtk_pconf_parse_conf(pctldev, g->pin,
> +               ret =3D mtk_pconf_parse_conf(pctl, g->pin,
>                         pinconf_to_config_param(configs[i]),
>                         pinconf_to_config_argument(configs[i]));
>                 if (ret < 0)
> @@ -870,19 +877,20 @@ static int mtk_gpio_set_config(struct gpio_chip *ch=
ip, unsigned offset,
>         struct mtk_pinctrl *pctl =3D gpiochip_get_data(chip);
>         const struct mtk_desc_pin *pin;
>         unsigned long eint_n;
> -       u32 debounce;
> +       enum pin_config_param param =3D pinconf_to_config_param(config);
> +       u32 arg =3D pinconf_to_config_argument(config);
>
> -       if (pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUNC=
E)
> -               return -ENOTSUPP;
> +       if (param =3D=3D PIN_CONFIG_INPUT_DEBOUNCE) {
> +               pin =3D pctl->devdata->pins + offset;
> +               if (pin->eint.eintnum =3D=3D NO_EINT_SUPPORT)
> +                       return -EINVAL;
>
> -       pin =3D pctl->devdata->pins + offset;
> -       if (pin->eint.eintnum =3D=3D NO_EINT_SUPPORT)
> -               return -EINVAL;
> +               eint_n =3D pin->eint.eintnum;
>
> -       debounce =3D pinconf_to_config_argument(config);
> -       eint_n =3D pin->eint.eintnum;
> +               return mtk_eint_set_debounce(pctl->eint, eint_n, arg);
> +       }
>
> -       return mtk_eint_set_debounce(pctl->eint, eint_n, debounce);
> +       return mtk_pconf_parse_conf(pctl, offset, param, arg);
>  }
>
>  static const struct gpio_chip mtk_gpio_chip =3D {
>
> --
> 2.47.0
>
>

