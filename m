Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77D3C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:50:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B14720708
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aHFGq0xW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlZQMRY/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B14720708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xzvAeB+maam8/od2jFMLk8cGRm225dhaszQdCFNqToQ=; b=aHFGq0xW1xGMFNKfLPaLK5FCE
	8eFpXTn+cRG5HgT3vCptYwYguCoZJne1oaPQfgKfqnYpRij9v+mbm9JoyiX3ed3aovCJGi26Krbh+
	949IY2w+3xAa5/qVUhO15DwMcWvfUx2d8UrUqf+5OWyRHnEpWxYHhjytqPHSHGC25+eOmfvMtXWpO
	iaH8LHFHip8i/4XBmli+n8g9HaO0xdTarPP692g18juT89U8HJcOZfiTZlqg4p1g8sXh4EKHwrqa8
	CG4cLM6T5KGlsjHeFwdxpmar7SafCDzkWJe79D/e1cA2jMDv7NBpH/Q69gM3wu5CsWLhc+6ww42DX
	uppRzQOlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQhX-0006mi-2n; Thu, 24 Sep 2020 12:50:19 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQhL-0006kV-Aw
 for linux-mediatek@lists.infradead.org; Thu, 24 Sep 2020 12:50:10 +0000
Received: by mail-vk1-xa41.google.com with SMTP id b4so853521vkh.9
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hnddfcAzp662iEl9KigyhAvJGdoz9QK4/ZZLC6F3MuI=;
 b=xlZQMRY/W4OFxyVddObGTDk8bcDCpTmP1fowScD0Jvkc7oKkv8FhAQeWy84N0ZhaaY
 l0MEjrvF7f37MKPhcwIXhYAEmGqug8Nw60tauSSIH2yxOmM1/FBKpVEIwV6Rkjb20072
 ZwEIHztTW/h7JqoMbwMlh/YI9WMDKUlMb2YI2Kl3lhT8iPudIz1unzhSjuqLc++YqdKZ
 OBiNYVbbuahv8M38nQk22HELN0PKptaVM1193XDg//gXbEj+E6zuc7xitgEOmMpf/RV6
 IDHCrQjbK+0hJKj647yLJZL4Obq/DPhiiIw+PB45RPCELHQGYBD1heQXwnJA4y3Y+ay7
 U2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hnddfcAzp662iEl9KigyhAvJGdoz9QK4/ZZLC6F3MuI=;
 b=cT7a17T3xDyJGDkfZ3IWB2FDPxZFDLB3b8QreRAJGEDEvMAYZh6c1ISrKjwfC3IUH2
 6cn6rRjhdydreSIrKbAMfXmfQVOF4F3t46Obzs7V7XtLfw6G1FquplUGW31gwY+F7OfR
 N9eU/M5mipQkxRL7JWXZWOTdNWS0B6a+FPmOvJKm9s71UoB3mcVrvSG6StsO9l4FPDLG
 L5J/eiyJDlE26DW2zPc9CLKFfUEhkMn3DYlEud7+HinJsPWpyQtIjZFBMjVW9XDnHHms
 dKWzmS4iZ7UOeh5zr3JXd1lMNecsGbA08YeLZAULGSSKkRTZNU7P0KC2j0XDwHbxz7ps
 Uu7A==
X-Gm-Message-State: AOAM531SZGfFYMoEiES3lrTuASrPddJ8ITSDPTFN/IlQhgQXbPX8dYQk
 9W9mLqTHJUFJpK2kB3fZl48izsSvJupql0d9n6fUEg==
X-Google-Smtp-Source: ABdhPJweLqRrdU4UiHF3cqaQwdwaRlMidr3x1EIzZx4rQiO8mqdv36WK/R/dBPN87yGM7Plfjouym0SxRYLsTorW5Ik=
X-Received: by 2002:ac5:cced:: with SMTP id k13mr3485134vkn.7.1600951805106;
 Thu, 24 Sep 2020 05:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200917192624.548720-1-ameynarkhede03@gmail.com>
