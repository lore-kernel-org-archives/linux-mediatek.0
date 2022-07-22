Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F51C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 11:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izkU4mah/un/nzuEYg+rATlJGvgsEy0VGKd9W+/pvrY=; b=Cv4u2RRbUefdxbzmbkKreqxnkC
	hqyK/qFp/4UQCaUpKWdIkZxUzeNMnIB3UQMen3Gzt2RzdZ9a3cm6lbHAQbV+AqaCGaglXVypOXnf3
	e2wKtjz6v1dtYUnH9giGKILiGv26PzqXt3Ft4l0vV0EGG9FPsRa3okkpF67SkHjYkequ7zZDXnngh
	OchXIMtAznpMs4Z7MNZs1Ntm5D1s5cE9FRQdG0eZ6Y+1NzN9r0hFxT4srgrP0ZBR2pZoNcdPBsrQV
	hRXdpeyASDUhUrOAw16lwi0naO2Zi0Y5lRif7TjeS6us+jturXTOovFKbwlGKWTmeCcc8QgEIjUrU
	KR2F5h1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEqjT-003Mxs-0w; Fri, 22 Jul 2022 11:22:11 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEqjG-003MlS-F0
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 11:21:59 +0000
Received: by mail-ej1-x62e.google.com with SMTP id sz17so8042117ejc.9
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Jul 2022 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=izkU4mah/un/nzuEYg+rATlJGvgsEy0VGKd9W+/pvrY=;
        b=ryb4OaJfzEr9ggTWevlpkTIaBHRTsw8tExgvOQ6QoWCvQyNiMGrKmWvVN5N6gIjbkS
         g5dMeWGkeIIya+vpts4sxscSIxHpkA6PjjG6JNw1WyA/vtsffh1pdMmuqE9ffGgDtB+K
         qZCB0+AfXG1OEtxDmWLeutPHdCBH+sVv5+uQs9OiHhGI7QcKyB+Fr592F7IykUFPabc5
         nfWHlazzSRSVbzWP4HKfs/9NylruAYw9iCY3V8RWweNE3zRh81u5E0qFhobWnlWmAz9X
         Ny3VsHPle/VJlnz0tJIAGJCQ0y3C3uraT09/r62C6ph/90nZeiYPd5OIGhRJIcgc+v9d
         iQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izkU4mah/un/nzuEYg+rATlJGvgsEy0VGKd9W+/pvrY=;
        b=AyVXCMxLrCeQ5he5vvPy5GO+fXKYyLs5VnufEGy2loYqIkDbLzzw+AUZ645pj9i+Z6
         tTjYULY62VeL1LWkaG6htyflEsqiq5EwlK5bdCRZ7p0c8u+olgpGUXCrRDPZeMrWWBtD
         /ASzNac64airrrpuft7F2Yc9f5CUXMaP5tV2D8HDwIdw1RoJKTD4Tk5wf84k40O7ohRF
         06jQW827Rex1nEKQ4RqWofWhsby1RZfWELst+Vjte1RsBAk2j9d/o82WkMK7wXbePMaE
         vjTKR4CGKxll2OR/VI/9ZVeG16FzouisgUdXKXCBpLOmQ2lViGqrqn2WurdN8EloBSJG
         SIqA==
X-Gm-Message-State: AJIora+ERNDwHrQFdWLcobbUWQEhazhXwKUOChoH2LrgAmLUIg9TRVGL
	MFeVIFUhk5FQd7GhwNj566BpFrD68+hfEYROGQMLZA==
X-Google-Smtp-Source: AGRyM1tH81A3xbL8H/MiYm3b4BfyGhy0gHIfa1xccj6sPyALKEykHh7hPIPYXSe/KSX9tjz8BmuonIyr6tZasgUnvdw=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr93992ejs.190.1658488914468; Fri, 22 Jul
 2022 04:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220623090445.1401-1-axe.yang@mediatek.com> <20220623090445.1401-4-axe.yang@mediatek.com>
In-Reply-To: <20220623090445.1401-4-axe.yang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Jul 2022 13:21:43 +0200
Message-ID: <CACRpkdZ5G2fMCqvkXANVEmZjNcF4U4mSDzZk6aXbqFjYVN3hcA@mail.gmail.com>
Subject: Re: [PATCH v13 3/3] mmc: mediatek: add support for SDIO eint wakup IRQ
To: Axe Yang <axe.yang@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, 
	Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, 
	Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Yong Mao <yong.mao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_042158_509954_4637F77D 
X-CRM114-Status: GOOD (  20.38  )
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

On Thu, Jun 23, 2022 at 11:10 AM Axe Yang <axe.yang@mediatek.com> wrote:

> MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> resume, switch GPIO function back to DAT1 mode then turn on clock.

So what I see is that you have what the electronics chip people call
an armed pad ring, such that an asynchronous event detector is connected
to the pin when it is in GPIO mode, and in this mode the system
can enter a lower sleep state (like powering off the MMC block
silicon...)

That seems fine, this is definitely how the chip people expected
it to work.

> +       if (mmc_card_enable_async_irq(mmc->card) && host->pins_eint) {
> +               if (enb) {
> +                       /*
> +                        * In dev_pm_set_dedicated_wake_irq_reverse(), eint pin will be set to
> +                        * GPIO mode. We need to restore it to SDIO DAT1 mode after that.
> +                        * Since the current pinstate is pins_uhs, to ensure pinctrl select take
> +                        * affect successfully, we change the pinstate to pins_eint firstly.
> +                        */
> +                       pinctrl_select_state(host->pinctrl, host->pins_eint);
> +                       ret = dev_pm_set_dedicated_wake_irq_reverse(host->dev, host->eint_irq);
> +
> +                       if (ret) {
> +                               dev_err(host->dev, "Failed to register SDIO wakeup irq!\n");
> +                               host->pins_eint = NULL;
> +                               pm_runtime_get_noresume(host->dev);
> +                       } else {
> +                               dev_dbg(host->dev, "SDIO eint irq: %d!\n", host->eint_irq);
> +                       }
> +
> +                       pinctrl_select_state(host->pinctrl, host->pins_uhs);
> +               } else {
> +                       dev_pm_clear_wake_irq(host->dev);
> +               }
> +       } else {
> +               if (enb) {
> +                       /* Ensure host->pins_eint is NULL */
> +                       host->pins_eint = NULL;
> +                       pm_runtime_get_noresume(host->dev);
> +               } else {
> +                       pm_runtime_put_noidle(host->dev);
> +               }
> +       }

This looks right.

> +       /* Support for SDIO eint irq ? */
> +       if ((mmc->pm_caps & MMC_PM_WAKE_SDIO_IRQ) && (mmc->pm_caps & MMC_PM_KEEP_POWER)) {
> +               host->eint_irq = platform_get_irq_byname(pdev, "sdio_wakeup");
> +               if (host->eint_irq > 0) {
> +                       host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");

I guess one of the other patches adds this to the DT binding?

With that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

