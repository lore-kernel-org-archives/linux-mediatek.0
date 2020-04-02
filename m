Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A292C43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 21:33:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA29E2078B
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 21:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCc80rrF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="auTMkc/6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA29E2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAboMXOoAYL1dVImn8WQJVgSH8uD6d33cVW6HBMAvJ0=; b=RCc80rrF4+gP+i
	57r1Y9AiBqm1bklk3nxTI8Mj5r0IR1wZZYJ6CVtu3uYINqWrRdcyIk0PsdV5GiobGBq4tP1OSMZjf
	pPEdPTHLFGswzQrtywlic2QSRpcnOjj9GqHSyE2FAll8HBD0ubj5gDKTZY8+LhRySSe6hUoeywB03
	saF4tz/3NsrejcsiVqv0a24/eLm3sqs6ovXSgZDK2Ib6N34rfDpkXOb5VnQamTrHHe3ZeGl8h1WI0
	v5oLYhVtGDi/7f3uhvd/jI3rK6HFImIRRxekvDSN2ycyyrnHGI6JGVWB5IuIAYY1Oij9zZY6eMrjc
	Q1Bcpvo9VT+iMobRx99Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK7Sf-0003Wp-CZ; Thu, 02 Apr 2020 21:33:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK7Sc-0003WN-IT
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 21:33:15 +0000
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8080D2080C
 for <linux-mediatek@lists.infradead.org>; Thu,  2 Apr 2020 21:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585863193;
 bh=sEbEJDY3uNsFFQnIzWiH4TyvsZPJRza9p71kK+FQIQs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=auTMkc/6TL7cwsVXVtygaZtVE/9AzLt81Z/XNW07UPnrdMbVjTiL7U0M76RnFoOvX
 wzlk5B3vIBkru25w47rgFhHhba5hb5bfo3PFYA4NlbbpkxF3/XKI7wACPLPYTIeYzB
 nCf1vrK6BtDg4hGPROfuKSOBxnAeUFnPPqE/7NrE=
Received: by mail-io1-f47.google.com with SMTP id s15so5280215ioj.7
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2020 14:33:13 -0700 (PDT)
X-Gm-Message-State: AGi0Pua+qhlNiwA9uy3uczR+wI4zmYI1pRgnRHGwSIs+JblOTq0BjUSP
 s8MZ3j7aDzxlNyZ9fyjdxMTviggpEXT6BflBDro=
X-Google-Smtp-Source: APiQypLHI870DXnGi+SPCNcNnoFCTVHDyToeM11A/grJamJ4IqpuKrPjOk9kN49V1aXouUC4oxxy05Hry8/NW4pm25o=
X-Received: by 2002:a02:a785:: with SMTP id e5mr5232296jaj.97.1585863192871;
 Thu, 02 Apr 2020 14:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <1585128694-13881-1-git-send-email-hanks.chen@mediatek.com>
 <1585128694-13881-4-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1585128694-13881-4-git-send-email-hanks.chen@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 2 Apr 2020 14:33:01 -0700
X-Gmail-Original-Message-ID: <CAGp9LzpaC5opt9=BDUbR6tdr75F8cUxZc9nydJmNwoyq15x7hg@mail.gmail.com>
Message-ID: <CAGp9LzpaC5opt9=BDUbR6tdr75F8cUxZc9nydJmNwoyq15x7hg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_143314_653921_8B19DE82 
X-CRM114-Status: GOOD (  19.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hanks,

On Wed, Mar 25, 2020 at 2:31 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> for virtual gpios, they should not do reg setting and
> should behave as expected for eint function.
>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |   28 ++++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |    1 +
>  drivers/pinctrl/mediatek/pinctrl-paris.c         |    7 ++++++
>  3 files changed, 36 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 20e1c89..087d233 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -226,6 +226,31 @@ static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
>         return EINT_NA;
>  }
>
> +/*
> + * Virtual GPIO only used inside SOC and not being exported to outside SOC.
> + * Some modules use virtual GPIO as eint (e.g. pmif or usb).
> + * In MTK platform, external interrupt (EINT) and GPIO is 1-1 mapping
> + * and we can set GPIO as eint.
> + * But some modules use specific eint which doesn't have real GPIO pin.
> + * So we use virtual GPIO to map it.
> + */
> +
> +bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
> +{
> +       const struct mtk_pin_desc *desc;
> +       bool virt_gpio = false;
> +
> +       if (gpio_n >= hw->soc->npins)
> +               return virt_gpio;

gpio_n should always be less than hw-> soc-> npins, right? If so, we
can delete the condition from here.

> +
> +       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
> +
> +       if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
> +               virt_gpio = true;
> +
> +       return virt_gpio;
> +}
> +
>  static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
>                              unsigned int *gpio_n,
>                              struct gpio_chip **gpio_chip)
> @@ -278,6 +303,9 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
>         if (err)
>                 return err;
>
> +       if (mtk_is_virt_gpio(hw, gpio_n))
> +               return 0;
> +
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
>
>         err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 1b7da42..cda1c7a0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -299,4 +299,5 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
>  int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc, u32 *val);
>
> +bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n);
>  #endif /* __PINCTRL_MTK_COMMON_V2_H */
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 923264d..7fba76d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -693,6 +693,13 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>         const struct mtk_pin_desc *desc;
>         int value, err;
>
> +       /*
> +        * "Virtual" GPIOs are always and only used for interrupts
> +        * Since they are only used for interrupts, they are always inputs
> +        */
> +       if (mtk_is_virt_gpio(hw, gpio))
> +               return 1;
> +
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
>         err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &value);
> --
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
