Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B04DC7EE2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmF0HRjkj/ixrMO32qTd6MR/LIHFeaXxncI6n5YLT8o=; b=SMaskcLhQz0WCLQiYsVjZPT4IU
	WlwGSEjI7Dvm3HD+XfkimA+WgJq4t2ECcjG0rHHDkpLikBbFsvp+NWeVfw+KG+FcULFqe3vxL8cZf
	rUzF4ihhn2bGQGtx8DHT75/kvF5t1MOAoOGO7JWWU5jcmUyf+5MuLHrfDKZYMiYVwNWTwQh85El9t
	0idBSeVtOZTlRI02LndMInaivpk3UmDhw2PErbt7Q/p7YU8qbknF84M1Q1CeBRWQxQTxu8uHV6Q10
	dy8zTS9kxTpq5VNeeYVS41V1k3rUOD2Yo39YPtGErbxIXBPqDsDrXd9IIW4xGbvgnfviQ3AhSsKJu
	7G2G+A2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TY8-0017cn-1f;
	Tue, 06 Jun 2023 10:04:24 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TY5-0017bJ-0q
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 10:04:23 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-78a0c37428cso941392241.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 03:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686045859; x=1688637859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmF0HRjkj/ixrMO32qTd6MR/LIHFeaXxncI6n5YLT8o=;
        b=R0fD8KNGQlFcsBAkbsGeTcSPZRQ75sePEgaumFIgths5NRJvW3jCgtmyqkNU1aghs5
         vidRpIa51YvKmrncUU6XGGs7Y1HUnXtcRSF5RwZycjo4LkjKkEFi+eOgM2q5JwSId4ww
         1lytQ1wJ0uZZBCVY5EKezct51s5fyHSywbM30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686045859; x=1688637859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmF0HRjkj/ixrMO32qTd6MR/LIHFeaXxncI6n5YLT8o=;
        b=S4S8p+ukur4k49O50w1Ic29LdlekjvtiaUfXBSdS34pSoC3zOJaXSIrOkc+ZKIL0B7
         GscYPddiLDsfvE3Wi/QAzCgIF0LQ5gGItBBZE5yshvOyaHbYaaw+zX5goNaJ4S4uZR7R
         5ujk9PJaW75JFQw4o0eD+rJsscMTI7AVhZIt4FbNKl8RFriUKcHg9boEi+TW6vOEGldL
         B9onuKlJ4QwhCFU+WxCeSC+EFGyjtmNNDKkoIvuXnSVihjVAxTzuNNdbe5KGMGbLQUMB
         2x66kCxiPYAw+Up8fQ1f2TylHNOTIFQEgStMR9DMlGWjdLZz34twWkGFownTZC3fJZWy
         fLTA==
X-Gm-Message-State: AC+VfDzXV2rfAA7KlxfZQGiE0V5QORpkBYUq6CZUFIRyA2hiHXE8NwRu
	EdfUQJA7XpZXegYIamyKhcBHMP9KqDZDAQjFLAHENQ==
X-Google-Smtp-Source: ACHHUZ5U6NN5JuVT6xugTHtgq3mvsUusg/3/3ptFMfIWWDkXrgFBqm9fxalqfCc6jesVBuUuUOTJKEK5VLi8XTfccYs=
X-Received: by 2002:a67:f649:0:b0:434:6958:cdc6 with SMTP id
 u9-20020a67f649000000b004346958cdc6mr789597vso.19.1686045859248; Tue, 06 Jun
 2023 03:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230606091747.2031168-1-wenst@chromium.org> <58949bbd-1506-90a0-7154-e6e57d8ddf70@collabora.com>
In-Reply-To: <58949bbd-1506-90a0-7154-e6e57d8ddf70@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Jun 2023 18:04:08 +0800
Message-ID: <CAGXv+5GRBOWFMw+BmkSpczHcm_R6=mvL2GSKnWWyhpng1xw21w@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_mtk: Simplify clock sequencing and runtime PM
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, John Ogness <john.ogness@linutronix.de>, 
	linux-serial@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_030421_296468_8FD9819E 
X-CRM114-Status: GOOD (  36.15  )
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

On Tue, Jun 6, 2023 at 5:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/06/23 11:17, Chen-Yu Tsai ha scritto:
> > The 8250_mtk driver's runtime PM support has some issues:
> >
> > - The bus clock is enabled (through runtime PM callback) later than a
> >    register write
> > - runtime PM resume callback directly called in probe, but no
> >    pm_runtime_set_active() call is present
> > - UART PM function calls the callbacks directly, _and_ calls runtime
> >    PM API
> > - runtime PM callbacks try to do reference counting, adding yet another
> >    count between runtime PM and clocks
> >
> > This fragile setup worked in a way, but broke recently with runtime PM
> > support added to the serial core. The system would hang when the UART
> > console was probed and brought up.
> >
> > Tony provided some potential fixes [1][2], though they were still a bit
> > complicated. The 8250_dw driver, which the 8250_mtk driver might have
> > been based on, has a similar structure but simpler runtime PM usage.
> >
> > Simplify clock sequencing and runtime PM support in the 8250_mtk driver=
.
> > Specifically, the clock is acquired enabled and assumed to be active,
> > unless toggled through runtime PM suspend/resume. Reference counting is
> > removed and left to the runtime PM core. The serial pm function now
> > only calls the runtime PM API.
> >
> > [1] https://lore.kernel.org/linux-serial/20230602092701.GP14287@atomide=
.com/
> > [2] https://lore.kernel.org/linux-serial/20230605061511.GW14287@atomide=
.com/
> >
> > Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers t=
o enable runtime PM")
> > Suggested-by: Tony Lindgren <tony@atomide.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> You're both cleaning this up and solving a critical issue and I completel=
y agree
> about doing that.
>
> I can imagine what actually fixes the driver, but still, is it possible t=
o split
> this commit in two?
> One that solves the issue, one that performs the much needed cleanups.
>
> If it's not possible, then we can leave this commit as it is... and if th=
e problem
> about splitting is the Fixes tag... well, we don't forcefully need it: af=
ter all,
> issues started arising after runtime PM support for 8250 landed and befor=
e that the
> driver technically worked, even though it was fragile.

