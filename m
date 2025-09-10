Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834EBCA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 23:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uaQ7TD8pMvzG92lNgKcMbONAOYfj9YFkjjiBuMiWYag=; b=Tgf4jYLR+eBqGC2uenSAKNUWvp
	qsRbzWGjfPB/F1qouhxGNhpL9Al+/WQ+k/pAQuoicIuzhoIy/S2tzhbZTpUzKRHTlc0txmIKkr2Mr
	u/SgLa5Q7pbUcFD++UzaYNO6MQ07VPrVTNWTsWROLJtSRMazG7Qi+OMKTk4nW72niu5ft427pXA/o
	msObXEot8vTba/4ybkGd6xiEi9CRE1I+c7wTFVSwWXpVJsBfoirLQGdUHfWUjhm66FmjzRMUCFR79
	5xmdS2T2j5VP1+oKd24XmGpMTGjKl2atAfa+s4SxpuJTEbENvql56DuvoU++1Pp7KUeEOFxsBdszz
	Bd8jv27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwU4y-0000000HGfE-0zJG;
	Wed, 10 Sep 2025 23:18:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwU4v-0000000HGeK-3eSo
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Sep 2025 23:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBE1344134;
	Wed, 10 Sep 2025 23:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940E6C4CEEB;
	Wed, 10 Sep 2025 23:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757546296;
	bh=N5qouKpM2Ppup08aA4wGO8T0cYYdFaA7krwQNVXFOa8=;
	h=From:To:Subject:Date:From;
	b=R8wkdR/xZqh9h8dQ8OgrLd0hxHhROQR6+U5hZQqQSLN1wDUPcvHoVDrOyJ+w/K04b
	 cdX4KJFdDFBZpML1QclyFjHwdc0PiXTtnlLbbkvrOMmg7zke1HRCovttpQFS+WKz4N
	 UBr9gasCrMM0FPDJJvLFDdTLL38B1abv4y/rvJ/VuRhPvmP4bbX4IJ1PyE6QyIK1rr
	 RHXIHDFmQjfyC2spXkMx2cUFAHZzmx9dxD1hC5UjEJNS8QBPJKKgCMvG78g7KtC2c+
	 4o77Z9f3ySgPEqov8qkL0Qyeuvk06XwvzsTb0AwFVOPhY2RT64MZKf1B5xL8PE0v9V
	 8Kj+xU+v6IfCA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Johan Hovold <johan@kernel.org>
Subject: [GIT PULL] mediatek drm fixes - 20250910
Date: Wed, 10 Sep 2025 23:18:13 +0000
Message-Id: <20250910231813.3526-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_161817_929990_70550494 
X-CRM114-Status: UNSURE (   5.30  )
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
1. fix potential OF node use-after-free

Regards,
Chun-Kuang.

The following changes since commit c34414883f773412964404d77cd2fea04c6f7d60:

  drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls (2025-08-28 23:15:41 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250910

for you to fetch changes up to 9ba2556cef1df746fad4d691c8290e235b23c7d1:

  drm/mediatek: clean up driver data initialisation (2025-09-10 12:52:59 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250910

1. fix potential OF node use-after-free

----------------------------------------------------------------
Johan Hovold (2):
      drm/mediatek: fix potential OF node use-after-free
      drm/mediatek: clean up driver data initialisation

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

