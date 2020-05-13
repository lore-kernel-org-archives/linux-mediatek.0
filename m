Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044EDC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 19:45:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF5F20659
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 19:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LmJ4Z7t1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="XU7gRL4v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF5F20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLDSzmL5GdvOdb+XwHOqaXS9pyemty2n/IwPV8DcfYU=; b=LmJ4Z7t1LNQVq8
	snHgFT5vC27rthlNfAvfUOG861zAzvCz5oB4GTGq1osu6BLL2Qxy30ppeYa8eG7MOJ6ZeVCJsXMty
	ksBPIiyxNxWJjY5FVD2yRpLXMMs3XAIBVzo4FPGz4FU9s8AAOs6a1DP1Qp3yEU6tD207pSTuYdcUA
	ACVf+8YJGhWjnExqvhCBWNJ/0f+GDVMCTqhnC07kXv5qJaE+QBiO7tgFp+3U8/Dc/Bxp+jfEop40f
	QtE79zCei0r9WBzm3kxhjNqsuwOPE30Wmd/Sf1+FSPtNDf8OQwjyADb0ogbT5T5s/mYpLgLA7rX15
	YwVNY8coVjtlwYP1UyKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYxJl-0000Ix-Cf; Wed, 13 May 2020 19:45:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYxJi-0000IS-KR
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 19:45:24 +0000
Received: by mail-wm1-x344.google.com with SMTP id m24so18264835wml.2
 for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2020 12:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fktKk3VPkbByxMnUb2lfcrz6WyYgwRfNuZOH8M/MI6s=;
 b=XU7gRL4veiPTn8LeZV5Zw4H2p6P7rlb5zDm8t+QfU+x+JYQaZEDpZ/Vfkz/Nc2gZ6E
 SE43C+CrySsjUtl1JrIdNDCnpevmncgZ00eLbEO5I83zIFEyGRssaE50HHfzjROVzofl
 S2YmeuRpI2bGvYTCKG9NKJIU5dmuFeOzpUWS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fktKk3VPkbByxMnUb2lfcrz6WyYgwRfNuZOH8M/MI6s=;
 b=hEOOHV2Y+Fq9KyqtV1gRaAebWnX+puMrOWwHQQtqofMGpQe8mgj7R2ZMuqC0UQtDD2
 kxEVERYHRC1mqiBrnrjKA2m+71MAs3jFp6sau1waiO6b57PWZj2TL/tCnZzFPHmPvXVL
 ibSpqP2an6YQ1Uf1gDTcasrETLp4fcfvahfJ9LwAxnA/SM1ovOuFh+1kYfdS+65rCrtY
 8ZFNU53MThOFoEZd7H+ortj9YNJus9/OFooVV4BvF1mX+c9CCZre6J4zUUhNofRNfE2i
 7k16qEJ1V5w4EYKS80G0teLmIZiyYH1+FmkjYLfKpQ5WRKeSe9nNf5ZKrKcEYGw6YHZS
 J/cQ==
X-Gm-Message-State: AGi0PuZfpST/OcFElhX3v5gnqPLIlRe7W67qhqVIjqPDTsvFZ6pwnKJM
 2TzvrnKkMUYtGGM//vzswCHmTw==
X-Google-Smtp-Source: APiQypLjLvOuunRYTd+SxcqMzVtW21yRmTzyCEgDimY0GhpGnBTQLazCjnaLb8wyQ2nIQMGEY2kHXA==
X-Received: by 2002:a1c:f207:: with SMTP id s7mr17333901wmc.14.1589399120838; 
 Wed, 13 May 2020 12:45:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r2sm657575wrg.84.2020.05.13.12.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 12:45:20 -0700 (PDT)
