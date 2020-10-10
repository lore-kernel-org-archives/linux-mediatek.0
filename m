Return-Path: <SRS0=AZ7y=DR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05362C433E7
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 09:18:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78992207C4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 09:18:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QPz3vcmj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TMP0Xzqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78992207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qwj8ttvZVyAkvnlc9IJYR6UPkYIcwSFtqG4veQRA8ts=; b=QPz3vcmjPSUUKKYtrm84cNNRx
	TdR3ecQWmSjV9zPX8FqdEmQmDwTBZfCi03KTeW4QyZJK6CnwZR7q8p5HJiuRKaLy/6ROVQ7Z5JR62
	tLIc95pgycuD1GqnZ1GchdJSk/YXdd6ZPxZAGQJUpngNpISieHg+kKDihmW/Xh+NYmqofRl8IeECR
	vzfFT4YDorbvvor0kRkMQ/+r1oVUne6rELgqyCudf6oWZpaQO0GqP5fECHcTxvo/i28T6Zu/gCXsg
	ILSi1+KZK55CNN2WHo/bk/i/1ANPr9C9QejL5SBrQeeWAJPWPQDZqTfGigLJ0KNt0fLpJO3wQTGZw
	WfYm1RyTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRB1T-0001UZ-Su; Sat, 10 Oct 2020 09:18:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRB1N-0001Tp-4A; Sat, 10 Oct 2020 09:18:35 +0000
X-UUID: 100cc763e9824346b7069aec65f8c1a0-20201010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=H+ln7qIH6WhzfS8WeSevzwzddMMkN7urwrkqmKBrJkk=; 
 b=TMP0Xzqg0/AlemBSuJbg5oKE+XfYCJoLmsNfSo+jgOzTpRQQwdADzJwvVzI5vUU/BNmlkuMmT2Zov6Z/thCmhCmCm1cafqEZktorabDhtHuC80/Kd3+yFTAigynxbwcztn+ZgEcSOUDxCG+bx4AiOHgZj6wuoG34NGZZ37sON3k=;
X-UUID: 100cc763e9824346b7069aec65f8c1a0-20201010
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1926140442; Sat, 10 Oct 2020 01:18:25 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Oct 2020 02:18:24 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 10 Oct 2020 17:18:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Oct 2020 17:18:18 +0800
Message-ID: <1602321500.11947.6.camel@mhfsdcap03>
Subject: Re: [PATCH v3 4/4] mmc: mediatek: Add subsys clock control for
 MT8192 msdc
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 10 Oct 2020 17:18:20 +0800
In-Reply-To: <CANMq1KCQ9x1kgME3dAQmGzjUoqkNLuWGS4dG07qhNKQ3N=o_dw@mail.gmail.com>
References: <20200930083120.11971-1-wenbin.mei@mediatek.com>
 <20200930083120.11971-5-wenbin.mei@mediatek.com>
 <CANMq1KCQ9x1kgME3dAQmGzjUoqkNLuWGS4dG07qhNKQ3N=o_dw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 28E61ED4929A78886AAEC66E902D7BDF49F75B5965520A77CC1E21997464EA852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_051833_602090_EA8A5B23 
