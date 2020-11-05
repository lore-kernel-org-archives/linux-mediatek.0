Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE86FC00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 13:00:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D217206D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 13:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQnc11qc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SraoIp6G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D217206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vRcDfh1y1HjZtCcOupsWrZhE6gfI1z3P1ihCzhjhzFQ=; b=BQnc11qcm3LgCKNY7S4Rcmqzy
	RDAXeDsCT+R8UJo+V1O2GdTxiW3vivsMUSiBH/XG1eyqhZS66FLPqnAh52wyu0ECzMk8kumt8A9RU
	zCOD6Gh/TqxhPe5iOjJDz+muceVejWziHJeofqo0QaaqHBKKwTj8RfCNoUlENVdB7JVf5+xV40r6s
	Byf2Qhr7pfIdRB8qBygnVnQxJ4eevff5u1+/b2U/IOkwek8XmwfU1eBxIWFJiAN8uOIDiIQjl8vCU
	L2GQK0kDrX/tSyqv9mSic58I2uZi99ZutUmDb931/ZrYEEyQRd4I3bxNo8YV+vn3A6PgIiFZ8ItOd
	T9ffRnb9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaesF-0005zg-BT; Thu, 05 Nov 2020 13:00:19 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaerp-0005pX-GO
 for linux-mediatek@lists.infradead.org; Thu, 05 Nov 2020 12:59:59 +0000
Received: by mail-ua1-x944.google.com with SMTP id q4so477371ual.8
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2020 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WT1MvSlztZlc1FZ5Asxkhe1NYZezAK9LnhK1vwgJmXo=;
 b=SraoIp6GVcQVkv/M8F+b5/a1obllwuyTigrdn6SG8CQ4oTWM2I3D4/w1z1XoKddci4
 Mj8+kvwiLLFykFKvzijWne63PuKBXEVHEV2dQirGZeDWNKUvAgYdG8GeKEVFzDI5xGOJ
 lE+WkS0HVDlLyyt4ybARSfIuMoBZJvZIyoK74/GNeYLjQo3KEMHWoHUU53XptSRhP7Us
 EYG5C3AXS6ncwALJF7yGYpeZozD9WPSPCunnttAtiiv6xJ9eUNK6uEkvfrWvqnjNFtK7
 kdB+BylGReXaV6UsK0XguHSE7tIsnM7HZlejUmbhxTcgizc/StgRSSWjn/ZuVL0e29Or
 i0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WT1MvSlztZlc1FZ5Asxkhe1NYZezAK9LnhK1vwgJmXo=;
 b=mNXm9scdm/c9oOKxU4ffI+z/ScRhBBJIRqaFdjQHLQAwc9DLWgtDUIvg/77qspoVqf
 UQhgL3G56uCFtYAJnVTxVgw/5Ps36Y8eaec9rHEr2g1Q5t6LSyK3cB4r1ncxgryJqDst
 Rr9Z3AHj92xnvr6dsozE0Evmzuwuk8s4i7o0qO+J0VwFZLCmRPttSbGDQ+qT4q8lVSes
 kLFAwrv3ue6W0pL0XJqR5y2hYTiUq3jfkDE/dA1jvAYAyku4trwpLc1jtrSnoWXrStCM
 qjYqMBgvyzvDsgSZslRuMbofpPj5C9xnKd6KzMS+C+QMX+UsvLd4a7hVtBxTzhu6dDf/
 gx7g==
X-Gm-Message-State: AOAM531fSd/ypwcSbXiFM34CiUmzI+kpxzPPAowSujy0emYYMwSIX6nq
 Tuwj/icGtvaQiwVRjkMuUXyPn7wJvQhkEfdX6dm6Kg==
X-Google-Smtp-Source: ABdhPJw0Ws5JxTx6vxeo66/SjiEPxXO12VwIiiEbeCglmyTuCgwCugyFQ5EdHVJLN7WAkJdswMXD1NoWU6xFViluqAo=
X-Received: by 2002:ab0:23d5:: with SMTP id c21mr816639uan.129.1604581191469; 
 Thu, 05 Nov 2020 04:59:51 -0800 (PST)
MIME-Version: 1.0
References: <20201102092822.5301-1-wenbin.mei@mediatek.com>
 <20201102092822.5301-2-wenbin.mei@mediatek.com>
