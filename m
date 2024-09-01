Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346E5C54FC6
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Sep 2024 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VsGlwPZVDBGybTRg10cMLlzuGawlqNFvp72WBi29Nyo=; b=ATI2+MPqK7pz7r
	SQAI6DwtXwWZzIR2lNGnpAsv8ql010G3oih1AuUW7PyLuUcKRKjZn9MQh7HNLo52mQpOXB67huZly
	CHmZXhX5+1bVyy3tvDI5TmcSGbgOJ3bsFdeDP6/zTRovlMZ+44HmJlvqzULWLvOzdqFd0XaC78YvK
	PgJzilEm06BygWLtcuKx066G01j0/Cklkz4Zgz3iqDBMfV9nTkbiciC3ynbyg+hkBSbAoYjpyrsxH
	AQ46CloFuvXb+eHVVjX+wHPJZ1sfPWDB5LSCR+MU2q81BZpIdIGJmVGHIfw5Dw+S6O4GrmscIvlEZ
	S/W6mrpuy1l/NlcVDiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skkPC-0000000BgMw-2iSQ;
	Sun, 01 Sep 2024 13:14:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skkP9-0000000BgLk-3TBb
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Sep 2024 13:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B466E5C4D20;
	Sun,  1 Sep 2024 13:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413AEC4CEC3;
	Sun,  1 Sep 2024 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725196440;
	bh=TsJk1UslMdTzF39qT2aKFXcW5AVFwY/n1oi5BBSvDac=;
	h=From:To:Cc:Subject:Date:From;
	b=LFs28TByEBAyyAoduQhLjyAowqYt8AQKf9cZ5Kw8g4aS9vYMoLgpp4Vw9zNKNqVCg
	 QmrEFpBNhbbGvUiMBWMPsnUQdyMCzla4WajVQSnknnuvCwT3Kzow2ZJaJ21nIju1jJ
	 lZM/rnJWYJ27yRPVbWT4oJILDqR5k36jsYW64UvFCx60+FLVB4lVB54N5PHJbMMhVQ
	 9JCuZ5J9loiqDA8/eJRVsAl4NpinmdinXJrHa8RFUZXgGJ9BXqTHQK5v3y9Ax89yap
	 t9Y78H33DwQebGvd3WFLDUWiG0NZ/jHXSGf2/lJQ8KunHppIaH9/GThQBRXSZZrZbQ
	 wwMnzyG1A5ACA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 6.12
Date: Sun,  1 Sep 2024 13:13:54 +0000
Message-Id: <20240901131354.2686-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_061407_958628_D7E16527 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: Rob Herring <robh@kernel.org>, Rohit Agarwal <rohiagar@chromium.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Shuijing Li <shuijing.li@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Support alpha blending
2. Remove cl in struct cmdq_pkt
3. Fixup for ovl adaptor
4. Declare Z Position for all planes
5. Drop unnecessary check for property presence
6. Add dsi per-frame lp code for mt8188
7. Fix missing configuration flags in mtk_crtc_ddp_config()
8. Use spin_lock_irqsave() for CRTC event lock
9. Add power domain binding to the mediatek DPI controller

Regards,
Chun-Kuang.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.12

for you to fetch changes up to 5474d49b2f79b41f2ab09b0deb9d97d47b18d094:

  dt-bindings: display: mediatek: dpi: Add power domains (2024-08-30 12:12:40 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.12

1. Support alpha blending
2. Remove cl in struct cmdq_pkt
3. Fixup for ovl adaptor
4. Declare Z Position for all planes
5. Drop unnecessary check for property presence
6. Add dsi per-frame lp code for mt8188
7. Fix missing configuration flags in mtk_crtc_ddp_config()
8. Use spin_lock_irqsave() for CRTC event lock
9. Add power domain binding to the mediatek DPI controller

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: Declare Z Position for all planes

Chun-Kuang Hu (2):
      drm/mediatek: Use cmdq_pkt_eoc() instead of cmdq_pkt_finalize()
      drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()

Fei Shao (1):
      drm/mediatek: Use spin_lock_irqsave() for CRTC event lock

Hsiao Chien Sung (5):
      drm/mediatek: Support "None" blending in OVL
      drm/mediatek: Support "None" blending in Mixer
      drm/mediatek: Support "Pre-multiplied" blending in OVL
      drm/mediatek: Support "Pre-multiplied" blending in Mixer
      drm/mediatek: Support alpha blending in display driver

Jason-JH.Lin (1):
      drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config()

Javier Carrasco (3):
      drm/mediatek: ovl_adaptor: Drop unused mtk_crtc.h header
      drm/mediatek: ovl_adaptor: Add missing of_node_put()
      drm/mediatek: ovl_adaptor: Use scoped variant of for_each_child_of_node()

Rob Herring (Arm) (1):
      drm/mediatek: Drop unnecessary check for property presence

Rohit Agarwal (1):
      dt-bindings: display: mediatek: dpi: Add power domains

Shuijing Li (1):
      drm/mediatek: dsi: Add dsi per-frame lp code for mt8188

 .../bindings/display/mediatek/mediatek,dpi.yaml    |  17 ++++
 drivers/gpu/drm/mediatek/mtk_crtc.c                |  82 +++++++---------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  36 +++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  13 +--
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 106 ++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |  13 ++-
 drivers/gpu/drm/mediatek/mtk_plane.c               |  29 +++++-
 drivers/gpu/drm/mediatek/mtk_plane.h               |   3 +-
 9 files changed, 221 insertions(+), 83 deletions(-)

