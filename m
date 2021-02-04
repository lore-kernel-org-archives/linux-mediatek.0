Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98C0C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:18:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6365B64DDA
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6365B64DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XGjwE3QtHF60dwCmBMTnlNevHKM4hmAlhwif9a0j738=; b=HFCHjesVkkuhMMcrW3RGtfIk3j
	fGPmdCvJitY8FHVMvp9ZKYpE+dDBm018UQq8MKZHENHe4fz4gv2qQXzc8mTvRCzrCqaROAOl18kIZ
	5bACyUt0TGimuc69Bj/HJDL3P8zBni2AhLO8WrSJ9Ip61hYwUQ21A2vr/zGQp7wT9+hhUM0j0Wzsw
	OMlGEoWXGzjRGbOttNrLYhV3au23xcH+FnLEsK4SLvRH5T9jPwPQdQqJuaYqX1knDL6AhYYcO/YnV
	ogB2Vw28WSnFS4ou0HPMMTPbjd406eBpMLBGfD/PFXhTornqQfD61aQnprPLjKCRFliBQT70wlrmw
	Y1H4El0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7gOM-0007z5-28; Thu, 04 Feb 2021 15:17:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7gOJ-0007yb-K3
 for linux-mediatek@lists.infradead.org; Thu, 04 Feb 2021 15:17:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BA7F64E31;
 Thu,  4 Feb 2021 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612451874;
 bh=zNK209Gl4uZunzJzQ3WYCdDVLRby+xZhZaHIDYojS4Y=;
 h=From:To:Cc:Subject:Date:From;
 b=kBCQcYXmwfxn7ym0KuwRG6mfnPhiP9tpxuA8pxVERcCjWZFsiASgKFyTaoFYly9TF
 K1PKTb4MHLNN3Sh3RUo9XQckgkS02vcDXIC/abV7ap8gBoOS8GaREEeq6JDhCv/Npo
 HAJM4JqOD+kQmDDBeyVbJye71LzgDTsVKexYYjQ1zXJ+zzUYEQamI17j9/tcDbGUTr
 k3GNNaZXEg6AYLiEkNJ0PL8Amkvyhx70jcL0xRj5k8E+b2hPCINeZxtC+NL1XajYUi
 Z5EDRyxAzM3UcAF9II7ONafO/3j8jH1OLBwWSW8pQNIRaQr3zPZFQ2Vdu5sSDg1Pfi
 KYpvq8HsecBig==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [GIT PULL v2] mediatek drm next for 5.12
Date: Thu,  4 Feb 2021 23:17:50 +0800
Message-Id: <20210204151750.7550-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_101755_828170_F22096FE 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This version fix fixes tag quotation missing.
This includes:

1. Decouple Mediatek DRM sub driver
2. Share mtk mutex driver for both DRM and MDP
3. Add support for SoC MT8183

Regards,
Chun-Kuang.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.12

for you to fetch changes up to 738ed4156fbac6f6eb84c23b95cf25aa57707332:

  drm/mediatek: Add matrix_bits private data for ccorr (2021-02-04 22:55:46 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.12

1. Decouple Mediatek DRM sub driver
2. Share mtk mutex driver for both DRM and MDP
3. Add support for SoC MT8183

----------------------------------------------------------------
CK Hu (15):
      drm/mediatek: Separate getting larb device to a function
      drm/mediatek: Move clk info from struct mtk_ddp_comp to sub driver private data
      drm/mediatek: Move regs info from struct mtk_ddp_comp to sub driver private data
      drm/mediatek: Remove irq in struct mtk_ddp_comp
      drm/mediatek: Use struct cmdq_client_reg to gather cmdq variable
      drm/mediatek: Move cmdq_reg info from struct mtk_ddp_comp to sub driver private data
      drm/mediatek: Change sub driver interface from mtk_ddp_comp to device
      drm/mediatek: Register vblank callback function
      drm/mediatek: DRM driver directly refer to sub driver's function
      drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver
      drm/mediatek: Remove redundant file including
      drm/mediatek: Rename file mtk_drm_ddp to mtk_mutex
      drm/mediatek: Change disp/ddp term to mutex in mtk mutex driver
      drm/mediatek: Automatically search unclaimed mtk mutex in mtk_mutex_get()
      soc / drm: mediatek: Move mtk mutex driver to soc folder

Chun-Kuang Hu (2):
      drm/mediatek: Get CMDQ client register for all ddp component
      drm/mediatek: Use correct device pointer to get CMDQ client register

Hsin-Yi Wang (2):
      drm/mediatek: mtk_dpi: Create connector for bridges
      drm/mediatek: Add mtk_dither_set_common() function

Jitao Shi (1):
      drm/mediatek: dsi: Use IRQF_TRIGGER_NONE for dsi irq trigger type

Yongqiang Niu (15):
      dt-bindings: mediatek: add description for mt8183 display
      dt-bindings: mediatek: add description for mt8192 display
      drm/mediatek: Check if fb is null
      dt-bindings: mediatek: add rdma-fifo-size description for mt8183 display
      dt-bindings: mediatek: add description for postmask
      drm/mediatek: Fix aal size config
      drm/mediatek: Add fifo_size into rdma private data
      drm/mediatek: Separate gamma module
      drm/mediatek: Add has_dither private data for gamma
      drm/mediatek: Add support for SoC MT8183
      drm/mediatek: Enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
      drm/mediatek: Enable dither function
      drm/mediatek: Separate ccorr module
      drm/mediatek: Fix ccorr size config
      drm/mediatek: Add matrix_bits private data for ccorr

 .../bindings/display/mediatek/mediatek,disp.txt    |  12 +-
 drivers/gpu/drm/mediatek/Makefile                  |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          | 223 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |  89 ++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  92 ++++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          | 197 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 254 ++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           | 194 ++++----
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  57 +--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 107 ++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |  28 --
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 503 ++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        | 100 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  88 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  50 +-
 drivers/soc/mediatek/Makefile                      |   1 +
 .../mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c}     | 328 +++++++-------
 include/linux/soc/mediatek/mtk-mutex.h             |  26 ++
 20 files changed, 1446 insertions(+), 914 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_drv.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.h
 rename drivers/{gpu/drm/mediatek/mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c} (53%)
 create mode 100644 include/linux/soc/mediatek/mtk-mutex.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
