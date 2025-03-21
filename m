Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECA6C36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mZPiXquyeyecb4DW24Tg2cMooYApUCDgOih/gW3Z9R0=; b=zzh0jaQu30dxq0bSkQ4i7rs9Op
	7MIK4yHlgvgs32ZhAEnhXaKWPc/O0bPmDlMYlgwdq7nILXtpoWeQ9FwHbehCll6eUiK8yCrFWlCnN
	tVTCgMoZESn+zetakTV0iH8sESwFalfLTIz66nzg1TFHiYEdpzE5Zv98VtYmrrPAP+3Ulgy+fuL4u
	you2FO/H3gWhzG88W4BRCYbwEcmNHR1R2W0ZxCteHHxlIaUxZ1CMR/zlyHA3X/nFvfsBaFYbH30jZ
	oJbK3wHSrpupjDlA7o3fp5YGZIJXoTFWQ66r0LAAu7xAWi9YBLb4bu2YX/VPv/ws+cOiQHIg1uqxf
	Vrj/DK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYBv-0000000EIsc-3ybw;
	Fri, 21 Mar 2025 08:57:23 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYAI-0000000EIar-1HQ8
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 08:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=mZPiX
	quyeyecb4DW24Tg2cMooYApUCDgOih/gW3Z9R0=; b=Q2q+HaQb6m1V6zhg2GZ3x
	ApDdI20drvLGz5KHCSSpKrOwxl25P8rhpcPPnxSEP/op78ftR8pqOIIsIeYaj6Pa
	fha7H2gzaIpVnuxuJNLhshBzJl818rFe7wmtfPvHhXGmgMagRItzF/HgZ0QW0AgX
	yCXdpnqxIc6RaaN7ERPnRY=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3lmIbKd1nvVJ9AQ--.2326S2;
	Fri, 21 Mar 2025 16:53:51 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
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
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/1] Pass down connector to drm bridge detect hook
Date: Fri, 21 Mar 2025 16:53:37 +0800
Message-ID: <20250321085345.136380-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3lmIbKd1nvVJ9AQ--.2326S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw48KrWfKF1UWr4UXr15twb_yoW5WF1rpF
	W2gry3Ary8ZFWakayxAF18CF98A3Z7JFWFkrW2ywna93WruF1UArsxAayYqFyDWF17Jr1a
	ywnrGrWxGF1xAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jvuWdUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBcXXmfdIWPYKgAAsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_015542_635794_E45CF8C3 
X-CRM114-Status: GOOD (  10.34  )
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

From: Andy Yan <andy.yan@rock-chips.com>


In some application scenarios, we hope to get the corresponding
connector when the bridge's detect hook is invoked.

For example, we may want to call drm_dp_read_sink_count_cap(which needs
a drm_connector) at the dp deteck hook, intel_dp and nouveau_dp do this
at it's connector's detetc_ctx/detect hook.

But for a bridge driver, it's detect hook is initiated by the connector,
there is no connector passed down.

In most cases, we can get the connector by drm_atomic_get_connector_for_encoder
if the encoder attached to the bridge is enabled, however there will
still be some scenarios where the detect hook of the bridge is called
but the corresponding encoder has not been enabled yet. For instance,
this occurs when the device is hot plug in for the first time.

Since the call to bridge's detect is initiated by the connector, passing
down the corresponding connector directly will make things simpler.

Before preparing this patch, we have had some discussions on the details
here[0].

[0]https://patchwork.freedesktop.org/patch/640712/?series=143573&rev=5


Andy Yan (1):
  drm/bridge: Pass down connector to drm bridge detect hook

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c          |  3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c             |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c   |  3 ++-
 drivers/gpu/drm/bridge/chrontel-ch7033.c              |  2 +-
 drivers/gpu/drm/bridge/display-connector.c            | 11 ++++++++---
 drivers/gpu/drm/bridge/ite-it6263.c                   |  3 ++-
 drivers/gpu/drm/bridge/ite-it6505.c                   |  2 +-
 drivers/gpu/drm/bridge/ite-it66121.c                  |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c              |  6 +++---
 drivers/gpu/drm/bridge/lontium-lt9611.c               |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c            |  3 ++-
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  3 ++-
 drivers/gpu/drm/bridge/sii902x.c                      |  3 ++-
 drivers/gpu/drm/bridge/simple-bridge.c                |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c          |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c             |  3 ++-
 drivers/gpu/drm/bridge/tc358767.c                     |  5 +++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                 |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c                    |  2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c                 |  8 +++++++-
 drivers/gpu/drm/display/drm_bridge_connector.c        |  2 +-
 drivers/gpu/drm/drm_bridge.c                          |  5 +++--
 drivers/gpu/drm/mediatek/mtk_dp.c                     |  3 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                   |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.c                       |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi.h                       |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c                |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                   |  4 ++--
 drivers/gpu/drm/xlnx/zynqmp_dp.c                      |  3 ++-
 include/drm/drm_bridge.h                              |  6 ++++--
 30 files changed, 67 insertions(+), 38 deletions(-)

-- 
2.43.0