The pure fix would look like what Tony posted [1]. However it would add stu=
ff
that isn't strictly needed after the cleanup. Doing it in one patch results
in less churn. Think of it another way: it's a nice cleanup that just so
happens to fix a regression.

As for the fixes tag, it's there so other people potentially doing backport=
s
of the 8250 runtime PM work can spot this followup fix.

ChenYu

[1] https://lore.kernel.org/linux-serial/20230605061511.GW14287@atomide.com=
/

> Thanks,
> Angelo
>
> > ---
> >   drivers/tty/serial/8250/8250_mtk.c | 50 ++++++-----------------------=
-
> >   1 file changed, 10 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/82=
50/8250_mtk.c
> > index aa8e98164d68..74da5676ce67 100644
> > --- a/drivers/tty/serial/8250/8250_mtk.c
> > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > @@ -431,12 +431,7 @@ static int __maybe_unused mtk8250_runtime_suspend(=
struct device *dev)
> >       while
> >               (serial_in(up, MTK_UART_DEBUG0));
> >
> > -     if (data->clk_count =3D=3D 0U) {
> > -             dev_dbg(dev, "%s clock count is 0\n", __func__);
> > -     } else {
> > -             clk_disable_unprepare(data->bus_clk);
> > -             data->clk_count--;
> > -     }
> > +     clk_disable_unprepare(data->bus_clk);
> >
> >       return 0;
> >   }
> > @@ -444,19 +439,8 @@ static int __maybe_unused mtk8250_runtime_suspend(=
struct device *dev)
> >   static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
> >   {
> >       struct mtk8250_data *data =3D dev_get_drvdata(dev);
> > -     int err;
> >
> > -     if (data->clk_count > 0U) {
> > -             dev_dbg(dev, "%s clock count is %d\n", __func__,
> > -                     data->clk_count);
> > -     } else {
> > -             err =3D clk_prepare_enable(data->bus_clk);
> > -             if (err) {
> > -                     dev_warn(dev, "Can't enable bus clock\n");
> > -                     return err;
> > -             }
> > -             data->clk_count++;
> > -     }
> > +     clk_prepare_enable(data->bus_clk);
> >
> >       return 0;
> >   }
> > @@ -465,14 +449,12 @@ static void
> >   mtk8250_do_pm(struct uart_port *port, unsigned int state, unsigned in=
t old)
> >   {
> >       if (!state)
> > -             if (!mtk8250_runtime_resume(port->dev))
> > -                     pm_runtime_get_sync(port->dev);
> > +             pm_runtime_get_sync(port->dev);
> >
> >       serial8250_do_pm(port, state, old);
> >
> >       if (state)
> > -             if (!pm_runtime_put_sync_suspend(port->dev))
> > -                     mtk8250_runtime_suspend(port->dev);
> > +             pm_runtime_put_sync_suspend(port->dev);
> >   }
> >
> >   #ifdef CONFIG_SERIAL_8250_DMA
> > @@ -504,7 +486,7 @@ static int mtk8250_probe_of(struct platform_device =
*pdev, struct uart_port *p,
> >               return 0;
> >       }
> >
> > -     data->bus_clk =3D devm_clk_get(&pdev->dev, "bus");
> > +     data->bus_clk =3D devm_clk_get_enabled(&pdev->dev, "bus");
> >       if (IS_ERR(data->bus_clk))
> >               return PTR_ERR(data->bus_clk);
> >
> > @@ -587,25 +569,16 @@ static int mtk8250_probe(struct platform_device *=
pdev)
> >
> >       platform_set_drvdata(pdev, data);
> >
> > -     pm_runtime_enable(&pdev->dev);
> > -     err =3D mtk8250_runtime_resume(&pdev->dev);
> > -     if (err)
> > -             goto err_pm_disable;
> > -
> >       data->line =3D serial8250_register_8250_port(&uart);
> > -     if (data->line < 0) {
> > -             err =3D data->line;
> > -             goto err_pm_disable;
> > -     }
> > +     if (data->line < 0)
> > +             return data->line;
> >
> >       data->rx_wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> >
> > -     return 0;
> > -
> > -err_pm_disable:
> > -     pm_runtime_disable(&pdev->dev);
> > +     pm_runtime_set_active(&pdev->dev);
> > +     pm_runtime_enable(&pdev->dev);
> >
> > -     return err;
> > +     return 0;
> >   }
> >
> >   static int mtk8250_remove(struct platform_device *pdev)
> > @@ -619,9 +592,6 @@ static int mtk8250_remove(struct platform_device *p=
dev)
> >       pm_runtime_disable(&pdev->dev);
> >       pm_runtime_put_noidle(&pdev->dev);
> >
> > -     if (!pm_runtime_status_suspended(&pdev->dev))
> > -             mtk8250_runtime_suspend(&pdev->dev);
> > -
> >       return 0;
> >   }
> >
>
>

