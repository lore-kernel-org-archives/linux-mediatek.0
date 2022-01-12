Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3LPkGv8vvxYG9IUs+r7p1fj5I284LEbztA0NrLmn09A=; b=RMkF/glYA+hvcu
	OXxjuqzvnaFhwrhNCk7Z16KsHq+BNEpSL9leBrwAY5PYaesAkgL6wmHA0atTGhL/fUceyyI5FQ5Z/
	EyMMBUBRLPHp3Je0u1V9jU3u6dcpiAv2cQ4Ti14FJlV3Qb3GGmTEik3YtNOP5eZ/cN1p79TL96XRD
	WZ5EbdERFUNmEHv3gVqfsDo/dmhg46u8e33OSiRwxSKX/gN2U/FTcnI/nb5C4JCUqVVSGkf8k4BFx
	sQL1aMdyxvCaYn0lo+aI0YMd4HbZx3Q7Y75v6DK7Qnc+Sx21IkBIF3rTogiTdGUENricHjLt/7WLZ
	6P7ZDpz2cLUXySwhpz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ZOC-001dRo-1O; Wed, 12 Jan 2022 08:53:52 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ZO5-001dN4-GE
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 08:53:47 +0000
Received: by mail-lf1-x132.google.com with SMTP id x7so5603893lfu.8
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Jan 2022 00:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QX44NtMzpgo+l2Ho0SHw53qmGi3kaH4gIg9bfUEaJf8=;
 b=GwrhxtFMs32fVtJhHB7d1TFxrETcq3mcE7NxamZu/6SOWSIdtZ4+Srz4LvEcSQmDB9
 LGFQ2vBPVGkMp3fk+4mJMplM1VhKxsHdEqD7JU4j3PciOrX6Zd64Jq9V2eEXn6NbELug
 K4bzHQ4527hYt4Ei4Xt8net4BaK/oZ4fiVvYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QX44NtMzpgo+l2Ho0SHw53qmGi3kaH4gIg9bfUEaJf8=;
 b=4Eu2tbi9L3LPst7PGknWhvFgO+PYDl9aLBdejdFQ0OPw979ua6emh+j4Jjbn98DGOS
 o8aGdn6X68pPtoU4ZgeEGc+ueGaHzAl2E1kNIucIm6m4UeDkJg2+dQlWvV1shwQC+hjD
 i+YBP/76ZMsY4QSOzOo2Ga4JOWGPLq+8sz8EDyxiK6EH7c5xhpOEXNsh36+UKvoFG/fE
 nHiPxoJOMem3sW5SJfCoxzjM4HIUi7YHstxwwlhbuPHvrZwNvP2fqj1ekCnsta9boocq
 ivTG2uIzg78WpBvHHV+uBrlhR+CumD5gUVWW3pTYBIQHNTmIjU1Yzwo/Onm7bbrgrCZX
 d9Zw==
X-Gm-Message-State: AOAM532GyfhnsBf/LuH/h7Q+xgn/QzBz8DDsjisU/xKOqBRIensz2v+t
 SiG451+7VJLEXCdYgn4dFj5ytakgEhlezYPuUMKEfA==
X-Google-Smtp-Source: ABdhPJxEbYrAx/hnpV9Nn6yck1TYbHCWYGr7VZUmUHpP5vookcO09X5JJ9gm0O/ez/CfSZpUBOe1UT3KZO6sItHHMFc=
X-Received: by 2002:a2e:7f1a:: with SMTP id a26mr5747639ljd.414.1641977622599; 
 Wed, 12 Jan 2022 00:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-8-wenst@chromium.org>
In-Reply-To: <20220111112244.1483783-8-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 12 Jan 2022 16:53:31 +0800
Message-ID: <CAGXv+5Gq0uH-eA799f1MRgzeUU9fsfi-Xz0XyW7ZJW==i_mcYg@mail.gmail.com>
Subject: Re: [PATCH 7/7] pinctrl: mediatek: paris: Support generic
 PIN_CONFIG_DRIVE_STRENGTH_UA
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_005345_602184_277FD097 
X-CRM114-Status: GOOD (  34.56  )
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

On Tue, Jan 11, 2022 at 7:23 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Some of the MediaTek chips that utilize the Paris pinctrl driver library
> support a lower drive strength (<= 1mA) than the standard drive strength
> settings (2~16 mA) on certain pins. This was previously supported by the
> custom MTK_PIN_CONFIG_DRV_ADV parameter along with the
> "mediatek,drive-strength-adv" device tree property.
>
> The drive strength values for this hardware are 125, 250, 500, and 1000 mA,
> and can be readily described by the existing "drive-strength-microamp",
> which then gets parsed by the generic pinconf library into the parameter
> PIN_CONFIG_DRIVE_STRENGTH_UA.

