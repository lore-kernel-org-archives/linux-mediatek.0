Return-Path: <SRS0=Q2+k=4I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7367DC11D14
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 17:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49AC724673
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 17:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uGElkU8Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49AC724673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N2BccARSYSlEsmyBDAeQevk4++9Sz6f3BFLo1Sih7/8=; b=uGElkU8YGK8alJ
	xdIeWkBsa5cVDbcMoJxFzMXbz2VP/74Yc9pylSHI7vC77Qht45l9OKyylzWJrMmpL5Dl3fuUdAtfp
	mz5tTY9N5znDBef3zft2UOaP9bnzMbtiiWOAFclh8/DLK5JEMQvKvPSGghvCx5uexjTldGlDZ0V0k
	6v6Rf6KycLtVBn9tQ0q4AZFSovDuRkdwufVpafZQn4NZgHuJSurmDLuP4IfVtAXNLHaiICWdIKwVy
	c9Uv4tRm+L/OJmmfTo61il3s13lezq2uHrX6m1vOOzLFPlmZBSeeXZ1DQX9Wbt+OjErQKqZgj7wN+
	PNTvYV26WsyykSM8tyvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4pWm-0002Xq-Nq; Thu, 20 Feb 2020 17:22:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4pWS-0002IG-U9; Thu, 20 Feb 2020 17:22:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id CCF2F29527F
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH v8 0/6] arm/arm64: mediatek: Fix mmsys device probing
Date: Thu, 20 Feb 2020 18:21:41 +0100
Message-Id: <20200220172147.919996-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_092201_228999_478B65FD 
X-CRM114-Status: GOOD (  15.63  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, frank-w@public-files.de,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Fabien Parent <fparent@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear all,

Those patches are intended to solve an old standing issue on some
Mediatek devices (mt8173, mt2701 and mt2712) in a slightly different way
to the precedent series.

Up to now both drivers, clock and drm are probed with the same device tree
compatible. But only the first driver get probed, which in effect breaks
graphics on those devices.

The version eight of the series tries to solve the problem with a
different approach than the previous series but similar to how is solved
on other Mediatek devices.

The MMSYS (Multimedia subsystem) in Mediatek SoCs has some registers to
control clock gates (which is used in the clk driver) and some registers
to set the routing and enable the differnet blocks of the display
and MDP (Media Data Path) subsystem. On this series the clk driver is
not a pure clock controller but a system controller that can provide
access to the shared registers between the different drivers that need
it (mediatek-drm and mediatek-mdp). And the biggest change is, that in
this version, clk driver is the entry point (parent) which will trigger
the probe of the corresponding mediatek-drm driver and pass its MMSYS
platform data for display configuration.

All this series was tested on the Acer R13 Chromebook only.

For reference, here are the links to the old discussions:

* v7: https://patchwork.kernel.org/project/linux-mediatek/list/?series=241217
* v6: https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
* v5: https://patchwork.kernel.org/project/linux-mediatek/list/?series=44063
* v4:
  * https://patchwork.kernel.org/patch/10530871/
  * https://patchwork.kernel.org/patch/10530883/
  * https://patchwork.kernel.org/patch/10530885/
  * https://patchwork.kernel.org/patch/10530911/
  * https://patchwork.kernel.org/patch/10530913/
* v3:
  * https://patchwork.kernel.org/patch/10367857/
  * https://patchwork.kernel.org/patch/10367861/
  * https://patchwork.kernel.org/patch/10367877/
  * https://patchwork.kernel.org/patch/10367875/
  * https://patchwork.kernel.org/patch/10367885/
  * https://patchwork.kernel.org/patch/10367883/
  * https://patchwork.kernel.org/patch/10367889/
  * https://patchwork.kernel.org/patch/10367907/
  * https://patchwork.kernel.org/patch/10367909/
  * https://patchwork.kernel.org/patch/10367905/
* v2: No relevant discussion, see v3
* v1:
  * https://patchwork.kernel.org/patch/10016497/
  * https://patchwork.kernel.org/patch/10016499/
  * https://patchwork.kernel.org/patch/10016505/
  * https://patchwork.kernel.org/patch/10016507/

Best regards,
 Enric

Changes in v8:
- Be a builtin_platform_driver like other mediatek mmsys drivers.
- New patches introduced in this series.

Changes in v7:
- Add R-by from CK
- Add R-by from CK
- Fix check of return value of of_clk_get
- Fix identation
- Free clk_data->clks as well
- Get rid of private data structure

Enric Balletbo i Serra (2):
  drm/mediatek: Move MMSYS configuration to include/linux/platform_data
  clk/drm: mediatek: Fix mediatek-drm device probing

Matthias Brugger (4):
  drm/mediatek: Use regmap for register access
  drm/mediatek: Omit warning on probe defers
  media: mtk-mdp: Check return value of of_clk_get
  clk: mediatek: mt8173: Switch MMSYS to platform driver

 drivers/clk/mediatek/Kconfig                  |   6 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt2701-mm.c          |  30 +++
 drivers/clk/mediatek/clk-mt2712-mm.c          |  44 +++++
 drivers/clk/mediatek/clk-mt8173-mm.c          | 172 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8173.c             | 104 -----------
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  12 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c        |  53 +++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  56 +-----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 113 +-----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  13 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   4 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |   6 +
 include/linux/platform_data/mtk_mmsys.h       |  73 ++++++++
 20 files changed, 401 insertions(+), 317 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
 create mode 100644 include/linux/platform_data/mtk_mmsys.h

-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
