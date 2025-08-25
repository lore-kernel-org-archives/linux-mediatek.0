Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFF0CA0FE8
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x7oK/oLbTvOZJCpNyytT1I9W5K6oVRnefhFtfDbtR38=; b=hivpG2dF95BNaC/4W/NakEznhA
	ynPOWfn/xBEkQp+oyl4JGVdUzGQJMtB+dPkL/kHBkML5NiVXh7qb0EBfK8lRMpuxTIqsM1z79UiXO
	aWRSp6TAaZz8Fylx4yZJX0KqnGsO6fdfJ1ELCUN38V+Q4v6yrL2zbkbTtt1hmzxIdr4YCVBoyzOn1
	MC/8J7TK7Xk4h0b8TRSyL3Rl/r3VRnPqegeEMZMPglY82HKvD3bqHmowkcfRr19uoR3b6jp3CO6B6
	s8xbQltMt+XcU0Ergj0ROZKNS93fX8h1PJBIfwwBuEURCQ3hA1H/LlY2m/MYSq02OwHc951UWJtCx
	Wr/eDI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZXl-00000008ZuO-0tTL;
	Mon, 25 Aug 2025 15:55:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYpV-00000008Ss9-1cBo
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Aug 2025 15:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 442954488F;
	Mon, 25 Aug 2025 15:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C752AC4CEED;
	Mon, 25 Aug 2025 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756134592;
	bh=D5JfNIGsYtCUzeP1Emn+WvKO7QWwGQOk/zFvJ+01A1s=;
	h=From:To:Subject:Date:From;
	b=MnXVfg5MNm1GUa3h5ZsddMgxbjNNkM2dOcnRJ6aDcdDdHGJ+1nSSRaSd+VZ5l6cRU
	 vZEjF04uc8ekN3t08JdKEM53wFDBQXHNINlJj7h5xnfIuHO+fr7OQ6GEN5jYvZh7qt
	 oqXVzw4lyw2xw+aI7kvR6180VVYnJx5J8XSI5F4Z2L+JWPK2zk8KUo4ERTCgxAqjEn
	 XgGB0nz818K4Lql/TjWwCObXi1MurUPxOGnGiuWBrEsTSkHmsq+r3df4GVJu70WYZv
	 vGYWNMDn7yM6brVLIxiWYKM0NqFnnQsvLbFT55Ms0UO2vbKBtcpOedpwGXAYAWYBws
	 zJVkNOBHQ2Vdg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Ma Ke <make24@iscas.ac.cn>
Subject: [GIT PULL] mediatek drm fixes - 20250825
Date: Mon, 25 Aug 2025 15:09:48 +0000
Message-Id: <20250825150948.2998-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_080953_439919_DB4F0DEC 
X-CRM114-Status: UNSURE (   6.78  )
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
1. Add error handling for old state CRTC in atomic_disable
2. Fix DSI host and panel bridge pre-enable order
3. Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
4. mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

Regards,
Chun-Kuang.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250825

for you to fetch changes up to e65e7bce0f0530052bfbae07d34a362480f94f4d:

  drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls (2025-08-23 15:34:39 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250825

1. Add error handling for old state CRTC in atomic_disable
2. Fix DSI host and panel bridge pre-enable order
3. Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
4. mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

----------------------------------------------------------------
Jason-JH Lin (1):
      drm/mediatek: Add error handling for old state CRTC in atomic_disable

Louis-Alexis Eyraud (2):
      drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order
      drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

Ma Ke (1):
      drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_dsi.c     |  6 ++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.c    |  8 ++++----
 drivers/gpu/drm/mediatek/mtk_plane.c   |  3 ++-
 4 files changed, 26 insertions(+), 12 deletions(-)

