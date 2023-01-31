Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D010C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 03:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZOfd2zx+NjgQww/0mU3ZaJ9v79cmnQrDykMgvyCyxY=; b=oWEDFcgmAqxw4aQgi4t+29GMY/
	hlWfcFvDF/gEQTs13j0f1HUrAevaOMziv3EVIOJcwDscWf7eyTBLJgZ2nJRLsuGJ3zGBrQ4pqNAkT
	O5tpo/s4gilWf2hg/k2UFUAT9zm1fcTMoKnaUa746iUDzsdJBV4/Zk8CqIqhkjASorIwfvElBbUdf
	Ni9kSmcd0l/BqUdOpIjV6jT/UcSUSHT5SO78GsnXZlHXl8Fb3Wt8q5jZYTWmJVlULcNzU2ghlDLaQ
	r+jTjNGjTBX0MMVTCmXo5tjfp2mH/bRxLU/j63EMJCDanju5il2M76L7LKDZCpXr7rhM5OB6ak/Ji
	1Y9EEuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMh1W-0068pt-Gq; Tue, 31 Jan 2023 03:09:30 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMh1L-0068oD-AZ; Tue, 31 Jan 2023 03:09:21 +0000
Received: by mail-qk1-x72a.google.com with SMTP id pj1so6004721qkn.3;
        Mon, 30 Jan 2023 19:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZOfd2zx+NjgQww/0mU3ZaJ9v79cmnQrDykMgvyCyxY=;
        b=mzAZo9UKt2apBG+a8Vk+YCpQ2F+UrwegjTc4F5sZHyb/tpmwnBW+FQVFlZv5cFkdTM
         Fj5UP+IddswiXOskayD5RsC7RdozQ/oVuxzQjiEoFOv7RVpn5VlS+ML+LDykzx778FmC
         /V2lnjbg+Ko3orxv1yk8tyX2llLuBqKo5OpnW8aKoMTvSPJRiTwVXKHWBqzzjnuuCWRx
         8iix8Y9x9v4Ox26Zxcq6BJ0ROZyd8tJ254zafSXx08PxCm/dqdecN3l20K/42ZKXn4mQ
         R9Lxt5ocxE65yPdm3kHMn2yRhfJuV4YCoutiqYVk/m3aJ6fpGygeHBrQjqS4CxJEzOmB
         hBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZOfd2zx+NjgQww/0mU3ZaJ9v79cmnQrDykMgvyCyxY=;
        b=nNjVrTA6B03cKywOBdGcGo4kjuro81yC4EGavTRReAvR7Cg7m1/cOyxzagp5awrS5D
         K5WbH8UPZGDURqn0yT3joj076yWk0oNPEVVTSJcvglnFjEmg0QtaQaWGn5svQfcRHF1k
         WpY8A0/gssCaA5vRFvnQU92nCubcpraA0VLfr15x1MlLmNx00aWBe0czgLV5OD1LTfQZ
         ezvsB7TRLQogzLrA2CUAmbtxnOA4C7WuYqrnYQjZMotbzrvNAM8kuGFQEi2hY3ndcas1
         p8kE9xDw7oDaEkqvJGEkND1kUFYDawpZ3edmUwi39xQ2HdTUaZL+JlajIdtB4O8MA9dZ
         yETg==
X-Gm-Message-State: AO0yUKVtQMmFKfL3PwJI64ewzxClDJbmvVTSvQOzE78W+PL4aSpzS+9i
	7gpOS/8+jVpBAk/ikRprGX0yVKrGiKuKqg4HsTg=
X-Google-Smtp-Source: AK7set/0nBTFpX0vgIbgrVXsLzjuAA5v6zMOAXCuo7yTj9cK+cCPb3/FTeGJLfxyzfnTCHWhJu0cPJPDYnef62asg/Y=
X-Received: by 2002:a05:620a:2042:b0:724:3c65:e6ee with SMTP id
 d2-20020a05620a204200b007243c65e6eemr206666qka.456.1675134557070; Mon, 30 Jan
 2023 19:09:17 -0800 (PST)
