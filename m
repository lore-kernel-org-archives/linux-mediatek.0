Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C1AC47DAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PYEUA5mJ1YHKP7Oh2k+8QM8qEV8euCh8GWXE3TNoB4=; b=hZ6AjjEXcqq3IKx4OLclrzd+He
	YNbir5oKcPQiSNFu/wkih8NUr/U/YRvgIyMaDoYum3PDiaPLi4rXgsTvfEr/NyIEuSUOtlfPOuaSs
	5TR0caXmJ6qfKSqxvr+1a8A0h+xJ+cZoD2xBRa5QxgBm5xvHLg2m73Tysu0Istrr73sJSxbqxEUF5
	0RYnskltzLnVvLLu0QfHdGQGUryrE58vRSnVLUc/QdBBKfC42yqr4F6+3+7s0TFuE/oracN3X1vxZ
	OxLmNyQl5hCnWJgL7g8udfD0wc+QNYpGJoXdiFvf9DWbHvWlghfBFH0n1YTBYxImKhmlzbf6z4F04
	bRusbRIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQnIN-005Gie-05;
	Fri, 19 Jan 2024 11:44:23 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQnIJ-005Ghj-1J
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jan 2024 11:44:20 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5ff790d41bdso4750797b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jan 2024 03:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705664657; x=1706269457; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7PYEUA5mJ1YHKP7Oh2k+8QM8qEV8euCh8GWXE3TNoB4=;
        b=qHUdaVfahIUS2W1oV5PsfltoQvGziAHy5DlkdHo2d3DrsVgme7yGn/QQ/1uSIhzcOp
         VY3Qs5nn+RbRCWwg+l9oPlCBuGSUiWorWclGk6jPN0Sj3loaroPnyut/QtVI3KDFW4Jn
         BtHr+1zkFXQA8rKXZnoQN9mOdB0g1wcBy5qG2cUDJti3fZBgFaY/CcwbYoWNWUGvBA0l
         TMlcVgvu3VYQk2q16zCBlS4+G9WP45VbDB3YlltR8Z4+m3FGulcn4FXPK3ZB3XryD7WW
         QRoF0dGKJnu6jMGZntAI1BBTrtgY8yr8K8v4PjkafyT3YwbNG3HgXFMdE6ydF3Ui/76j
         buzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664657; x=1706269457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PYEUA5mJ1YHKP7Oh2k+8QM8qEV8euCh8GWXE3TNoB4=;
        b=JAQZAvgn4Coh/EftOaK6x/oBvbjYkOkN661W3OOc31Znrp5bul8MzO8lLzMnrx8+77
         EFMXCig1YvK+Erehy8mUVqlD0m3S6QE0ZJi8HK5T1VbB1GuZjHRhYf7RSCiuJtKrEbZH
         vwPw1wEyW5vsbkkJwH+Gf2OD99sleN8WOP/tQrEcXbzMf25NQJmz1XT6ES3WJzNfzTp2
         XnYIYswZben2OKI3Xl6r5DdLkTXICgbBayUtXogrb2O76LUPWfgM8ElpysD3VICaHwD+
         CqdSbDOj06T276clohTxXWNF/yqHz9+W/ABqxzvg7j/bNln5t33GvpXo6T/ShBeQTNCS
         bEMQ==
X-Gm-Message-State: AOJu0YyMk/106eDnmgPs/Afy6PqSmAldEpBGKZndY2HlJxs0xVwb/wC5
	Y3iPgZw5asDyVIvZOrnr+Ih7T1jgv2JrxOlQX1IzH8Cj081AO4H4PXOE/UqYtTW6TSYLrP8euai
	swOaEXsiEtb1dJRfsU0f5cksRUZzZnky5WagcyQ==
X-Google-Smtp-Source: AGHT+IGqbqkbD6fW2EN1HO1MGH2/vvyUfQeHRTCzzVMdlXs43kYw3d6/IF14jXMxWRFgoIamJCPu3Y40u2FVCUSmQSY=
X-Received: by 2002:a81:720b:0:b0:5d7:a3f:fce3 with SMTP id
 n11-20020a81720b000000b005d70a3ffce3mr2262644ywc.8.1705664657042; Fri, 19 Jan
 2024 03:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20240119104550.140061-1-angelogioacchino.delregno@collabora.com> <20240119104550.140061-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240119104550.140061-3-angelogioacchino.delregno@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jan 2024 13:44:06 +0200
Message-ID: <CAA8EJprroFtKvCeZtP_FySr5d6v4dogYQKFQvzPJLpwWBuMrKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: mux: Add ITE IT5205 Alternate Mode
 Passive MUX driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com, 
	neil.armstrong@linaro.org, andersson@kernel.org, nathan@kernel.org, 
	luca.weiss@fairphone.com, tianping.fang@mediatek.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_034419_444738_59606016 
X-CRM114-Status: GOOD (  24.45  )
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