Date: Wed, 13 May 2020 21:45:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [GIT PULL] mediatek drm next for 5.8
Message-ID: <20200513194518.GN206103@phenom.ffwll.local>
References: <CAAOTY_8gJNpWXcMnHiZzg_sgyiJ6BDsBYRxaLX0OXWRuLF1NCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_8gJNpWXcMnHiZzg_sgyiJ6BDsBYRxaLX0OXWRuLF1NCg@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_124522_673336_F42E1062 
X-CRM114-Status: GOOD (  17.92  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>, YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 14, 2020 at 12:16:59AM +0800, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
> 
> This include dpi pin mode swap, config mipi_tx current and impedance,
> convert mtk-dpi to drm_bridge API, and some fixup.
> 
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> are available in the Git repository at:
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
> tags/mediatek-drm-next-5.8

Your pull request is badly line wrapped, and I don't have an ssh account
on that machine ... Maybe airlied has, not sure. http:// or git:// would
be a bunch easier, and then signed that. Plus if your pull isn't
linewrapped we can stuff it directly into scripts.

All I quickly wanted to quickly check is your new bridge driver.
- was that reviewed/acked by bridge maintainers? There's a lot of rework
  going on right now, need to make sure we're not adding new bridge
  drivers that use old style

- why is this bridge driver not in drm/bridge/ directory?

Cheers, Daniel

> for you to fetch changes up to 23b29ff9f13a8fb5a12be9fedb8b614b9dede46a:
>   drm/mediatek: Eliminate the magic number in array size (2020-05-10
> 09:08:30 +0800)
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 5.8
> ----------------------------------------------------------------
> Anand K Mistry (1):
>       drm/mediatek: Stop iterating dma addresses when sg_dma_len() == 0
> Bernard Zhao (2):
>       drm/mediatek: Cleanup coding style in mediatek a bit
>       drm/mediatek: Eliminate the magic number in array size
> Chun-Kuang Hu (1):
>       Merge tag 'v5.7-next-drm-stable' of
> ssh://gitolite.kernel.org/.../matthias.bgg/linux into
> mediatek-drm-next
> Enric Balletbo i Serra (7):
>       dt-bindings: mediatek: Update mmsys binding to reflect it is a
> system controller
>       soc / drm: mediatek: Move routing control to mmsys device
>       soc / drm: mediatek: Fix mediatek-drm device probing
>       drm/mediatek: Remove debug messages for function calls
>       drm/mediatek: mtk_dpi: Rename bridge to next_bridge
>       drm/mediatek: mtk_dpi: Convert to bridge driver
>       drm/mediatek: mtk_dpi: Use simple encoder
> Hsin-Yi Wang (1):
>       drm/mediatek: Fix device passed to cmdq
> Jitao Shi (6):
>       dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
>       drm/mediatek: set dpi pin mode to gpio low to avoid leakage current
>       dt-bindings: display: mediatek: add property to control mipi tx
> drive current
>       dt-bindings: display: mediatek: get mipitx calibration data from nvmem
>       drm/mediatek: add the mipitx driving control
>       drm/mediatek: config mipitx impedance with calibration data
> Matthias Brugger (2):
>       drm/mediatek: Omit warning on probe defers
>       clk / soc: mediatek: Move mt8173 MMSYS to platform driver
> YueHaibing (1):
>       drm/mediatek: Fix Kconfig warning
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt   |   7 +-
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt |   6 +
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt |  10 ++
>  drivers/clk/mediatek/Kconfig                                        |   7 +
>  drivers/clk/mediatek/Makefile                                       |   1 +
>  drivers/clk/mediatek/clk-mt8173-mm.c                                |
> 146 +++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8173.c                                   |
> 104 --------------
>  drivers/gpu/drm/mediatek/Kconfig                                    |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_color.c                           |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c                             |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c                            |   5 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                                  |
> 127 ++++++++++-------
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c                             |  27 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c                              |
> 259 +---------------------------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h                              |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c                              |
>  50 +++----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h                              |   2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c                              |   3 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c                                  |   8 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                                 |  22 ++-
>  drivers/gpu/drm/mediatek/mtk_mipi_tx.c                              |
>  54 +++++++
>  drivers/gpu/drm/mediatek/mtk_mipi_tx.h                              |   4 +
>  drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c                       |  28 ++++
>  drivers/soc/mediatek/Kconfig                                        |   8 ++
>  drivers/soc/mediatek/Makefile                                       |   1 +
>  drivers/soc/mediatek/mtk-mmsys.c                                    |
> 337 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h                              |  20 +++
>  27 files changed, 778 insertions(+), 476 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
