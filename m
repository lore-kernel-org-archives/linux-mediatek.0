Return-Path: <SRS0=t7yo=3L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DECBC2D0DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 19:42:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0127624655
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 19:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n1Rbylg0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/LEOYSM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0127624655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1rSdh+0hUjXyvdcrlHE6+bsOUw3dL8J6NMFrcHf+DM=; b=n1Rbylg0KyifHn
	g3IKWDHOjmlFvWCgVr4MaQHqvw46wu+C/KQLHlVvvwcxFUH2rf/WcYq3C5t8WYTpAfsx4G0zNA3+v
	4QFSy6iYI00mGWRmXbV2mllAOapHqMh2SQ4RmRztcde6vmSdMgxVnNxNgFkMn0XCU4HKFO2zOYTgY
	VZdG95Q42kPwThKwblSMuIK9Y0nneeELVLbJISwlTuiwGIOvfB0UmGnOFd/2lr/3CcI20MX9Dvfi6
	us8d3j8rPXx4iLjzFxZOfso3ya8KVXIkgGjE1PerJEB85Jw6Wad6m14gqw0DMm1jw+TakZN5V6p9r
	IoQldFHyuHhVTNRKijwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuLtL-0007LV-Ji; Wed, 22 Jan 2020 19:42:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuLtJ-0007Ku-1H
 for linux-mediatek@lists.infradead.org; Wed, 22 Jan 2020 19:42:18 +0000
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97D3424655
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Jan 2020 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579722136;
 bh=vSh/LzY7wnIEE4bBX0Rl1f0hkSHm9NzERbFFttaLlF0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m/LEOYSMZJG6XnTa1OkWt0zaAl8D3V/InYAb4UZX61M2xpNZdX+vd3up9gQi793G1
 SJ2RIRK70mrh27gxHDJcagrodo0yn/pLkvGWjh7hfSJYrb37U2hu90NjJ0ZvAMzbqO
 A9/BRIhB3n0mnsi3T5nTlNsIWXdtyCpLqLLrTHaU=
Received: by mail-il1-f173.google.com with SMTP id v15so360583iln.0
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Jan 2020 11:42:16 -0800 (PST)
X-Gm-Message-State: APjAAAVBgD3SFP0Z5moFQpsNAaFpGNneJqOk8JPfv6Oo12IXdHNOjM8w
 AtBdo9C2vKpibzybjVQi1Evf5BTov+stiSilYdU=
X-Google-Smtp-Source: APXvYqxhuzafvvtzgJNqXMkCLYnRnNF77njy55bed5yYyNwQhldrW3dn8yjZaH7/VwoYxM6ACSzpvKs4J1MS7KiBu7Q=
X-Received: by 2002:a92:5e46:: with SMTP id s67mr7138225ilb.162.1579722135945; 
 Wed, 22 Jan 2020 11:42:15 -0800 (PST)
MIME-Version: 1.0
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
 <1579675994-7001-3-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1579675994-7001-3-git-send-email-light.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 22 Jan 2020 11:42:04 -0800
X-Gmail-Original-Message-ID: <CAGp9Lzqnscf+xySPEJ+FsPDEmcjbPNE0GfbMDPexqqfGwhH0WQ@mail.gmail.com>
Message-ID: <CAGp9Lzqnscf+xySPEJ+FsPDEmcjbPNE0GfbMDPexqqfGwhH0WQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] pinctrl: mediatek: Refine mtk_pinconf_get() and
 mtk_pinconf_set()
