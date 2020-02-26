Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3708C4BA0B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A939A24689
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:54:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tgn2uPKH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A939A24689
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ax/gwKPzcq0LIxTB3130bZOlguMWK9ZEBQ4FK/+zITY=; b=Tgn2uPKHlW2sdB
	/m5hb7G5p9cPkbSjcqyWM91PyFTB3eSB8k7K2zTvrXYVj/BlbA6hyK/m25oGDfJr+3OmEWb9ZydW3
	LX6mmljdx2ECyO74BakGLqm9q0cGQW/dUT8tDzUzg7OkCzOqTnAhsLe25L7aIrNJ+cFzvrtmc5mhj
	Pyp3sMiyWQbr0SfDgkfZSkreYy38GfPejDuCxJCZykY/6ENg33sHR7JTz7KG4PI98PcfG6ptNtqwk
	m7wXPLhK8QFWs6U7C1dHlQeN3aYkgS5lb4WKJ91Yb5GT6T9xR83ywaSOW1kSYXnTczxWwtw5ZZPAW
	VWhDcp1kUde0pGBtd/uA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6uKv-0001iq-UF; Wed, 26 Feb 2020 10:54:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6uKj-0001Y3-Oy; Wed, 26 Feb 2020 10:54:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A078328531A
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH v9 0/4] arm64: mediatek: Fix mt8173 mmsys device probing
Date: Wed, 26 Feb 2020 11:54:15 +0100
Message-Id: <20200226105419.632771-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_025430_078298_3E358CE1 
X-CRM114-Status: GOOD (  12.93  )
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
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear all,

Those patches are intended to solve an old standing issue on some
Mediatek devices (mt8173, mt2701 and mt2712).

Up to now both drivers, clock and drm are probed with the same device tree
compatible. But only the first driver gets probed, which in effect breaks
graphics on those devices.

The MMSYS (Multimedia subsystem) in Mediatek SoCs has some registers to
control clock gates (which is used in the clk driver) and some registers
to set the routing and enable the differnet blocks of the display
and MDP (Media Data Path) subsystem. On this series the clk driver is
not a pure clock controller but a system controller that can provide
access to the shared registers between the different drivers that need
it (mediatek-drm and mediatek-mdp). Hence the MMSYS clk driver was moved
to drivers/soc/mediatek and is the entry point (parent) which will trigger
the probe of the corresponding mediatek-drm driver.

**IMPORTANT** This series only fixes the issue on mt8173 to make it
simple and as is the only platform I can test. Similar changes should be
applied for mt2701 and mt2712 to have display working.

For reference, here are the links to the old discussions:
* v8: https://patchwork.kernel.org/project/linux-mediatek/list/?series=244891
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

Changes in v9:
- Move mmsys to drivers/soc/mediatek (CK)
- Do not move the display routing from the drm driver (CK)
- Removed from this series because are not needed:
  * [PATCH v8 5/6] drm/mediatek: Move MMSYS configuration to include/linux/platform_data
- Removed from this series because are applied:
  * [PATCH v8 3/6] media: mtk-mdp: Check return value of of_clk_get.

Changes in v8:
- Select REGMAP and MFD_SYSCON (Randy Dunlap)
- Be a builtin_platform_driver like other mediatek mmsys drivers.
- New patch introduced in this series.

Changes in v7:
- Add R-by from CK
- Free clk_data->clks as well
- Get rid of private data structure

Enric Balletbo i Serra (1):
  drm/mediatek: Fix mediatek-drm device probing

Matthias Brugger (3):
  drm/mediatek: Use regmap for register access
  drm/mediatek: Omit warning on probe defers
  soc: mediatek: Move mt8173 MMSYS to platform driver

 drivers/clk/mediatek/clk-mt8173.c         | 104 ----------------
 drivers/gpu/drm/mediatek/Kconfig          |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c        |  12 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c   |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c    |  53 ++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h    |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    |  45 ++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c        |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c       |   4 +-
 drivers/soc/mediatek/Kconfig              |   7 ++
 drivers/soc/mediatek/Makefile             |   1 +
 drivers/soc/mediatek/mt8173-mmsys.c       | 143 ++++++++++++++++++++++
 16 files changed, 233 insertions(+), 171 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8173-mmsys.c

-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
