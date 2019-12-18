Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853AEC43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 02:27:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 497AA21582
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 02:27:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WX0bTThF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCi55Za6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 497AA21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bc8I9z7jgLFnztvrO5lW0pnAfgDWXSqqAtkkbmq8Ams=; b=WX0bTThF6deCc5
	+CMc/Bl/m+WQaXt1ARFjKad+O8sQpwGeyqhb4fuzTqipSUv4ZITX5oDAeYnaoBkK39Vlh8pKiComK
	XJ0LMXqy5+GD8uzxZ8h/kDooBZnFbwEM93RYt/s/6hMHYYiA8XFuHHPOIhk7H7fT+VccAbDGMVVH+
	Nj1nPKzCcXftpH1MHreL6Ro5fkNH7Q2QjdRL/cVNliMeCeSnR2x4Dxg9n9TDn4PV5VBEPh8siGdF7
	887XH7D8fm5Hs/pef6Z/Z30AFw1yFPm2eDocDOLqjWNA5yfOBu1K94VEXcI2aiVQBkRYlZEaTl/TB
	1lTy4hmObphQ4n/7e97Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihP3r-0001CA-6n; Wed, 18 Dec 2019 02:27:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihP3a-00010B-7r; Wed, 18 Dec 2019 02:27:23 +0000
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8795824679;
 Wed, 18 Dec 2019 02:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576636041;
 bh=XXM1qIhv6mp83mUAwPbmy0ZfgUh12/5MVM64g+j5teY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hCi55Za6H6EHQPAD6URE8PGJGj3b8jufgHzcpYxUrTf1oOUk0J+qMQUm0sPJCtc7r
 6hqTkdqqH/VSIYUPWgFk0SWRXd5zDliUXY7JRQjWGD8UVI/Jkk3JvuQlCMV4fucBh3
 b39jAE0qN9Y0vhBvTYjp72lV3E2ydN0Rtg9KqVu8=
Received: by mail-wr1-f50.google.com with SMTP id c14so561837wrn.7;
 Tue, 17 Dec 2019 18:27:21 -0800 (PST)
X-Gm-Message-State: APjAAAUdafRhupAvPkorn9W6inWc5ipH7bgjxmcaAbo/lkAhEL+KwgI0
 i4eY0O7Ghj8y65TxtobuP9g8jOoEwbS38Br8IO4=
X-Google-Smtp-Source: APXvYqx5UqcfQ1FFJHQCZKd5vBjgfL46TLBnUHJQVj6I1P5C7P5qttyGdV5lMniGCCRpoGO06aEnPCSAImq8qwlk310=
X-Received: by 2002:adf:81e3:: with SMTP id 90mr1054120wra.23.1576636040002;
 Tue, 17 Dec 2019 18:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Dec 2019 10:27:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64uQr6JKCbhY+iMd___bLedvSOMTffg=JDX-pOZHY+sbw@mail.gmail.com>
Message-ID: <CAGb2v64uQr6JKCbhY+iMd___bLedvSOMTffg=JDX-pOZHY+sbw@mail.gmail.com>
Subject: Re: [PATCH 01/13] mmc: sunxi-mmc: convert to
 devm_platform_ioremap_resource
To: Yangtao Li <tiny.windzz@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_182722_306554_5AC1BE76 
X-CRM114-Status: GOOD (  15.57  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, geert+renesas@glider.be,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Kevin Hilman <khilman@baylibre.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andy Gross <agross@kernel.org>, chaotian.jing@mediatek.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 wsa+renesas@sang-engineering.com, Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 ben-linux@fluff.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, nico@fluxnic.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 yoshihiro.shimoda.uh@renesas.com, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 manuel.lauss@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 16, 2019 at 1:51 AM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---

Acked-by: Chen-Yu Tsai <wens@csie.org>

>  drivers/mmc/host/sunxi-mmc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index d577a6b0ceae..f87d7967457f 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1273,8 +1273,7 @@ static int sunxi_mmc_resource_request(struct sunxi_mmc_host *host,
>         if (ret)
>                 return ret;
>
> -       host->reg_base = devm_ioremap_resource(&pdev->dev,
> -                             platform_get_resource(pdev, IORESOURCE_MEM, 0));
> +       host->reg_base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(host->reg_base))
>                 return PTR_ERR(host->reg_base);
>
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
