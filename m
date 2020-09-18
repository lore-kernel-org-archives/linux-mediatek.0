Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30ADCC43464
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 11:03:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC4B620795
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 11:03:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nwgfufQV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOOnrumD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC4B620795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZCKAOYYc6eF4dbM8jCHjgSc0unaiTLyQLtISsAhQAFQ=; b=nwgfufQV3T+1p2s9NaBL6hiQb
	8FVema+yTv3IAycdzUUkHBDj7ItYhWS6n9Q2B26C6zmvY+BDRvC5XEK9QopFc4pTIUPNdaHgprf0i
	+rzNSr6EXdLM9Ucv9nJQuMmBo3/jThawOxu6sWCBwdpx0fxZg0cLkWqqmu1F4sjaCICIOOgLXF4AM
	lROEPrB57Mx51PqqX6ZmEufB7qBi5H/wmSkPxV0WYDmaJsJhjJkOZHQNCNdN5AW0rnP0mF/zI7Tq5
	tHszjv91vxamrzLvjRal06ni2Jc41Zkxmnd/+An9cxPsy29VQm6CU5l0ypiOVTF66WHUobbk3Rru+
	JF3htza+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJEAx-0008OR-Ox; Fri, 18 Sep 2020 11:03:35 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJEAu-0008NQ-He; Fri, 18 Sep 2020 11:03:33 +0000
Received: by mail-pg1-x541.google.com with SMTP id s65so3277134pgb.0;
 Fri, 18 Sep 2020 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nao0/Wr0hBbBHzRTt2lYTcrL2lgJfdqCHe2qLp5Vfbs=;
 b=ZOOnrumDDELWvuqtf3pLDC3+QT7tIp4eL3dqXtZnnzHnZVCh1e16nMtyEz0fOAXXrx
 dRSq/FLxBdynsc26VSUZwuYH0q2/+YD2RlF3+VJg4vpFOn2nxTRdfbb3tX6zu03Ykf9O
 zNVCJ9eyZxdgbEn/ghY+bLLqd6lXTI5DgucL2mnGVdpqVOrkk+pBoKD1rKi+L/YJr65C
 OdAMPZqRDjWwMLOpH1yviYdHmm7PvSnO/mW0grqcF1BrcOvtZePU5GyRFPZo5SCXlLbu
 IS0iRHvE6Km+93YcACqjW59zzq0cA1LjQ50d4xh9TVJwDNNKGehJ/1TJiAgsYnELePwp
 E36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nao0/Wr0hBbBHzRTt2lYTcrL2lgJfdqCHe2qLp5Vfbs=;
 b=VN3T69TR61+BDGhxMKKWgePgVBVD2p/jHgwOkKQD09INqEG29dIDcPGHCr2HPBkic4
 VbwRrbWLk74mJvdYrLHL7SguxFGM3mQe87DDqTbrhghilDoU2Crecr36/LPQOur2hisG
 iIKErw81ehuzdeJ4/q98S+TmtNx1PM9abkd+GLQF5KY3YoW5mhoPNhK0wp3jGltK7G7e
 6I2/7F1hyzg32XhKAToKStN+Fa3AYZo7gFvUL6091Pg8Rk8TtgL+xbBqqQGGxrsS7Or2
 7/KzVSyAoILUtzaoMoHexVPnbX2RQmjcNZ+CpntOp8STdRsbqDkqskW4oh6Plm3vXL1K
 otIg==
X-Gm-Message-State: AOAM532UvmxWZ5TrSGZp3PStaxituGtCGvT6cNrdQ9FYr5wILBCF0dVe
 oTvsCW3MQdf0dCcjnJpkl+Pv+U594840kG1ypb61hqrxZe2j3w==
X-Google-Smtp-Source: ABdhPJwr0+DnowJF2rGQ525MkBbx6O/JnE/mrxsqe4Qz4K48A78m7Pd48JGufEzbgiQQwnMesZiWjKslBt1FZPPDQZQ=
X-Received: by 2002:aa7:9201:0:b029:13e:d13d:a10c with SMTP id
 1-20020aa792010000b029013ed13da10cmr30226423pfo.40.1600427008863; Fri, 18 Sep
 2020 04:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200915054825.3289105-1-hsinyi@chromium.org>
In-Reply-To: <20200915054825.3289105-1-hsinyi@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 18 Sep 2020 14:03:11 +0300
Message-ID: <CAHp75VetbOewxfr2weG_WJDQ7hNkmBBnL_A-JZV9iTXT2vd-_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tty: serial: print earlycon info after match->setup
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_070332_594027_BC408D96 
X-CRM114-Status: GOOD (  22.78  )
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
Cc: Eddie Huang <eddie.huang@mediatek.com>,
 Changqi Hu <changqi.hu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 8:50 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> 8250 devices may modify iotype in their own earlycon setup. For example:
> 8250_mtk and 8250_uniphier force iotype to be MMIO32. Print earlycon info
> after match->setup to reflect actual earlycon info.

Thanks for an update.
I prefer to see some flag that tells user that options were forced by
the kernel itself (something like err > 0 returned from ->setup()),
but I think it's matter of an additional fix. In principle user can
check the command line and / or DT/ACPI vs. dmesg, although it will
require an extra work.

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change:
> v1->v2: rename function
> ---
>  drivers/tty/serial/earlycon.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
> index 2ae9190b64bb9..b70877932d47d 100644
> --- a/drivers/tty/serial/earlycon.c
> +++ b/drivers/tty/serial/earlycon.c
> @@ -56,7 +56,6 @@ static void __init earlycon_init(struct earlycon_device *device,
>                                  const char *name)
>  {
>         struct console *earlycon = device->con;
> -       struct uart_port *port = &device->port;
>         const char *s;
>         size_t len;
>
> @@ -70,6 +69,12 @@ static void __init earlycon_init(struct earlycon_device *device,
>         len = s - name;
>         strlcpy(earlycon->name, name, min(len + 1, sizeof(earlycon->name)));
>         earlycon->data = &early_console_dev;
> +}
> +
> +static void __init earlycon_print_info(struct earlycon_device *device)
> +{
> +       struct console *earlycon = device->con;
> +       struct uart_port *port = &device->port;
>
>         if (port->iotype == UPIO_MEM || port->iotype == UPIO_MEM16 ||
>             port->iotype == UPIO_MEM32 || port->iotype == UPIO_MEM32BE)
> @@ -140,6 +145,7 @@ static int __init register_earlycon(char *buf, const struct earlycon_id *match)
>
>         earlycon_init(&early_console_dev, match->name);
>         err = match->setup(&early_console_dev, buf);
> +       earlycon_print_info(&early_console_dev);
>         if (err < 0)
>                 return err;
>         if (!early_console_dev.con->write)
> @@ -302,6 +308,7 @@ int __init of_setup_earlycon(const struct earlycon_id *match,
>         }
>         earlycon_init(&early_console_dev, match->name);
>         err = match->setup(&early_console_dev, options);
> +       earlycon_print_info(&early_console_dev);
>         if (err < 0)
>                 return err;
>         if (!early_console_dev.con->write)
> --
> 2.28.0.618.gf4bc123cb7-goog
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
