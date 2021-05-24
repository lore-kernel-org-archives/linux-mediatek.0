Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21AAC04FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 16:32:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FFFE613CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 16:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FFFE613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KH2ZtQ5LK6v1VhL6PyE7FEYBffMDVQLOnQA1jaLE7tA=; b=1egHBfbGs/sci6
	gA5c6Iu6RKR/jda/lzMc2MRLmPfD3RC3zLHqK68HaYKyBQuT+7Q64XPLAevZHCRQ4aUhRwax8Ag6C
	D/6+8BoU4mqKT8Zzru8ab7Vjm7FHMvbaiHSQlCCHCTYB/qtBjR/CLW2c0FRuhdN5ObCByHzsVBee1
	q4jqwDJ/1jATZO6j7OuFhdcI9QkDDVOJlzYJZpYHZSJyxZBFqi/zqbdOs3Jlbjtt/M6SXC9x4+LYm
	B6lwlr85wNcl3rzSd3ii9JNZGd1FSWH3OHPgegmfz127wBBPPZ2gKfVC9U3kHnXa9lXgDT23munl8
	/pBvEMQBH05ThRB/zWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llDUb-0017Nv-K6; Mon, 24 May 2021 16:31:49 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llBIW-000zE7-Jk
 for linux-mediatek@lists.infradead.org; Mon, 24 May 2021 14:11:14 +0000
Received: by mail-vs1-xe33.google.com with SMTP id q6so10091953vsp.13
 for <linux-mediatek@lists.infradead.org>; Mon, 24 May 2021 07:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RtaxpJ3ZIqpbUxLnGdserLZmqNzbhH1N5iJJI4iZESw=;
 b=O4jM4bSYSS7J58eJ1fb121TCHbnOVl9LqBduEc7SGBX/YCXdfSI46H4Wtka1LkxRS7
 8h5kPKFQpPZcA+Ca3Rmzk7NVImyE9jZi4KUPNBd23Q44W/5sVRURZ+oTZlE9diZCsekz
 2I2M2Z4PefHOLr/5yuYaUowwknRfVV3CCpuPffOo2hSQQ5NCc8Y7seAZfU0ScrEePnQU
 1fK776YmoVWqh2nKRFv/8JY765zcPiQCPxZTrruhpPj1mTuq9GbuEAe/xQt0uN1tZdPE
 uJwHz3IrZ74D3spFamWzHnDOnclKG9UmNxZE8t+X4EjSgJKUhrmeWLGZr5rjcyyA6b8X
 gGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RtaxpJ3ZIqpbUxLnGdserLZmqNzbhH1N5iJJI4iZESw=;
 b=qBQWkdKDrOfUU4KTCg/t0IlFsoGup3kXPAqEFSYiOpifSdtEzP0x6eHFYHuZnWCIGu
 LPDbxRcZeC54cdwg8K5/FawzAVIKDXGE7Lu8jMB7v/QzEA6+cH/a1ox+sZswvq9YU6gf
 H2PayksyjxZRfqgLMMOoZed0ZflX5yAOPMhThBPF2P8TRp+2UFehrp//Hx6efBCxWQQN
 WygkLLfkE4/BhuXcIh1l2/jVfpYTZcNOFyp9uv4tJ/5ScCm6XkVOsMif2+66fIR3jeDj
 rlkmxJX0Kt7kYJNRNpiKS0FLXfxv2qugXqpxuq4bpLW8AuLgS37G00kCdrIQPA78TO+M
 grhw==
X-Gm-Message-State: AOAM531iWU6jYTeWtTM6KSzhJwVSnsNCEfNAEo5h1YL+setmLY4Bleug
 PZKchARU8OpFdMrTypiYp0WY7oD2XmIvzshxSqdFBA==
X-Google-Smtp-Source: ABdhPJyJxoEXg38Ru3anDaOR89iyQH6Z608DJmvgu1cLXp9ByLGDvmMUflZvo2udH4W1HBCqQ8ERHRYs9TOLCeqKR4M=
X-Received: by 2002:a67:1087:: with SMTP id 129mr20526217vsq.42.1621865471594; 
 Mon, 24 May 2021 07:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210517100900.1620-1-zbestahu@gmail.com>
