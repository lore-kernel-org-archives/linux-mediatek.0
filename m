Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5553C10DCE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 02:25:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0DC208E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 02:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YpPnW1qE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iHJbBStr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0DC208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/kDdAw68Hh2hdEUhGogxZPnScOJG0aF3n3wmrUpNqg=; b=YpPnW1qEtWz35M
	/H7MuKRaY2ugK+v+WXu8dinEEfqSSrq6OJQp3vQ+XTQ8FRErDQAKsopuF+xnUhRrZiF67KCicVYMC
	9EHz7LMAxJRaD6oX0A70J6vnDi7hKRIo8l7eKuIVa7U2HHC/eNoAvrN+paUSKWfUbX5MsWWie3QpA
	Wb0IZz1e+7kqT5UFk39tmjQJULSr+Ga0ejs5p+QIWRBZkFOhRf95v7BkPHzq0B9cLvMFTJA/m8RBU
	fSGBeWN8y6I1gdHSySn6Z1Sy6u2UHQvqmQ01VOguudPklevejcvrwIfv5bKApxgjIQKx+efwCzW5Y
	4v+rvWEn/JBd3L6VMOtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBr3k-0002Fx-TH; Wed, 11 Mar 2020 02:25:24 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBr3d-00029d-9B
 for linux-mediatek@lists.infradead.org; Wed, 11 Mar 2020 02:25:19 +0000
Received: by mail-vs1-xe41.google.com with SMTP id n6so355987vsc.3
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2020 19:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6o9zvEt6IYrwE+ElnVDn48jnHKonftzRMbou+m4VFt4=;
 b=iHJbBStrT5lCa9wZXnmyeoPZDOfvkfGvFnrSpTnUNDpI8FHGkaSafTKOZRZv+o4uFD
 jxW1iNcwui6ka32A8R1FnFHB89096I16to1pL+OZScW0nm+K1MgkyN6OL1d1Kr2U6jOe
 KGkPOgmwUDwrPWOx4HIWvUDc4byDfuMvq2Vok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6o9zvEt6IYrwE+ElnVDn48jnHKonftzRMbou+m4VFt4=;
 b=hk/ITFE1/1O63mENoJt2fnQ/9voNj2FW25VpwHDuHYBGtcoZIVpoYgKp5X2WLuT1J7
 usByRdrbAEphgIjZP07HTESAajh6OqKNVpfEHJF0pRY6ay4hx+8bmfEg10ngMSPa2Vkx
 ylfBFAWGS9TjM+a45XSo//TGA84Z/Z7HL25yWu3A3bS3x6L7Z3PL86a5gqQItgA0wR/s
 9nW7IqrF6FKROOxn8h/p7DO4xzDFW1KOeU8Lo7/dIWFpMPKD8YuK+tNIDnQBybW3a/pc
 7AuDR8R2LnlCSMvrdmvFeLUJSHcO7eM3A04RZruuCGVi5zeXE2mbMHNrB04Q1FMIjsRZ
 MFwg==
X-Gm-Message-State: ANhLgQ26pvlBt5StmrI5qLP1onLwYkKNxsQUDT+T0J8BnH7E/xcnul8X
 o3jKoL/ax+gcMuy5ZTrIoLy71PJ0lvne3uO4p25Uew==
X-Google-Smtp-Source: ADFU+vtp5uLMl3WlytXh2yLahHytv4h0LV7sRnFZjXVDDtC6hDZ6kgnPVr90KVcnWc7bMzZnT4KXS33RQ5WJ6PjFIdU=
X-Received: by 2002:a67:fe05:: with SMTP id l5mr620139vsr.186.1583893515541;
 Tue, 10 Mar 2020 19:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <1582707225-26815-1-git-send-email-changqi.hu@mediatek.com>
In-Reply-To: <1582707225-26815-1-git-send-email-changqi.hu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 11 Mar 2020 10:25:04 +0800
Message-ID: <CANMq1KBE4kn-VamAMh71rLecy6VAE=66_4brTf811VrTcc4obg@mail.gmail.com>
Subject: Re: [PATCH v4] serial: 8250-mtk: modify mtk uart power and clock
 management
