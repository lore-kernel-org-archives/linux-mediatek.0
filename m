Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE23C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:25:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46600233A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46600233A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7+Z0I7bzXBzSmygOuwb08KghitwKrt3kvA3ZkF1uELU=; b=PJ0iO34SeEfHTPFpEn/3h4uac
	Cr288KNhaGUIxEux6CT+QfA6co6dSyuxen+i8SOCZexbJ8Zjov6pnSnuN8Wl/8kkcp9fEXqQbiLm4
	gVF/wq5iQLJ++VqxLJm4dxDQsCiaqZC5IeKwh8Pb9D9s52HE2HMkN6O+If0LCzDU02VEtYEefoLnu
	12kOs5NtYd9Zml/DEpfDADZRcbJiSDDL3m3cgSFZPYz74uEaC5jVd5ySBLnPcmBrl/3477iOFxL8g
	hS+rppaDVAxzVVZcQppDe0eetI652TdQOkKWI1Eu7FhO/ydXxOG0aDwgkuZCguuRiA92ij4p4xejP
	tZyfsi0ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzeHW-0001LT-TR; Wed, 13 Jan 2021 11:25:43 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzeHT-0001KC-Lu
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 11:25:40 +0000
Received: by mail-ua1-x929.google.com with SMTP id p2so573342uac.3
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Jan 2021 03:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MHNibYYv7+qauL9LhD11ieYINhm5TZijHvflmi3bdH8=;
 b=hjy9k4R9ib4o2u7huC6bJ4lkeKLmB5Jew27fl8oeht5CUxAHsdsDeX2NC80qjL2S4l
 gUlB2R0cXo48ZpGaZSqf+Nq0T1o1mb3SeO41fRs9jqR9HWibjshnrbKYLefbE83c7MDQ
 I1zL9EIADhWBePrPHpCjCXE5+TP460bRnb0XslavBr3yM5QMPdfVQ7NCff46cSC+5FfN
 pbcfygXb1TuDvKwzV9kAu2rFDU2zrR8YwIO+qKS0iVkF31zaaleaf4h3Nh4HO9j/i4WM
 DOX2QZUAnHpvITzauHmRa+sEPGHlh2tXz+LVGlzaep4dPPz/vSvdq07+/AjwhGcl0RFP
 GUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHNibYYv7+qauL9LhD11ieYINhm5TZijHvflmi3bdH8=;
 b=V9LlHKhrt84VbfhwoASSP+coKD5SDvQxtjhDReYHbEos7ZhDnWIM/2pjZV/SuJHist
 5jvxZJck7JRvUluJxQxhCF4/hHQtJq0rl5F7cYRovtTll8ue/rucqMg7Sm+XR6/2hTts
 PuyxBmiLW03P76k9ow5i6NKygi+vgu3jd5qHR4S3/ccMs3PLdcEbjEHD0BqogX9tdnom
 Yes9pZKA+PmkU2SWjJMS2AmPOXjFQsBfFt1E1fpoBbNi3p9YA7T/d+YB0v4f+bbRJgpb
 mw6qyTLwKhzQv3pKi0ejh/z41HVStOh0inIWyKwJI068VuiAPkgsRXlkiFsaWlpCn98/
 +Afw==
X-Gm-Message-State: AOAM533nhs6ir1tZvVfQsx+HjsRCg8EkXsmrFuVpN60WcvLSJWxAl9zd
 3BMFk9UgVyw0Z+JRtGEQoxPK3eRMJ9SsDiUhf5UTaA==
X-Google-Smtp-Source: ABdhPJwUr2j4zp44dH9qlqnjT+owu7a82g6S5ZhcB/Pq1jwX7B9mRAq7ji6Gxk1aDp66Ptf1Q1GmlXXxd4uR+rQmYzw=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr1278622uam.19.1610537134500;
 Wed, 13 Jan 2021 03:25:34 -0800 (PST)
MIME-Version: 1.0
References: <20201218071611.12276-1-chaotian.jing@mediatek.com>
In-Reply-To: <20201218071611.12276-1-chaotian.jing@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 13 Jan 2021 12:24:57 +0100
Message-ID: <CAPDyKFpFKNgTkPJuOM=xOo1pnWmjxh=rD+rdZYu6nwYNWvxz+Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: fix race condition between
 msdc_request_timeout and irq
To: Chaotian Jing <chaotian.jing@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_062539_884198_7E2A4417 
X-CRM114-Status: GOOD (  19.91  )
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 18 Dec 2020 at 08:16, Chaotian Jing <chaotian.jing@mediatek.com> wrote:
>
> when get request SW timeout, if CMD/DAT xfer done irq coming right now,
> then there is race between the msdc_request_timeout work and irq handler,
> and the host->cmd and host->data may set to NULL in irq handler. also,
> current flow ensure that only one path can go to msdc_request_done(), so
> no need check the return value of cancel_delayed_work().
>
> Signed-off-by: Chaotian Jing <chaotian.jing@mediatek.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index de09c6347524..898ed1b023df 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1127,13 +1127,13 @@ static void msdc_track_cmd_data(struct msdc_host *host,
>  static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
>  {
>         unsigned long flags;
> -       bool ret;
>
> -       ret = cancel_delayed_work(&host->req_timeout);
> -       if (!ret) {
> -               /* delay work already running */
> -               return;
> -       }
> +       /*
> +        * No need check the return value of cancel_delayed_work, as only ONE
> +        * path will go here!
> +        */
> +       cancel_delayed_work(&host->req_timeout);
> +
>         spin_lock_irqsave(&host->lock, flags);
>         host->mrq = NULL;
>         spin_unlock_irqrestore(&host->lock, flags);
> @@ -1155,7 +1155,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
>         bool done = false;
>         bool sbc_error;
>         unsigned long flags;
> -       u32 *rsp = cmd->resp;
> +       u32 *rsp;
>
>         if (mrq->sbc && cmd == mrq->cmd &&
>             (events & (MSDC_INT_ACMDRDY | MSDC_INT_ACMDCRCERR
> @@ -1176,6 +1176,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
>
>         if (done)
>                 return true;
> +       rsp = cmd->resp;
>
>         sdr_clr_bits(host->base + MSDC_INTEN, cmd_ints_mask);
>
> @@ -1363,7 +1364,7 @@ static void msdc_data_xfer_next(struct msdc_host *host,
>  static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
>                                 struct mmc_request *mrq, struct mmc_data *data)
>  {
> -       struct mmc_command *stop = data->stop;
> +       struct mmc_command *stop;
>         unsigned long flags;
>         bool done;
>         unsigned int check_data = events &
> @@ -1379,6 +1380,7 @@ static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
>
>         if (done)
>                 return true;
> +       stop = data->stop;
>
>         if (check_data || (stop && stop->error)) {
>                 dev_dbg(host->dev, "DMA status: 0x%8X\n",
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
