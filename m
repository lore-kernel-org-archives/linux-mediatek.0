Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A3BC7EE2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 09:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Khb/i5f1eJZ0J6xeiDfa7TucSC94mz6ND/CCe3oa97c=; b=xUiir2dMyQNZYHmD2QrPy4HLB1
	3MQyEp6Qs2lo/QL4f0f4eIzPwpBO1YaFMS16zk2ON3Uo1lVSUadlcCHw6xkQ4J9ks7YmNwTkZFTmc
	PvmoSQiQ7etFm1HG6wzkjn9oIhHKKCvq0nFxtPvdeKyf8rgRfvDng+giCJiOulKv7i+F+DbsryZQX
	Qs8xJOPVsS7zdxNnU8dWUtnUGSsXRxPS0+AJUjxQCUxvPS5ewJp4+0/ltVF55gvSLn8UulOyZFuSu
	IU4oW1IG4E/bUs3DpkvUFlGj+SA1Fvste+iUhP/RxsYxkvgqbBNlc71FpwUSRArCj6HSEKLJdMmdC
	+s5e8X+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SoQ-000yKl-1W;
	Tue, 06 Jun 2023 09:17:10 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SoM-000yIA-2u
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 09:17:08 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-43b45a0ae19so554277137.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 02:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686043022; x=1688635022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Khb/i5f1eJZ0J6xeiDfa7TucSC94mz6ND/CCe3oa97c=;
        b=MfAG+IuBokCFoq6NH0TfQ3LdRjyZ4XQHnhklH/9QDPZAO+l05Tgr5r4mdDo/GRSe/W
         tTqsoN/TLZw5KbHQWjvZh4f06ku1WTxTK5RA4jDeJg4iRl3GgI206Ry/4rVkCBQTt1Zy
         bNTbtrtrKfP6ajPOKPQ2ZFN4Fv/e59vfvCT+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043022; x=1688635022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Khb/i5f1eJZ0J6xeiDfa7TucSC94mz6ND/CCe3oa97c=;
        b=UHmRyff8y6mgXDReETkrefVGIP9iZAAMMztaeNun3sp0wVNre+Nn7g9GRL6Jdw+ELK
         R7eIqV5BLPUClhjbS0N9St0afyDxE7+Yq8CLr1s+KaWAfknvJ/zbd/kVDlgyNvW0TJl8
         sFdi/9NmTyDSo1XcKdIDVarJOEKZZd58uWUNtb8RXbDjjzAhXobrBm+VTViI1iGN3cwU
         rJ3V3wdXWnA9physw4msdyjBc686CLCpEM9S9JvIb/z5m1CBu15KAJcETbBC9AKqR7yZ
         e4FaYo9HwVFxlEWLYcwuv9CDfNf1mhRH1h4sW2FX1fE4y6DcHxAaqwKjtgqedWcCkw7d
         DmCg==
X-Gm-Message-State: AC+VfDyjk3tSIgI9yJA2lA4HgD+3B5DuQDwc1lzi5nOnJRYsCTRr9pJc
	1hofQR+t03QqOm+YDc0R6GBvE4aN6vhJNvy6chJbIg==
X-Google-Smtp-Source: ACHHUZ4Q5xZF3lkjNlUB6Gn9V6AQgQZ2sq3mqzhEAjK9Sn0NJJMwCpu52xY+BZ6AAOUkIEC/8Il2gpm8IN/ybT89ztU=
X-Received: by 2002:a05:6102:2d6:b0:434:7757:f025 with SMTP id
 h22-20020a05610202d600b004347757f025mr947556vsh.0.1686043022440; Tue, 06 Jun
 2023 02:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230525113034.46880-1-tony@atomide.com> <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de> <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com> <20230605061511.GW14287@atomide.com>
 <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com>
 <20230605122447.GY14287@atomide.com> <CAGXv+5HwL+R5QpO3pHGQd9qAxu2pCMDjYvdni1HjiC8eEE38mg@mail.gmail.com>
 <20230605131803.GA14287@atomide.com>
In-Reply-To: <20230605131803.GA14287@atomide.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Jun 2023 17:16:50 +0800
Message-ID: <CAGXv+5GR9TEaNrj4B21H2iukS2kWW=rtoWkoVnWewVsrbcG0Hw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230606_021706_963829_87F52CD3 
X-CRM114-Status: GOOD (  44.29  )
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

On Mon, Jun 5, 2023 at 9:18=E2=80=AFPM Tony Lindgren <tony@atomide.com> wro=
te:
>
> * Chen-Yu Tsai <wenst@chromium.org> [230605 13:01]:
> > On Mon, Jun 5, 2023 at 8:24=E2=80=AFPM Tony Lindgren <tony@atomide.com>=
 wrote:
