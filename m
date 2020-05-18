Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87A6C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 00:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 885372067D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 00:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGejzd/x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4nmrWAH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 885372067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lYqB1/NXOGO3ZA2xwRJHXujnK3WM/1KozsvUqkTGVTc=; b=cGe
	jzd/xkscEfo8QBzHyYpucTai7m6DNDZRcfmNUsNWZc5RlUmrV2aIUgC+utEb6HH2/utcAa9GQ2bQs
	ALEMtGqz8VAWw/W4zyeQvtjw7KXdbmHDE9TwNpXXqq4ukCtb7jwEI4o0Xa13dWiCl/el4ky/gRqkV
	ewCPgFmHsMbez/NB8Aiq/vOOHC4OFT95CiQSiw76mMHWw2oZd1oHlMXKKdsUjgBAwsyI+rZ/4Ldz+
	FS+TYe59760DWTl81L5WyabUt40Z1geqWKKEmWFkm0qUOaE39RiRwVTYBp/Vdo6C+gFUxaasqxdM2
	SHj78cUdseLcx+xFcKeaqzGV8M+nTjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaTIp-0007w4-HY; Mon, 18 May 2020 00:06:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaTIm-0007vh-8c
 for linux-mediatek@lists.infradead.org; Mon, 18 May 2020 00:06:41 +0000
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAA252067D
 for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2020 00:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589760394;
 bh=LeR4+EuxTF9HvWrcrcTAkCiB30AEQHBjIa6B1Vqmk50=;
 h=From:Date:Subject:To:From;
 b=n4nmrWAHGqu43/jYxtNeka6fAxGOqniBJvr/DK30jANFFlAL0lLZxajxKiKAfuT/K
 P21gvx3qxj9wS8cTpftw/cs48PEF9sEyd6uMg/DVH3BRm3TZnAfSsk3YoEB035x8o6
 sTz2L3rO8UzDwlkccR+kdm1vZzrib8OR09Y2vT2I=
Received: by mail-ed1-f52.google.com with SMTP id k19so6982657edv.9
 for <linux-mediatek@lists.infradead.org>; Sun, 17 May 2020 17:06:33 -0700 (PDT)
X-Gm-Message-State: AOAM533aGB8UKVKQ1I3G31rZz5ekXnmnFDWo+f8igp44arPAFCmHLzOm
 ZrcWL0lCOFR2zX4etlhSzprmsdYF3O2af+i7eA==
X-Google-Smtp-Source: ABdhPJxVLRseciM0ruSfMPREomFv8I8KV6q9J3+1yH0SCIFVeVAjvQtfmLcHAd3ocnI2iRj3HCJpZBaVWXPQnsQw56E=
X-Received: by 2002:a50:e1c5:: with SMTP id m5mr5720901edl.47.1589760392355;
 Sun, 17 May 2020 17:06:32 -0700 (PDT)
MIME-Version: 1.0
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 May 2020 08:06:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
Message-ID: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
Subject: [GIT PULL v2] mediatek drm next for 5.8
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bernard Zhao <bernard@vivo.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>, 
 YueHaibing <yuehaibing@huawei.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_170640_345889_2D6D516A 
X-CRM114-Status: GOOD (  13.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This include dpi pin mode swap, config mipi_tx current and impedance,
and some fixup. I drop drm_bridge patches in this version.

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
are available in the Git repository at:
  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
tags/mediatek-drm-next-5.8
for you to fetch changes up to 007d274a017bb4e2ef7b922c2f54f40cf2073664:
  drm/mediatek: Eliminate the magic number in array size (2020-05-16
17:08:47 +0800)
----------------------------------------------------------------
Mediatek DRM Next for Linux 5.8
----------------------------------------------------------------
Anand K Mistry (1):
      drm/mediatek: Stop iterating dma addresses when sg_dma_len() == 0
Bernard Zhao (2):
      drm/mediatek: Cleanup coding style in mediatek a bit
      drm/mediatek: Eliminate the magic number in array size
Chun-Kuang Hu (1):
      Merge tag 'v5.7-next-drm-stable' of
ssh://gitolite.kernel.org/.../matthias.bgg/linux into
mediatek-drm-next
Enric Balletbo i Serra (4):
      dt-bindings: mediatek: Update mmsys binding to reflect it is a
system controller
      soc / drm: mediatek: Move routing control to mmsys device
      soc / drm: mediatek: Fix mediatek-drm device probing
      drm/mediatek: Remove debug messages for function calls
Hsin-Yi Wang (1):
      drm/mediatek: Fix device passed to cmdq
Jitao Shi (6):
      dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
      drm/mediatek: set dpi pin mode to gpio low to avoid leakage current
      dt-bindings: display: mediatek: add property to control mipi tx
drive current
      dt-bindings: display: mediatek: get mipitx calibration data from nvmem
      drm/mediatek: add the mipitx driving control
      drm/mediatek: config mipitx impedance with calibration data
Matthias Brugger (2):
      drm/mediatek: Omit warning on probe defers
      clk / soc: mediatek: Move mt8173 MMSYS to platform driver
YueHaibing (1):
      drm/mediatek: Fix Kconfig warning
 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt   |   7 +-
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt |   6 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt |  10 ++
 drivers/clk/mediatek/Kconfig                                        |   7 +
 drivers/clk/mediatek/Makefile                                       |   1 +
 drivers/clk/mediatek/clk-mt8173-mm.c                                |
146 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt8173.c                                   |
104 --------------
 drivers/gpu/drm/mediatek/Kconfig                                    |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c                           |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                            |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                                  |
 43 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c                             |  27 ++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c                              |
259 +---------------------------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h                              |   7 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                              |
 50 +++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h                              |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c                              |   3 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                                  |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                                 |  22 ++-
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c                              |
 54 +++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h                              |   4 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c                       |  28 ++++
 drivers/soc/mediatek/Kconfig                                        |   8 ++
 drivers/soc/mediatek/Makefile                                       |   1 +
 drivers/soc/mediatek/mtk-mmsys.c                                    |
337 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h                              |  20 +++
 27 files changed, 739 insertions(+), 431 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
 create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
