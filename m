Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C7BC6FA8F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 10:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmxySgPzhnxxUTeywFheyR9KmyLlbR5/9tECTYy/UEo=; b=gDCnU4MXC8M1mfJx2xeJjCn7ZA
	JlXtPz1XRqHoAK/Epa/hVP0s7VaQoa8uIoY8sWN2f+XRAdcSDS+SdWEEg749u5Pft2BQvS9FZ3Oht
	Arl0nuP1FJQKIqvk1cTK8xnC2c/TyegM7unUKoFYecP2gwefRDPB0pxYq+9rKHPBD16nbTj3IUvtU
	KLt16PK9Lfag0DpcSmiv2fRx7tohI+silrSkvpzRwDSpjIh1ENjYosMjvi68MLa7UmddBBIU9y5+l
	UOmuRcXBnZNgfRqXXM+d2qyuP8sCNLHXk63XU7TrnIOvPhc2actmTOAHUET8wN2qTnN3/69Vn7yBx
	tIJ1rfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ80S-002vV2-05;
	Thu, 24 Aug 2023 10:56:04 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ80O-002vUA-2y
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 10:56:02 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-58dce1f42d6so10787467b3.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Aug 2023 03:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692874559; x=1693479359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DmxySgPzhnxxUTeywFheyR9KmyLlbR5/9tECTYy/UEo=;
        b=UaK5oz3c2QZPwlWA0J06xzTK/xDFzZZUAeUmpvMPlZj46JGOihJGLgJIi2kLwSrrCh
         3+85Zhuv0OQ85bwUFghZXFQtLS1OKK4f1KvUvXth2VCnAq7aXfnrUJZ09nXvftIj9ug1
         vqJdglFFR2XtF59xJ0TK8crRhW3Fj4vchycRaUAYcgkMH37beDeQeJdOalJdHnOTuK3X
         mFbwzsMfl/HgjTmkkxLCKn/VFwV13ccwjMX8L0dXjxo3YiUaYbjPyWWlCPv578PLRiY1
         YafaOaRX9Y1K/VGzxbHY8nTaj6bnuCZl9TTamO7gHZSeiUSWjP2tTsB/xR/7hR+6XAZj
         gJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692874559; x=1693479359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmxySgPzhnxxUTeywFheyR9KmyLlbR5/9tECTYy/UEo=;
        b=A8rW42Pg/jQSjtgzG6xZKZOGz6EmmsIkR2WKOG+08IIaF3FgnBuWgTr7ZOnBB/F4Ld
         U8CLFbtItyfUsi7LJe07o3jEB7bytOjtjdd7oqEmmJ8dXMhdmK6hfgs5yH5TWWXvTyYk
         LKu4mI34iqi1Il9BkaSpLxAK/pGoNUsct0qVwMAXrmzOu4ncDCzYa2MwcuX1gbJadDwL
         FMDB9n8m05BZFIxZH6pxrq9F5XbdoQ3DVIn09C64eKvCW0z8re0/C4epvCXv/fdyZx4P
         kPkFug0s1Ca1j+rkmvXEKqynVeP4ozu5Ru/v8u5SjRUkoidUlTCadV1gBZ9Vk7+0Sm+T
         tIWg==
X-Gm-Message-State: AOJu0Yy65KJdZIYWzJtxDhpR/9FHNp7hbOD5NEQUBQNDphKB5vvnqYt6
	TU6ymP+SB42yoRiVYu2t/s57lP0mCrRH14QqtfRyrA==
X-Google-Smtp-Source: AGHT+IG5g981hiNWc2Virq/saq14f3u+c5agrarXaFetTlwLXn91k4F7b/MHfUOZ5lpFVRkOWRINd19ymBubd9J94eU=
X-Received: by 2002:a81:4f49:0:b0:56c:f0c7:7d72 with SMTP id
 d70-20020a814f49000000b0056cf0c77d72mr13387507ywb.4.1692874559668; Thu, 24
 Aug 2023 03:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230818022817.3341-1-Sharp.Xia@mediatek.com>
In-Reply-To: <20230818022817.3341-1-Sharp.Xia@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Aug 2023 12:55:23 +0200
Message-ID: <CAPDyKFqN0K=2e4rijUBz=9LXVfhEVvDzNgqXTyTgvaPRK-PBNQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
To: Sharp.Xia@mediatek.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@medaitek.com, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_035600_987758_72CBCBDA 
X-CRM114-Status: GOOD (  16.88  )
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

On Fri, 18 Aug 2023 at 04:45, <Sharp.Xia@mediatek.com> wrote:
>
> From: Sharp Xia <Sharp.Xia@mediatek.com>
>
> MMC does not set readahead and uses the default VM_READAHEAD_PAGES
> resulting in slower reading speed.
> Use the max_req_size reported by host driver to set the optimal
> I/O size to improve performance.

This seems reasonable to me. However, it would be nice if you could
share some performance numbers too - comparing before and after
$subject patch.

Kind regards
Uffe

>
> Signed-off-by: Sharp Xia <Sharp.Xia@mediatek.com>
> ---
>  drivers/mmc/core/queue.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index b396e3900717..fc83c4917360 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -359,6 +359,7 @@ static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
>                 blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
>         blk_queue_max_hw_sectors(mq->queue,
>                 min(host->max_blk_count, host->max_req_size / 512));
> +       blk_queue_io_opt(mq->queue, host->max_req_size);
>         if (host->can_dma_map_merge)
>                 WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
>                                                         mmc_dev(host)),
> --
> 2.18.0
>