X-CRM114-Status: GOOD (  32.12  )
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
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-10-01 at 14:14 +0800, Nicolas Boichat wrote:
> On Wed, Sep 30, 2020 at 4:31 PM Wenbin Mei <wenbin.mei@mediatek.com> wrote:
> >
> > MT8192 msdc is an independent sub system, we need control more bus
> > clocks for it.
> > Add support for the additional subsys clocks to allow it to be
> > configured appropriately.
> >
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > ---
> >  drivers/mmc/host/mtk-sd.c | 77 ++++++++++++++++++++++++++++++---------
> >  1 file changed, 59 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index a704745e5882..9a1422955593 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -425,6 +425,8 @@ struct msdc_host {
> >         struct clk *h_clk;      /* msdc h_clk */
> >         struct clk *bus_clk;    /* bus clock which used to access register */
> >         struct clk *src_clk_cg; /* msdc source clock control gate */
> > +       struct clk *sys_clk_cg; /* msdc subsys clock control gate */
> > +       struct clk_bulk_data bulk_clks[3];      /* pclk, axi, ahb clock control gate */
> >         u32 mclk;               /* mmc subsystem clock frequency */
> >         u32 src_clk_freq;       /* source clock frequency */
> >         unsigned char timing;
> > @@ -784,6 +786,8 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
> >
> >  static void msdc_gate_clock(struct msdc_host *host)
> >  {
> > +       clk_bulk_disable_unprepare(ARRAY_SIZE(host->bulk_clks),
> > +                                  host->bulk_clks);
> >         clk_disable_unprepare(host->src_clk_cg);
> >         clk_disable_unprepare(host->src_clk);
> >         clk_disable_unprepare(host->bus_clk);
> > @@ -792,10 +796,17 @@ static void msdc_gate_clock(struct msdc_host *host)
> >
> >  static void msdc_ungate_clock(struct msdc_host *host)
> >  {
> > +       int ret;
> > +
> >         clk_prepare_enable(host->h_clk);
> >         clk_prepare_enable(host->bus_clk);
> >         clk_prepare_enable(host->src_clk);
> >         clk_prepare_enable(host->src_clk_cg);
> > +       ret = clk_bulk_prepare_enable(ARRAY_SIZE(host->bulk_clks),
> > +                                     host->bulk_clks);
> > +       if (ret)
> > +               dev_dbg(host->dev, "enable clks failed!\n");
> 
> dev_err looks a lot more appropriate. Also, don't you want to exit the
> function in that case, rather than going to the while loop below where
> you may get stuck?
> 
I will change it in the next version.
> > +
> >         while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
> >                 cpu_relax();
> >  }
> > @@ -2366,6 +2377,52 @@ static void msdc_of_property_parse(struct platform_device *pdev,
> >                 host->cqhci = false;
> >  }
> >
> > +static int msdc_of_clock_parse(struct platform_device *pdev,
> > +                              struct msdc_host *host)
> > +{
> > +       struct clk *clk;
> > +
> > +       host->src_clk = devm_clk_get(&pdev->dev, "source");
> > +       if (IS_ERR(host->src_clk))
> > +               return PTR_ERR(host->src_clk);
> > +
> > +       host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > +       if (IS_ERR(host->h_clk))
> > +               return PTR_ERR(host->h_clk);
> > +
> > +       host->bus_clk = devm_clk_get(&pdev->dev, "bus_clk");
> > +       if (IS_ERR(host->bus_clk))
> > +               host->bus_clk = NULL;
> 
> Use devm_clk_get_optional instead (ditto for the next 2).
> 
> > +
> > +       /*source clock control gate is optional clock*/
> > +       host->src_clk_cg = devm_clk_get(&pdev->dev, "source_cg");
> > +       if (IS_ERR(host->src_clk_cg))
> > +               host->src_clk_cg = NULL;
> > +
> > +       host->sys_clk_cg = devm_clk_get(&pdev->dev, "sys_cg");
> > +       if (IS_ERR(host->sys_clk_cg))
> > +               host->sys_clk_cg = NULL;
> > +       else
> > +               clk_prepare_enable(host->sys_clk_cg);
> 
> This doesn't need to be in an else branch, calling clk_prepare_enable
> on a NULL clock is fine.
I will change it in the next version.
> 
> However, is it expected that this clock is turned on forever after
> probe?! At the very least, the clock should be disabled in
> msdc_drv_remove, but, really, I think it should be enabled as needed,
> like the other clocks, in msdc_gate_clock?
> 
This clock gate can not be closed, if it is closed, it can not be
accessed and can not be opened again.
So it is expected that this clock is turned on forever after probe.
> > +
> > +       clk = devm_clk_get(&pdev->dev, "pclk_cg");
> > +       if (IS_ERR(clk))
> > +               clk = NULL;
> > +       host->bulk_clks[0].clk = clk;
> > +
> > +       clk = devm_clk_get(&pdev->dev, "axi_cg");
> > +       if (IS_ERR(clk))
> > +               clk = NULL;
> > +       host->bulk_clks[1].clk = clk;
> > +
> > +       clk = devm_clk_get(&pdev->dev, "ahb_cg");
> > +       if (IS_ERR(clk))
> > +               clk = NULL;
> > +       host->bulk_clks[2].clk = clk;
> 
> Use devm_clk_bulk_get_optional for these 3.
> 
I will change it in the next version.
> > +
> > +       return 0;
> > +}
> > +
> >  static int msdc_drv_probe(struct platform_device *pdev)
> >  {
> >         struct mmc_host *mmc;
> > @@ -2405,25 +2462,9 @@ static int msdc_drv_probe(struct platform_device *pdev)
> >         if (ret)
> >                 goto host_free;
> >
> > -       host->src_clk = devm_clk_get(&pdev->dev, "source");
> > -       if (IS_ERR(host->src_clk)) {
> > -               ret = PTR_ERR(host->src_clk);
> > -               goto host_free;
> > -       }
> > -
> > -       host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > -       if (IS_ERR(host->h_clk)) {
> > -               ret = PTR_ERR(host->h_clk);
> > +       ret = msdc_of_clock_parse(pdev, host);
> > +       if (ret)
> >                 goto host_free;
> > -       }
> > -
> > -       host->bus_clk = devm_clk_get(&pdev->dev, "bus_clk");
> > -       if (IS_ERR(host->bus_clk))
> > -               host->bus_clk = NULL;
> > -       /*source clock control gate is optional clock*/
> > -       host->src_clk_cg = devm_clk_get(&pdev->dev, "source_cg");
> > -       if (IS_ERR(host->src_clk_cg))
> > -               host->src_clk_cg = NULL;
> >
> >         host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> >                                                                 "hrst");
> > --
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
