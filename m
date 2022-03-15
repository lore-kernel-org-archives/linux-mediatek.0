Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCACC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLOSOvjR2EXOVYgJwxU4LErUfw1f9DEAyH9b1XW1Csw=; b=BbxTeUExBgUM/+
	qvzKzWfY80lrImh+DxyWtE2QZrs22W9pyGJNlQzFY41nRn+u2w9XX5uTdvoQ5G3rm6HgiueXWPRFP
	4YJip9BejsB7TXY59+wcu8mKlWhDk38q2SI9ECjASR//521Ap89So2KM39VJFJAb9ZuCyk6L9zR1U
	+iK9REcMbVTkhFWGKwD51TeKLWJuN2zqQiuOpLh3TILVHRoVPjsdPNYuJTjiyofeyEXqoa5+IKzcB
	fw5crje5ID0dAdMAwcx6XG1U7M1zkgGYF8NMwF4qUfvw7F6NQVzod7ep5rUbaxZe3bZ/GJFcjLrtI
	Le1TZwByj+CUKKt9J5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU6DP-0090Yt-Od; Tue, 15 Mar 2022 12:23:51 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU6DC-0090TZ-GU
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 12:23:39 +0000
Received: by mail-lj1-x235.google.com with SMTP id z26so26199110lji.8
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Mar 2022 05:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRpn9k07AvFRGh0gF6YNXgmPxpnxq7wyCuwbzm66mLY=;
 b=NpcMfLCqOAjT2sSeV2QqGd3mVpMck4r8/tTTwR2NqNCDqUgjj1ku8olci2AYbWVWSM
 7/pwvHGIT4rLhKXrwy9JGibkOvzcmbIBtdsjb73CDUIt15Tv1gKSbdqdj00GESjfXH4v
 Re/lrRPmgkYVNgNBKm3V9vwRYgxGVMxS6fXIANYcBpaUNRxd81mFdoDXuAaZAKxNL7Kr
 tsNlouITyJipc4mN1YQDc06DHWRtdgOskGMbY2Frn6vypqk1p+pAiP0imz2KQA3QbMbe
 xMby9/TNvVxnrvP3GrelxqBxGtR10TmBCHNVA8f+vB8C5+BUbC2KK34tQUgLuprmojc6
 QWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRpn9k07AvFRGh0gF6YNXgmPxpnxq7wyCuwbzm66mLY=;
 b=aaSkX0VJP0LiQQoWpDgKr87TCKrKx0WM5Pa5K2LBKgwNMXSwJ3/gMPaFBFSbkCilf0
 iX3gS0tyMGTzNap8ykfp+CBiH/cBMbmFoU+SKHxUM3VBT2vJHs1WMoPm9EIHqNGDuUmn
 WJMTvml+K6pWSq6OgefL0mkNoCrmksxIEAvJBlqf239leOGw942u+O2hddrjjVgVghpv
 yjJyI1JkWuWU19FSD3pGTKKPF3641JGq/mqXWJhdQYsagnEY08yP9u9wEYqfuTweF23u
 pMATTNCX0Vcsi/lSbx0PnbyYIPKZH4t4BPWRLjABP/o493O0puTkP8721ES/LOR65dCB
 VE7g==
X-Gm-Message-State: AOAM533dyEZXgjdUoKuhHKAuQfVxqD2VSn/R6dv4Y6g3IMu1e0NZsqYe
 2F370RyDfBNsadShcV08KpwKe7IN3dNN0nxxrIeqnw==
X-Google-Smtp-Source: ABdhPJzu8qPCA6D1kpxXHeMtMO8O3TbgLh0QyLY8oWy5P2UKXJg3HmMXMtdXQRnulGznlGIGslhhvaCuFE5JlYb47eI=
X-Received: by 2002:a2e:890e:0:b0:249:295a:eb40 with SMTP id
 d14-20020a2e890e000000b00249295aeb40mr9371355lji.463.1647347015757; Tue, 15
 Mar 2022 05:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220311103320.3072171-1-abailon@baylibre.com>
In-Reply-To: <20220311103320.3072171-1-abailon@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Mar 2022 13:22:59 +0100
Message-ID: <CAPDyKFp4QbaCvOQoK_5rdh4X_iuvvsZ6M-iGiBCNp-VuQ+WChg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mtk-sd: Silence delay phase calculation debug log
To: Alexandre Bailon <abailon@baylibre.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_052338_556946_75D2EE04 
X-CRM114-Status: GOOD (  15.49  )
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

On Fri, 11 Mar 2022 at 11:33, Alexandre Bailon <abailon@baylibre.com> wrote:
>
> The driver prints the following log everytime data is written to RPMB:
> mtk-msdc 11230000.mmc: phase: [map:ffffffff] [maxlen:32] [final:10]
>
> dev_info is used to print that log but it seems that log is only
> useful for debbuging. Use dev_dbg instead of dev_info.
>
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index d5a9c269d492..05c8b4de46f3 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1914,8 +1914,8 @@ static struct msdc_delay_phase get_best_delay(struct msdc_host *host, u32 delay)
>                 final_phase = (start_final + len_final / 3) % PAD_DELAY_MAX;
>         else
>                 final_phase = (start_final + len_final / 2) % PAD_DELAY_MAX;
> -       dev_info(host->dev, "phase: [map:%x] [maxlen:%d] [final:%d]\n",
> -                delay, len_final, final_phase);
> +       dev_dbg(host->dev, "phase: [map:%x] [maxlen:%d] [final:%d]\n",
> +               delay, len_final, final_phase);
>
>         delay_phase.maxlen = len_final;
>         delay_phase.start = start_final;
> --
> 2.34.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
