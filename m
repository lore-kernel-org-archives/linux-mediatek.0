Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3B9C83F38
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 23:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=umP+AJTPMR57RxewVPVPpahtxuzDTQRzE2N4ZkKZEkM=; b=VVWZjMNQwJVBvImteTE7kmYqi/
	uCZs5nbD9t2MlYPn3bUZsZmQY1JMR2geTHZJxWlQv/R8U7SD7TziptJybLKgtV3cWC6atrKTE99Xo
	HNFqKJ38inw/1UROBZj1IJw7e1HOe9+Qk2e1S0VeHRknCntDA4BqmEPOTIGAxePuTtMaikIb+FrFC
	v+qZgJzfexjjrOVVfRJyU1OlIjqYeYMKPmQ2GRBpN35Yz9p+w42IjOzU2i1871Ij8UewRes1tmgQ4
	GdwuqnVlEbhrBe+OHJLFX4pmrGpAikuNu8HDwQY7cj/2rfkkuJ5t9cHfJJLu0Ou7b0gyFqzzOn4vf
	skyC30OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYUH-0000000BNca-0Ozh;
	Thu, 17 Jul 2025 23:58:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucY2T-0000000BI8r-1hkv
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 23:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F44C613F3;
	Thu, 17 Jul 2025 23:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B2BC4CEE3;
	Thu, 17 Jul 2025 23:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752794960;
	bh=umj1MpXiyHSIhgzpDKbeJ+au+K5ZOO0CIxaQKQnTow8=;
	h=From:To:Subject:Date:From;
	b=k+io4OlaZL1Pvj9ZSSBwbhB148SFYr+9VpNuBc4msqDMvHl9BhavwiIYyclcskhAz
	 fKVRFAl2K0kIhwN+irdtZcadYgSOOwCinSFY8N+K0D5bo/tltEka+pJBIb+dphCENJ
	 UPwdMgW2oYVQ1Ooe8n4b1NQfaYRZ3JX9D7HCFWmmllp08eLimyKfFSfbH6JWbvxYt3
	 NilE0lJ6jiUAIgeVKecMfc5VWNoGL/XWI2G3j2p/p2hfXyIUyxW3G0efYIiDrWnw+F
	 tNBcNYpQ7OCr/AeyMsg2tleJp+59hGnv/c+SCYUa8XREq25FFTBoDOT+XEq0yAHtqf
	 aU748VO3fo1uQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [GIT PULL] mediatek drm fixes - 20250718
Date: Thu, 17 Jul 2025 23:29:16 +0000
Message-Id: <20250717232916.12372-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:
1. Add wait_event_timeout when disabling plane
2. only announce AFBC if really supported
3. mtk_dpi: Reorder output formats on MT8195/88

Regards,
Chun-Kuang.

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250718

for you to fetch changes up to 5ceed7a6d34a8800bc39673bf2d5573990fbac4d:

  drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88 (2025-07-17 23:19:05 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250718

1. Add wait_event_timeout when disabling plane
2. only announce AFBC if really supported
3. mtk_dpi: Reorder output formats on MT8195/88

----------------------------------------------------------------
Icenowy Zheng (1):
      drm/mediatek: only announce AFBC if really supported

Jason-JH Lin (1):
      drm/mediatek: Add wait_event_timeout when disabling plane

Louis-Alexis Eyraud (1):
      drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88

 drivers/gpu/drm/mediatek/mtk_crtc.c     | 36 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.h     |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  9 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c |  7 +++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c      |  4 ++--
 drivers/gpu/drm/mediatek/mtk_plane.c    | 12 +++++++++--
 drivers/gpu/drm/mediatek/mtk_plane.h    |  3 ++-
 9 files changed, 68 insertions(+), 6 deletions(-)

