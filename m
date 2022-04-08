Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B998EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoAu2vMc5biesR0OaoIazF7qkvB8eQ0IPOJLPVfXzGA=; b=broDUN6SvtUy1l
	Zeyp4w81xd2KSK0kQ4poJ2IqaVTRWo7RUmcIzXVBExwvXuN2FDLkf/YCIoD13xh7yV048GhSFKfXy
	zZ0S9Oipw3TOfvVz2euK6KvUJm1c03MOcz3ppEnDBghU/3lE3el9Jlvq6uKrt/QBnaEdPLKHomiGI
	VZaCERaIlg7nU0vTRxQezpySbeRRlGZUKdJocGfVGSjZwxfAWBk9FlnCc9TKC6+Cmvxt6XK6Vbud/
	3XZIe7PvVYEqXP2PeyHCqqlIVHbvNjPYzwYR6ZgHQSW9Npqu311Qenu2QxmAUWsQ/Ws4QGny++tls
	PJGZIW4yL3JO6O8bo0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nckZr-00G3Bm-7H; Fri, 08 Apr 2022 09:06:47 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nckZg-00G356-HW
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 09:06:38 +0000
Received: by mail-lf1-x133.google.com with SMTP id x33so7494497lfu.1
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZTgTrO8kYm9f4pu/QJrfNd/0CjpbX6Q1P+5MHmfotqk=;
 b=i2envguo4E6b4pLxv4XJXo+T/VB92G0yxDyRf6C4Zynw809rRjG4TPgiKQW4iUdAv3
 0tw/FwIqX9NFRcxNywh1A2CkXqBeDO3z4zaJ1HWc81YOpnbcYUz2HphICFC28YyT8dRd
 rnL5rspaX1Anjxgpb5DF1oPVz0MJGGmd0zEMMkm7FLJmnWzCBJfKcnhRsqBP3rZAGVnH
 UJIRsQeHZCYIOFRUoxrDZxh0DeotCHIgMIdzstU0UQd+Nxv5L1bQcdKzr7r++SlNCXpe
 QgXC9KKAMxXCuoM3kGDuy6rRVjV0ECnVx9rKx3YmL5/KKn+bFgar4zwneztVZ0fKeyNS
 qQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZTgTrO8kYm9f4pu/QJrfNd/0CjpbX6Q1P+5MHmfotqk=;
 b=gb60ao76GMn7SrY9mO7i7f3FXQg4i/FNPM/7tgjlW2hLwJj/Mf4dYqO9o15lu8+GOt
 K/Nifsw1QLbRxdIzspU03TH4JeBxhTu+zJB/YlDrx76ooPh9mwGpanAg7UMwYMf1i+FR
 dxz5AoNKi6VnRm0PyYsBWCjXMQmtkXAY31hJPFT7NyBPhehjpt4tBCHY4hz84n8dArjC
 Yo7NlqwIfQHKuQHlQfVyPb4fxNnCaxOo7Y8GlUEKI/cE/1J6UYlKvJSx0R+iXGrbyNI5
 WywU1mjapSsMrvL/m3JNV5lVHSa04SpWAMaacjJs5k/DlkOw2Lm6U6yJyhUyGb4f3a3e
 QB8A==
X-Gm-Message-State: AOAM531npvBeRRX/x+PhgSUx1u2bZ+079GcMtg24IhnA7YBeFsIDxYPE
 WJ3iyGUhY55CLbHYuZ8ZegpEpxWPqPXfkfGdwyPzQw==
X-Google-Smtp-Source: ABdhPJxJkWFAtOiYY7lH9mD1xE8veW54kPfgnqaEUsfjr6zNHODKBpmFl1OMxUDn+3CZnMq6R8G5Xp9HAI1SN+XENZ8=
X-Received: by 2002:a05:6512:2627:b0:44a:f55c:ded9 with SMTP id
 bt39-20020a056512262700b0044af55cded9mr12460116lfb.373.1649408791888; Fri, 08
 Apr 2022 02:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220408080045.6497-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220408080045.6497-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 8 Apr 2022 11:05:55 +0200
Message-ID: <CAPDyKFpaMy7ATDm6PCnYBxS_6-TZ-TF+gfHbp_o0nTo-6RaGdQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mmc: improve API to make clear {h|s}w_reset is for
 cards
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 ath10k@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, 
 brcm80211-dev-list.pdl@broadcom.com, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_020636_648745_E6B63515 
X-CRM114-Status: GOOD (  16.39  )
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

On Fri, 8 Apr 2022 at 10:01, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> As discussed in 2020 [1], Ulf and I agreed that it would be easier to
> understand the {h|s}w_reset mechanisms if it was clear that they are for
> cards. This series implements that by changing the parameter to mmc_card
> where apropriate. Also, the callback into host drivers has been renamed
> to 'card_hw_reset' to make it obvious what exactly the driver is
> expected to reset.
>
> I tested it with my Renesas boards, so far no regressions. Buildbots are
> currently checking the series.
>
> This series is based on mmc/next as of yesterday. A branch is here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mmc/reset-api-v2
>
> Looking forward to comments. Happy hacking,
>
>    Wolfram
>
> [1] https://lore.kernel.org/all/20200916090121.2350-1-wsa+renesas@sang-engineering.com/
>
> Wolfram Sang (3):
>   mmc: core: improve API to make clear mmc_hw_reset is for cards
>   mmc: core: improve API to make clear that mmc_sw_reset is for cards
>   mmc: improve API to make clear hw_reset callback is for cards
>
>  drivers/mmc/core/block.c                             |  2 +-
>  drivers/mmc/core/core.c                              | 12 +++++++-----
>  drivers/mmc/core/mmc.c                               |  4 ++--
>  drivers/mmc/core/mmc_test.c                          |  3 +--
>  drivers/mmc/host/bcm2835.c                           |  2 +-
>  drivers/mmc/host/dw_mmc.c                            |  2 +-
>  drivers/mmc/host/meson-mx-sdhc-mmc.c                 |  2 +-
>  drivers/mmc/host/mtk-sd.c                            |  2 +-
>  drivers/mmc/host/sdhci.c                             |  2 +-
>  drivers/mmc/host/sunxi-mmc.c                         |  2 +-
>  drivers/mmc/host/uniphier-sd.c                       |  2 +-
>  drivers/net/wireless/ath/ath10k/sdio.c               |  2 +-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/sdio.c  |  2 +-
>  drivers/net/wireless/marvell/mwifiex/sdio.c          |  2 +-
>  drivers/net/wireless/ti/wlcore/sdio.c                |  2 +-
>  include/linux/mmc/core.h                             |  4 ++--
>  include/linux/mmc/host.h                             |  2 +-
>  17 files changed, 25 insertions(+), 24 deletions(-)
>

Patch 1 applied for fixes and the two others for next, thanks!

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
