Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D15C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 12:46:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110D120702
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 12:46:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hjnu47SW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="oqT6qh0I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 110D120702
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nulxr5nmrXDzgCQCq9TriFROZEGCp7WqkScYicLmSE0=; b=Hjnu47SW8BZ5waSB+jgRpXcVu
	Qe7Jkasxozv+v9xeMoX3ErL7KSsaZ4hxT83DoP30+IIiq4AzSSaBXgcQvnLEoAyFDUMvS1lb3kG4X
	6Z2RWBpkGhSzzvzZ50RBnV95rAIeUqWNz9ELDOOamN+aA5lbC6k0BEmDMVZ+iQvhnYGGYsapkGln+
	tain6PQHJh9tHpKKF5t1OUfRivEHciyv2GpQGHtvKC3dwFtn7cUPIdWyX0CLTXESdWuArrfn82dbv
	KWGvzVJ5xCttY0GEUpCYc+CTxOglorFa+UuJMY3bl1DQvvdumEWWMqL0elZ9fq5DXNEKZ6ZKhefwg
	96NETQ46A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqc8O-0004nY-D1; Wed, 01 Jul 2020 12:46:40 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqc8M-0004mx-4j
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 12:46:38 +0000
Received: by mail-lj1-x242.google.com with SMTP id q7so13503060ljm.1
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 05:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zOvTyVPom8sy12IqSAPoAUTKHIeIoMVlwU22bcDjqVI=;
 b=oqT6qh0IRRfF/hnPkpSxBlCyj8JlcIeGScOsmu3MknpD1FOeumlsiueZV9yQrK6CbT
 irSqPO/UzaDN6TU8bs6xDqkerVRlNw8OtpvQIms+HZuijJce976FRgfZHVOMOzJ+iuX4
 KBxf6UE202KXfO2JbQ1mpcEZVV9gmuk+p/140T9mOkIVSVCp87s5NiE61LmBwFODPUiU
 HwuzN2rXXXp45jIAlyYWd2kpJooAB9pHBRbaHLSeoDnG954hScv6X8EOLIonsgOKOnvQ
 x+nCGPJrXDOssJfQ48uLMfwawqYhSXcU+SF7oq5ZY1VWDhKG4AUadO3Gth8hyX8CbkSG
 AdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zOvTyVPom8sy12IqSAPoAUTKHIeIoMVlwU22bcDjqVI=;
 b=Wsoyj3DTF8E2HVLOVpwDq3ozc0Jne9WRlU7Cmf1Nxg47QmYIZRrMSiJZF+eqLRYoZA
 ylPVbzu+UKyI7g0ywcCmQkY5inzXhZK9sVgBFL8PJYVgR0CV1S/M2xwDWH1WkwVDUWN/
 BNN82GaZ2vMmh8yd8ODBoAgX3Kv7tXpapDJfkKldQToqog3SxiWB8Cw0ZS1G/wU1EgIO
 bw5PgnO9UJ0BtWD9n/rf4bX4EnYwdykBGLhmWuECnYpHZ4HoHm5B30bW6AQx3NDNT3rN
 p4ULtfCaKgAcHHGq3SY+3uuyh/jEiWiC3Od6g5+NZYgrBV5dQpMLnqtOlcOYe9yOcVOy
 8d4g==
X-Gm-Message-State: AOAM533Q7d06NPCnrSzIz8NDxq2r8hQMOtusFXLfSIMy4mLTObUtiffT
 CqOSpbpSQNvaab2JXwbiuYELWrLm5oRNhgg1qpp8mA==
X-Google-Smtp-Source: ABdhPJyqoZrcGcxMfGqgL0Ym5t+DxEuMVFUjY74p7t/TokcsIbFUid9tbE1q0whKvuYnl7vgX2sWaFjlwZnne9EfZcM=
X-Received: by 2002:a2e:85d8:: with SMTP id h24mr12658637ljj.274.1593607593233; 
 Wed, 01 Jul 2020 05:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200630164204.1.I2cc415fa5793b3e55acfd521ba8f0a71e79aa5f1@changeid>
 <20200701043001.73qhxyyjx6bayn2m@wunner.de>
 <20200701113904.7zh534vmlvjvojia@mobilestation>
