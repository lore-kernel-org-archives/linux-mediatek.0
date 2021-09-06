Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B917C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 17:11:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34BA660F21
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 17:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34BA660F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xu9vOP78PX0dCNzrj6LHrQwfUpLlh0i2eakIOuRr5UM=; b=16JVp5N27ZpQE3
	FUHclv88f4uuQZsbwFG94UhnQuGCd+82HJbaIR/uaTe0E7S2n6aTVoha3HGPfv0sMefm9X1B3OCwH
	1CA7xPFq/F1Ywd1RJEiOYkPlfMd+EM64LtgfQCpZ2Z2jlU+y+h+Oh4OIEiEis1MwhyoOdEr8q3o1Y
	VoDxMvZfKu3EnnddKGki5uhiFPlayYZgKUGMC2OkE7zEs3vS1R7xOd32qlNkqUypI6iFnWi5MufG4
	MsSUH3GSbRvF0UR8EqEsDVJYbf6qYV6ay5yar+aNIsripqMeL7C+6CuUpl3RDnUNoV63jVwVvN2Xc
	cUF8DsNvqcc+cV8ucjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNI8s-001Odi-7A; Mon, 06 Sep 2021 17:10:46 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNI8f-001Oa3-3Y
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 17:10:34 +0000
Received: by mail-lf1-x134.google.com with SMTP id h16so14501955lfk.10
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=noINKmz3hzTGqq034jTZ5E+LdSOi2uYpC/Rle/66Vl4=;
 b=iYuhyd4uCzT8/2bOYiqWul/nZlbxsr1/PhzUk73eDC6N2l4dLguCZl2MbY01uzkgRA
 RbG+L1yM5kQiLZ3pmvpdIhRjJBRqnBNohvQRqQT5f/4IxftO5212RnLbyNyxomeQl1r4
 CY7+Y360ktzEFLIeLa4nSSw+fMsv8wixGi6JYB2AwTsc7yjcHeBazmWagk7Sd+oqZxn9
 7xxvydbz7tR3J+hjS3d9gRdPT9RbxBce8cRBPn1kkEL2cU4C3WlUjvgTiIbgrzWRV7Qx
 4NPpu9hltTXmywS3o97zRq+1YeB8PUdWLZKz4w0/MZR2JiX7yjgZk8jDSkxu7+AaJt8P
 hkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=noINKmz3hzTGqq034jTZ5E+LdSOi2uYpC/Rle/66Vl4=;
 b=L2F8RHOFraDVuJj9BT/qGZgzegVzFrc8XyQmLruwOh/2n8oMo0eJyXo5lLwW7QFcjP
 mzqJD3BU1KgHH+dL8d58Q9S+J3lSBmkMUCg9416e/p6FRNORNjN+xNtZxuw7yQGxTU1d
 lgiUBvEU5Dffv4UfbAN51iH1w+KebgAiCQTvRJcbxX3jRx3l0cmnFkIuQxMl7BTsX6CU
 +EzZ10Z5rKORxXBt9kvBl7vpj+XosGZX7e3EH4Vxqgk3oN8mYUX3Mzgy6ieFt9+pguLr
 0DPheFCI8oRJF6DRogyW5mY7JmscRl4dqbxKmIPYnI4EgdZcbB7yrDgHnpsDnrpR2k3t
 XQlw==
X-Gm-Message-State: AOAM530FRfppP/+tVgf8m3kIzfOdPvyGm7cLFP+7lh27zmYwGxsy2R7S
 Pl118gH4YSfKSu1ncVcsmAcvDFWhzsSm7PoruCRzWw==
X-Google-Smtp-Source: ABdhPJxlhFOEzJRlkJCRsUZZ2Q4TuaOmHRL8uGNY7RMU3fpBcQJG/A6CDs3tVr/JkHXbcvF9vj/fRKk5UtWSuPkrEEo=
X-Received: by 2002:a05:6512:3ca5:: with SMTP id
 h37mr10177779lfv.254.1630948230961; 
 Mon, 06 Sep 2021 10:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210827071537.1034-1-derong.liu@mediatek.com>
In-Reply-To: <20210827071537.1034-1-derong.liu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 6 Sep 2021 19:09:54 +0200
Message-ID: <CAPDyKFpubTas6HMe=uzqJyQuQS9TRnDGuGjaS80ymjevN_CFMQ@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: mediatek: add wait dma stop done flow
To: Derong Liu <derong.liu@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 wsp_upstream@mediatek.com, Peng Zhou <peng.zhou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_101033_192024_88FB73D5 
X-CRM114-Status: GOOD (  19.17  )
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

On Fri, 27 Aug 2021 at 09:15, Derong Liu <derong.liu@mediatek.com> wrote:
>
> We found this issue on a 5G platform, during CMDQ error handling, if DMA status is active when it call msdc_reset_hw, it means mmc host hw reset and DMA transfer will be parallel, mmc host may access sram region unexpectedly.
> According to the programming guide of mtk mmc host, it needs to wait for dma stop done after set dma stop.
> This change should be applied to all SoCs.
>
> Change-Id: I9b87523f19b24ca73958bbcb83bb418413c5a180

I am dropping this tag.

> Signed-off-by: Derong Liu <derong.liu@mediatek.com>

Applied for next, thanks! I guess we should also tag this for stable
kernels, right?

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4dfc246c5f95..b99330bad6a5 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/iopoll.h>
>  #include <linux/ioport.h>
>  #include <linux/irq.h>
>  #include <linux/of_address.h>
> @@ -2330,6 +2331,7 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
>  static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>  {
>         struct msdc_host *host = mmc_priv(mmc);
> +       unsigned int val = 0;
>
>         /* disable cmdq irq */
>         sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INT_CMDQ);
> @@ -2339,6 +2341,9 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>         if (recovery) {
>                 sdr_set_field(host->base + MSDC_DMA_CTRL,
>                               MSDC_DMA_CTRL_STOP, 1);
> +               if (WARN_ON(readl_poll_timeout(host->base + MSDC_DMA_CFG, val,
> +                       !(val & MSDC_DMA_CFG_STS), 1, 3000)))
> +                       return;
>                 msdc_reset_hw(host);
>         }
>  }
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
