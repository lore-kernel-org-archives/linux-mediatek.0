Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9B1C4727C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 06:14:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE35B21D7D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 06:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZxePeeP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nsKh9Smy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE35B21D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C2Il8X9HpC5Iivz/kc0wopMu5dglJuCeEGy0vmd7sNU=; b=nZxePeePrMjDZxyR2OY2tC5Yx
	znPJJKr0lcv6w2Zf3dewJpKkPEAB8V1tpDSL+DJrMpl71/RHGwyCo8NuzlKQd/DpnzVHqPmI5Q4el
	jvueWlWJ0923FNV7yV/rCJ/TibMiSRyLf4BRxLXHpYJyuA6T4U2Hjik+OkjFgbLiTWm0gItN6yVgB
	z21y+7wuGgxgrKkX4GfzbotwKk/u5W4eeH1JU0cfG/ouK9NHDedJhUZ0WgXcE79lfPFN8331kXypb
	zHypaG4Nh+KoEcWj206NtqUPAXoADX4jJfNMotyOZ3/M7hWSHCvhx7uMuebTANiognYcSu9DPLZ53
	N/bCG8WWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNrrD-000283-5Q; Thu, 01 Oct 2020 06:14:23 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNrr8-00025y-Ae
 for linux-mediatek@lists.infradead.org; Thu, 01 Oct 2020 06:14:19 +0000
Received: by mail-vs1-xe44.google.com with SMTP id 7so2074936vsp.6
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2020 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VlK25AeCqL3jo7oZoKivx7ZKCZnGaTWNtqH24P3Rx58=;
 b=nsKh9SmyYr6dFqhw75fYDL7n5mG3UUdgFMIuakzzITavWvq6EHjqF1X9nWwIt2r+wX
 ojx5yjM71XwFhwhBRKWEodxX/dyhQeHrEI6fO/7tXmPZCrQuvRAeuMTU8UkiYbAfYgfV
 y257KdPrMIfZeX9eyDP+cp0PpHAtvE9Vqtfko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VlK25AeCqL3jo7oZoKivx7ZKCZnGaTWNtqH24P3Rx58=;
 b=uNKbbCz7mQVtzUXs2S6rH+/uHAFaf1o1p3nue35cqz8pvCqtnP3cVzjtGu0z4xXLHb
 jkNxuJsuk8dZNcBUZW11HejAimGEVAXezKuLtclDOzzfrNY8XVLQc8mxT3gIa/QB96VB
 cXlSvAZKLGOA7crVKHoZOhm2ATnSbsNaGoTFzgRAwhzfswE3OXzxsyDNMBX+xJmJIUJy
 HnemZFTr+ghbzDDlSl00mKTLaJDfpDeXnUUUiNLbKSPBM1tKKMVxe6Crhy22ipUejwDt
 I4k6JToD4IYJ5mALqZS6Go1B2GF3eggAkbLjmhLSnbrkBExG61DrlLFHh9YsG+d2UZU4
 RaHw==
X-Gm-Message-State: AOAM530dzcbvNH5aN2O1kvapemqCBo56JjYsPBgwTiC3ZtaAbUot0v4s
 B0xnIciCdcRHPrWEBF4B9DAqh8ss1qLaAl7ZR4aUfA==
X-Google-Smtp-Source: ABdhPJxLXQQGLRLzY6RFBL5DI0m1HQoOFsQi0w8LIWHFTIqUlUJYtSC0vKE7KVqUO73TNfZ8033bmhNJ5nUfTYZXppE=
X-Received: by 2002:a67:be08:: with SMTP id x8mr4072437vsq.47.1601532853052;
 Wed, 30 Sep 2020 23:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200930083120.11971-1-wenbin.mei@mediatek.com>
 <20200930083120.11971-5-wenbin.mei@mediatek.com>
In-Reply-To: <20200930083120.11971-5-wenbin.mei@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 1 Oct 2020 14:14:02 +0800
Message-ID: <CANMq1KCQ9x1kgME3dAQmGzjUoqkNLuWGS4dG07qhNKQ3N=o_dw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mmc: mediatek: Add subsys clock control for MT8192
 msdc
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_021418_400636_16FF1DC7 
X-CRM114-Status: GOOD (  25.52  )
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

