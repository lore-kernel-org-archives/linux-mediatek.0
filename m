Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F09C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qCI5GvghvsGmsvpaqO4zK3IMFJK7AmQBcX97tFKCatU=; b=oWh3Y0bzR3jvac3sjR64im7930
	zfWhXw76Ry07Rq0PwbDrOmQl00sSOSy1bR2Sk5t2uaYsPoGnT6gRyDGilr33qFMzYr4vSLZqB6J1w
	uGRjXQGAnNuxNaFP+3o7h4pDz2HFEWeCu2gVlg2rBH3I0K366IdpnBSt1P6Jl5118cGIaI55X3eni
	2NEZy4sJpKBhiTsKsImuC0HvnxL/PPAWNAgjdIZi8xP6AkPGRacAqBmu7nFF8C74O6SBkfRF/BBrr
	ih3zU8h9iBSbTAHwkSPZQLhCbr8gVBgN9YYyeg3ms8dto+xMRC9ECit0k8+KIz8PbfBirYlQS14kg
	WBoxUfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi0A-005LsR-0s;
	Mon, 11 Dec 2023 15:15:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi06-005Lqr-2U
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Dec 2023 15:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 23C2BB80E9B;
	Mon, 11 Dec 2023 15:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99742C433C8;
	Mon, 11 Dec 2023 15:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702307716;
	bh=SkUYDHmoavBKDRYVMUWlwJYgwpCDbiZN63M2msaRJLc=;
	h=From:To:Subject:Date:From;
	b=I1hpFZsrl++EoIP1B+g3fmELWbGol2rnd3ItM9DWyug3A0rsqKvPSlABl+uJj1iaf
	 9qwiPN3nqKeiASJ3rrQuHP/N3eRR+Lw66owau4iJBur2/XDNSUZ2Q8Q7jM8HYXomKD
	 EWVQS6lqKEUaskxrKjrxtA2vWI24zSh+DCOvNkc9lkRjKNAAVIaKqtfGaAZ+Du7i8J
	 tD/8novJoZtIGaY26ZcON9cgKUdR53hIYd0UKsRrbLxYe/ulWbYyW64s0TFcLnZV5T
	 ESeRCZasVVTmcTuaohelSh80xJP8BVdSZgmNRYulDeV10LwXHc8cfzXtTrtYc3VgdG
	 ckBtDmVchApSw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Walle <mwalle@kernel.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Stuart Lee <stuart.lee@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes 20231211
Date: Mon, 11 Dec 2023 15:15:10 +0000
Message-Id: <20231211151510.6749-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_071518_978975_73631F0D 
X-CRM114-Status: UNSURE (   6.29  )
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

1. mtk_disp_gamma: Fix breakage due to merge issue
2. fix kernel oops if no crtc is found
3. Add spinlock for setting vblank event in atomic_begin
4. Fix access violation in mtk_drm_crtc_dma_dev_get

Regards,
Chun-Kuang.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20231211

for you to fetch changes up to b6961d187fcd138981b8707dac87b9fcdbfe75d1:

  drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get (2023-12-11 14:40:05 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20231211

1. mtk_disp_gamma: Fix breakage due to merge issue
2. fix kernel oops if no crtc is found
3. Add spinlock for setting vblank event in atomic_begin
4. Fix access violation in mtk_drm_crtc_dma_dev_get

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: mtk_disp_gamma: Fix breakage due to merge issue

Jason-JH.Lin (1):
      drm/mediatek: Add spinlock for setting vblank event in atomic_begin

Michael Walle (1):
      drm/mediatek: fix kernel oops if no crtc is found

Stuart Lee (1):
      drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get

 drivers/gpu/drm/mediatek/mtk_disp_gamma.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c   | 14 +++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    |  5 ++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

