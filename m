Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DD6C54F51
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DevyNzk/0RjswZblIxZkdQSTJtX1K3UZCjo6NK2E/+s=; b=QuFdjd7hsfpSsZ5QzL72JyT6+q
	X0NHYYCvoQbKdmlZtqErckN+oQ9SsvLDf1/S2di/jdaAIFSbQl/QhDaTB02SnVA5DVrO3oso1g5GS
	VjwWPFaXOLOtka3JLE8rCdx/bJblvUcMKTKVNP30fHMQaAl8+XprQ40XDW0sA3yO0JboNiUI7ayYa
	nK6y7qxUP3rGxgJw73N7iPj3JZb1sy9wHbgRGw7AsoPl5g2CTVvHo5XHsTCGeGXeoojqRQgxK7pyg
	eu8Fu4zY8qiOTEZNoI0E3UFoUiSVQnZZdVQqPEbV/KpTg5Phhy0UdcmOiVC15gVCR6pgLDn7Nrp+H
	3R08e7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp49j-000000083mD-2wBW;
	Wed, 29 Jul 2026 13:17:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp49i-000000083ih-2P4C
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 13:17:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AFB05600AB;
	Wed, 29 Jul 2026 13:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89C61F00A3A;
	Wed, 29 Jul 2026 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331025;
	bh=DevyNzk/0RjswZblIxZkdQSTJtX1K3UZCjo6NK2E/+s=;
	h=From:To:Subject:Date;
	b=SwNmoM8aUcgyFWR0l88ZUxsNAMlOpQPXNs3hk1Yn3Tv4T4x1Gj3ArSDRP7CT30QaC
	 XSMm0asu2UAK/LWZ84oxdvweio2dvsmS3JFKYUX3Ot89uI3uXyKQg8LIYeZcJ6T45d
	 c5S3uUX9qSNi6+99kOWaqkCokPj71n3yWypNcOA1gKheYuvrvuy7ew9itiErlIfhcc
	 wpr/zd+1wEgEuJ6THboY7zdJbXjPSKyO7uygC69XuGsAM3qoV4mc8YONCMtuTrCxK0
	 tbBSdbcW8rHKjlO6U5kfw5c429KMAj9hFuZyzvq0ZN21F+F0ZkZmbPGFPUM2ArGi9W
	 +LwRoWhGBiGwg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Ruoyu Wang <ruoyuw560@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [GIT PULL] mediatek drm fixes - 20260729
Date: Wed, 29 Jul 2026 13:17:01 +0000
Message-Id: <20260729131701.4158-1-chunkuang.hu@kernel.org>
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

Hi, Dave & Sima:

This includes:
1. Check CRTC state before freeing
2. mtk_hdmi: Fix DDC adapter double put in v2
3. mtk_hdmi_common: take i2c adapter module reference
4. mtk_dsi: Enable HS clock only at pre-enable
5. ovl_adaptor: balance component registrations

Regards,
Chun-Kuang.

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20260729

for you to fetch changes up to 533e3469a57996905cdb95f178e7efe38c21aeb2:

  drm/mediatek: ovl_adaptor: balance component registrations (2026-07-29 12:52:16 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20260729

1. Check CRTC state before freeing
2. mtk_hdmi: Fix DDC adapter double put in v2
3. mtk_hdmi_common: take i2c adapter module reference
4. mtk_dsi: Enable HS clock only at pre-enable
5. ovl_adaptor: balance component registrations

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: mtk_dsi: Enable HS clock only at pre-enable

Guangshuo Li (1):
      drm/mediatek: mtk_hdmi: Fix DDC adapter double put in v2

Johan Hovold (1):
      drm/mediatek: mtk_hdmi_common: take i2c adapter module reference

Myeonghun Pak (1):
      drm/mediatek: ovl_adaptor: balance component registrations

Ruoyu Wang (1):
      drm/mediatek: Check CRTC state before freeing

 drivers/gpu/drm/mediatek/mtk_crtc.c             |  6 +++---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  7 ++++++-
 drivers/gpu/drm/mediatek/mtk_dsi.c              |  5 +++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c      | 11 +++++++++--
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c          |  8 --------
 5 files changed, 21 insertions(+), 16 deletions(-)