On Fri, 19 Jan 2024 at 12:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The ITE IT5202 is a USB Type-C Alternate Mode Passive MUX, used for
> muxing the SBU lines of a Type-C port with DisplayPort altmode and
> also providing an orientation switch.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/usb/typec/mux/Kconfig  |  10 ++
>  drivers/usb/typec/mux/Makefile |   1 +
>  drivers/usb/typec/mux/it5205.c | 292 +++++++++++++++++++++++++++++++++
>  3 files changed, 303 insertions(+)
>  create mode 100644 drivers/usb/typec/mux/it5205.c
>
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index d2cb5e733e57..399c7b0983df 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -36,6 +36,16 @@ config TYPEC_MUX_INTEL_PMC
>           control the USB role switch and also the multiplexer/demultiplexer
>           switches used with USB Type-C Alternate Modes.
>
> +config TYPEC_MUX_IT5205
> +       tristate "ITE IT5205 Type-C USB Alt Mode Passive MUX driver"
> +       depends on I2C
> +       select REGMAP_I2C
> +       help
> +         Driver for the ITE IT5205 Type-C USB Alternate Mode Passive MUX
> +         which provides support for muxing DisplayPort and sideband signals
> +         on a common USB Type-C connector.
> +         If compiled as a module, the module will be named it5205.
> +
>  config TYPEC_MUX_NB7VPQ904M
>         tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
>         depends on I2C
> diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
> index 57dc9ac6f8dc..bb96f30267af 100644
> --- a/drivers/usb/typec/mux/Makefile
> +++ b/drivers/usb/typec/mux/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_TYPEC_MUX_FSA4480)         += fsa4480.o
>  obj-$(CONFIG_TYPEC_MUX_GPIO_SBU)       += gpio-sbu-mux.o
>  obj-$(CONFIG_TYPEC_MUX_PI3USB30532)    += pi3usb30532.o
>  obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)      += intel_pmc_mux.o
> +obj-$(CONFIG_TYPEC_MUX_IT5205)         += it5205.o
>  obj-$(CONFIG_TYPEC_MUX_NB7VPQ904M)     += nb7vpq904m.o
>  obj-$(CONFIG_TYPEC_MUX_PTN36502)       += ptn36502.o
>  obj-$(CONFIG_TYPEC_MUX_WCD939X_USBSS)  += wcd939x-usbss.o
> diff --git a/drivers/usb/typec/mux/it5205.c b/drivers/usb/typec/mux/it5205.c
> new file mode 100644
> index 000000000000..99203b8a086d
> --- /dev/null
> +++ b/drivers/usb/typec/mux/it5205.c
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ITE IT5205 Type-C USB alternate mode passive mux
> + *
> + * Copyright (c) 2020 MediaTek Inc.
> + * Copyright (c) 2024 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + *
> + */
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mutex.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +#include <linux/usb/typec.h>
> +#include <linux/usb/typec_mux.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio.h>
> +#include <linux/usb/tcpm.h>

I'd say, it is a usual custom to sort this list.

[skipped]

> +
> +static int it5205_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +       struct it5205 *it = typec_mux_get_drvdata(mux);
> +       u8 val;
> +
> +       switch (state->mode) {
> +       case TYPEC_STATE_USB:
> +               val = IT5205_USB;
> +               break;
> +       case TYPEC_DP_STATE_C:
> +               fallthrough;
> +       case TYPEC_DP_STATE_E:
> +               val = IT5205_DP;
> +               break;
> +       case TYPEC_DP_STATE_D:
> +               val = IT5205_DP_USB;
> +               break;
> +       case TYPEC_STATE_SAFE:
> +               fallthrough;
> +       default:
> +               val = 0;
> +               break;
> +       }

Please add a check for state->altmode. All states at TYPEC_STATE_MODAL
and above (which includes TYPEC_DP_STATE_[CDE]) are only relevant with
connection to the particular typec->altmode SVID.

> +
> +       return regmap_update_bits(it->regmap, IT5205_REG_MUXCR,
> +                                 IT5205_DP_USB_CTRL_MASK, val);
> +}
> +
> +static irqreturn_t it5205_irq_handler(int irq, void *data)
> +{
> +       struct it5205 *it = data;
> +       int ret;
> +       u32 val;
> +
> +       ret = regmap_read(it->regmap, IT5205_REG_ISR, &val);
> +       if (ret)
> +               return IRQ_NONE;
> +
> +       if (val & IT5205_ISR_CSBU_OVP) {
> +               dev_warn(&it->client->dev, "Overvoltage detected!\n");

Will it cut the voltage automatically?

> +
> +               /* Reset CSBU */
> +               regmap_update_bits(it->regmap, IT5205_REG_CSBUSR,
> +                                  IT5205_CSBUSR_SWITCH, 0);
> +               regmap_update_bits(it->regmap, IT5205_REG_CSBUSR,
> +                                  IT5205_CSBUSR_SWITCH, IT5205_CSBUSR_SWITCH);
> +       }
> +
> +       return IRQ_HANDLED;
> +}

The rest LGTM


-- 
With best wishes
Dmitry

