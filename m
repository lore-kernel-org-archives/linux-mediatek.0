Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C366C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 16:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE062053B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 16:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kiDJdBxH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fq/2WmyH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BE062053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GbqZ7cxCkP2ZEYza+Dlxg5I5ovISg4PLfPPVtT/gOM0=; b=kiDJdBxHxzSYd8
	kRqipEV5fDMcFwa+VU3HeIBPwSxHZGOvArztvIl2ahMDmR8Zzre6+/l4K9BvOdQc4+aictwOcgFOs
	vaub/eUzdgxI1vPJdWZLml0J8Q1aF1jnZPIOgcnqCk5Aar4HcuiPHvQBvgBN0IkPTcDKCbcCDjpnY
	I0YhRLzAq+MzadEyWhkN5z2ZM71QzUJN38LZr0v/7ryYxQjTxPOjQGXx6SQ8EMxfo16w2q804qXkR
	glv5ouw86p/o6/Gu0vB9hn4QWvqDGFEe1IEwLY75UgUlpwvsUWlmMs6Xdka8fjbs03FbY1reY82oE
	gk0hKnTNQ9Dx0qxb1XlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYu4J-0006zJ-HL; Wed, 13 May 2020 16:17:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYu4H-0006x2-J7
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 16:17:14 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0174420794
 for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2020 16:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589386633;
 bh=LqHMqv+cs54oc1DGAOIwvhYA+eUxtjbD/21x+c7zW7Q=;
 h=From:Date:Subject:To:Cc:From;
 b=fq/2WmyHGrM5dZ688uGEcuSqe9mKSQ0Wg3B3Tm2aRh0sgsX6xy0wPrc8QVu0/rtgf
 7mnqdJFLs5uZU7BTpnIbWt9Y1dxpGxiyISyggz9R/jp0hxuXzBOM5F413aXeKQzM+t
 1jTiD14ootBIWZkieoipXtmA7azYd4bobbRf5EEU=
Received: by mail-ej1-f46.google.com with SMTP id a2so8796ejx.5
 for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2020 09:17:12 -0700 (PDT)
X-Gm-Message-State: AGi0PuZMAlHR3QDh+T7rW64DOOjq/mQsgHDAAGJo5jGFwDYgyXZXxBxC
 4zJocCX00U0ehwZ2SQckBazuQTQNR/jPEQYE/g==
X-Google-Smtp-Source: APiQypJiwyFCj/xngtINH3ad241V/T5agFVkQac23GNp0Mcffi69VPaa3fS6ljkNwUHqspKhdrJDpZOwAHa1JPxGv/8=
X-Received: by 2002:a17:906:2503:: with SMTP id
 i3mr22035962ejb.293.1589386630979; 
 Wed, 13 May 2020 09:17:10 -0700 (PDT)
MIME-Version: 1.0
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 May 2020 00:16:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8gJNpWXcMnHiZzg_sgyiJ6BDsBYRxaLX0OXWRuLF1NCg@mail.gmail.com>
Message-ID: <CAAOTY_8gJNpWXcMnHiZzg_sgyiJ6BDsBYRxaLX0OXWRuLF1NCg@mail.gmail.com>
Subject: [GIT PULL] mediatek drm next for 5.8
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_091713_676458_C8259899 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Bernard Zhao <bernard@vivo.com>,
 YueHaibing <yuehaibing@huawei.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This include dpi pin mode swap, config mipi_tx current and impedance,
convert mtk-dpi to drm_bridge API, and some fixup.

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
are available in the Git repository at:
  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
tags/mediatek-drm-next-5.8
for you to fetch changes up to 23b29ff9f13a8fb5a12be9fedb8b614b9dede46a:
  drm/mediatek: Eliminate the magic number in array size (2020-05-10
09:08:30 +0800)
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
Enric Balletbo i Serra (7):
      dt-bindings: mediatek: Update mmsys binding to reflect it is a
system controller
      soc / drm: mediatek: Move routing control to mmsys device
      soc / drm: mediatek: Fix mediatek-drm device probing
      drm/mediatek: Remove debug messages for function calls
      drm/mediatek: mtk_dpi: Rename bridge to next_bridge
      drm/mediatek: mtk_dpi: Convert to bridge driver
      drm/mediatek: mtk_dpi: Use simple encoder
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
127 ++++++++++-------
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
 27 files changed, 778 insertions(+), 476 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
 create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
