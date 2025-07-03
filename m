Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD37C83F04
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3MGa7aUIUrsqSH5jzhVO2fccWDlbAAU4JB3lQ6tDZMI=; b=NNOgwOoj69E3UJZnmbCoE+5mok
	DTfcT/amwZknG3xMB0iW4eSPkSLBD1glXgH2wqBfFKgMaJNUX7zQnFtFrzQ/QDFtkVapi6U9YzkCv
	tP7CieA1v2ADXXVKjoW3esI9sasT0Nsy9/RgyavyNSDwL2egjiG+lgIT3lJy0BL8pE7Y2V/pYQv2s
	65evxHOwSVxzWJoOo92cx+QuCKAPqTw0Zp7InlnCiv4xga3NgQIVarKZiUEO+dh9hq7TmwS8wil3d
	f9aUkyQRhRAlMaygRP61oKr+g3WrKGe661+fUKjc2htMGiEvGLiuiof9bv7GBUuW0Kb5Dxd4ARw8G
	nvyRkpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKus-0000000BfJC-3L9y;
	Thu, 03 Jul 2025 14:27:58 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJPX-0000000BOTb-03kt
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Jul 2025 12:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3M
	Ga7aUIUrsqSH5jzhVO2fccWDlbAAU4JB3lQ6tDZMI=; b=pmle+Jf+7uIoBLtNKD
	xi1b+D8KcNunRsFTEJia3+2C6/zC0gicTdnwnl4yVUZjVDwsHptAhPc9f3D0hRbx
	0s5RkxMaXBtwEYpvEYHNefuKt6VEqNljQ5iDvtEHNM7zHv9/vVDgXMIKXmD6BhgU
	aIjZ429cMAPxWuk06/+TY8Q3Y=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXBAyWfGZoVnrrCA--.37969S2;
	Thu, 03 Jul 2025 20:50:34 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: mripard@kernel.org,
	neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	dianders@chromium.org,
	jani.nikula@intel.com,
	lyude@redhat.com,
	jonathanh@nvidia.com,
	p.zabel@pengutronix.de,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	rfoss@kernel.org,
	chunkuang.hu@kernel.org,
	cristian.ciocaltea@collabora.com,
	Laurent.pinchart@ideasonboard.com,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH v3 0/2] Pass down connector to drm bridge detect hook
Date: Thu,  3 Jul 2025 20:49:51 +0800
Message-ID: <20250703125027.311109-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXBAyWfGZoVnrrCA--.37969S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw48KrWfKF1UWr4UWr15urg_yoW5Kw4UpF
	W2gFyavryxAF4aka1xAF18AF90y3Z7XFWrKry2v3sI93WFvF1UArsxAayrXryDGFyxJr12
	ywn7GrWxGF12yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRSkshUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBx-XmhmehVGHAAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_055131_435165_62F3ED12 
X-CRM114-Status: GOOD (  12.73  )
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


In some application scenarios, we hope to get the corresponding
connector when the bridge's detect hook is invoked.

For example, we may want to call drm_dp_read_sink_count_cap(which needs
a drm_connector) at the dp deteck hook, intel_dp and nouveau_dp do this
at it's connector's detetc_ctx/detect hook.

But for a bridge driver, it's detect hook is initiated by the connector,
there is no connector passed down.

In most cases, we can get the connector by
drm_atomic_get_connector_for_encoder
if the encoder attached to the bridge is enabled, however there will
still be some scenarios where the detect hook of the bridge is called
but the corresponding encoder has not been enabled yet. For instance,
this occurs when the device is hot plug in for the first time.

Since the call to bridge's detect is initiated by the connector, passing
down the corresponding connector directly will make things simpler.

Before preparing this patch, we have had some discussions on the details
here[0].

PATCH1 adjust the dp/hdmi_audio_* callback parameters order, make it
maintain the same parameter order as get_modes and edid_read.
PATCH2 add connector to detect hook.

[0]https://patchwork.freedesktop.org/patch/640712/?series=143573&rev=5

Changes in v3:
- Remove redundant SoB

Changes in v2:
- Make dp/hdmi_audio_* callback keep the same par get_modes

Andy Yan (2):
  drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter order
    with get_modes
  drm/bridge: Pass down connector to drm bridge detect hook

 drivers/gpu/drm/bridge/adv7511/adv7511.h      | 16 +++----
 .../gpu/drm/bridge/adv7511/adv7511_audio.c    | 12 +++---
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c  |  4 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |  3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  3 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c      |  2 +-
 drivers/gpu/drm/bridge/display-connector.c    | 11 +++--
 drivers/gpu/drm/bridge/ite-it6263.c           |  3 +-
 drivers/gpu/drm/bridge/ite-it6505.c           |  2 +-
 drivers/gpu/drm/bridge/ite-it66121.c          |  3 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c      |  6 +--
 drivers/gpu/drm/bridge/lontium-lt9611.c       | 15 +++----
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c    |  3 +-
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  3 +-
 drivers/gpu/drm/bridge/sii902x.c              |  3 +-
 drivers/gpu/drm/bridge/simple-bridge.c        |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 14 +++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  3 +-
 drivers/gpu/drm/bridge/tc358767.c             |  5 ++-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  3 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |  2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c         |  8 +++-
 .../gpu/drm/display/drm_bridge_connector.c    | 20 ++++-----
 drivers/gpu/drm/drm_bridge.c                  |  5 ++-
 drivers/gpu/drm/mediatek/mtk_dp.c             |  3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  3 +-
 drivers/gpu/drm/msm/dp/dp_audio.c             |  8 ++--
 drivers/gpu/drm/msm/dp/dp_audio.h             |  8 ++--
 drivers/gpu/drm/msm/dp/dp_drm.c               |  3 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h               | 10 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c         |  8 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c           |  4 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |  3 +-
 include/drm/drm_bridge.h                      | 42 ++++++++++---------
 37 files changed, 139 insertions(+), 110 deletions(-)

-- 
2.43.0

base-commit: 56e5375b23f342dfa3179395aacc1b47395fddf7
branch: drm-misc-next