MIME-Version: 1.0
References: <20230130064656.106793-1-michael@allwinnertech.com>
In-Reply-To: <20230130064656.106793-1-michael@allwinnertech.com>
From: Wenchao Chen <wenchao.chen666@gmail.com>
Date: Tue, 31 Jan 2023 11:09:06 +0800
Message-ID: <CA+Da2qzJBxn5up1YLiaguhMJ=W7JkVExyyiFco9KyPE+3jEn8w@mail.gmail.com>
Subject: Re: [PATCH] mmc:mmc-cqhci:support interrupt coalescing
To: Michael Wu <michael@allwinnertech.com>
Cc: adrian.hunter@intel.com, riteshh@codeaurora.org, asutoshd@codeaurora.org, 
	ulf.hansson@linaro.org, chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	kdasu.kdev@gmail.com, alcooperx@gmail.com, f.fainelli@gmail.com, 
	haibo.chen@nxp.com, shawnguo@kernel.org, agross@kernel.org, 
	andersson@kernel.org, michal.simek@xilinx.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, bcm-kernel-feedback-list@broadcom.com, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	konrad.dybcio@linaro.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_190919_428957_C3A643E3 
X-CRM114-Status: GOOD (  22.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 30, 2023 at 2:49 PM Michael Wu <michael@allwinnertech.com> wrote:
>
> Support interrupt coalescing to reduce the frequency of mmc interrupts
>

Hi Michael
The CQIS register does not have any configuration.
Usually ICCTH needs to be enabled.

> Signed-off-by: Michael Wu <michael@allwinnertech.com>
> ---
>  drivers/mmc/host/cqhci-core.c      | 20 +++++++++++++++-----
>  drivers/mmc/host/cqhci.h           |  5 ++++-
>  drivers/mmc/host/mtk-sd.c          |  2 +-
>  drivers/mmc/host/sdhci-brcmstb.c   |  2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c |  2 +-
>  drivers/mmc/host/sdhci-msm.c       |  2 +-
>  drivers/mmc/host/sdhci-of-arasan.c |  2 +-
>  drivers/mmc/host/sdhci-pci-core.c  |  2 +-
>  drivers/mmc/host/sdhci-pci-gli.c   |  2 +-
>  drivers/mmc/host/sdhci-tegra.c     |  2 +-
>  drivers/mmc/host/sdhci_am654.c     |  2 +-
>  11 files changed, 28 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
> index b3d7d6d8d654..f9cdf9f04bfc 100644
> --- a/drivers/mmc/host/cqhci-core.c
> +++ b/drivers/mmc/host/cqhci-core.c
> @@ -420,7 +420,7 @@ static void cqhci_disable(struct mmc_host *mmc)
>  }
>
>  static void cqhci_prep_task_desc(struct mmc_request *mrq,
> -                                struct cqhci_host *cq_host, int tag)
> +                                struct cqhci_host *cq_host, int tag, int intr)
>  {
>         __le64 *task_desc = (__le64 __force *)get_desc(cq_host, tag);
>         u32 req_flags = mrq->data->flags;
> @@ -428,7 +428,7 @@ static void cqhci_prep_task_desc(struct mmc_request *mrq,
>
>         desc0 = CQHCI_VALID(1) |
>                 CQHCI_END(1) |
> -               CQHCI_INT(1) |
> +               CQHCI_INT(intr) |
>                 CQHCI_ACT(0x5) |
>                 CQHCI_FORCED_PROG(!!(req_flags & MMC_DATA_FORCED_PRG)) |
>                 CQHCI_DATA_TAG(!!(req_flags & MMC_DATA_DAT_TAG)) |
> @@ -621,7 +621,7 @@ static int cqhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         }
>
>         if (mrq->data) {
> -               cqhci_prep_task_desc(mrq, cq_host, tag);
> +               cqhci_prep_task_desc(mrq, cq_host, tag, (cq_host->intr_clsc ? 0 : 1));
>
>                 err = cqhci_prep_tran_desc(mrq, cq_host, tag);
>                 if (err) {
> @@ -812,7 +812,7 @@ static void cqhci_finish_mrq(struct mmc_host *mmc, unsigned int tag)
>  irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
>                       int data_error)
>  {
> -       u32 status;
> +       u32 status, rval;
>         unsigned long tag = 0, comp_status;
>         struct cqhci_host *cq_host = mmc->cqe_private;
>
> @@ -856,6 +856,15 @@ irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
>                 spin_unlock(&cq_host->lock);
>         }
>
> +       if (cq_host->intr_clsc) {
> +               rval = cqhci_readl(cq_host, CQHCI_IC);
> +               rval |= CQHCI_IC_RESET;
> +               cqhci_writel(cq_host, rval, CQHCI_IC);
> +               rval = cqhci_readl(cq_host, CQHCI_IC);
> +               rval &= (~CQHCI_IC_RESET);
> +               cqhci_writel(cq_host, rval, CQHCI_IC);
> +       }
> +
>         if (status & CQHCI_IS_TCL)
>                 wake_up(&cq_host->wait_queue);
>
> @@ -1172,11 +1181,12 @@ static unsigned int cqhci_ver_minor(struct cqhci_host *cq_host)
>  }
>
>  int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc,
> -             bool dma64)
> +             bool dma64, bool intr_clsc)
>  {
>         int err;
>
>         cq_host->dma64 = dma64;
> +       cq_host->intr_clsc = intr_clsc;
>         cq_host->mmc = mmc;
>         cq_host->mmc->cqe_private = cq_host;
>
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index ba9387ed90eb..acf90773c30a 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -227,6 +227,9 @@ struct cqhci_host {
>
>         /* 64 bit DMA */
>         bool dma64;
> +
> +       /* interrupt coalescing*/
> +       bool intr_clsc;
>         int num_slots;
>         int qcnt;
>
> @@ -312,7 +315,7 @@ struct platform_device;
>
>  irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
>                       int data_error);
> -int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64);
> +int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64, bool intr_clsc);
>  struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
>  int cqhci_deactivate(struct mmc_host *mmc);
>  static inline int cqhci_suspend(struct mmc_host *mmc)
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index edade0e54a0c..2c18f954d4b8 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2796,7 +2796,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
>                 host->cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>                 host->cq_host->mmio = host->base + 0x800;
>                 host->cq_host->ops = &msdc_cmdq_ops;
> -               ret = cqhci_init(host->cq_host, mmc, true);
> +               ret = cqhci_init(host->cq_host, mmc, true, false);
>                 if (ret)
>                         goto host_free;
>                 mmc->max_segs = 128;
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index f2cf3d70db79..4aeaeddbbf25 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -231,7 +231,7 @@ static int sdhci_brcmstb_add_host(struct sdhci_host *host,
>                 cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>         }
>
> -       ret = cqhci_init(cq_host, host->mmc, dma64);
> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>         if (ret)
>                 goto cleanup;
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 9e73c34b6401..7aef7abe71f1 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1712,7 +1712,7 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
>                 cq_host->mmio = host->ioaddr + ESDHC_CQHCI_ADDR_OFFSET;
>                 cq_host->ops = &esdhc_cqhci_ops;
>
> -               err = cqhci_init(cq_host, host->mmc, false);
> +               err = cqhci_init(cq_host, host->mmc, false, false);
>                 if (err)
>                         goto disable_ahb_clk;
>         }
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4ac8651d0b29..b6549d1e43ec 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2153,7 +2153,7 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>         if (ret)
>                 goto cleanup;
>
> -       ret = cqhci_init(cq_host, host->mmc, dma64);
> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>         if (ret) {
>                 dev_err(&pdev->dev, "%s: CQE init: failed (%d)\n",
>                                 mmc_hostname(host->mmc), ret);
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index 89c431a34c43..811f8686532d 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -1610,7 +1610,7 @@ static int sdhci_arasan_add_host(struct sdhci_arasan_data *sdhci_arasan)
>         if (dma64)
>                 cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>
> -       ret = cqhci_init(cq_host, host->mmc, dma64);
> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>         if (ret)
>                 goto cleanup;
>
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
> index c359f867df0a..6f6cae6355a7 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -964,7 +964,7 @@ static int glk_emmc_add_host(struct sdhci_pci_slot *slot)
>         if (dma64)
>                 cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>
> -       ret = cqhci_init(cq_host, host->mmc, dma64);
> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>         if (ret)
>                 goto cleanup;
>
> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pci-gli.c
> index 633a8ee8f8c5..6917ba339aa9 100644
> --- a/drivers/mmc/host/sdhci-pci-gli.c
> +++ b/drivers/mmc/host/sdhci-pci-gli.c
> @@ -908,7 +908,7 @@ static int gl9763e_add_host(struct sdhci_pci_slot *slot)
>         if (dma64)
>                 cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>
> -       ret = cqhci_init(cq_host, host->mmc, dma64);
> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>         if (ret)
>                 goto cleanup;
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index bff084f178c9..f98a468e8f43 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1620,7 +1620,7 @@ static int sdhci_tegra_add_host(struct sdhci_host *host)
>         if (dma64)
>                 cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>
> -       ret = cqhci_init(cq_host, host->mmc, dma64);
> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>         if (ret)
>                 goto cleanup;
>
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index 7ef828942df3..8e7fbee70e16 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -568,7 +568,7 @@ static int sdhci_am654_cqe_add_host(struct sdhci_host *host)
>
>         host->mmc->caps2 |= MMC_CAP2_CQE;
>
> -       return cqhci_init(cq_host, host->mmc, 1);
> +       return cqhci_init(cq_host, host->mmc, 1, false);
>  }
>
>  static int sdhci_am654_get_otap_delay(struct sdhci_host *host,
> --
> 2.29.0
>

