Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C9CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 10:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFCAB610D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 10:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFCAB610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MrP7isxO6cbUg5CH/fa1EiVHZ66NBbZLK4P+PTvMo0=; b=zUJSV616/js/w2
	NV+GtVNmEYtijupM+ZTBiUVov0hLq2iuP6u4gvMDQUjSTpows7AuAzdsYjaOL7FIsSEmphrxB4wkH
	p+pT6MSlU+iPpfHI8M4BBQlPtaIPC3p74kWn5JatmyIJnJH54SNFF9p0XGpapYn5aj1pmTCP12YlA
	r18j/uXhEuNa8e6b1xwhTk/a65VKHcFA5BnS32xrNf129uDHYVrvdtWv5r1Mlcr2MyjE99lLaJXiR
	kx6AxryJmqpfWOVgDphn/Z0zUNq4zmyd1wJ8rIp59fyKa0qtqJRQkYFoBXMyfsOo3/8ZJ0vmzNblN
	HwReHc3n3SymeGsSko1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg2Dq-007SmH-UI; Thu, 28 Oct 2021 10:01:22 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg2Dc-007Sgg-V7
 for linux-mediatek@lists.infradead.org; Thu, 28 Oct 2021 10:01:10 +0000
Received: by mail-lj1-x234.google.com with SMTP id u5so9689674ljo.8
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Oct 2021 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fSUUXSAFp+U/pzk0ZFFpNl+pmZUQiHZI7Km2UPBgzxo=;
 b=pyIEuQfNSMvWaNLN4sXO6MGPdFJpMAFX/V8Vn8qMhLNzrgXfippjXKeKDerh0YjsyA
 5zJn7MNZHNZ1qb/mkLWiMtNDvLViR3JI/44RxloJPwcBxfyqdZ+YZn3XtnjbxEnWdeCF
 oH4tqXjy1QIcOtTY6iBFWJaSihr9CGTa7luZZEOj6Fp6qgzZR8vMz4o3Zt/HfvVvazNY
 g8Wy5QOhBD0LdnPBnL2ZlFko2KwmA+VfMcCgLZeImT46c2F5ifBBlsf4f/hXLAKLaINP
 RhDXWzKBA/GH1ZdLCh/odbLVryNdOWeYi6/0z0cGAHJL2ZBOOrdQrNH8qqGkstHdDf4m
 NQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSUUXSAFp+U/pzk0ZFFpNl+pmZUQiHZI7Km2UPBgzxo=;
 b=y+ZRcKDyhRp4Z5awZPhdTBa5QpQ1p22vuWgmLRro4Tu1XvO56Jm4GCqFe+oFOOJFdd
 QEUqHeg4IMvxKopFqbZePCg28AlZje6IDm1YBGCBsfevfyKpdAjrfKA9jZ85yz0eLMaL
 qkzDN9h+fIqkTX4gn3IqmrjM2OvRO3KgPpE8mgM+mTsuz2c4UgC553vmHPBC6ypGc6+e
 mazEobIfG0B+Z8dhF03eUggc8XzQniQv6ADLUaO8ErQx6xk1NRIXY38t6tgjCJaxk/f3
 saTtYGBQE7U8+8Jfsfa3CX/CSAsMAnsiwvvHW1HVeXaKhzsS8uLIl0GT0f6Iid66rUmc
 sMuw==
X-Gm-Message-State: AOAM532u8hwZnqhEm9n61ZUmtcmknO6XjVB4nPC277vKrN8hzzEu042T
 4bgcvpmA8uX1cKQL4Iwmul9x6pzm04kL1EcgQu1y4w==
X-Google-Smtp-Source: ABdhPJxluntOhxdxK38z3qCSthne3EvWdVhekoNo1AufTq1f5b0lSX4qPbjRU8qzy2AYU+QFtnq4Te9kDWr177reDPc=
X-Received: by 2002:a05:651c:907:: with SMTP id
 e7mr3774078ljq.300.1635415267227; 
 Thu, 28 Oct 2021 03:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211028022049.22129-1-wenbin.mei@mediatek.com>
In-Reply-To: <20211028022049.22129-1-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 28 Oct 2021 12:00:30 +0200
Message-ID: <CAPDyKFpcPDKmL-MCsXssX2ABVQ3LnMQVM+pG1=z68_b4d6bPBA@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: move cqhci init behind ungate clock
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Chun-Hung Wu <chun-hung.wu@mediatek.com>, Yong Mao <yong.mao@mediatek.com>, 
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream@mediatek.com, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_030109_013193_CBA2E28B 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 28 Oct 2021 at 04:20, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> We must enable clock before cqhci init, because crypto needs
> read information from CQHCI registers, otherwise, it will hang
> in MediaTek mmc host controller.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Fixes: 88bd652b3c74 ("mmc: mediatek: command queue support")
> Cc: stable@vger.kernel.org

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b124cfee05a1..943940b44e83 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2656,6 +2656,25 @@ static int msdc_drv_probe(struct platform_device *pdev)
>                 host->dma_mask = DMA_BIT_MASK(32);
>         mmc_dev(mmc)->dma_mask = &host->dma_mask;
>
> +       host->timeout_clks = 3 * 1048576;
> +       host->dma.gpd = dma_alloc_coherent(&pdev->dev,
> +                               2 * sizeof(struct mt_gpdma_desc),
> +                               &host->dma.gpd_addr, GFP_KERNEL);
> +       host->dma.bd = dma_alloc_coherent(&pdev->dev,
> +                               MAX_BD_NUM * sizeof(struct mt_bdma_desc),
> +                               &host->dma.bd_addr, GFP_KERNEL);
> +       if (!host->dma.gpd || !host->dma.bd) {
> +               ret = -ENOMEM;
> +               goto release_mem;
> +       }
> +       msdc_init_gpd_bd(host, &host->dma);
> +       INIT_DELAYED_WORK(&host->req_timeout, msdc_request_timeout);
> +       spin_lock_init(&host->lock);
> +
> +       platform_set_drvdata(pdev, mmc);
> +       msdc_ungate_clock(host);
> +       msdc_init_hw(host);
> +
>         if (mmc->caps2 & MMC_CAP2_CQE) {
>                 host->cq_host = devm_kzalloc(mmc->parent,
>                                              sizeof(*host->cq_host),
> @@ -2676,25 +2695,6 @@ static int msdc_drv_probe(struct platform_device *pdev)
>                 mmc->max_seg_size = 64 * 1024;
>         }
>
> -       host->timeout_clks = 3 * 1048576;
> -       host->dma.gpd = dma_alloc_coherent(&pdev->dev,
> -                               2 * sizeof(struct mt_gpdma_desc),
> -                               &host->dma.gpd_addr, GFP_KERNEL);
> -       host->dma.bd = dma_alloc_coherent(&pdev->dev,
> -                               MAX_BD_NUM * sizeof(struct mt_bdma_desc),
> -                               &host->dma.bd_addr, GFP_KERNEL);
> -       if (!host->dma.gpd || !host->dma.bd) {
> -               ret = -ENOMEM;
> -               goto release_mem;
> -       }
> -       msdc_init_gpd_bd(host, &host->dma);
> -       INIT_DELAYED_WORK(&host->req_timeout, msdc_request_timeout);
> -       spin_lock_init(&host->lock);
> -
> -       platform_set_drvdata(pdev, mmc);
> -       msdc_ungate_clock(host);
> -       msdc_init_hw(host);
> -
>         ret = devm_request_irq(&pdev->dev, host->irq, msdc_irq,
>                                IRQF_TRIGGER_NONE, pdev->name, host);
>         if (ret)
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
