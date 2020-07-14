Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DE1C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:45:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E7F20656
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uJA6UBvv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="dsDrvsXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E7F20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nNri12jqnNKTm6038Kw8TRLqGjfYN1LBHrESviquXXo=; b=uJA6UBvvF0TAS9cX/c0n/hMhi
	ZxdcWQaOw++vysIQO8WY2HNOyEW8/G3Fa1jwX3pmvKZBnshEDSVfoqngXSRHuOaKsk4rdTgG53fYx
	j+UFItQhNDEhgVqTcexGZnFLCrW4FR7RIS97cCdU5ltZB13cpY47MAPzDDYNwu26jvjXFFxkKg6oy
	UaaGZqyFCqW5gSA3IydbgDTQMPRZenLkfVQrW2vlVuriGVhUqhDLM5k1JcVMaRA8WGGf/3nd2J9aa
	mR4vp4M1ef0EwI7AhlyxegT0NJtdotKlbHIxePsXGtYJbVYzYvg+JiUUyTVLeCJT1mmWbj9KZW5Cw
	dLuAyNx/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvRnk-00007T-Se; Tue, 14 Jul 2020 20:45:20 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvRnf-00005T-TK
 for linux-mediatek@lists.infradead.org; Tue, 14 Jul 2020 20:45:17 +0000
Received: by mail-ej1-x643.google.com with SMTP id p20so24358356ejd.13
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2020 13:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kqh1NBVBlHrZFE286BUwAHdoh8ntAaaIXSLlXQ7Bm6s=;
 b=dsDrvsXKwnz4Ec5AoGC7UzNnGr6HGFuQx0fMIrzZdpvzT8V+sMBjSseqibtKkUleNp
 YAQBi76uicXluskJd+hTeTsyWAg05jNYM0frcHY4PBAtEKlADxwqvaJdPcxxHuR6fSg4
 Z8Av9Xw3kWBU7AcvAiZLJvP0ANAQYQY/1HRVk5m0U6KRDc+OtwfbXN0N1c0AAmeVdh96
 7p0jLgi5ACnL+H0e8teJtGjWlj+U1ay7gVzmHsVYk1zN8dRbuaztcrZ66pzJ2Ok7zto2
 EGMDow93S9QTHHgzoSZB16/uOQk9fIg12WPTEmg38d7cg2Gx2p4CpzISSSFIUXkbDAsr
 HC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kqh1NBVBlHrZFE286BUwAHdoh8ntAaaIXSLlXQ7Bm6s=;
 b=VJ55O0aXowpwHxm9a+Dlxky37uxFkGIhyHaqqP8fjo0/f71LhFtYq8bRhzgO7PRIIQ
 AvwFHUxv2NobkY+SrX4PuGGqiDubNHqx2iHaoyOZmW0fkWcmE//u9XW6wTz5RFuW62QA
 5RHOuZ8oEr9q97SBK9XkmJhMELr7xYEvXFEWPO4BsqLwhr54xPyG2GgUL0RG9jyzu5Tc
 x75VODLptgIsG24SJg9I1OdHGqGX7pWT3uFJzKfrGwiaCcTxdJn1cubPnq5M+qOK4O7H
 vOFPIfqgafxx6HCnrwIpjnNtVc6vI1uqNXY825F2DObO7KpGJm64pqwAZtvcbAtJ+kLC
 oZ5w==
X-Gm-Message-State: AOAM531jO2TCTURwEgYo5smd6n7hnkb+olTp51z6N5QXbENqzUIZNVcf
 ajIlzzYx+0pXuGYORCx6wdEnYjW9IGqDDrHhPSMt6g==
X-Google-Smtp-Source: ABdhPJysUSBHVOa53sWJQjIcFkn4l3OgSNQEcR9y15L+mAV25fgE46PISgPYdobloPCBMeTthBtC00kZdSRclXpMQu0=
X-Received: by 2002:a17:906:fa9b:: with SMTP id
 lt27mr6000034ejb.513.1594759512692; 
 Tue, 14 Jul 2020 13:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200714124113.20918-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200714124113.20918-1-Sergey.Semin@baikalelectronics.ru>
From: Daniel Winkler <danielwinkler@google.com>
Date: Tue, 14 Jul 2020 13:45:01 -0700
Message-ID: <CAP2xMbvwxYaGPPCDWY2LWUc2te8kS9t-+A0zieYp3RiGMJR6ng@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_mtk: Fix high-speed baud rates clamping
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Claire Chang <tientzu@google.com>, Nicolas Boichat <drinkcat@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_164516_065794_01F5E576 
X-CRM114-Status: GOOD (  32.37  )
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 BlueZ <linux-bluetooth@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>,
 linux-mediatek@lists.infradead.org, abhishekpandit@chromium.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, stable@vger.kernel.org,
 Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thank you Sergey for looking into this. Adding folks working on this