So I am actually unsure how to implement support for this properly.
My intention was to map "mediatek,drive-strength-adv" to
"drive-strength-microamp". This implies using the advanced mode if
the property is present, and vice versa.

(Also unsure if such a binding would be acceptable.)

However the pin configs are passed in one-by-one within the driver, so
it doesn't seem viable to check for the absence of a certain parameter.
This might involve a bit more rewriting.

ChenYu

> Add support for PIN_CONFIG_DRIVE_STRENGTH_UA while keeping the old
> custom parameter around for backward compatibility.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>
> The indentation in the switch/case blocks is getting somewhat out of
> control. I also have some cleanup changes to reverse the logic of the
> if/break statements. Not sure if it should be done before or after this
> patch though.
>
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 84 ++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 678c8aa33012..5a94903ae372 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -48,6 +48,53 @@ static const char * const mtk_gpio_functions[] = {
>         "func12", "func13", "func14", "func15",
>  };
>
> +/*
> + * This section supports converting to/from custom MTK_PIN_CONFIG_DRV_ADV
> + * and standard PIN_CONFIG_DRIVE_STRENGTH_UA pin configs.
> + *
> + * The custom value encodes three hardware bits as follows:
> + *
> + *   |           Bits           |
> + *   | 2 (E1) | 1 (E0) | 0 (EN) | drive strength (uA)
> + *   ------------------------------------------------
> + *   |    x   |    x   |    0   | disabled, use standard drive strength
> + *   -------------------------------------
> + *   |    0   |    0   |    1   |  125 uA
> + *   |    0   |    1   |    1   |  250 uA
> + *   |    1   |    0   |    1   |  500 uA
> + *   |    1   |    1   |    1   | 1000 uA
> + */
> +static const int mtk_drv_adv_uA[] = { 125, 250, 500, 1000 };
> +
> +static int mtk_drv_adv_to_uA(int val)
> +{
> +       /* This should never happen. */
> +       if (WARN_ON_ONCE(val < 0 || val > 7))
> +               return -EINVAL;
> +
> +       /* Bit 0 simply enables this hardware part */
> +       if (!(val & BIT(0)))
> +               return -EINVAL;
> +
> +       return mtk_drv_adv_uA[(val >> 1)];
> +}
> +
> +static int mtk_drv_uA_to_adv(int val)
> +{
> +       switch (val) {
> +       case 125:
> +               return 0x1;
> +       case 250:
> +               return 0x3;
> +       case 500:
> +               return 0x5;
> +       case 1000:
> +               return 0x7;
> +       }
> +
> +       return -EINVAL;
> +}
> +
>  static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
>                                           struct pinctrl_gpio_range *range,
>                                           unsigned int pin)
> @@ -151,11 +198,38 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>
>                 break;
>         case PIN_CONFIG_DRIVE_STRENGTH:
> +               if (hw->soc->adv_drive_get) {
> +                       err = hw->soc->adv_drive_get(hw, desc, &ret);
> +                       if (!err) {
> +                               err = mtk_drv_adv_to_uA(ret);
> +                               if (err > 0) {
> +                                       /* PIN_CONFIG_DRIVE_STRENGTH_UA used */
> +                                       err = -EINVAL;
> +                                       break;
> +                               }
> +                       }
> +               }
> +
>                 if (hw->soc->drive_get)
>                         err = hw->soc->drive_get(hw, desc, &ret);
>                 else
>                         err = -ENOTSUPP;
>                 break;
> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +               if (hw->soc->adv_drive_get) {
> +                       err = hw->soc->adv_drive_get(hw, desc, &ret);
> +                       if (err)
> +                               break;
> +                       err = mtk_drv_adv_to_uA(ret);
> +                       if (err < 0)
> +                               break;
> +
> +                       ret = err;
> +                       err = 0;
> +               } else {
> +                       err = -ENOTSUPP;
> +               }
> +               break;
>         case MTK_PIN_CONFIG_TDSEL:
>         case MTK_PIN_CONFIG_RDSEL:
>                 reg = (param == MTK_PIN_CONFIG_TDSEL) ?
> @@ -271,6 +345,16 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>                 else
>                         err = -ENOTSUPP;
>                 break;
> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +               if (hw->soc->adv_drive_set) {
> +                       err = mtk_drv_uA_to_adv(arg);
> +                       if (err < 0)
> +                               break;
> +                       err = hw->soc->adv_drive_set(hw, desc, err);
> +               } else {
> +                       err = -ENOTSUPP;
> +               }
> +               break;
>         case MTK_PIN_CONFIG_TDSEL:
>         case MTK_PIN_CONFIG_RDSEL:
>                 reg = (param == MTK_PIN_CONFIG_TDSEL) ?
> --
> 2.34.1.575.g55b058a8bb-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
