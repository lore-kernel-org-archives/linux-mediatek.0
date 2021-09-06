Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCCBC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 17:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E34560EE6
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 17:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E34560EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbeyS/joP5bt45x6EI2X0huHIcANjfexXJf7nRT2I7c=; b=Fbx7hTkpF8DD7S
	7ppL9POB/Rij141tjzHn8pda8rIHWL2btFvvSPSPXKcg59z+PAkwkYdX29tmGqaRiDhmhuB7aZv64
	x4x0RU0xOmRF/M+Hofn6TOCV+clWCjfPoc8G7Yhy/lyWMjKrNIhGpf4zKJLZFNQrEr5VmEVd4imIZ
	r6ZKRNSj6x6U7lJvIfD/uBkrwEpkPTUpT0le2iyan+cScafhlN4FD0AyCDqJPKd2QIQP60WNaR4dC
	Ju81V/G9nwqiXpM1ULG/FAwAF/7todhd/71ykNw5T0TrcZK9tXpsXABRmFen86isfGWWOFP5huEfb
	801eBfLYyYezz80Jvcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNI95-001Oij-3Z; Mon, 06 Sep 2021 17:10:59 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNI8o-001Ocm-Ns
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 17:10:44 +0000
Received: by mail-lj1-x22c.google.com with SMTP id g14so12306978ljk.5
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 10:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g2B76iGb/MvAFL/fqwBXAafaG+ZhGIUwhCY1ak7fyyI=;
 b=Qaq6D5JS3cWjYVjgYxZRkOoXeNX5pjffsV5NAIqydMEoigzxhzJ4Psue87vIspCszS
 vrE7rn4XVI7WeVDTBUKL2E9EGT0rAzkMRfX9MBTDtjNHx2oHkiOp4bkKDsFSY6arpP7g
 OpblIA7orJmsnURtExNxKBU1zFn3oHv24AssgtwnHadNO+TL8tciL0JFnnG6sinH00sN
 +WEIxJsTH+P2AxxT+4XWRzGz6nG+Zno0TLgZ+t/51s6buvrDUYG3npElUi6YcN+aFfHh
 yrItNVsgOaeECRcj51OfDMbJXaX7kqvWseeLswVkpFNl1BvgUkrrF+OhXgQblXWlll8s
 4TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2B76iGb/MvAFL/fqwBXAafaG+ZhGIUwhCY1ak7fyyI=;
 b=EWbncLZOAcBgwZl9hrMu4jplM0qopR/prMQhUiFT+L7ZEWGHxA99GLjG4S5HOpyWXe
 j6TlS7Bp6MOm97TSOiau1xK0g0D8s5gQHjMjGGqtSWZQRMNB1ynwPsxpBpaV3VXq8FpL
 InRWqEhpIRtE5XeiOEC7sAo6sIA2dhvGqtJu3RhWd8MsGwUZ2uL3062XaTNFcPHkG61g
 mWAnDK4KjD3yk2emNhE4Gu0i4fqxV0LjXWGpwB/q028CUSubHXcm1oxUyxxT5kUb8hQa
 41JPfHwZOgN9anbSwtJ/VXiO/DiNVi5sfP4vBE5oMPHbe9wSDMffjU02+dxkQBHpZP1G
 w11w==
X-Gm-Message-State: AOAM530WiP1xFCmXEJ7WN6j2Ii264/fFG/+k69Jsod79GtqYUjW6VFGl
 0KEuYpRIzK+yaWKM8NwoF1HSSTAZzr304rVyt+8DBQ==
X-Google-Smtp-Source: ABdhPJw2WazDx6ltshqgFzZJ15YF3sOJrKyyamAfpMdAE96du0/LoDwinquUUOD4VsO/nUFaNHGbVxIZB0fhs8JEymI=
X-Received: by 2002:a2e:8495:: with SMTP id b21mr11848281ljh.4.1630948240811; 
 Mon, 06 Sep 2021 10:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210830022507epcas1p43b45563c6e36bd00e3b6160bb42605bf@epcas1p4.samsung.com>
 <20210830021749.5947-1-cw9316.lee@samsung.com>
In-Reply-To: <20210830021749.5947-1-cw9316.lee@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 6 Sep 2021 19:10:05 +0200
Message-ID: <CAPDyKFot9rL3Vs1g4ZH3QYnqrHL29Or362Ga_nZD3DBBtM+NFw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: Remove unused parameters
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 grant.jung@samsung.com, 
 jt77.jang@samsung.com, DooHyun Hwang <dh0421.hwang@samsung.com>, 
 Seunghui Lee <sh043.lee@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_101042_880888_64A6B201 
X-CRM114-Status: GOOD (  16.11  )
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

On Mon, 30 Aug 2021 at 04:25, Chanwoo Lee <cw9316.lee@samsung.com> wrote:
>
> From: ChanWoo Lee <cw9316.lee@samsung.com>
>
> Remove unused parameters
> 1. msdc_start_data() - struct mmc_request *mrq
> 2. msdc_track_cmd_data() - struct mmc_data *data
>
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>

Queued for v5.16 on the temporary devel branch, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4dfc246c5f95..a8736067c409 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1043,8 +1043,8 @@ static inline u32 msdc_cmd_prepare_raw_cmd(struct msdc_host *host,
>         return rawcmd;
>  }
>
> -static void msdc_start_data(struct msdc_host *host, struct mmc_request *mrq,
> -                           struct mmc_command *cmd, struct mmc_data *data)
> +static void msdc_start_data(struct msdc_host *host, struct mmc_command *cmd,
> +               struct mmc_data *data)
>  {
>         bool read;
>
> @@ -1112,8 +1112,7 @@ static void msdc_recheck_sdio_irq(struct msdc_host *host)
>         }
>  }
>
> -static void msdc_track_cmd_data(struct msdc_host *host,
> -                               struct mmc_command *cmd, struct mmc_data *data)
> +static void msdc_track_cmd_data(struct msdc_host *host, struct mmc_command *cmd)
>  {
>         if (host->error)
>                 dev_dbg(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
> @@ -1134,7 +1133,7 @@ static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
>         host->mrq = NULL;
>         spin_unlock_irqrestore(&host->lock, flags);
>
> -       msdc_track_cmd_data(host, mrq->cmd, mrq->data);
> +       msdc_track_cmd_data(host, mrq->cmd);
>         if (mrq->data)
>                 msdc_unprepare_data(host, mrq->data);
>         if (host->error)
> @@ -1295,7 +1294,7 @@ static void msdc_cmd_next(struct msdc_host *host,
>         else if (!cmd->data)
>                 msdc_request_done(host, mrq);
>         else
> -               msdc_start_data(host, mrq, cmd, cmd->data);
> +               msdc_start_data(host, cmd, cmd->data);
>  }
>
>  static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
> --
> 2.29.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
