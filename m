Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A54C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:39:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C7562074F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o0V19kmQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GvYw6qfj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C7562074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1FfEg2yRT9owOU8FcrKM9PwvTYJmgwAfNhcvHMVsRqw=; b=o0V19kmQFQAPEjXvpzDThvxRo
	J0H79ZlUMnxJ8moEY8bWdv0moUA2wMZZpkiT3Ktp39it9C0f7aRAx17dcPKVxntAgs0ffEDLb63Fy
	KQH8V1uNH5cQCVFOBMmJ5grNrAcu5MZYEZPrpppGbLgLEGRZgF6dQaTeYruFLqXterECS3AY3UaOM
	m+UvTlQ2TQnxwp+C7LIJo/yHKDPy/XFt4VfKFNn1Csc53mNVURuEVH7NPDnAoLfq8GEwyLL2/O9Gq
	+krp40i8a46TIBHDg8L3dETNIFVCh/HCtRt5cpOL+ffbxxcADQyhocMWk08JcqYeS+EzMtlBU1CrO
	rKST09aFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRog2-0001Jk-Ub; Mon, 12 Oct 2020 03:39:10 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRofy-0001I7-Rv
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 03:39:08 +0000
Received: by mail-vk1-xa43.google.com with SMTP id z10so3539868vkn.0
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2020 20:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KiuyMjRQI4UrLg1n7cKhKKhLAfvoAgBKOZvduZBf0aY=;
 b=GvYw6qfjah6oj28Zd4TyigWyNPLHWgTmQXGUKHFCNco3JwK1pqqfGb+tdfWgJV/aHj
 S+h2hbUt0Q0CInYosoIAWUWuaIun06dlEqgLRbo4SauF9qtCc8cq4Z0radiQB0tk3mmI
 IDt/gz0+D1P3VfbCMkRdwLcOAADZSidrs9f3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KiuyMjRQI4UrLg1n7cKhKKhLAfvoAgBKOZvduZBf0aY=;
 b=eAPg5qbqz2OSwHKn/J9ZHTCpU8s4KA37UMhCto0b+TIxPhoAV2TMqprdTrvGJ+d+WA
 d6Y+47J0x3m0Ge1mXae6DKpKJY38aauJLEKJEneMWCjNnXsEtrp7HJK0ZVUI+YZ2HkeG
 duCi4ik5lAU2prp3cumVjFNBy299V3VhAJ4+dvzWZw4Tkll17N290ToDjxqueIiqXrVQ
 KiSUGv6yorCPadKTSQW5tr6OftFDaO5flBaCR06/903c7Rr9IC+2gYuymsNUsyr5GVtW
 z2aMKhXimOjxFBg2LFTyOAY2/zZ3J9Jp6GjPB9nHqTZQ4m9uKg3z8wQlZGmPRYpPoeqM
 1NTg==
X-Gm-Message-State: AOAM5332p1ln2IGNMyzcqCdCRgtfG1Q9bis/Dfy2lbEyEkCaq9NQ2heB
 FwgzJKhc5nvMjQ5Ysqa7QHjmbpCQTVdg9okReuN5Qg==
X-Google-Smtp-Source: ABdhPJwKOiKNGLkhvGKapg/FgDio242ur83cmC2L2lxBLQ0SOgKJTlTt6djxWtCGfhAXNv6m7RcdvSnXNsZSIZ3S6+c=
X-Received: by 2002:a05:6122:7c7:: with SMTP id
 l7mr2639856vkr.17.1602473944804; 
 Sun, 11 Oct 2020 20:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201012024345.8361-1-wenbin.mei@mediatek.com>
 <20201012024345.8361-5-wenbin.mei@mediatek.com>
