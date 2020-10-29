Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26E0C55179
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 12:09:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73F192076E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 12:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bUM8Liy0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3Nt87l2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73F192076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ixrjYRFs8/xklCRaxLT35LUuOEj/mRoxn0CyZB0Dr6M=; b=bUM8Liy0rqS76ZyPxANQ1vSl/
	CWyK6SmCkehP3uWfpVogAf3pLrY3hqKGW2jdHdjFs9OgnjGBfn6w02mE5Icc73GEl2pZxZJY2UXfs
	gVNtyP8vwRJ8mo9IwJDBrEB/JoLAUTWhbc2HV+YONQd5T+Q1JsLIiEYukCz964FvZhHmt+F4psezg
	Ht1edWjN/Yiu9kIQA1zBpEBnHDUyfb/VSvj45qRhyT46dKjSwg9l33m6luDPVDOlBQmLCxbsomYrG
	WMT26NJJ7W/okbnVWkfXqkZ90YR29UM3xC9QdzBxKKFRlmmU3sAecNtte7MMZTh7VFkXJxbyDbC5l
	Lk1mdXKkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY6k4-0000U6-64; Thu, 29 Oct 2020 12:09:20 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY6jv-0000Qu-VM
 for linux-mediatek@lists.infradead.org; Thu, 29 Oct 2020 12:09:13 +0000
Received: by mail-vk1-xa43.google.com with SMTP id t67so635004vkb.8
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Oct 2020 05:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2OKA9Pgk0ZZ7+DXmqAtn7byrzzqg0DhRt90w2UoAl54=;
 b=p3Nt87l2xN8E/kW1cpinhezE9x7HXKo0TaISvtMl0md3/MASIkPOI4oWfHMDtV2fL8
 HJf8642vtrJwRDG15XPPEhmxdnqKFj1DCvxvW0izscb4zY+MPp/WvvZTLUwkDNI9YTog
 RMbzmKP8cNTp32zafmWVv7TbKNv7p4bZyuZ+QemO5SKdfFmSlt5+kiPbBo+xxxnypH60
 t9nSQ/yHhI6zYAF4FVQiiEOTs4vK48hVWrxgCv3/XszpLqel8WuZDFHQmfkvcEkMHtcl
 AWTYcD6quieQEWNs2sBIikUTjgIQzx/S+gm9fC7VmHV9Sy1HeHWtweWy6MGK4Ldk3KCm
 8w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2OKA9Pgk0ZZ7+DXmqAtn7byrzzqg0DhRt90w2UoAl54=;
 b=RPoBXVgx9NneJ5GT6aip6sV5XAbQYeykH2R4CQwGg02phUcAcoxsj9O1NYivtgXd/F
 rF5UN4ckJSZJXGXKejAqHI1ClqaB5z+9VVvstDLlD5SI47SKqi1MTIcbTjXgJZTzFnQC
 wjeStLiXe6GVnR91WmH1KqqlqdXrtVGWToPwgljvb+oLuhmb80hnplugzxgi9DZi3oLr
 QeAeLAGkxuMOMTQ0fPXS31YoDj6sJzodWBlBZZq/aFHkpQHFuxqKuZrlQ1dP/sBYWHQk
 dFUHYTU1xNh2FtCeFZsC7tstgKxoXn1jOF/JFJR8yuj9zLqMYqmqVHdgSX8FAWTv/Qe0
 Gudw==
X-Gm-Message-State: AOAM5316uVvyjHFPjfxiGxZMbOM6gofHVU0Q77K0ZBnLAfuuFX8jqyUd
 PBfe3WeQ6HLU2jO9JQUAjmnxrqUwLubJqwV5kdWqqQ==
X-Google-Smtp-Source: ABdhPJyfh/wov0bgUNVgZKsf5ChZEKE/xeN/ahZVICTxi8+aUGFoAtBQTKr6ElCer1/at22RWmlzu2bKpXFwdKJFUFg=
X-Received: by 2002:a1f:4c07:: with SMTP id z7mr2571896vka.15.1603973349970;
 Thu, 29 Oct 2020 05:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <1603068193-44688-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1603068193-44688-1-git-send-email-tiantao6@hisilicon.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 29 Oct 2020 13:08:33 +0100
Message-ID: <CAPDyKFpyASJCE8QtKX=R=eVeeT2=adknBZmWo8GVaaLDv8KAXw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: replace spin_lock_irqsave by spin_lock in
 hard IRQ
To: Tian Tao <tiantao6@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_080912_066465_8A717921 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, haotian.jing@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.or>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 19 Oct 2020 at 02:42, Tian Tao <tiantao6@hisilicon.com> wrote:
>
> The code has been in a irq-disabled context since it is hard IRQ. There
> is no necessity to do it again.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a704745..fb3e419 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1536,13 +1536,12 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
>         struct mmc_host *mmc = mmc_from_priv(host);
>
>         while (true) {
> -               unsigned long flags;
>                 struct mmc_request *mrq;
>                 struct mmc_command *cmd;
>                 struct mmc_data *data;
>                 u32 events, event_mask;
>
> -               spin_lock_irqsave(&host->lock, flags);
> +               spin_lock(&host->lock);
>                 events = readl(host->base + MSDC_INT);
>                 event_mask = readl(host->base + MSDC_INTEN);
>                 if ((events & event_mask) & MSDC_INT_SDIOIRQ)
> @@ -1553,7 +1552,7 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
>                 mrq = host->mrq;
>                 cmd = host->cmd;
>                 data = host->data;
> -               spin_unlock_irqrestore(&host->lock, flags);
> +               spin_unlock(&host->lock);
>
>                 if ((events & event_mask) & MSDC_INT_SDIOIRQ)
>                         sdio_signal_irq(mmc);
> --
> 2.7.4
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
