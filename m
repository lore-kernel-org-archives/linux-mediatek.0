Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96292C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 10:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJuF0RzNg2uVjuLafMmSDzK7wWGIx8dS2o1QANe17RU=; b=r6MElD56FiQ/r4
	nb6tGLw8S7zPClI1O16q+9Emj++Lrpgt6wY/gU7hU2keJDq1acg0a5OkDZ2cijSvZuhfbDIQ6EEc+
	XXXZPM2K7iyNhdFAlFJO1TFo7iBkFgtkvIe5zG8rQ6z71GOAju8X/iSCXgVr8j9iiauLpVqbA/TiC
	huD8kNcLlVvgcPZhGR7cavMQS6ysgY8/diMCKzhqbs3+rlLKDayfPcBKLtDJBaeOS/P6a7AHbbBLJ
	UJrEruaUoxuHwQrx5ZY1oh+VyZdss4ps5cbjEce4aKGExv8TR/B8/kJ3SJdfQo27YUepI8VWkg3p/
	Vlk7GcCkEEXAEec3pxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWa3-006iGv-8a; Tue, 07 Jun 2022 10:36:59 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWZb-006i2A-EA
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 10:36:33 +0000
Received: by mail-lf1-x132.google.com with SMTP id a2so21495288lfg.5
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 03:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PCgtiLUZSuHTz5IK2x7L4YWF9E3UmFqw0nwv703neGE=;
        b=VtxwY0WZ4gkosObf0GXqVeyMNqRlH34rx43Ljv2zwfm9wXOGkVEOzangTkLbA30Nk7
         4UMUr0ZoLYZQ7bdEc5LpD6XTrk30gR13z02xc8euG+tKqiaYXML6EwNBRfxpwm2m9s20
         P6944BEiYjl8YMV9ooXTkk23s2eXj7MkdO6zKRh4Rp9O1TMIguL6jXZU8N47a7pBde5T
         i2LTOARUkYBcLR8cdvmESeUp6CR4WdNOAm5JHzJHMuZFUttkYSybDMAFxEubMx7//b2f
         3ro6kFTn0b/WQwl8yC1YJYXIO5vQyKdm5i+HnYfZJe+lnVhhek0bVdONcecNNduutPqv
         xwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PCgtiLUZSuHTz5IK2x7L4YWF9E3UmFqw0nwv703neGE=;
        b=tnnktGdgR5AqYVDGYxdoVybb+bV6X6wiLns5pOixYhYIT5owtTb/xS3s+gPIaE9yE9
         pOSK/COf3pNi4IzkPwlXfTz2sjgcDN/MHXZD/VX2Z3by0T39fT7Y1Z/BxXkUMUbxojdq
         WAq+8rQHpewURoDmT3YU1LriYvuN7Bh3jlrIFBwzriWTsuksBBXcaTV06H5QY7jt9YkQ
         2pQnNpYKuG3Kq99XqKDfjiu4BW0qvfJ7p8WJKAjrWI3uYlf++mC/py3e9IfV/AdE3z9J
         /bL5IG1MXaRWLYz+DNbE5UTHgL8UVE2XXRZNtvBu9DIDj1bAPcX/jYQZL0mRlk3xcbH7
         jVLA==
X-Gm-Message-State: AOAM532fTyxhklG08B8dW+wojoq3fxysQdq2LwJP+2mzzHHKrk3OpUp3
	L+Rr72325OtoUf50JdqO5CuINVEk4it/KU6d4ZX90Q==
X-Google-Smtp-Source: ABdhPJxfsW6DVMMdTLuCpQREFHXfOUnR2FOXxYSOcFvFjAWB2Vboe2sXi8WL4FurxlVmPtwGId9RZuQa8KMbjhiOAl8=
X-Received: by 2002:a19:ac42:0:b0:478:593c:e6fe with SMTP id
 r2-20020a19ac42000000b00478593ce6femr17792413lfc.254.1654598189364; Tue, 07
 Jun 2022 03:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220606142051.20350-1-mengqi.zhang@mediatek.com>
In-Reply-To: <20220606142051.20350-1-mengqi.zhang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 7 Jun 2022 12:35:53 +0200
Message-ID: <CAPDyKFruh_t3uR3-u-_wH9LmZo77Ra-LumKe808jDfbGGM+04Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: wait dma stop bit reset to 0
To: Mengqi Zhang <mengqi.zhang@mediatek.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_033631_536179_875003B4 
X-CRM114-Status: GOOD (  19.01  )
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

On Mon, 6 Jun 2022 at 16:21, Mengqi Zhang <mengqi.zhang@mediatek.com> wrote:
>
> MediaTek IP requires that after dma stop, it need to wait this dma stop
> bit auto-reset to 0. When bus is in high loading state, it will take a
> while for the dma stop complete. If there is no waiting operation here,
> when program runs to clear fifo and reset, bus will hang.
>
> In addition, there should be no return in msdc_data_xfer_next, because no
> matter what error occurs here, it should continue to excute to the
> following mmc_request_done. Otherwise the core layer may wait complete
> forever.
>
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>

Is there a certain commit this fixes? In that case, we should add a fixes tag.

> ---
>  drivers/mmc/host/mtk-sd.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 195dc897188b..c925f45786c2 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
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

Looks like msdc_data_xfer_done() should be turned into a void
function, as it would always return true beyond this change.

> -               }
> +               if (ret)
> +                       dev_dbg(host->dev, "DMA inactive timed out\n");
>
>                 sdr_clr_bits(host->base + MSDC_INTEN, data_ints_mask);
>                 dev_dbg(host->dev, "DMA stop\n");
> @@ -2416,6 +2419,9 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>         if (recovery) {
>                 sdr_set_field(host->base + MSDC_DMA_CTRL,
>                               MSDC_DMA_CTRL_STOP, 1);
> +               if (WARN_ON(readl_poll_timeout(host->base + MSDC_DMA_CTRL, val,
> +                       !(val & MSDC_DMA_CTRL_STOP), 1, 3000)))
> +                       return;
>                 if (WARN_ON(readl_poll_timeout(host->base + MSDC_DMA_CFG, val,
>                         !(val & MSDC_DMA_CFG_STS), 1, 3000)))
>                         return;

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
