Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBE3C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:43:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BDFB21D93
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:43:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nvsKcQge";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L3o8CJJI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BDFB21D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9+2G28nYFPex0kYaYBy2e/W8BCax/2zHl3wVyEmtg74=; b=nvsKcQgeQ6/6JUC8J03J9XhZO
	leiHhcvufSvEQDmgbdR30nrj/j9q1ATLxoJbubddgXgGMflyDJmOE9XYLtR3p5bRAOeN7SlqIjNAy
	8wqdEg7GqMY1IiPl3F+E+0HSB54QVRaY/5JJHDb/5xUJRWXZRTDdkMxs5Z1n/FMNWF1OqG06axon9
	Ij7ApRFbC+o8IDgDRlldjMa1LR4SIo2u39Qqc0J1Iqd0naVxC0HxjjyjqtVh5RqGB9kp8MM+PpfwI
	Bfk/l07AbUef6Kn15MOCRT7oKJ2jl70ntTYjxDc5CfeHtKfYoAuJmdQJL4sQ2CVAGcUG8AiFtpiCN
	fqBwd8VAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kea6V-0003fR-QS; Mon, 16 Nov 2020 08:43:15 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kea6R-0003dW-85
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 08:43:12 +0000
Received: by mail-vs1-xe41.google.com with SMTP id f7so8704172vsh.10
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CKXWZoZd8QcdkzAVySC/eiJYHbKt+QMjTxLKQIPnmNY=;
 b=L3o8CJJIIYNqMEHzdr8KgW7ZkkgOFBCI8VX1mioeOJ3k58L9dtdLzGM0AWSuhtK8sd
 3RS2fKA9noFJ9Yti/ZlEaur2G8Uz/OOJ4cvxaC2FVxb1NiS+KNF9n1R3knsrOMQlnVA0
 RX+Y1KN6Iiu4HA5zPkISm9Utbe10GZBtszf1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CKXWZoZd8QcdkzAVySC/eiJYHbKt+QMjTxLKQIPnmNY=;
 b=mCoNdXI0NzcyupY1cIXW3bsbxaYDNOjV4arWVSkHDQtzG46ayqEpjQYNSSd9oKwWaa
 Eg8u+5S7tUMamZ7Q5IkMqJRI/wDbVnpEQob3kf5372S23dZCoj1qCHimyJr/XIjgr6Nd
 h/9TDPFoHiySyTqXMCfWQxbnp+vZOBX3iTMLktFQcZIkCf2Sbt23UTQtsEip1gKCKKgm
 dZoVDDBhT3LX/UosvWUZL7DvVogWNU0/3fYZpYxNUxOvE5N+EIKV5J3nFxG+/mX4ehVd
 zs55UvgpHmuufzFtWNNbE2DgfNOeO2JUccUhg1wOerxCSgWjtt/VbWyT941qYj+CH4fU
 Y24g==
X-Gm-Message-State: AOAM530ihEU+7MkOPTpTR5Hx1xTxIO0sH//efo9awuBhmnt+bN2fj1fG
 KxXL8S2aetc6Ui5DkpkcfYPLf73WjP9YwZuReaxwkQ==
X-Google-Smtp-Source: ABdhPJxOnfFqjublvcEGqBfUg6OiK+LATMc5qZd9s1aNgp/F8asGgvnGu3qq8bcqkc57U29ER3+Y3MQeOGiuYAq0tVM=
X-Received: by 2002:a67:2783:: with SMTP id n125mr7520035vsn.47.1605516189515; 
 Mon, 16 Nov 2020 00:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20201116082537.3287009-1-tzungbi@google.com>
 <20201116082537.3287009-2-tzungbi@google.com>
In-Reply-To: <20201116082537.3287009-2-tzungbi@google.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 16 Nov 2020 16:42:58 +0800
Message-ID: <CANMq1KA_4M3vLzA6aK++_0_StDD1f7O=Q9AsofeQzHWzFmVV6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc/mediatek: fix sparse errors on sram
 power on and off
To: Tzung-Bi Shih <tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_034311_382033_29B484D4 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kernel test robot <lkp@intel.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Guenter Roeck <groeck@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 4:26 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Fixes the following sparse errors on sram power on and off:
>
> On drivers/remoteproc/mtk_scp.c:306:17:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
>
> On drivers/remoteproc/mtk_scp.c:307:9:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
>
> On drivers/remoteproc/mtk_scp.c:314:9:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
>
> On drivers/remoteproc/mtk_scp.c:316:17:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 577cbd5d421e..8ed89ea1eb78 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -298,7 +298,7 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
>         return 0;
>  }
>
> -static void mt8192_power_on_sram(void *addr)
> +static void mt8192_power_on_sram(void __iomem *addr)
>  {
>         int i;
>
> @@ -307,7 +307,7 @@ static void mt8192_power_on_sram(void *addr)
>         writel(0, addr);
>  }
>
> -static void mt8192_power_off_sram(void *addr)
> +static void mt8192_power_off_sram(void __iomem *addr)
>  {
>         int i;
>
> --
> 2.29.2.299.gdc1121823c-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