On Wed, Sep 30, 2020 at 4:31 PM Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> MT8192 msdc is an independent sub system, we need control more bus
> clocks for it.
> Add support for the additional subsys clocks to allow it to be
> configured appropriately.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 77 ++++++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a704745e5882..9a1422955593 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -425,6 +425,8 @@ struct msdc_host {
>         struct clk *h_clk;      /* msdc h_clk */
>         struct clk *bus_clk;    /* bus clock which used to access register */
>         struct clk *src_clk_cg; /* msdc source clock control gate */
> +       struct clk *sys_clk_cg; /* msdc subsys clock control gate */
> +       struct clk_bulk_data bulk_clks[3];      /* pclk, axi, ahb clock control gate */
>         u32 mclk;               /* mmc subsystem clock frequency */
>         u32 src_clk_freq;       /* source clock frequency */
>         unsigned char timing;
> @@ -784,6 +786,8 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
>
>  static void msdc_gate_clock(struct msdc_host *host)
>  {
> +       clk_bulk_disable_unprepare(ARRAY_SIZE(host->bulk_clks),
> +                                  host->bulk_clks);
>         clk_disable_unprepare(host->src_clk_cg);
>         clk_disable_unprepare(host->src_clk);
>         clk_disable_unprepare(host->bus_clk);
> @@ -792,10 +796,17 @@ static void msdc_gate_clock(struct msdc_host *host)
>
>  static void msdc_ungate_clock(struct msdc_host *host)
>  {
> +       int ret;
> +
>         clk_prepare_enable(host->h_clk);
>         clk_prepare_enable(host->bus_clk);
>         clk_prepare_enable(host->src_clk);
>         clk_prepare_enable(host->src_clk_cg);
> +       ret = clk_bulk_prepare_enable(ARRAY_SIZE(host->bulk_clks),
> +                                     host->bulk_clks);
> +       if (ret)
> +               dev_dbg(host->dev, "enable clks failed!\n");

dev_err looks a lot more appropriate. Also, don't you want to exit the
function in that case, rather than going to the while loop below where
you may get stuck?

> +
>         while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
>                 cpu_relax();
>  }
> @@ -2366,6 +2377,52 @@ static void msdc_of_property_parse(struct platform_device *pdev,
>                 host->cqhci = false;
>  }
>
> +static int msdc_of_clock_parse(struct platform_device *pdev,
> +                              struct msdc_host *host)
> +{
> +       struct clk *clk;
> +
> +       host->src_clk = devm_clk_get(&pdev->dev, "source");
> +       if (IS_ERR(host->src_clk))
> +               return PTR_ERR(host->src_clk);
> +
> +       host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> +       if (IS_ERR(host->h_clk))
> +               return PTR_ERR(host->h_clk);
> +
> +       host->bus_clk = devm_clk_get(&pdev->dev, "bus_clk");
> +       if (IS_ERR(host->bus_clk))
> +               host->bus_clk = NULL;

Use devm_clk_get_optional instead (ditto for the next 2).

> +
> +       /*source clock control gate is optional clock*/
> +       host->src_clk_cg = devm_clk_get(&pdev->dev, "source_cg");
> +       if (IS_ERR(host->src_clk_cg))
> +               host->src_clk_cg = NULL;
> +
> +       host->sys_clk_cg = devm_clk_get(&pdev->dev, "sys_cg");
> +       if (IS_ERR(host->sys_clk_cg))
> +               host->sys_clk_cg = NULL;
> +       else
> +               clk_prepare_enable(host->sys_clk_cg);

This doesn't need to be in an else branch, calling clk_prepare_enable
on a NULL clock is fine.

However, is it expected that this clock is turned on forever after
probe?! At the very least, the clock should be disabled in
msdc_drv_remove, but, really, I think it should be enabled as needed,
like the other clocks, in msdc_gate_clock?

> +
> +       clk = devm_clk_get(&pdev->dev, "pclk_cg");
> +       if (IS_ERR(clk))
> +               clk = NULL;
> +       host->bulk_clks[0].clk = clk;
> +
> +       clk = devm_clk_get(&pdev->dev, "axi_cg");
> +       if (IS_ERR(clk))
> +               clk = NULL;
> +       host->bulk_clks[1].clk = clk;
> +
> +       clk = devm_clk_get(&pdev->dev, "ahb_cg");
> +       if (IS_ERR(clk))
> +               clk = NULL;
> +       host->bulk_clks[2].clk = clk;

Use devm_clk_bulk_get_optional for these 3.

> +
> +       return 0;
> +}
> +
>  static int msdc_drv_probe(struct platform_device *pdev)
>  {
>         struct mmc_host *mmc;
> @@ -2405,25 +2462,9 @@ static int msdc_drv_probe(struct platform_device *pdev)
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
