Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74364C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 03:16:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5A360527
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 03:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C5A360527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1KHb6b2tmv2qknqTU66fZ0gIQLYXgtHgPcwyMV6WHE=; b=utFXRJZnuBcv3h
	2pZgLgB5cW0IDMpUkCjfBGo09zc2IubRhIyw4/fuSd/KzsRfsK7AJu65JNXkqmucxyoybpcpGBjjV
	SNI64Hq+GEBvqlnlGANWF6zcTqLkU4T+igOJtjeK9bKZucD1YiwNN07+6PXkrnnMqY6H75SXzqXLR
	FjBDUwqTgkAuFhlLnj3CzY+YOnyqrAjv3oWeHo8qSN9e6CiZf0J4c0pmcenCKUoDnvrOgKQpV4J0w
	TDjHEhR5BubfaZ4+FHMeVzGITdZHoaoGR7XGlrlATZG1jDdfBpwbaSmNL6TXcFptViDWuC73OyZWl
	ZGMFJXqfVg+CmbJIyeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8wWi-002xXw-SX; Thu, 29 Jul 2021 03:16:04 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8wWU-002xWk-UD
 for linux-mediatek@lists.infradead.org; Thu, 29 Jul 2021 03:15:52 +0000
Received: by mail-il1-x135.google.com with SMTP id a14so4344945ila.1
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Jul 2021 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GEHpVphhyLJFXCEe7iQRjsD/9tyMnPNRqVbPlXIwLE4=;
 b=H90NoVLKUmuE48C1hAsE0ENepOFZRurynbwu4Ws/QA1jGVRagWYAhHGiC8+m2XW69W
 JA9fHV1GqZL6fM7sH2FKKneMMmwqYPo8v4iPz8hoSF6djxgc3bXBfUay/zJ28wLYWvpT
 vkll/a6MvrPvAukm8GFHf+MXXIuhOKhN/2AKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEHpVphhyLJFXCEe7iQRjsD/9tyMnPNRqVbPlXIwLE4=;
 b=newcbTLq0yULCPVzirP7W4jb5yjCJETbqdmM/WCbnIN3H+ZNOOeDBK6LW5JlOdheXq
 ViIQuqQ69yVp9NZNUS065sy6PrHsO/VdSrWUWJOBL5h+p1al+Gc0irPRzXP1NhLTqiAn
 lV/urr6swbe/hvH4axfcfJAnAmifqpguhjZUJc+lj2RQ4yG0dmMfJH5vE/qcO6qdqerE
 ndQi9f7x51RS56SWI5hu4FvYHcX81E19ayUIV+s3hsr3A1LZcFOE2VGreXVeiGOxiJsP
 5bLTKLtvY6VGF2LcveBVk7XD+95IH8baYtdcW2Xl+BfWbNJ7JUMfrX466ulb6g9EA9Tu
 GSJQ==
X-Gm-Message-State: AOAM530+j3YtJCbsS9V+B/6wUJcKQIDnPdUVtL8VEbYFBqauaXO6aLIt
 IoEqPzdKV6lVMTAANhlRxlvi98GrS/3msc0JpCS0WA==
X-Google-Smtp-Source: ABdhPJyPsS75VPrbgercdilELkiuOWzRBn0SaHkomjCxnwrLSJus0YUdJJOv5CRdtmWxFFYOzx1hw2W2wQKSbbm/++c=
X-Received: by 2002:a05:6e02:d8f:: with SMTP id
 i15mr2072719ilj.102.1627528549224; 
 Wed, 28 Jul 2021 20:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210727174025.10552-1-linux@fw-web.de>
In-Reply-To: <20210727174025.10552-1-linux@fw-web.de>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 29 Jul 2021 11:15:23 +0800
Message-ID: <CAJMQK-g8g5QJbBkU-A6th1VSWafxVv2fGtym+enQa_hDVaVoBw@mail.gmail.com>
Subject: Re: [PATCH] soc: mmsys: mediatek: add mask to mmsys routes
To: Frank Wunderlich <linux@fw-web.de>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
 stable@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_201551_025850_C24D9A6F 
X-CRM114-Status: GOOD (  21.83  )
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

On Wed, Jul 28, 2021 at 1:41 AM Frank Wunderlich <linux@fw-web.de> wrote:
>
> From: CK Hu <ck.hu@mediatek.com>
>
> SOUT has many bits and need to be cleared before set new value.
> Write only could do the clear, but for MOUT, it clears bits that
> should not be cleared. So use a mask to reset only the needed bits.
>
> this fixes HDMI issues on MT7623/BPI-R2 since 5.13
>
> Cc: stable@vger.kernel.org
> Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the routing registers")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> ---
> code is taken from here (upstreamed without mask part)
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2345186/5
> basicly CK Hu's code so i set him as author
> ---
>  drivers/soc/mediatek/mtk-mmsys.c |   7 +-
>  drivers/soc/mediatek/mtk-mmsys.h | 133 +++++++++++++++++++++----------
>  2 files changed, 98 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 080660ef11bf..0f949896fd06 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -68,7 +68,9 @@ void mtk_mmsys_ddp_connect(struct device *dev,
>
>         for (i = 0; i < mmsys->data->num_routes; i++)
>                 if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -                       reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
> +                       reg = readl_relaxed(mmsys->regs + routes[i].addr);
> +                       reg &= ~routes[i].mask;
> +                       reg |= routes[i].val;
>                         writel_relaxed(reg, mmsys->regs + routes[i].addr);
>                 }
>  }
> @@ -85,7 +87,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>
>         for (i = 0; i < mmsys->data->num_routes; i++)
>                 if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -                       reg = readl_relaxed(mmsys->regs + routes[i].addr) & ~routes[i].val;
> +                       reg = readl_relaxed(mmsys->regs + routes[i].addr);
> +                       reg &= ~routes[i].mask;

This patch is breaking the mt8183 internal display. I think it's
because  ~routes[i].val; is removed?
Also what should the routes[i].mask be if it's not set in
mmsys_mt8183_routing_table?

>                         writel_relaxed(reg, mmsys->regs + routes[i].addr);
>                 }
>  }
<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