In-Reply-To: <20200701113904.7zh534vmlvjvojia@mobilestation>
From: Alain Michaud <alainmichaud@google.com>
Date: Wed, 1 Jul 2020 08:46:21 -0400
Message-ID: <CALWDO_VbstuRPw-M13gf9JxsHb3Jhr7KEnCpFMoV6ZdDUohG1Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "serial: 8250: Fix max baud limit in generic 8250
 port"
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
 BlueZ <linux-bluetooth@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_084638_228615_08D4867A 
X-CRM114-Status: GOOD (  33.54  )
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
Cc: chromeos-bluetooth-upstreaming
 <chromeos-bluetooth-upstreaming@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Lukas Wunner <lukas@wunner.de>, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, Daniel Winkler <danielwinkler@google.com>,
 Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adding the bluetooth list as well per the Bluetooth impact.


On Wed, Jul 1, 2020 at 7:39 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Hello Lukas,
>
> On Wed, Jul 01, 2020 at 06:30:01AM +0200, Lukas Wunner wrote:
> > On Tue, Jun 30, 2020 at 04:42:11PM -0700, Daniel Winkler wrote:
> > > This reverts commit 0eeaf62981ecc79e8395ca8caa1570eaf3a12257.
> >
> > That is not an upstream commit.  You probably mean:
> >
> >     commit 7b668c064ec33f3d687c3a413d05e355172e6c92
> >     Author: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >     Date:   Thu May 7 02:31:32 2020 +0300
> >
> >     serial: 8250: Fix max baud limit in generic 8250 port
> >
> > And you didn't cc the commit author (hereby fixed).
> >
> > Thanks,
> >
> > Lukas
>
> Thanks for Cc'ing me.
>
> >
> > >
> > > The change regresses the QCA6174A-3 bluetooth chip, preventing
> > > firmware from being properly loaded. We have verified that without
> > > this patch, the chip works as intended.
>
> That text doesn't say what is really wrong and why the firmware couldn't be loaded.
> The original commit gets back the 8250 port baud rate limitation so if the baud
> gets out of the range [uartclk / 16 / UART_DIV_MAX; (port->uartclk + tolerance) /
> 16], then it will be clamped to be within it. That range is what the standard
> 8250 port supports. Acceptance of out of that range values will cause a
> problem further in calling serial8250_get_divisor() and uart_get_divisor()
> methods (see the original patch log message) for standard 8250 ports. Any different
> behavior must be taken into account by a custom set_termios() callbacks or at
> least must be workarounded so the standard 8250 ports wouldn't be affected. So in
> order to investigate the root cause of the problem it would be good to at least
> know what your platform was and what UART port has been used in the attempt to
> load the QCA6174A-3 chip firmware.
>
> -Sergey
>
> > >
> > > Signed-off-by: Daniel Winkler <danielwinkler@google.com>
> > > ---
> > >
> > >  drivers/tty/serial/8250/8250_port.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> > > index 1632f7d25acca..e057c65ac1580 100644
> > > --- a/drivers/tty/serial/8250/8250_port.c
> > > +++ b/drivers/tty/serial/8250/8250_port.c
> > > @@ -2618,8 +2618,6 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
> > >                                          struct ktermios *termios,
> > >                                          struct ktermios *old)
> > >  {
> > > -   unsigned int tolerance = port->uartclk / 100;
> > > -
> > >     /*
> > >      * Ask the core to calculate the divisor for us.
> > >      * Allow 1% tolerance at the upper limit so uart clks marginally
> > > @@ -2628,7 +2626,7 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
> > >      */
> > >     return uart_get_baud_rate(port, termios, old,
> > >                               port->uartclk / 16 / UART_DIV_MAX,
> > > -                             (port->uartclk + tolerance) / 16);
> > > +                             port->uartclk);
> > >  }
> > >
> > >  void
> > > --
> > > 2.27.0.212.ge8ba1cc988-goog
>
> --
> You received this message because you are subscribed to the Google Groups "ChromeOS Bluetooth Upstreaming" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to chromeos-bluetooth-upstreaming+unsubscribe@chromium.org.
> To post to this group, send email to chromeos-bluetooth-upstreaming@chromium.org.
> To view this discussion on the web visit https://groups.google.com/a/chromium.org/d/msgid/chromeos-bluetooth-upstreaming/20200701113904.7zh534vmlvjvojia%40mobilestation.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
