Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3743CC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:34:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0EE723DC1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0EE723DC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fCoi1MiBS/mgDrKrhYG318gkxarklz2cdDXmBXgB89Q=; b=xDbPuLtrAw9UL+AWSujEHpG4PQ
	HuIacs/lNUpq0MELgTrRIILZhTGOhnZQcbjmOtpRoNE0SUf9/X9IMktivakmHG8z4+sDNKLIMzIV1
	YJd9W3vRU0dm3bFvzJWYNRz3IqPTNbgFplqdg9tydGJq0uO8L3uVsr8m5umThMemJOlY7qUYRuaBH
	IeblEasLC9RkswOJrVbt7EhS6lfyksJ6zn0iSSDOXLr1jUy7EfHWYYPQWmL5W0uomBYfNDjJqdJVG
	i4Ewxp0tnlipMuvIv/bWeM15bm2x2xT8kW3Dv0jfGxw0DNiJN8yayLbJGAOlnoIXS6HQVp+1xRLSw
	hbm5nSAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knPq3-00028z-Rr; Thu, 10 Dec 2020 17:34:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOWy-0001aN-L9
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 16:11:05 +0000
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 00/12] Decouple Mediatek DRM sub driver
Date: Fri, 11 Dec 2020 00:10:38 +0800
Message-Id: <20201210161050.8460-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_111100_861401_5C742A27 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk ccorr is controlled by DRM and MDP [1]. In order to share
mtk_ccorr driver for DRM and MDP, decouple Mediatek DRM sub driver
which include mtk_ccorr, so MDP could use this decoupled mtk_ccorr.

Changes in v2:
1. Fix iommu larb problem.
2. Based on mediatek-drm-next-5.11-2 [2].

[1] https://patchwork.kernel.org/patch/11140751/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next-5.11-2

CK Hu (10):
  drm/mediatek: Separate getting larb device to a function
  drm/mediatek: Move clk info from struct mtk_ddp_comp to sub driver
    private data
  drm/mediatek: Move regs info from struct mtk_ddp_comp to sub driver
    private data
  drm/mediatek: Remove irq in struct mtk_ddp_comp
  drm/mediatek: Use struct cmdq_client_reg to gather cmdq variable
  drm/mediatek: Move cmdq_reg info from struct mtk_ddp_comp to sub
    driver private data
  drm/mediatek: Change sub driver interface from mtk_ddp_comp to device
  drm/mediatek: Register vblank callback function
  drm/mediatek: DRM driver directly refer to sub driver's function
  drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver

Chun-Kuang Hu (2):
  drm/mediatek: Get CMDQ client register for all ddp component
  drm/mediatek: Use correct device pointer to get CMDQ client register

 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  89 ++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  69 ++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 217 +++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 169 ++++----
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  44 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  75 ++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 429 ++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 100 +++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  30 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  47 +--
 12 files changed, 676 insertions(+), 596 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_drv.h

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