In-Reply-To: <20210517100900.1620-1-zbestahu@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 May 2021 16:10:33 +0200
Message-ID: <CAPDyKFoPKSCoh6udphtGY210rB-QonJF-MAT0ZQJa+kJn-o6aQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: use data instead of mrq parameter from
 msdc_{un}prepare_data()
To: Yue Hu <zbestahu@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yue Hu <huyue2@yulong.com>, zbestahu@163.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_071112_673360_67C55575 
X-CRM114-Status: GOOD (  19.72  )
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

On Mon, 17 May 2021 at 12:09, Yue Hu <zbestahu@gmail.com> wrote:
>
> From: Yue Hu <huyue2@yulong.com>
>
> We already have 'mrq->data' before calling these two functions, no
> need to find it again via 'mrq->data' internally. Also remove local
> data variable accordingly.
>
> Signed-off-by: Yue Hu <huyue2@yulong.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 898ed1b..c4db944 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -724,10 +724,8 @@ static inline void msdc_dma_setup(struct msdc_host *host, struct msdc_dma *dma,
>         writel(lower_32_bits(dma->gpd_addr), host->base + MSDC_DMA_SA);
>  }
>
> -static void msdc_prepare_data(struct msdc_host *host, struct mmc_request *mrq)
> +static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
> -       struct mmc_data *data = mrq->data;
> -
>         if (!(data->host_cookie & MSDC_PREPARE_FLAG)) {
>                 data->host_cookie |= MSDC_PREPARE_FLAG;
>                 data->sg_count = dma_map_sg(host->dev, data->sg, data->sg_len,
> @@ -735,10 +733,8 @@ static void msdc_prepare_data(struct msdc_host *host, struct mmc_request *mrq)
>         }
>  }
>
> -static void msdc_unprepare_data(struct msdc_host *host, struct mmc_request *mrq)
> +static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
> -       struct mmc_data *data = mrq->data;
> -
>         if (data->host_cookie & MSDC_ASYNC_FLAG)
>                 return;
>
> @@ -1140,7 +1136,7 @@ static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
>
>         msdc_track_cmd_data(host, mrq->cmd, mrq->data);
>         if (mrq->data)
> -               msdc_unprepare_data(host, mrq);
> +               msdc_unprepare_data(host, mrq->data);
>         if (host->error)
>                 msdc_reset_hw(host);
>         mmc_request_done(mmc_from_priv(host), mrq);
> @@ -1311,7 +1307,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         host->mrq = mrq;
>
>         if (mrq->data)
> -               msdc_prepare_data(host, mrq);
> +               msdc_prepare_data(host, mrq->data);
>
>         /* if SBC is required, we have HW option and SW option.
>          * if HW option is enabled, and SBC does not have "special" flags,
> @@ -1332,7 +1328,7 @@ static void msdc_pre_req(struct mmc_host *mmc, struct mmc_request *mrq)
>         if (!data)
>                 return;
>
> -       msdc_prepare_data(host, mrq);
> +       msdc_prepare_data(host, data);
>         data->host_cookie |= MSDC_ASYNC_FLAG;
>  }
>
> @@ -1340,14 +1336,14 @@ static void msdc_post_req(struct mmc_host *mmc, struct mmc_request *mrq,
>                 int err)
>  {
>         struct msdc_host *host = mmc_priv(mmc);
> -       struct mmc_data *data;
> +       struct mmc_data *data = mrq->data;
>
> -       data = mrq->data;
>         if (!data)
>                 return;
> +
>         if (data->host_cookie) {
>                 data->host_cookie &= ~MSDC_ASYNC_FLAG;
> -               msdc_unprepare_data(host, mrq);
> +               msdc_unprepare_data(host, data);
>         }
>  }
>
> --
> 1.9.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
