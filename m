Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE412C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cO38/BvQLHAQ87G9qM9lbTJ3ImPZclrAKat+fZGulg8=; b=H2SxDbuQseCaxiI+lOhN8hVqTS
	F9PY5xqnlGclePrMb9BP5mQklmW4Eur7+fu5T/viYkaPzNF98NWANhnM0l3wfU6GwbXqRdpMwT7JN
	+HlacE8STh/ayLf6ZNF0dlCDp7IvdIdtcu837jyB2qW7fYdImyVc+SgqoXR3X/1RlocL2iAQtZZE5
	3+IYwmMkPmYntCcoZ41MG0vSfd3gTFH3WIL+IG03IQ4TS1s1CEBebovqhAhTwPVKSwHY1pXEDpLFx
	e+bpuCaEoQeQ+R6cF/Z2rpwA4S2hiu0TbdDcxZFqG45+FNAM6Ha0eGOvBWMepc30sbXBBseX3VsX+
	GEljaJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q69qE-00FXlP-2R;
	Mon, 05 Jun 2023 13:01:46 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q69qB-00FXkm-11
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 13:01:44 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-43b28754c88so2324361137.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jun 2023 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685970101; x=1688562101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO38/BvQLHAQ87G9qM9lbTJ3ImPZclrAKat+fZGulg8=;
        b=Pvm80JLLbw9204UFhZpF1p4N3+QTzv9VaQY6S9dISSHHxWvVTn+6Tp9q8CBQIwHNRJ
         YARczhIEuxIv1KtQTEa4vcAebIMdGhrwywm8IsdbQ+R9Fmi6ivofNqX/RyPSQzp3VX7Q
         PMSBt1Jw0hL48gQ1WNI755anzsZDG7z93nhVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685970101; x=1688562101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cO38/BvQLHAQ87G9qM9lbTJ3ImPZclrAKat+fZGulg8=;
        b=NyDABe4FUohqC3fBk6AiTRyIcTDzItqqHl0Dx6DUgy12GvqPqFc4RpYvu2Ky0rchZz
         dzFg2SOYOekyjgj8zGll5O5T5CoUlETCxatmplszahkYlKNS/nQSKyDUhS9AsIINk6p5
         zXrxqnVIWKeT2MLHrtXGVtqxUehoctETPOHshCP68YmPDovpBaq/q4kNv0nat7Ph0Uxu
         Pnbdef094uj7MKO9DhpF2sIb1+sL3IgGbFd8t6keNsZcacWSqkPdq7yrlnn4hrwxdsn1
         oZFmmbCPPYZOCLoNW7boAS6JmObNBN8zOyvJ57HMHTAjDnlu3WSQ39TFv5AQrel5+Hcp
         RsOQ==
X-Gm-Message-State: AC+VfDyXyJVmgt8hsI4uHtJOQcTCLtQioPaM4bd5SjC7OFvqD8OACtfh
	y7kWimf/frcwXb0Ln0dFanE4ZzKtaqWMqO1O1OUqpQ==
X-Google-Smtp-Source: ACHHUZ6YZzW+yZOZuWvTCNoj/dgyh96LyT2DXgLsptRLSpDmYKbQOI/iNYJ3d5WCgu88E0xn8iIVW6pMblwAwmUBM28=
X-Received: by 2002:a67:bd18:0:b0:43b:2c84:1fca with SMTP id
 y24-20020a67bd18000000b0043b2c841fcamr3134845vsq.5.1685970100956; Mon, 05 Jun
 2023 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230525113034.46880-1-tony@atomide.com> <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de> <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com> <20230605061511.GW14287@atomide.com>
 <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com> <20230605122447.GY14287@atomide.com>
In-Reply-To: <20230605122447.GY14287@atomide.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 5 Jun 2023 21:01:29 +0800
Message-ID: <CAGXv+5HwL+R5QpO3pHGQd9qAxu2pCMDjYvdni1HjiC8eEE38mg@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
To: Tony Lindgren <tony@atomide.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Dhruva Gole <d-gole@ti.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Johan Hovold <johan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_060143_385792_C6D31351 
X-CRM114-Status: GOOD (  30.66  )
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

On Mon, Jun 5, 2023 at 8:24=E2=80=AFPM Tony Lindgren <tony@atomide.com> wro=
te:
>
> * Chen-Yu Tsai <wenst@chromium.org> [230605 11:34]:
> > On Mon, Jun 5, 2023 at 2:15=E2=80=AFPM Tony Lindgren <tony@atomide.com>=
 wrote:
> > > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/=
8250/8250_mtk.c
> > > --- a/drivers/tty/serial/8250/8250_mtk.c
> > > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > > @@ -425,11 +439,10 @@ mtk8250_set_termios(struct uart_port *port, str=
uct ktermios *termios,
> > >  static int __maybe_unused mtk8250_runtime_suspend(struct device *dev=
)
> > >  {
> > >         struct mtk8250_data *data =3D dev_get_drvdata(dev);
> > > -       struct uart_8250_port *up =3D serial8250_get_port(data->line)=
;
> > >
> > >         /* wait until UART in idle status */
> > >         while
> > > -               (serial_in(up, MTK_UART_DEBUG0));
> > > +               (mtk8250_read(data, MTK_UART_DEBUG0));
> >
> > I believe it still gets stuck here sometimes.
>
> Hmm so maybe you need to mtk8250_write(data, 0, MTK_UART_RATE_FIX) in
> probe before pm_runtime_resume_and_get() that enables the baud clock?
> That's something I changed, so maybe it messes up things.

I think it has something to do with the do_pm() function calling
the callbacks directly, then also calling runtime PM.

> Looking at the 8250_mtk git log, it's runtime PM functions seem to only
> currently manage the baud clock so register access should be doable
> without runtime PM resume?

Actually it only manages the bus clock. The baud clock is simply the system
XTAL which is not gateble.

> > With your earlier patch, it could get through registering the port, and
> > the console would show
> >
> >     11002000.serial: ttyS0 at MMIO 0x11002000 (irq =3D 240, base_baud =
=3D
> > 1625000) is a ST16650V2
> >
> > for the console UART.
>
> OK
>
> > Angelo mentioned that we should be using SLEEP_REQ/SLEEP_ACK registers
> > in the MTK UART hardware.
> >
> > I tried reworking it into your patch here, but it causes issues with th=
e
> > UART-based Bluetooth on one of my devices. After the UART runtime suspe=
nds
> > and resumes, something is off and causes the transfers during Bluetooth
> > init to become corrupt.
> >
> > I'll try some more stuff, but the existing code seems timing dependent.
> > If I add too many printk statements to the runtime suspend/resume
> > callbacks, things seem to work. One time I even ended up with broken
> > UARTs but otherwise booted up the system.
>
> Well another thing that now changes is that we now runtime suspend the
> port at the end of the probe. What the 8250_mtk probe was doing earlier
> it was leaving the port baud clock enabled, but runtime PM disabled
> until mtk8250_do_pm() I guess.

I guess that's the biggest difference? Since the *bus* clock gets disabled,
any access will hang. Is it enough to just support runtime PM? Or do I have
to also have UART_CAP_RPM?

ChenYu

