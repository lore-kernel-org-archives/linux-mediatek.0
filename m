Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BB2C04FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:03:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B410561404
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B410561404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWHFQzwuGBHzOL1qB/Reyuc4vgC+zvSJ7KCzy+ANKpA=; b=1mGSHe9k07gFQU
	IcK6acLXQNM/VJrw9xdJoPFhlJtqvf+ZUqGOrDyd6n9mDnN82DD8lAyd9eWgh+TqRbUoPd56nKTGf
	H26zS57wZNV7CMazX8KlF+X1fY93WXC4P8mvt6vzVzgSPqwM014TInpsZYQxzGdM1ErN74o3K2ltB
	VMttWTgQO4EV6rCA/9iOROWmEMgNdWuXG/vuVlEGx6R2STUuqkncY+/V3Mt0s+oj7TJ3R9ok+By20
	ToPFNb0d69uW+UI6BMBK0vMDDHUAKpNwKXtM1hqiLXob+2gJ5HZr+EPaN2Emjv67D+VnoAkqsJ3n7
	WSG+bBN0oZvORSWhJMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llIfV-0022T6-BX; Mon, 24 May 2021 22:03:25 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llBIa-000zEQ-JH
 for linux-mediatek@lists.infradead.org; Mon, 24 May 2021 14:11:17 +0000
Received: by mail-vs1-xe31.google.com with SMTP id m9so4641557vsq.5
 for <linux-mediatek@lists.infradead.org>; Mon, 24 May 2021 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tCQyDrPS485JCf/EEBqEIhlOY+R+jUvQFllkGWdxwlU=;
 b=rL221ZDLv+YLV6YwZRS3eQJhMyuZtgYBJ8CrSEy+N6aSE3T3ThkMn/A72sXlzWEXbB
 s1fWLTuu717xF3h23DVKY+pstdeiXlXI6rgJa3HM7nv6/VFM86FSs/coHqklivyZxNA4
 2Wy/1Ng8g7/BKFHWqPSiiVhnh22Syomle17OvQ/4n29KfSfukWYqmp/FK4vZilte2jL9
 WhQgB/sIQ+bfT/s7/yIGKbhNOCm0/mLSPh34x9FiqKVL8xH/xA8h6z9GQzFWPDX4kajB
 egQ4wTAvfNnM/dAg6LaDnHi6YxsyGwGKtAhJWvxJHNFOt9KfyQ2/V0vH/FDeaHPyr2WJ
 GMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tCQyDrPS485JCf/EEBqEIhlOY+R+jUvQFllkGWdxwlU=;
 b=bHKwDAeHCrjL9iGnFAUr1CewVe/ChdrnVKBn/urUpKgTzrjTZOYM/d6et7e+p/TkLZ
 5qQArHvAI8vMA43LrbYZvBQv5rMCtEwCc7yXfOSdY1TGHJV/lHDjVUYED4jG5AgxK59d
 w10G2MD+sm3rUuAbuHd4UFNag5n4SBBPcN44B3BjiB9b33TJjoN49JEPgw1hWTD80VOM
 GLzGMVHjjLQ3u258P63+F9YIaDgK+bYrQrWX8k6Cr4KnEw/bww3LPiesdDEY6zdHjMYe
 KZKU5/ZbzTsQwogfnFqXyc96FuKkhq4zB4W0pCzwy1/1hJ3HvNps/VjTecUWZpId87HP
 bZww==
X-Gm-Message-State: AOAM531QaancAq2jslGgCsbv3mtWzDlWBDhwbMFLuaeSeXIst5JRhn6X
 dIQSavgIONDYXbYPQ8sx7/YsGmbpoHWxqfgt7MMaaQ==
X-Google-Smtp-Source: ABdhPJwMK3SFZbamqjUeewMx4pyjEYGz6E3mOkM1UlEIRFJpJxPqU+mIDBmUS5Mxf2RtuRjUN723pYQ6K6iCkHrQauA=
X-Received: by 2002:a05:6102:7d5:: with SMTP id
 y21mr21665508vsg.19.1621865475641; 
 Mon, 24 May 2021 07:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210517105432.1682-1-zbestahu@gmail.com>
In-Reply-To: <20210517105432.1682-1-zbestahu@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 May 2021 16:10:36 +0200
Message-ID: <CAPDyKFpyoEFt6CEwitD12sskG_YuLW=B+635_hyJ5gOLAzwYPQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: remove useless data parameter from
 msdc_data_xfer_next()
To: Yue Hu <zbestahu@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yue Hu <huyue2@yulong.com>, zbestahu@163.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_071116_654942_5E9393F7 
X-CRM114-Status: GOOD (  16.03  )
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

On Mon, 17 May 2021 at 12:54, Yue Hu <zbestahu@gmail.com> wrote:
>
> From: Yue Hu <huyue2@yulong.com>
>
> We do not use the 'data' in msdc_data_xfer_next().
>
> Signed-off-by: Yue Hu <huyue2@yulong.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index c4db944..4dfc246 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1347,8 +1347,7 @@ static void msdc_post_req(struct mmc_host *mmc, struct mmc_request *mrq,
>         }
>  }
>
> -static void msdc_data_xfer_next(struct msdc_host *host,
> -                               struct mmc_request *mrq, struct mmc_data *data)
> +static void msdc_data_xfer_next(struct msdc_host *host, struct mmc_request *mrq)
>  {
>         if (mmc_op_multi(mrq->cmd->opcode) && mrq->stop && !mrq->stop->error &&
>             !mrq->sbc)
> @@ -1407,7 +1406,7 @@ static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
>                                 (int)data->error, data->bytes_xfered);
>                 }
>
> -               msdc_data_xfer_next(host, mrq, data);
> +               msdc_data_xfer_next(host, mrq);
>                 done = true;
>         }
>         return done;
> --
> 1.9.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