To: Changqi Hu <changqi.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_192518_006239_CE92AAE4 
X-CRM114-Status: GOOD (  20.79  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Claire Chang <tientzu@chromium.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2020 at 4:54 PM Changqi Hu <changqi.hu@mediatek.com> wrote:
>
> MTK uart design no need to control uart clock,
> so we just control bus clock in runtime function.
> Add uart clock used count to avoid repeatedly switching the clock.

This patch does a lot more than that:
 - Adds a busy loop in mtk8250_runtime_suspend
 - Changes how you do pm_runtime stuff.

These probably need to be split to different patches, and can you
please describe why you are making those changes in the commit
message?

> Signed-off-by: Changqi Hu <changqi.hu@mediatek.com>
> ---
>
> Changes in v4:
>  Modify commit-message
>
> Changes in v3:
>  Merge patch v1 and v2 together.
>
> Changes in v2:
>  Enable uart bus clock when probe and resume base on v1 patch,
>  but miss v1 patch itself.
>
>  drivers/tty/serial/8250/8250_mtk.c | 50 ++++++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index 4d067f5..f839380 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -32,6 +32,7 @@
>  #define MTK_UART_RXTRI_AD      0x14    /* RX Trigger address */
>  #define MTK_UART_FRACDIV_L     0x15    /* Fractional divider LSB address */
>  #define MTK_UART_FRACDIV_M     0x16    /* Fractional divider MSB address */
> +#define MTK_UART_DEBUG0        0x18
>  #define MTK_UART_IER_XOFFI     0x20    /* Enable XOFF character interrupt */
>  #define MTK_UART_IER_RTSI      0x40    /* Enable RTS Modem status interrupt */
>  #define MTK_UART_IER_CTSI      0x80    /* Enable CTS Modem status interrupt */
> @@ -388,9 +389,18 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
>  static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
>  {
>         struct mtk8250_data *data = dev_get_drvdata(dev);
> +       struct uart_8250_port *up = serial8250_get_port(data->line);
>
> -       clk_disable_unprepare(data->uart_clk);
> -       clk_disable_unprepare(data->bus_clk);
> +       /* wait until UART in idle status */
> +       while
> +               (serial_in(up, MTK_UART_DEBUG0));

No timeout?

> +
> +       if (data->clk_count == 0U) {
> +               dev_dbg(dev, "%s clock count is 0\n", __func__);
> +       } else {
> +               clk_disable_unprepare(data->bus_clk);
> +               data->clk_count--;
> +       }

The clock core already does reference counting for you, so I don't
think you need this.
https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L1004

>
>         return 0;
>  }
> @@ -400,16 +410,16 @@ static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
>         struct mtk8250_data *data = dev_get_drvdata(dev);
>         int err;
>
> -       err = clk_prepare_enable(data->uart_clk);
> -       if (err) {
> -               dev_warn(dev, "Can't enable clock\n");
> -               return err;
> -       }
> -
> -       err = clk_prepare_enable(data->bus_clk);
> -       if (err) {
> -               dev_warn(dev, "Can't enable bus clock\n");
> -               return err;
> +       if (data->clk_count > 0U) {
> +               dev_dbg(dev, "%s clock count is %d\n", __func__,
> +                       data->clk_count);
> +       } else {
> +               err = clk_prepare_enable(data->bus_clk);
> +               if (err) {
> +                       dev_warn(dev, "Can't enable bus clock\n");
> +                       return err;
> +               }
> +               data->clk_count++;
>         }
>
>         return 0;
> @@ -419,12 +429,14 @@ static void
>  mtk8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
>  {
>         if (!state)
> -               pm_runtime_get_sync(port->dev);
> +               if (!mtk8250_runtime_resume(port->dev))
> +                       pm_runtime_get_sync(port->dev);
>
>         serial8250_do_pm(port, state, old);
>
>         if (state)
> -               pm_runtime_put_sync_suspend(port->dev);
> +               if (!pm_runtime_put_sync_suspend(port->dev))
> +                       mtk8250_runtime_suspend(port->dev);
>  }
>
>  #ifdef CONFIG_SERIAL_8250_DMA
> @@ -501,6 +513,8 @@ static int mtk8250_probe(struct platform_device *pdev)
>         if (!data)
>                 return -ENOMEM;
>
> +       data->clk_count = 0;
> +
>         if (pdev->dev.of_node) {
>                 err = mtk8250_probe_of(pdev, &uart.port, data);
>                 if (err)
> @@ -533,6 +547,7 @@ static int mtk8250_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, data);
>
> +       pm_runtime_enable(&pdev->dev);
>         err = mtk8250_runtime_resume(&pdev->dev);
>         if (err)
>                 return err;
> @@ -541,9 +556,6 @@ static int mtk8250_probe(struct platform_device *pdev)
>         if (data->line < 0)
>                 return data->line;
>
> -       pm_runtime_set_active(&pdev->dev);
> -       pm_runtime_enable(&pdev->dev);
> -
>         data->rx_wakeup_irq = platform_get_irq_optional(pdev, 1);
>
>         return 0;
> @@ -556,11 +568,13 @@ static int mtk8250_remove(struct platform_device *pdev)
>         pm_runtime_get_sync(&pdev->dev);
>
>         serial8250_unregister_port(data->line);
> -       mtk8250_runtime_suspend(&pdev->dev);
>
>         pm_runtime_disable(&pdev->dev);
>         pm_runtime_put_noidle(&pdev->dev);
>
> +       if (!pm_runtime_status_suspended(&pdev->dev))
> +               mtk8250_runtime_suspend(&pdev->dev);
> +
>         return 0;
>  }
>
> --
> 2.6.4

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