platform to perform validation of the proposed patch.

Best,
Daniel

On Tue, Jul 14, 2020 at 5:41 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Commit 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250
> port") fixed limits of a baud rate setting for a generic 8250 port.
> In other words since that commit the baud rate has been permitted to be
> within [uartclk / 16 / UART_DIV_MAX; uartclk / 16], which is absolutely
> normal for a standard 8250 UART port. But there are custom 8250 ports,
> which provide extended baud rate limits. In particular the Mediatek 8250
> port can work with baud rates up to "uartclk" speed.
>
> Normally that and any other peculiarity is supposed to be handled in a
> custom set_termios() callback implemented in the vendor-specific
> 8250-port glue-driver. Currently that is how it's done for the most of
> the vendor-specific 8250 ports, but for some reason for Mediatek a
> solution has been spread out to both the glue-driver and to the generic
> 8250-port code. Due to that a bug has been introduced, which permitted the
> extended baud rate limit for all even for standard 8250-ports. The bug
> has been fixed by the commit 7b668c064ec3 ("serial: 8250: Fix max baud
> limit in generic 8250 port") by narrowing the baud rates limit back down to
> the normal bounds. Unfortunately by doing so we also broke the
> Mediatek-specific extended bauds feature.
>
> A fix of the problem described above is twofold. First since we can't get
> back the extended baud rate limits feature to the generic set_termios()
> function and that method supports only a standard baud rates range, the
> requested baud rate must be locally stored before calling it and then
> restored back to the new termios structure after the generic set_termios()
> finished its magic business. By doing so we still use the
> serial8250_do_set_termios() method to set the LCR/MCR/FCR/etc. registers,
> while the extended baud rate setting procedure will be performed later in
> the custom Mediatek-specific set_termios() callback. Second since a true
> baud rate is now fully calculated in the custom set_termios() method we
> need to locally update the port timeout by calling the
> uart_update_timeout() function. After the fixes described above are
> implemented in the 8250_mtk.c driver, the Mediatek 8250-port should
> get back to normally working with extended baud rates.
>
> Link: https://lore.kernel.org/linux-serial/20200701211337.3027448-1-danielwinkler@google.com
>
> Fixes: 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250 port")
> Reported-by: Daniel Winkler <danielwinkler@google.com>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>
> ---
>
> Folks, sorry for a delay with the problem fix. A solution is turned out to
> be a bit more complicated than I originally thought in my comment to the
> Daniel revert-patch.
>
> Please also note, that I don't have a Mediatek hardware to test the
> solution suggested in the patch. The code is written as on so called
> the tip of the pen after digging into the 8250_mtk.c and 8250_port.c
> drivers code. So please Daniel or someone with Mediatek 8250-port
> available on a board test this patch first and report about the results in
> reply to this emailing thread. After that, if your conclusion is positive
> and there is no objection against the solution design the patch can be
> merged in.
>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Daniel Winkler <danielwinkler@google.com>
> Cc: Aaron Sierra <asierra@xes-inc.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-serial@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: BlueZ <linux-bluetooth@vger.kernel.org>
> Cc: chromeos-bluetooth-upstreaming <chromeos-bluetooth-upstreaming@chromium.org>
> Cc: abhishekpandit@chromium.org
> Cc: stable@vger.kernel.org
> ---
>  drivers/tty/serial/8250/8250_mtk.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index f839380c2f4c..98b8a3e30733 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -306,8 +306,21 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
>         }
>  #endif
>
> +       /*
> +        * Store the requested baud rate before calling the generic 8250
> +        * set_termios method. Standard 8250 port expects bauds to be
> +        * no higher than (uartclk / 16) so the baud will be clamped if it
> +        * gets out of that bound. Mediatek 8250 port supports speed
> +        * higher than that, therefore we'll get original baud rate back
> +        * after calling the generic set_termios method and recalculate
> +        * the speed later in this method.
> +        */
> +       baud = tty_termios_baud_rate(termios);
> +
>         serial8250_do_set_termios(port, termios, old);
>
> +       tty_termios_encode_baud_rate(termios, baud, baud);
> +
>         /*
>          * Mediatek UARTs use an extra highspeed register (MTK_UART_HIGHS)
>          *
> @@ -339,6 +352,11 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
>          */
>         spin_lock_irqsave(&port->lock, flags);
>
> +       /*
> +        * Update the per-port timeout.
> +        */
> +       uart_update_timeout(port, termios->c_cflag, baud);
> +
>         /* set DLAB we have cval saved in up->lcr from the call to the core */
>         serial_port_out(port, UART_LCR, up->lcr | UART_LCR_DLAB);
>         serial_dl_write(up, quot);
> --
> 2.26.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
