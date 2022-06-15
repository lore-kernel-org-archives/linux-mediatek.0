Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C47AC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S72eeZ+Row01YghjpUmWYlpXnQzipZvAzNu3EG7dF00=; b=AH2Up9xe7BHTOiLm9OVf8HWePi
	+iUL9URL6jn7JwZfM/2c0Lco9GRZkfHJcUIChI6V7md4aQVYf7LAAOaE3X+b3/MRITkBC9Vi7DN/7
	ydMmKNAd0KL5RZFftdwODya6AnTM7w6dOEOc3lyd2Pxa8cVJukiw4UeikUiC5Rl5A4LYn/GSz4guz
	rz1uzlg57pa9QCZrEjcmgNIilZhJtni9GabE9L/IVKvrZ0MSZ6HQTty0d5TI+c+rhTP16iW2zbp0N
	fw1Xb4HjdMopMnv8RuaGQsunzk/fr2I5leEiHe0D/Kn5cDOdD++ID2JMUfDZ8uS4Ybl2uzk7RxGJM
	uIdM/8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Wu5-00Fj6d-PD; Wed, 15 Jun 2022 17:34:05 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WtX-00Fipq-Nw
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 17:33:34 +0000
Received: by mail-lf1-x12d.google.com with SMTP id i29so20033900lfp.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S72eeZ+Row01YghjpUmWYlpXnQzipZvAzNu3EG7dF00=;
        b=BR3qLXEgSSszCU9YWAmUJhaphZlQ5NrNHteiKYjbK+3eDpYdpbKiVLT1w/vldEp4pX
         +HF40JInhIku0OCm/pOdQei11tBJSd/sRQUSYNpM6UN/1BGD3idJgDsdLM4C0SRFCv6E
         HoNKUp07pwCmLjoXQeiU114Pm9YDXswIn+4NLoS5hgo/iZEL57b2eJBPA3PM/6xysOVY
         mMge2aJD8FyIUZWDSDDQish4QwCdUPY6yELRZnKF3XriuSWdtZviiqnIRlJQrWUdKyOF
         jaIQfrEi6tdUacNli3heJhT73rzaeOu0mQ2qGtRexeFU8mNVMfB8LBgSLG7kNKAA31DF
         RkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S72eeZ+Row01YghjpUmWYlpXnQzipZvAzNu3EG7dF00=;
        b=kWJ/j4OYbclzhk3CawgCls7lDYayj3K9AMRkRQb7xfT9/78vrGVRmxR+rTyic3IUcM
         Z4SFqWVAh4rLPyeTsiT8ILorPw4YCyeeMpMzMnwqqImxHmWpEoW3GBvnFYLFNJgkPDp3
         Tu5nPP7f0lbI4nha99bKDT0lNpJHVBCTc8/e7oWVc+ias8O+4fPJ9d129v1udqay+5EV
         BbxviR7rrOwJhq+7HZdoiNR5tiqZaQq8t6n73nEqxMm/5PPKRdIq2I6f9IAeG1Z0lvYr
         pW5YtksMOfQcAvJSF+sVdFNzoTZIcg9tcAYTBjTWSmPo1ZM1hGJ5FTB5046463Ezn+87
         xU0A==
X-Gm-Message-State: AJIora/XT9Pm8JBaP69ET4YWrfEUQoC0RV6b0+/xLAUmODsxAmZwkFDJ
	jVxLo5dG9kCEtYEneu2MLfKGd8UZhHSXOFD1q9ob+w==
X-Google-Smtp-Source: AGRyM1sA46kWiGsTwyik4A+h6I0Rt4vExcza34+hBCc/jIKpPP4aUs4AgBut2tMlPe1cEUer3DeVSKylq48GsEqiYSw=
X-Received: by 2002:a05:6512:1047:b0:479:2308:ac0b with SMTP id
 c7-20020a056512104700b004792308ac0bmr349197lfb.167.1655314408139; Wed, 15 Jun
 2022 10:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220609112239.18911-1-mengqi.zhang@mediatek.com>