In-Reply-To: <20200917192624.548720-1-ameynarkhede03@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Sep 2020 14:49:27 +0200
Message-ID: <CAPDyKFoJYGMcjykaBLy3uwWws87cp2Fc9xYBqe+9bcK8S4q9Ug@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: Drop pointer to mmc_host from msdc_host
To: Amey Narkhede <ameynarkhede03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_085007_449479_4F9846F4 
X-CRM114-Status: GOOD (  23.63  )
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
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 17 Sep 2020 at 21:27, Amey Narkhede <ameynarkhede03@gmail.com> wrote:
>
> The MediaTek MMC driver uses  pointer to get from private
> msdc_host structure to the generic mmc_host structure.
> However mmc_host always precedes msdc_host in memory so compute
> its address with a subtraction (which is cheaper than a dereference)
> using mmc_from_priv() and drop the extra pointer.
>
> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 45 ++++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b0c27944db7f..bbd9064e3e4a 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -397,7 +397,6 @@ struct msdc_delay_phase {
>  struct msdc_host {
>         struct device *dev;
>         const struct mtk_mmc_compatible *dev_comp;
> -       struct mmc_host *mmc;   /* mmc structure */
>         int cmd_rsp;
>
>         spinlock_t lock;
> @@ -734,14 +733,15 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_request *mrq)
>
>  static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
>  {
> +       struct mmc_host *mmc = mmc_from_priv(host);
>         u64 timeout, clk_ns;
>         u32 mode = 0;
>
> -       if (host->mmc->actual_clock == 0) {
> +       if (mmc->actual_clock == 0) {
>                 timeout = 0;
>         } else {
>                 clk_ns  = 1000000000ULL;
> -               do_div(clk_ns, host->mmc->actual_clock);
> +               do_div(clk_ns, mmc->actual_clock);
>                 timeout = ns + clk_ns - 1;
>                 do_div(timeout, clk_ns);
>                 timeout += clks;
> @@ -802,6 +802,7 @@ static void msdc_ungate_clock(struct msdc_host *host)
>
>  static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>  {
> +       struct mmc_host *mmc = mmc_from_priv(host);
>         u32 mode;
>         u32 flags;
>         u32 div;
> @@ -811,7 +812,7 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>         if (!hz) {
>                 dev_dbg(host->dev, "set mclk to 0\n");
>                 host->mclk = 0;
> -               host->mmc->actual_clock = 0;
> +               mmc->actual_clock = 0;
>                 sdr_clr_bits(host->base + MSDC_CFG, MSDC_CFG_CKPDN);
>                 return;
>         }
> @@ -890,7 +891,7 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>         while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
>                 cpu_relax();
>         sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_CKPDN);
> -       host->mmc->actual_clock = sclk;
> +       mmc->actual_clock = sclk;
>         host->mclk = hz;
>         host->timing = timing;
>         /* need because clk changed. */
> @@ -901,7 +902,7 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>          * mmc_select_hs400() will drop to 50Mhz and High speed mode,
>          * tune result of hs200/200Mhz is not suitable for 50Mhz
>          */
> -       if (host->mmc->actual_clock <= 52000000) {
> +       if (mmc->actual_clock <= 52000000) {
>                 writel(host->def_tune_para.iocon, host->base + MSDC_IOCON);
>                 if (host->top_base) {
>                         writel(host->def_tune_para.emmc_top_control,
> @@ -932,7 +933,7 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>                 sdr_set_field(host->base + tune_reg,
>                               MSDC_PAD_TUNE_CMDRRDLY,
>                               host->hs400_cmd_int_delay);
> -       dev_dbg(host->dev, "sclk: %d, timing: %d\n", host->mmc->actual_clock,
> +       dev_dbg(host->dev, "sclk: %d, timing: %d\n", mmc->actual_clock,
>                 timing);
>  }
>
> @@ -967,6 +968,7 @@ static inline u32 msdc_cmd_find_resp(struct msdc_host *host,
>  static inline u32 msdc_cmd_prepare_raw_cmd(struct msdc_host *host,
>                 struct mmc_request *mrq, struct mmc_command *cmd)
>  {
> +       struct mmc_host *mmc = mmc_from_priv(host);
>         /* rawcmd :
>          * vol_swt << 30 | auto_cmd << 28 | blklen << 16 | go_irq << 15 |
>          * stop << 14 | rw << 13 | dtype << 11 | rsptyp << 7 | brk << 6 | opcode
> @@ -993,7 +995,7 @@ static inline u32 msdc_cmd_prepare_raw_cmd(struct msdc_host *host,
>                 struct mmc_data *data = cmd->data;
>
>                 if (mmc_op_multi(opcode)) {
> -                       if (mmc_card_mmc(host->mmc->card) && mrq->sbc &&
> +                       if (mmc_card_mmc(mmc->card) && mrq->sbc &&
>                             !(mrq->sbc->arg & 0xFFFF0000))
>                                 rawcmd |= 0x2 << 28; /* AutoCMD23 */
>                 }
> @@ -1070,9 +1072,10 @@ static int msdc_auto_cmd_done(struct msdc_host *host, int events,
>   */
>  static void msdc_recheck_sdio_irq(struct msdc_host *host)
>  {
> +       struct mmc_host *mmc = mmc_from_priv(host);
>         u32 reg_int, reg_inten, reg_ps;
>
> -       if (host->mmc->caps & MMC_CAP_SDIO_IRQ) {
> +       if (mmc->caps & MMC_CAP_SDIO_IRQ) {
>                 reg_inten = readl(host->base + MSDC_INTEN);
>                 if (reg_inten & MSDC_INTEN_SDIOIRQ) {
>                         reg_int = readl(host->base + MSDC_INT);
> @@ -1080,7 +1083,7 @@ static void msdc_recheck_sdio_irq(struct msdc_host *host)
>                         if (!(reg_int & MSDC_INT_SDIOIRQ ||
>                               reg_ps & MSDC_PS_DATA1)) {
>                                 __msdc_enable_sdio_irq(host, 0);
> -                               sdio_signal_irq(host->mmc);
> +                               sdio_signal_irq(mmc);
>                         }
>                 }
>         }
> @@ -1113,7 +1116,7 @@ static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
>                 msdc_unprepare_data(host, mrq);
>         if (host->error)
>                 msdc_reset_hw(host);
> -       mmc_request_done(host->mmc, mrq);
> +       mmc_request_done(mmc_from_priv(host), mrq);
>         if (host->dev_comp->recheck_sdio_irq)
>                 msdc_recheck_sdio_irq(host);
>  }
> @@ -1500,6 +1503,7 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
>
>  static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
>  {
> +       struct mmc_host *mmc = mmc_from_priv(host);
>         int cmd_err = 0, dat_err = 0;
>
>         if (intsts & MSDC_INT_RSPCRCERR) {
> @@ -1523,12 +1527,13 @@ static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
>                         cmd_err, dat_err, intsts);
>         }
>
> -       return cqhci_irq(host->mmc, 0, cmd_err, dat_err);
> +       return cqhci_irq(mmc, 0, cmd_err, dat_err);
>  }
>
>  static irqreturn_t msdc_irq(int irq, void *dev_id)
>  {
>         struct msdc_host *host = (struct msdc_host *) dev_id;
> +       struct mmc_host *mmc = mmc_from_priv(host);
>
>         while (true) {
>                 unsigned long flags;
> @@ -1551,18 +1556,18 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
>                 spin_unlock_irqrestore(&host->lock, flags);
>
>                 if ((events & event_mask) & MSDC_INT_SDIOIRQ)
> -                       sdio_signal_irq(host->mmc);
> +                       sdio_signal_irq(mmc);
>
>                 if ((events & event_mask) & MSDC_INT_CDSC) {
>                         if (host->internal_cd)
> -                               mmc_detect_change(host->mmc, msecs_to_jiffies(20));
> +                               mmc_detect_change(mmc, msecs_to_jiffies(20));
>                         events &= ~MSDC_INT_CDSC;
>                 }
>
>                 if (!(events & (event_mask & ~MSDC_INT_SDIOIRQ)))
>                         break;
>
> -               if ((host->mmc->caps2 & MMC_CAP2_CQE) &&
> +               if ((mmc->caps2 & MMC_CAP2_CQE) &&
>                     (events & MSDC_INT_CMDQ)) {
>                         msdc_cmdq_irq(host, events);
>                         /* clear interrupts */
> @@ -2434,7 +2439,6 @@ static int msdc_drv_probe(struct platform_device *pdev)
>
>         host->dev = &pdev->dev;
>         host->dev_comp = of_device_get_match_data(&pdev->dev);
> -       host->mmc = mmc;
>         host->src_clk_freq = clk_get_rate(host->src_clk);
>         /* Set host parameters to mmc */
>         mmc->ops = &mt_msdc_ops;
> @@ -2475,7 +2479,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
>         mmc_dev(mmc)->dma_mask = &host->dma_mask;
>
>         if (mmc->caps2 & MMC_CAP2_CQE) {
> -               host->cq_host = devm_kzalloc(host->mmc->parent,
> +               host->cq_host = devm_kzalloc(mmc->parent,
>                                              sizeof(*host->cq_host),
>                                              GFP_KERNEL);
>                 if (!host->cq_host) {
> @@ -2560,7 +2564,7 @@ static int msdc_drv_remove(struct platform_device *pdev)
>         pm_runtime_get_sync(host->dev);
>
>         platform_set_drvdata(pdev, NULL);
> -       mmc_remove_host(host->mmc);
> +       mmc_remove_host(mmc);
>         msdc_deinit_hw(host);
>         msdc_gate_clock(host);
>
> @@ -2572,7 +2576,7 @@ static int msdc_drv_remove(struct platform_device *pdev)
>         dma_free_coherent(&pdev->dev, MAX_BD_NUM * sizeof(struct mt_bdma_desc),
>                         host->dma.bd, host->dma.bd_addr);
>
> -       mmc_free_host(host->mmc);
> +       mmc_free_host(mmc);
>
>         return 0;
>  }
> @@ -2607,6 +2611,7 @@ static void msdc_save_reg(struct msdc_host *host)
>
>  static void msdc_restore_reg(struct msdc_host *host)
>  {
> +       struct mmc_host *mmc = mmc_from_priv(host);
>         u32 tune_reg = host->dev_comp->pad_tune_reg;
>
>         writel(host->save_para.msdc_cfg, host->base + MSDC_CFG);
> @@ -2631,7 +2636,7 @@ static void msdc_restore_reg(struct msdc_host *host)
>                 writel(host->save_para.pad_tune, host->base + tune_reg);
>         }
>
> -       if (sdio_irq_claimed(host->mmc))
> +       if (sdio_irq_claimed(mmc))
>                 __msdc_enable_sdio_irq(host, 1);
>  }
>
> --
> 2.28.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
