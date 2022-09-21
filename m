Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3152AC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xVh6QQkOugCvZxvnqwNoPPM0nGmzcrT5IlvoMG13nOM=; b=roHatH92bduSgXu2CV5UvoBITT
	CSwyRRgldySotfXnTGB7FLJrQNKTZQDi/qWSe3QlsFcrfsTPSAfAxxdZPZKkC831YllWzaCdUdvUx
	97z1vdiPc7/bwWkrmoHjA++wdZCoJ7iBOo7jp3EXnkPLMTHKNrtSdXdTFdeSr4sHrs5MeUJnOQVBV
	bX8B6i/pHqwKjqGSZC8JpGTBwImozt589Mideap69n5WE/Wbm4pQWb3NVKGBFRrpzpv8pkp1mzHiO
	hcno9bQoIjlPHvSCKnU3BZo0M5gCjTKbzbKAgKZbaanMemIxD7halc1Z+SdNVxrUgH9tN//f8fGOl
	XvaSy6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob9a4-00CzdX-66; Wed, 21 Sep 2022 23:56:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob9a1-00Czcc-GM
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 23:56:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1674E62A08;
	Wed, 21 Sep 2022 23:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8AEC433C1;
	Wed, 21 Sep 2022 23:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663804595;
	bh=4aWdT1Ip1DIIIOA74g962gvYZDmK277RORHOc64wCPk=;
	h=From:To:Cc:Subject:Date:From;
	b=ipQT8JgVztymPR9CgY6cbFkvePT++k7CLFuYdg7/1bfY3ev8J2gOFfkxuG0DpSnFh
	 WVzI/u3dTCo+cYHtFAp1qRMw8OstBgmUPFlMLRn0bUdutNXKqlQKKXrBmtWvgHBngr
	 nANVZoy9IoyHm9dPycQLbpnCYRsJyURzc+Oi3hrrGqI2zz8RHSWezZmaqF7MWvG6dq
	 30iSAZO3E59zjyaiO9Y0Qbkn6GL+OFor4ndgX2/UxglwFHX8X8KQmNi+dUCDQ+0oov
	 HzNmsGZUzGalyTlZlLXQT2mv+uM9jHt7D4oc3htOoy2nOW7wcHa7eCWouvPg9ztqGA
	 8fvMyk9YybPiw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [GIT PULL] mediatek drm fixes for 6.0
Date: Thu, 22 Sep 2022 07:56:24 +0800
Message-Id: <20220921235624.23580-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_165637_624299_F0161723 
X-CRM114-Status: UNSURE (   7.96  )
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

1. dsi: Add atomic {destroy,duplicate}_state, reset callbacks
2. drm/mediatek: Fix wrong dither settings
3. dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()

Regards,
Chun-Kuang.


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-6.0

for you to fetch changes up to 90144dd8b0d137d9e78ef34b3c418e51a49299ad:

  drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff() (2022-09-22 07:31:43 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 6.0

1. dsi: Add atomic {destroy,duplicate}_state, reset callbacks
2. drm/mediatek: Fix wrong dither settings
3. dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()

----------------------------------------------------------------
Allen-KH Cheng (1):
      drm/mediatek: Fix wrong dither settings

AngeloGioacchino Del Regno (1):
      drm/mediatek: dsi: Add atomic {destroy,duplicate}_state, reset callbacks

Nícolas F. R. A. Prado (1):
      drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()

 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          | 24 +++++++++++++-----------
 2 files changed, 14 insertions(+), 12 deletions(-)

