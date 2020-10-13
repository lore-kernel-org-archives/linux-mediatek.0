Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D4DC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:59:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1409A205CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="idzo6p+5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oe3z23rb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1409A205CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GWbhOxK2TNDt9CaHoZLM2Gsk5vXap0aGHxRhrLjlbCk=; b=idzo6p+5Snu0yfOpVfpQoDNY+
	6hx0IJpJtMBEeeHh7Kns0pi101kTV/BPpVXJtGCHJSxuXpnGv+FxPkq1rc1nMroofzrpwj0k20wVI
	Tzc2FFC1SI7SihaNsTjF/wTYmEZu8Ac9XD2+HrBIr4mE+UIK6IOIDdJN1e3B2c4L62/rjmIG08ZrB
	MlBmihpitC+xOdk5f3zVDS0EENndqQi/m2U1LSWj3j15FnBc+j7fIr2DQk7q6xJ8EtE45lMcs5KbN
	GkFs1mL/vbf4/dNO4AzLARWmpj53ex80IoMUO0PHgrzSaRl2Yhj9JjZJRvhgGe6WfbbkVZH6zPJaD
	pj9sRAKdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSH5j-0007bJ-J1; Tue, 13 Oct 2020 09:59:35 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSH5f-0007ZU-71
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 09:59:32 +0000
Received: by mail-vs1-xe44.google.com with SMTP id u7so10681375vsq.11
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=94e1CygScgMia7B1GgYR76qDGeMl52sMlW+hZME3L4E=;
 b=Oe3z23rbXIRkPOg82eMRmptX/YGV1GSl80yu3tMF44SgpnJUFRyH31DYBPIeVvMPbO
 AkwaV7uoeoe8eL6jpyuuD7tl6V9On+NalcDWYZrADnmQE3CVirR1MxF9bnSYWP5zvdt7
 UyHnP7uTg6EDTd42K4QoytRC2rUs9qG0VKTtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94e1CygScgMia7B1GgYR76qDGeMl52sMlW+hZME3L4E=;
 b=VlrCSPqgO4EjUa+gdFe3jjRH+iovuUnsW4kUYy9GbbMDza/qZchDN6JpiX5BTMkVZr
 yA5W8QRi04ppijXcg0P5NH9q3PLYZN4ecxGeeRKF+8fHSEIhPzwO298dfm2MbjK4R12n
 WBNLZpZzbi6LriWMddy9iJvtyMIWL6GuW87lCYQ7CmJZyImtbgwb4X1+iYdXm/glic/B
 ksSmh8TizeVDosQBmV1PUp/ZiUP9bnk7EDC+EJ6zmX/1oexiITSU9n01lbsbW59xSAXE
 XxLFcPuCnq5pBWUs4OuA8PjPgd43qhQaKclM4it52Lttu6tA/e91WTQ2/sjD05DdtMAV
 yuVQ==
X-Gm-Message-State: AOAM533Z6Qo1US55OzQaZwOsJ0ZTFOsW9gPawSFKewqGJdX3d24MSqDt
 g8D8/qpR0H7ZOy0pMzkh5suV5/Qt78Iz89DKccpZ5g==
X-Google-Smtp-Source: ABdhPJzItTAowLdsnhfumm+mBqc+gsfN23zIOAuSGUeM3jKA7wqcYf+bd8TLqy7xqG0e3C5ExIM5O3X1OXfMhR8c9Fs=
X-Received: by 2002:a05:6102:237c:: with SMTP id
 o28mr15745607vsa.60.1602583167480; 
 Tue, 13 Oct 2020 02:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201012124547.16649-1-wenbin.mei@mediatek.com>
 <20201012124547.16649-5-wenbin.mei@mediatek.com>
In-Reply-To: <20201012124547.16649-5-wenbin.mei@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 13 Oct 2020 17:59:15 +0800
Message-ID: <CANMq1KAxY2gU4D6XUvq2SVGGq=8HpQ-uWWhgDBnymP=qSiuUDw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] mmc: mediatek: Add subsys clock control for MT8192
 msdc
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_055931_274931_888E9625 
X-CRM114-Status: GOOD (  24.63  )
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

On Mon, Oct 12, 2020 at 8:46 PM Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> MT8192 msdc is an independent sub system, we need control more bus
> clocks for it.
> Add support for the additional subsys clocks to allow it to be
> configured appropriately.
>

Looks ok now, but I'd still like to see 1 or 2 follow-up patches that:
 1. In msdc_ungate_clock: check all clk_prepare_enable return values
before busy looping (to be consistent with how you now handle
bulk_clks)
 2. In msdc_of_clock_parse: All these if(IS_ERR(clk)) clk = NULL;
should be replaced by if (IS_ERR(clk)) return PTR_ERR(clk);

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 74 +++++++++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a704745e5882..c7df7510f120 100644
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
> +       host->src_clk = devm_clk_get(&pdev->dev, "source");
> +       if (IS_ERR(host->src_clk))
> +               return PTR_ERR(host->src_clk);
> +
> +       host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> +       if (IS_ERR(host->h_clk))
> +               return PTR_ERR(host->h_clk);
> +
> +       host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
> +       if (IS_ERR(host->bus_clk))
> +               host->bus_clk = NULL;
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
