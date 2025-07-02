Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250BCC8303F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vBoJGHy0ISIe9dsE3K0UfQijWN6qYHy8h2nd32aYn0c=; b=vVGczkniJjxA3rbelYlWGytKe3
	0SnpQM9XPs2TZDusxdvW6yPn1AQIm/A69EHoTx7ivxeZ3o0CYkmrOUFVH+r3GsgBl66/9puuS8mhE
	mYENeOL+mLKJeJaS9p8cEsGejcO1TjmE7xnLwoITCBy/2Xz6Wsf2u67EBM6i8hObJfF/GE2kxUssU
	RBI0EYW1Ad1oXAneGBqxsG7DazyIkeGkmpwu5fnWAc8nVA1P/AkTFJPnhGcAlD0SBEV0c/GX5P4/J
	ySz1va7DBz23J029JcGTnZOV5QSo9YBUFakYWnhkpO3+teymPvNeYYCC5ibPEcbSUsITr9dlI+6KP
	0QBEeSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwJX-00000008GBG-0T2h;
	Wed, 02 Jul 2025 12:11:47 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvRV-000000086CA-3qPK
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Jul 2025 11:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vB
	oJGHy0ISIe9dsE3K0UfQijWN6qYHy8h2nd32aYn0c=; b=kXaSjN/VSLR+fLQh5x
	V2uqZSj7SAbIMImSPvPT+DZuz8vNVqIBDBrMAjk/mjtY4Z6hBUCoKfCXi5D0wJJ5
	5NDs7ZdNZlUGjifdUV094PvRR2s8Z6DpR3FqpRIpaCQ87HKE/vKQpNp8qAMmymq2
	dvDTRAMKRToNO9p81kIf+JS+E=
Received: from ProDesk.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHTGOvFGVoldg0Aw--.49301S2;
	Wed, 02 Jul 2025 19:15:00 +0800 (CST)
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
Subject: [PATCH v2 0/2] Pass down connector to drm bridge detect hook
Date: Wed,  2 Jul 2025 19:14:42 +0800
Message-ID: <20250702111453.102539-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgCHTGOvFGVoldg0Aw--.49301S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw48KrWfKF1UWr4UWr15urg_yoW5KF4fpF
	W2qFyavry0yF4aka1xAF18AF90y3Z7XFWrKry2v3sI93WFvF1UArsxAayrXryDGFyxJr12
	ywn7GrWxGF12yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zigTmxUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkA9+XmhlDvqMnwAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_041558_338577_D8FE1729 
X-CRM114-Status: GOOD (  13.34  )
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

Changes in v2:
- Adjust the dp/hdmi_audio_* callback parameters order.

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