To: Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_114217_119274_39872DEC 
X-CRM114-Status: GOOD (  24.33  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 21, 2020 at 10:53 PM <light.hsieh@mediatek.com> wrote:
>
> From: Light Hsieh <light.hsieh@mediatek.com>
>
> 1.Refine mtk_pinconf_get():
>   Use only one occurrence of return at end of this function.
>
> 2.Refine mtk_pinconf_set():
> 2.1 Use only one occurrence of return at end of this function.
> 2.2 Modify case of PIN_CONFIG_INPUT_ENABLE -
> 2.2.1
>     Regard all non-zero setting value as enable, instead of always enable.
> 2.2.2
>     Remove check of ies_present flag and always invoke mtk_hw_set_value()
>     since mtk_hw_pin_field_lookup() invoked inside mtk_hw_set_value() has
>     the same effect of checking if ies control is supported.
>     [The rationale is that: available of a control is always checked
>      in mtk_hw_pin_field_lookup() and no need to add ies_present flag
>      specially for ies control.]
> 2.3 Simply code logic for case of PIN_CONFIG_INPUT_SCHMITT.
> 2.4 Add case for PIN_CONFIG_INPUT_SCHMITT_ENABLE and process it with the
>     same code for case of PIN_CONFIG_INPUT_SCHMITT.
>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c |   1 -
>  drivers/pinctrl/mediatek/pinctrl-mt8183.c |   1 -
>  drivers/pinctrl/mediatek/pinctrl-paris.c  | 171 ++++++++++++------------------
>  3 files changed, 65 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 1212264..7fae397 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -1070,7 +1070,6 @@
>         .ngrps = ARRAY_SIZE(mtk_pins_mt6765),
>         .eint_hw = &mt6765_eint_hw,
>         .gpio_m = 0,
> -       .ies_present = true,
>         .base_names = mt6765_pinctrl_register_base_names,
>         .nbase_names = ARRAY_SIZE(mt6765_pinctrl_register_base_names),
>         .bias_disable_set = mtk_pinconf_bias_disable_set,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> index 9a74d50..4eca818 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> @@ -554,7 +554,6 @@
>         .ngrps = ARRAY_SIZE(mtk_pins_mt8183),
>         .eint_hw = &mt8183_eint_hw,
>         .gpio_m = 0,
> -       .ies_present = true,
>         .base_names = mt8183_pinctrl_register_base_names,
>         .nbase_names = ARRAY_SIZE(mt8183_pinctrl_register_base_names),
>         .bias_disable_set = mtk_pinconf_bias_disable_set_rev1,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 3e13ae7..2f07500 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -81,37 +81,30 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>         int val, val2, err, reg, ret = 1;
>         const struct mtk_pin_desc *desc;
>
> -       if (pin >= hw->soc->npins)
> -               return -EINVAL;
> +       if (pin >= hw->soc->npins) {
> +               err = -EINVAL;
> +               goto out;
> +       }
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
>         switch (param) {
>         case PIN_CONFIG_BIAS_DISABLE:
> -               if (hw->soc->bias_disable_get) {
> +               if (hw->soc->bias_disable_get)
>                         err = hw->soc->bias_disable_get(hw, desc, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_UP:
> -               if (hw->soc->bias_get) {
> +               if (hw->soc->bias_get)
>                         err = hw->soc->bias_get(hw, desc, 1, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_DOWN:
> -               if (hw->soc->bias_get) {
> +               if (hw->soc->bias_get)
>                         err = hw->soc->bias_get(hw, desc, 0, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_SLEW_RATE:
>                 err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &val);
> @@ -126,12 +119,16 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>         case PIN_CONFIG_OUTPUT_ENABLE:
>                 err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &val);
>                 if (err)
> -                       return err;
> -
> -               /* HW takes input mode as zero; output mode as non-zero */
> -               if ((val && param == PIN_CONFIG_INPUT_ENABLE) ||
> -                   (!val && param == PIN_CONFIG_OUTPUT_ENABLE))
> -                       return -EINVAL;
> +                       goto out;
> +               /*     CONFIG     Current direction return value
> +                * -------------  ----------------- ----------------------
> +                * OUTPUT_ENABLE       output       1 (= HW value)
> +                *                     input        0 (= HW value)
> +                * INPUT_ENABLE        output       0 (= reverse HW value)
> +                *                     input        1 (= reverse HW value)
> +                */
> +               if (param == PIN_CONFIG_INPUT_ENABLE)
> +                       val = !val;
>
>                 break;
>         case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> @@ -148,13 +145,10 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>
>                 break;
>         case PIN_CONFIG_DRIVE_STRENGTH:
> -               if (hw->soc->drive_get) {
> +               if (hw->soc->drive_get)
>                         err = hw->soc->drive_get(hw, desc, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> +               else
>                         err = -ENOTSUPP;
> -               }
>                 break;
>         case MTK_PIN_CONFIG_TDSEL:
>         case MTK_PIN_CONFIG_RDSEL:
> @@ -175,28 +169,24 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>
>                         pullup = param == MTK_PIN_CONFIG_PU_ADV;
>                         err = hw->soc->adv_pull_get(hw, desc, pullup, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               } else
> +                       err = -ENOTSUPP;
>                 break;
>         case MTK_PIN_CONFIG_DRV_ADV:
> -               if (hw->soc->adv_drive_get) {
> +               if (hw->soc->adv_drive_get)
>                         err = hw->soc->adv_drive_get(hw, desc, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         default:
> -               return -ENOTSUPP;
> +               err = -ENOTSUPP;
>         }
>
> -       *config = pinconf_to_config_packed(param, ret);
> +out:
> +       if (!err)
> +               *config = pinconf_to_config_packed(param, ret);
>
> -       return 0;
> +       return err;
>  }
>
>  static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> @@ -216,60 +206,47 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>
>         switch ((u32)param) {
>         case PIN_CONFIG_BIAS_DISABLE:
> -               if (hw->soc->bias_disable_set) {
> +               if (hw->soc->bias_disable_set)
>                         err = hw->soc->bias_disable_set(hw, desc);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_UP:
> -               if (hw->soc->bias_set) {
> +               if (hw->soc->bias_set)
>                         err = hw->soc->bias_set(hw, desc, 1);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_DOWN:
> -               if (hw->soc->bias_set) {
> +               if (hw->soc->bias_set)
>                         err = hw->soc->bias_set(hw, desc, 0);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_OUTPUT_ENABLE:
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
>                                        MTK_DISABLE);
> -               if (err)
> +               /* Keep set direction to consider the case that a GPIO pin
> +                *  does not have SMT control
> +                */
> +               if (err != -ENOTSUPP)
>                         goto err;
>
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
>                                        MTK_OUTPUT);
> -               if (err)
> -                       goto err;
>                 break;
>         case PIN_CONFIG_INPUT_ENABLE:
> -               if (hw->soc->ies_present) {
> -                       mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES,
> -                                        MTK_ENABLE);
> -               }
> +               /* regard all non-zero value as enable */
> +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
> +               if (err)
> +                       goto err;
>
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
>                                        MTK_INPUT);
> -               if (err)
> -                       goto err;
>                 break;
>         case PIN_CONFIG_SLEW_RATE:
> -               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR,
> -                                      arg);
> -               if (err)
> -                       goto err;
> -
> +               /* regard all non-zero value as enable */
> +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR, !!arg);
>                 break;
>         case PIN_CONFIG_OUTPUT:
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> @@ -279,41 +256,29 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO,
>                                        arg);
> -               if (err)
> -                       goto err;
>                 break;
> +       case PIN_CONFIG_INPUT_SCHMITT:
>         case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
>                 /* arg = 1: Input mode & SMT enable ;
>                  * arg = 0: Output mode & SMT disable
>                  */
> -               arg = arg ? 2 : 1;
> -               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> -                                      arg & 1);
> +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, !arg);
>                 if (err)
>                         goto err;
>
> -               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
> -                                      !!(arg & 2));
> -               if (err)
> -                       goto err;
> +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, !!arg);
>                 break;
>         case PIN_CONFIG_DRIVE_STRENGTH:
> -               if (hw->soc->drive_set) {
> +               if (hw->soc->drive_set)
>                         err = hw->soc->drive_set(hw, desc, arg);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case MTK_PIN_CONFIG_TDSEL:
>         case MTK_PIN_CONFIG_RDSEL:
>                 reg = (param == MTK_PIN_CONFIG_TDSEL) ?
>                        PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RDSEL;
> -
>                 err = mtk_hw_set_value(hw, desc, reg, arg);
> -               if (err)
> -                       goto err;
>                 break;
>         case MTK_PIN_CONFIG_PU_ADV:
>         case MTK_PIN_CONFIG_PD_ADV:
> @@ -323,20 +288,14 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>                         pullup = param == MTK_PIN_CONFIG_PU_ADV;
>                         err = hw->soc->adv_pull_set(hw, desc, pullup,
>                                                     arg);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               } else
> +                       err = -ENOTSUPP;
>                 break;
>         case MTK_PIN_CONFIG_DRV_ADV:
> -               if (hw->soc->adv_drive_set) {
> +               if (hw->soc->adv_drive_set)
>                         err = hw->soc->adv_drive_set(hw, desc, arg);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         default:
>                 err = -ENOTSUPP;
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