In-Reply-To: <20201012024345.8361-5-wenbin.mei@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 12 Oct 2020 11:38:53 +0800
Message-ID: <CANMq1KD5MRvAiwk+EPfOTqaEqjcXz5FUAvmkX+OjQ=kpEP_=8A@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] mmc: mediatek: Add subsys clock control for MT8192
 msdc
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_233906_922117_0CE0C186 
X-CRM114-Status: GOOD (  28.16  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, linux-mmc@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks for the quick turnaround.

And sorry, I should have noticed these issues in my previous pass.

On Mon, Oct 12, 2020 at 10:44 AM Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> MT8192 msdc is an independent sub system, we need control more bus
> clocks for it.
> Add support for the additional subsys clocks to allow it to be
> configured appropriately.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 74 +++++++++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a704745e5882..41703e6d6b17 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -35,6 +35,7 @@
>  #include "cqhci.h"
>
>  #define MAX_BD_NUM          1024
> +#define MSDC_NR_CLOCKS      3
>
>  /*--------------------------------------------------------------------------*/
>  /* Common Definition                                                        */
> @@ -425,6 +426,8 @@ struct msdc_host {
>         struct clk *h_clk;      /* msdc h_clk */
>         struct clk *bus_clk;    /* bus clock which used to access register */
>         struct clk *src_clk_cg; /* msdc source clock control gate */
> +       struct clk *sys_clk_cg; /* msdc subsys clock control gate */
> +       struct clk_bulk_data bulk_clks[MSDC_NR_CLOCKS];
>         u32 mclk;               /* mmc subsystem clock frequency */
>         u32 src_clk_freq;       /* source clock frequency */
>         unsigned char timing;
> @@ -784,6 +787,7 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
>
>  static void msdc_gate_clock(struct msdc_host *host)
>  {
> +       clk_bulk_disable_unprepare(MSDC_NR_CLOCKS, host->bulk_clks);
>         clk_disable_unprepare(host->src_clk_cg);
>         clk_disable_unprepare(host->src_clk);
>         clk_disable_unprepare(host->bus_clk);
> @@ -792,10 +796,18 @@ static void msdc_gate_clock(struct msdc_host *host)
>
>  static void msdc_ungate_clock(struct msdc_host *host)
>  {
> +       int ret;
> +
>         clk_prepare_enable(host->h_clk);
>         clk_prepare_enable(host->bus_clk);
>         clk_prepare_enable(host->src_clk);
>         clk_prepare_enable(host->src_clk_cg);
> +       ret = clk_bulk_prepare_enable(MSDC_NR_CLOCKS, host->bulk_clks);
> +       if (ret) {
> +               dev_err(host->dev, "Cannot enable pclk/axi/ahb clock gates\n");
> +               return;
> +       }

It's a bit odd that we only care about the last 3 clocks... Should we
return early if any of the clocks can't be enabled? Changing the
behaviour for the other clocks should be in another patch though.

> +
>         while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
>                 cpu_relax();
>  }
> @@ -2366,6 +2378,48 @@ static void msdc_of_property_parse(struct platform_device *pdev,
>                 host->cqhci = false;
>  }
>
> +static int msdc_of_clock_parse(struct platform_device *pdev,
> +                              struct msdc_host *host)
> +{
> +       int ret;
> +
> +       host->src_clk = devm_clk_get_optional(&pdev->dev, "source");

I think you want devm_clk_get, as the previous version of the code
does not make this clock optional.

> +       if (IS_ERR(host->src_clk))
> +               return PTR_ERR(host->src_clk);
> +
> +       host->h_clk = devm_clk_get_optional(&pdev->dev, "hclk");

ditto, devm_clk_get

> +       if (IS_ERR(host->h_clk))
> +               return PTR_ERR(host->h_clk);
> +
> +       host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
> +       if (IS_ERR(host->bus_clk))
> +               host->bus_clk = NULL;

This is consistent with previous behaviour, but this looks wrong. If
the clock exists (!= NULL return value), but you get an error, you
should return that error. This belongs in another patch though.

> +
> +       /*source clock control gate is optional clock*/
> +       host->src_clk_cg = devm_clk_get_optional(&pdev->dev, "source_cg");
> +       if (IS_ERR(host->src_clk_cg))
> +               host->src_clk_cg = NULL;
> +
> +       host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
> +       if (IS_ERR(host->sys_clk_cg))
> +               host->sys_clk_cg = NULL;
> +
> +       /* If present, always enable for this clock gate */
> +       clk_prepare_enable(host->sys_clk_cg);
> +
> +       host->bulk_clks[0].id = "pclk_cg";
> +       host->bulk_clks[1].id = "axi_cg";
> +       host->bulk_clks[2].id = "ahb_cg";
> +       ret = devm_clk_bulk_get_optional(&pdev->dev, MSDC_NR_CLOCKS,
> +                                        host->bulk_clks);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Cannot get pclk/axi/ahb clock gates\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int msdc_drv_probe(struct platform_device *pdev)
>  {
>         struct mmc_host *mmc;
> @@ -2405,25 +2459,9 @@ static int msdc_drv_probe(struct platform_device *pdev)
>         if (ret)
>                 goto host_free;
>
> -       host->src_clk = devm_clk_get(&pdev->dev, "source");
> -       if (IS_ERR(host->src_clk)) {
> -               ret = PTR_ERR(host->src_clk);
> -               goto host_free;
> -       }
> -
> -       host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> -       if (IS_ERR(host->h_clk)) {
> -               ret = PTR_ERR(host->h_clk);
> +       ret = msdc_of_clock_parse(pdev, host);
> +       if (ret)
>                 goto host_free;
> -       }
> -
> -       host->bus_clk = devm_clk_get(&pdev->dev, "bus_clk");
> -       if (IS_ERR(host->bus_clk))
> -               host->bus_clk = NULL;
> -       /*source clock control gate is optional clock*/
> -       host->src_clk_cg = devm_clk_get(&pdev->dev, "source_cg");
> -       if (IS_ERR(host->src_clk_cg))
> -               host->src_clk_cg = NULL;
>
>         host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
>                                                                 "hrst");
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