In-Reply-To: <20201102092822.5301-2-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Nov 2020 13:59:15 +0100
Message-ID: <CAPDyKFpej4T=-kaEMz6nzJxeYUfJVXzHckVr-LhwvZhuU68Y4w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] mmc: mediatek: add HS400 enhanced strobe support
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_075953_698912_67BA3E4D 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2 Nov 2020 at 10:29, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> Add support for HS400ES mode to MediaTek MMC Card Driver.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 40 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index f7f68623fefc..fc5ee5df91ad 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -78,9 +78,12 @@
>  #define MSDC_PAD_TUNE0   0xf0
>  #define PAD_DS_TUNE      0x188
>  #define PAD_CMD_TUNE     0x18c
> +#define EMMC51_CFG0     0x204
>  #define EMMC50_CFG0      0x208
> +#define EMMC50_CFG1      0x20c
>  #define EMMC50_CFG3      0x220
>  #define SDC_FIFO_CFG     0x228
> +#define CQHCI_SETTING   0x7fc
>
>  /*--------------------------------------------------------------------------*/
>  /* Top Pad Register Offset                                                  */
> @@ -261,15 +264,26 @@
>
>  #define PAD_CMD_TUNE_RX_DLY3     (0x1f << 1)  /* RW */
>
> +/* EMMC51_CFG0 mask */
> +#define CMDQ_RDAT_CNT            (0x3ff << 12) /* RW */
> +
>  #define EMMC50_CFG_PADCMD_LATCHCK (0x1 << 0)   /* RW */
>  #define EMMC50_CFG_CRCSTS_EDGE    (0x1 << 3)   /* RW */
>  #define EMMC50_CFG_CFCSTS_SEL     (0x1 << 4)   /* RW */
> +#define EMMC50_CFG_CMD_RESP_SEL   (0x1 << 9)   /* RW */
> +
> +/* EMMC50_CFG1 mask */
> +#define EMMC50_CFG1_DS_CFG        (0x1 << 28)  /* RW */
>
>  #define EMMC50_CFG3_OUTS_WR       (0x1f << 0)  /* RW */
>
>  #define SDC_FIFO_CFG_WRVALIDSEL   (0x1 << 24)  /* RW */
>  #define SDC_FIFO_CFG_RDVALIDSEL   (0x1 << 25)  /* RW */
>
> +/* CQHCI_SETTING */
> +#define CQHCI_RD_CMD_WND_SEL     (0x1 << 14) /* RW */
> +#define CQHCI_WR_CMD_WND_SEL     (0x1 << 15) /* RW */
> +
>  /* EMMC_TOP_CONTROL mask */
>  #define PAD_RXDLY_SEL           (0x1 << 0)      /* RW */
>  #define DELAY_EN                (0x1 << 1)      /* RW */
> @@ -2276,6 +2290,31 @@ static int msdc_get_cd(struct mmc_host *mmc)
>                 return !val;
>  }
>
> +static void msdc_hs400_enhanced_strobe(struct mmc_host *mmc,
> +                                      struct mmc_ios *ios)
> +{
> +       struct msdc_host *host = mmc_priv(mmc);
> +
> +       if (ios->enhanced_strobe) {
> +               msdc_prepare_hs400_tuning(mmc, ios);
> +               sdr_set_field(host->base + EMMC50_CFG0, EMMC50_CFG_PADCMD_LATCHCK, 1);
> +               sdr_set_field(host->base + EMMC50_CFG0, EMMC50_CFG_CMD_RESP_SEL, 1);
> +               sdr_set_field(host->base + EMMC50_CFG1, EMMC50_CFG1_DS_CFG, 1);
> +
> +               sdr_clr_bits(host->base + CQHCI_SETTING, CQHCI_RD_CMD_WND_SEL);
> +               sdr_clr_bits(host->base + CQHCI_SETTING, CQHCI_WR_CMD_WND_SEL);
> +               sdr_clr_bits(host->base + EMMC51_CFG0, CMDQ_RDAT_CNT);
> +       } else {
> +               sdr_set_field(host->base + EMMC50_CFG0, EMMC50_CFG_PADCMD_LATCHCK, 0);
> +               sdr_set_field(host->base + EMMC50_CFG0, EMMC50_CFG_CMD_RESP_SEL, 0);
> +               sdr_set_field(host->base + EMMC50_CFG1, EMMC50_CFG1_DS_CFG, 0);
> +
> +               sdr_set_bits(host->base + CQHCI_SETTING, CQHCI_RD_CMD_WND_SEL);
> +               sdr_set_bits(host->base + CQHCI_SETTING, CQHCI_WR_CMD_WND_SEL);
> +               sdr_set_field(host->base + EMMC51_CFG0, CMDQ_RDAT_CNT, 0xb4);
> +       }
> +}
> +
>  static void msdc_cqe_enable(struct mmc_host *mmc)
>  {
>         struct msdc_host *host = mmc_priv(mmc);
> @@ -2333,6 +2372,7 @@ static const struct mmc_host_ops mt_msdc_ops = {
>         .set_ios = msdc_ops_set_ios,
>         .get_ro = mmc_gpio_get_ro,
>         .get_cd = msdc_get_cd,
> +       .hs400_enhanced_strobe = msdc_hs400_enhanced_strobe,
>         .enable_sdio_irq = msdc_enable_sdio_irq,
>         .ack_sdio_irq = msdc_ack_sdio_irq,
>         .start_signal_voltage_switch = msdc_ops_switch_volt,
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