In-Reply-To: <20220609112239.18911-1-mengqi.zhang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Jun 2022 10:32:52 -0700
Message-ID: <CAPDyKFrBWBKJvLZaZOgK9K3Td0ZNq_0vP=K5ERjja3OnQFCsNA@mail.gmail.com>
Subject: Re: [RESEND V2] mmc: mediatek: wait dma stop bit reset to 0
To: Mengqi Zhang <mengqi.zhang@mediatek.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	wenbin.mei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_103331_930447_DB3B5B77 
X-CRM114-Status: GOOD (  19.94  )
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

On Thu, 9 Jun 2022 at 04:22, Mengqi Zhang <mengqi.zhang@mediatek.com> wrote:
>
> MediaTek IP requires that after dma stop, it need to wait this dma stop
> bit auto-reset to 0. When bus is in high loading state, it will take a
> while for the dma stop complete. If there is no waiting operation here,
> when program runs to clear fifo and reset, bus will hang.
>
> In addition, there should be no return in msdc_data_xfer_next() if
> there is data need be transferred, because no matter what error occurs
> here, it should continue to excute to the following mmc_request_done.
> Otherwise the core layer may wait complete forever.
>
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 195dc897188b..9da4489dc345 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1356,7 +1356,7 @@ static void msdc_data_xfer_next(struct msdc_host *host, struct mmc_request *mrq)
>                 msdc_request_done(host, mrq);
>  }
>
> -static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
> +static void msdc_data_xfer_done(struct msdc_host *host, u32 events,
>                                 struct mmc_request *mrq, struct mmc_data *data)
>  {
>         struct mmc_command *stop;
> @@ -1376,7 +1376,7 @@ static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
>         spin_unlock_irqrestore(&host->lock, flags);
>
>         if (done)
> -               return true;
> +               return;
>         stop = data->stop;
>
>         if (check_data || (stop && stop->error)) {
> @@ -1385,12 +1385,15 @@ static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
>                 sdr_set_field(host->base + MSDC_DMA_CTRL, MSDC_DMA_CTRL_STOP,
>                                 1);
>
> +               ret = readl_poll_timeout_atomic(host->base + MSDC_DMA_CTRL, val,
> +                                               !(val & MSDC_DMA_CTRL_STOP), 1, 20000);
> +               if (ret)
> +                       dev_dbg(host->dev, "DMA stop timed out\n");
> +
>                 ret = readl_poll_timeout_atomic(host->base + MSDC_DMA_CFG, val,
>                                                 !(val & MSDC_DMA_CFG_STS), 1, 20000);
> -               if (ret) {
> -                       dev_dbg(host->dev, "DMA stop timed out\n");
> -                       return false;
> -               }
> +               if (ret)
> +                       dev_dbg(host->dev, "DMA inactive timed out\n");
>
>                 sdr_clr_bits(host->base + MSDC_INTEN, data_ints_mask);
>                 dev_dbg(host->dev, "DMA stop\n");
> @@ -1415,9 +1418,7 @@ static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
>                 }
>
>                 msdc_data_xfer_next(host, mrq);
> -               done = true;
>         }
> -       return done;
>  }
>
>  static void msdc_set_buswidth(struct msdc_host *host, u32 width)
> @@ -2416,6 +2417,9 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>         if (recovery) {
>                 sdr_set_field(host->base + MSDC_DMA_CTRL,
>                               MSDC_DMA_CTRL_STOP, 1);
> +               if (WARN_ON(readl_poll_timeout(host->base + MSDC_DMA_CTRL, val,
> +                       !(val & MSDC_DMA_CTRL_STOP), 1, 3000)))
> +                       return;
>                 if (WARN_ON(readl_poll_timeout(host->base + MSDC_DMA_CFG, val,
>                         !(val & MSDC_DMA_CFG_STS), 1, 3000)))
>                         return;
> --
> 2.25.1
>