> > >
> > > * Chen-Yu Tsai <wenst@chromium.org> [230605 11:34]:
> > > > On Mon, Jun 5, 2023 at 2:15=E2=80=AFPM Tony Lindgren <tony@atomide.=
com> wrote:
> > > > > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/ser=
ial/8250/8250_mtk.c
> > > > > --- a/drivers/tty/serial/8250/8250_mtk.c
> > > > > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > > > > @@ -425,11 +439,10 @@ mtk8250_set_termios(struct uart_port *port,=
 struct ktermios *termios,
> > > > >  static int __maybe_unused mtk8250_runtime_suspend(struct device =
*dev)
> > > > >  {
> > > > >         struct mtk8250_data *data =3D dev_get_drvdata(dev);
> > > > > -       struct uart_8250_port *up =3D serial8250_get_port(data->l=
ine);
> > > > >
> > > > >         /* wait until UART in idle status */
> > > > >         while
> > > > > -               (serial_in(up, MTK_UART_DEBUG0));
> > > > > +               (mtk8250_read(data, MTK_UART_DEBUG0));
> > > >
> > > > I believe it still gets stuck here sometimes.
> > >
> > > Hmm so maybe you need to mtk8250_write(data, 0, MTK_UART_RATE_FIX) in
> > > probe before pm_runtime_resume_and_get() that enables the baud clock?
> > > That's something I changed, so maybe it messes up things.
> >
> > I think it has something to do with the do_pm() function calling
> > the callbacks directly, then also calling runtime PM.
>
> Yeah I'm not following really what's going on there.. So then I guess the
> call for mtk8250_write(data, 0, MTK_UART_RATE_FIX) should be after the
> pm_runtime_resume_and_get() call.
>
> > > Looking at the 8250_mtk git log, it's runtime PM functions seem to on=
ly
> > > currently manage the baud clock so register access should be doable
> > > without runtime PM resume?
> >
> > Actually it only manages the bus clock. The baud clock is simply the sy=
stem
> > XTAL which is not gateble.
>
> OK
>
> > > > With your earlier patch, it could get through registering the port,=
 and
> > > > the console would show
> > > >
> > > >     11002000.serial: ttyS0 at MMIO 0x11002000 (irq =3D 240, base_ba=
ud =3D
> > > > 1625000) is a ST16650V2
> > > >
> > > > for the console UART.
> > >
> > > OK
> > >
> > > > Angelo mentioned that we should be using SLEEP_REQ/SLEEP_ACK regist=
ers
> > > > in the MTK UART hardware.
> > > >
> > > > I tried reworking it into your patch here, but it causes issues wit=
h the
> > > > UART-based Bluetooth on one of my devices. After the UART runtime s=
uspends
> > > > and resumes, something is off and causes the transfers during Bluet=
ooth
> > > > init to become corrupt.
> > > >
> > > > I'll try some more stuff, but the existing code seems timing depend=
ent.
> > > > If I add too many printk statements to the runtime suspend/resume
> > > > callbacks, things seem to work. One time I even ended up with broke=
n
> > > > UARTs but otherwise booted up the system.
> > >
> > > Well another thing that now changes is that we now runtime suspend th=
e
> > > port at the end of the probe. What the 8250_mtk probe was doing earli=
er
> > > it was leaving the port baud clock enabled, but runtime PM disabled
> > > until mtk8250_do_pm() I guess.
> >
> > I guess that's the biggest difference? Since the *bus* clock gets disab=
led,
> > any access will hang. Is it enough to just support runtime PM? Or do I =
have
> > to also have UART_CAP_RPM?
>
> Maybe try changing pm_runtime_put_sync() at the end of the probe to just
> pm_runtime_put_noidle()? Then the driver should be back to where it was
> with clocks enabled but runtime PM suspended.
>
> I don't think you need UART_CAP_RPM right now unless 8250_mtk adds suppor=
t
> for autosuspend. That stuff will get replaced by the serial_core generic
> PM patch from Andy. I think in it's current form 8250_mtk just gets enabl=
ed
> when the port is opened, and disabled when the port is closed. And gets
> disabled for system suspend.

I ended up following 8250_dw's design, which seemed less convoluted.
The original code was waaay too convoluted.

BTW, the Bluetooth breakage seems like a different problem. It works
on v6.4-rc5, but breaks somewhere between that and next, before the
runtime PM series. This particular device has a Qualcomm WiFi/BT chip
with the Bluetooth part going through UART. The btqca reports a bunch
of frame reassembly errors during and after initialization:

Bluetooth: hci0: setting up ROME/QCA6390
Bluetooth: hci0: Frame reassembly failed (-84)
Bluetooth: hci0: QCA Product ID   :0x00000008
Bluetooth: hci0: QCA SOC Version  :0x00000044
Bluetooth: hci0: QCA ROM Version  :0x00000302
Bluetooth: hci0: QCA Patch Version:0x00000111
Bluetooth: hci0: QCA controller version 0x00440302
Bluetooth: hci0: QCA Downloading qca/rampatch_00440302.bin
Bluetooth: hci0: Frame reassembly failed (-84)
Bluetooth: hci0: QCA Downloading qca/nvm_00440302_i2s.bin
Bluetooth: hci0: QCA setup on UART is completed
Bluetooth: hci0: Opcode 0x1002 failed: -110
Bluetooth: hci0: command 0x1002 tx timeout
Bluetooth: hci0: crash the soc to collect controller dump
Bluetooth: hci0: QCA collecting dump of size:196608
Bluetooth: hci0: Frame reassembly failed (-84)
...
Bluetooth: hci0: Frame reassembly failed (-84)
Bluetooth: Received HCI_IBS_WAKE_ACK in tx state 0
Bluetooth: hci0: Frame reassembly failed (-84)
...
Bluetooth: hci0: Frame reassembly failed (-84)
Bluetooth: hci0: Frame reassembly failed (-90)
Bluetooth: hci0: Frame reassembly failed (-84)
...
Bluetooth: hci0: Frame reassembly failed (-84)
Bluetooth: hci0: Injecting HCI hardware error event

However on a different device that has a Realtek WiFi/BT chip,
it doesn't seem to run into errors.

Just putting it out there in case anyone else runs into it.


Thank you for your help on this.

ChenYu

