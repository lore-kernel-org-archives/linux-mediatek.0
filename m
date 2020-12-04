Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2048EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 10:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBC2122795
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 10:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBC2122795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6g/8F797BNmzYxvA6IYKEkEIiidyh8PqlS95hpS0wOs=; b=MSBgZomsGbrmUQRKXKNJ9zbQ2
	eByy/9R1WuKrAiGzmKzi7LJlLPKv8CdlA7fTScjnmcnlTnDKSvnuLZA41JTlFTccKNh9l+R/51w7n
	FcTpdztzax57bYWLo9aTorse3yabDc7A83/NbtKcM4wTVsO2PmOY9UPZn64AiNCOGEeU+TvY6+gvo
	w7k9AfoWThgwapQOrTX2hPSxBgcGJ2gIuaJpXGpJCXsZAN3BOxW1uwub0v5HmsNJkHQaGTdN3TZxc
	AXr4iLlGkvEZBINiHY0reX4FarFVqWINeMQCa+4G0TV9Fl1FXvqJjQXcVTJNMwZNO0xlAIdULUO9v
	pvtiOVUhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7vo-0005iY-WC; Fri, 04 Dec 2020 10:03:17 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7vk-0005h9-DS
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 10:03:13 +0000
Received: by mail-vs1-xe42.google.com with SMTP id w18so2912090vsk.12
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Dec 2020 02:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rcku4lPAn/y4YhBZdjYlkKZQc+t40+z/luVVG1YdFJI=;
 b=DHGwreClgzq5UgdvP5poTN7RLhMGva3+Muj5jp5VFGgimCmx9WYcK0eAsHiPKmOBvm
 fNIxvrpnxT7enGivLKac/vig8mhqLw+2Cr5Ryv3fxuRyEA+glFI9u5W3FH+lcviTWeGe
 gBc30+jMZuskqlYBYm3IDHW+cnGRkBk2GrNsHGWwfc0la+TFas3pa3GnvnDDDfrSJ5E/
 lbhQqn6JI6qM9R1x/J78C+8KnVayuEfKRieda9i6E3ekSvyEAadWUtTwn7t5ZCmq1hzh
 964NVr4rM402IWoljsqluvgZHAACwUvLsZ+XPrjLvLBmKS08Kc99fr5VRKqG48f1KGm8
 G7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rcku4lPAn/y4YhBZdjYlkKZQc+t40+z/luVVG1YdFJI=;
 b=Ol/hufzItWuvwi9OYrnnGS37BUgeCPqi5vw1J13lGlvBIK4q7H7KIvw27NIlB7xXIK
 oGxCNk/R9fdl8qIyml0nOPXzpngLvT4OKrE8EqMYkTmLQHGLgg92i/UI/hszzoC/PUJQ
 NtB8ZF67ESJV7pzB9wGFNn/cHZwW5LFfuYaghSZ4NwImI6Tg35tcSMEkN6tHX4x+ReV1
 37ACGzzDM1sMzfMXW6w3ThEvpFlQhgWEXcxDW8XBgzKgcsSJBciQIVWxhDO7gHBDiDJw
 /eFGxYASF6vc+oBD23aZJQTP1RIz3nFCnpn1h/uk9glJn6ZQ4IrgUkAAn0iA822tU8hh
 ovTg==
X-Gm-Message-State: AOAM532mncIRYCEwXAITVyRE309Uxav86jnetv0VeT3iMJVTIW2ciH8a
 BdnpQdnokSmFrWHa1H0t52ZBhnXvBhTyKgs47olbiyc3vCbY5NQS
X-Google-Smtp-Source: ABdhPJzF251m6Qz8Y2YtlC0BVJfa4JQ2d5vZe0SrIQHOSN0qQQLEJYfanTHuPYzxI3so5RnK5TCTPRNHPYoR6mFf9U4=
X-Received: by 2002:a67:fe85:: with SMTP id b5mr241341vsr.19.1607076189014;
 Fri, 04 Dec 2020 02:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20201203222922.1067522-1-arnd@kernel.org>
In-Reply-To: <20201203222922.1067522-1-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Dec 2020 11:02:32 +0100
Message-ID: <CAPDyKFqtFYqc8i_fVzOUnuZGJjtwjVLqE-vebtOKuYJ-4PrDBg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: mark PM functions as __maybe_unused
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_050312_504140_942B381F 
X-CRM114-Status: GOOD (  21.08  )
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
Cc: Marek Vasut <marex@denx.de>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yong mao <yong.mao@mediatek.com>, Amey Narkhede <ameynarkhede03@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 3 Dec 2020 at 23:29, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The #ifdef check for the suspend/resume functions is wrong:
>
> drivers/mmc/host/mtk-sd.c:2765:12: error: unused function 'msdc_suspend' [-Werror,-Wunused-function]
> static int msdc_suspend(struct device *dev)
> drivers/mmc/host/mtk-sd.c:2779:12: error: unused function 'msdc_resume' [-Werror,-Wunused-function]
> static int msdc_resume(struct device *dev)
>
> Remove the #ifdef and mark all four as __maybe_unused to aovid the
> problem.
>
> Fixes: c0a2074ac575 ("mmc: mediatek: Fix system suspend/resume support for CQHCI")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mmc/host/mtk-sd.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index d057fb11112a..de09c6347524 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2683,7 +2683,6 @@ static int msdc_drv_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM
>  static void msdc_save_reg(struct msdc_host *host)

Shouldn't msdc_save|restore_reg() be turned into "__maybe_unused" as well?

>  {
>         u32 tune_reg = host->dev_comp->pad_tune_reg;
> @@ -2742,7 +2741,7 @@ static void msdc_restore_reg(struct msdc_host *host)
>                 __msdc_enable_sdio_irq(host, 1);
>  }
>
> -static int msdc_runtime_suspend(struct device *dev)
> +static int __maybe_unused msdc_runtime_suspend(struct device *dev)
>  {
>         struct mmc_host *mmc = dev_get_drvdata(dev);
>         struct msdc_host *host = mmc_priv(mmc);
> @@ -2752,7 +2751,7 @@ static int msdc_runtime_suspend(struct device *dev)
>         return 0;
>  }
>
> -static int msdc_runtime_resume(struct device *dev)
> +static int __maybe_unused msdc_runtime_resume(struct device *dev)
>  {
>         struct mmc_host *mmc = dev_get_drvdata(dev);
>         struct msdc_host *host = mmc_priv(mmc);
> @@ -2762,7 +2761,7 @@ static int msdc_runtime_resume(struct device *dev)
>         return 0;
>  }
>
> -static int msdc_suspend(struct device *dev)
> +static int __maybe_unused msdc_suspend(struct device *dev)
>  {
>         struct mmc_host *mmc = dev_get_drvdata(dev);
>         int ret;
> @@ -2776,11 +2775,10 @@ static int msdc_suspend(struct device *dev)
>         return pm_runtime_force_suspend(dev);
>  }
>
> -static int msdc_resume(struct device *dev)
> +static int __maybe_unused msdc_resume(struct device *dev)
>  {
>         return pm_runtime_force_resume(dev);
>  }
> -#endif
>
>  static const struct dev_pm_ops msdc_dev_pm_ops = {

You may also change this to a __maybe_unused, as long as you also
assign the .pm pointer in the mt_msdc_driver with
pm_ptr(&msdc_dev_pm_ops).

Ideally the compiler should drop these functions/datas entirely then.

>         SET_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
> --
> 2.27.0
>

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
