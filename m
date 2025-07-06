Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC79C8303C
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Jul 2025 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rqNLYMRH4CDWul+5kzYEonT9Ub92+sW4uCVrpVBn+XU=; b=FoUIdXMVm+k4iF/y89dTMZ+7z/
	OSA3NLJjJNupTCPbiESQyQfA9XC0YBFv6w+P8ejg/a1gRS02iCXAlSLIWpW95kV3pTG93yu5zCjHj
	JCdhcxU5SqTyVQofelulJgVzgL6fQSwkaKLPo7xjKD+S0V07IlLpjhzW7ntJXIxqasMQUKSZCi0bm
	Pd0sjVr0TDxUOIT989aUolik5EyBkxfdfnQW854KFVH3+HCjf/Nyzgkej/IByzWWJWrOG8yuJbJK/
	v1stbJ22h2LtZ0m2UqtPNnJigaoY2P6IW3LvZEupHyvNDV0Z+Se/PseMnj9E2MNfYbKzTOanQprdK
	Mf4S6jIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYEz4-0000000HGlQ-4BIV;
	Sun, 06 Jul 2025 02:20:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYEz2-0000000HGka-1aLt
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Jul 2025 02:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92FDC454B2;
	Sun,  6 Jul 2025 02:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E125C4CEE7;
	Sun,  6 Jul 2025 02:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751768399;
	bh=5yjfcB+f1C7tTVdIW91QSz7CWF1fY2xoIWAxpTquOTM=;
	h=From:To:Subject:Date:From;
	b=nlh7v7SWbZgB4xLZ4a5xMtdG1sEU0VFo2Bhx47aQ9/51NPt12LmZ+YlMYwd9tEWoz
	 gOHKXjeBeINbxG8myTRIUKHprIBTiSoMsdqRw6yAX6l70kOxiG5GRmmWu3T2uo+3Kp
	 DQ7k2Z7rYBHSvNxP19UirZ+ZlfhguB2HTNiYfwCoATn+2sYsIWIA/F1qJJgm7PLmKx
	 ObVjxPCwfezCgbmYdcmMbbtHFZWPjlkXVujyS27aQBJVwuhCB866DfIFZafNUxxuBz
	 1s3iYkJUf6TB6ce+b7OUJ1jMycAKCLReJ/c50DlJ9Yky8AF7LL4Yia/73orPyJ8Djb
	 DB4m0esgyV4Ug==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [GIT PULL] mediatek drm fixes - 20250706
Date: Sun,  6 Jul 2025 02:19:55 +0000
Message-Id: <20250706021955.2794-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_192000_438543_DD2E23F3 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
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

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250706

for you to fetch changes up to 8708a4897380da17bd1afa70f8c6bef06fefe360:

  drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88 (2025-06-25 15:13:09 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250706

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

 drivers/gpu/drm/mediatek/mtk_crtc.c     | 34 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.h     |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  9 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c |  7 +++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c      |  4 ++--
 drivers/gpu/drm/mediatek/mtk_plane.c    | 12 ++++++++++--
 drivers/gpu/drm/mediatek/mtk_plane.h    |  3 ++-
 9 files changed, 66 insertions(+), 6 deletions(-)

