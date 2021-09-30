Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:32:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20427615A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20427615A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dxyk7kPEd/0m03cpqXSA+Lc+vND0bwk8ZFjbN8gVzGA=; b=U1guMohEURmtED
	NR0+/cEueVJ5Aan8dD8zrQxMIh9zD+LYndosufI53OWan1nLMw7p8azUgOEcN9k7jmvA+IkFCcgKR
	FQDhSxlfi6ZpML44hFstsEZnZ4AlY+bp19kB9E4eshnPMFzmel2FgGr0tcGkmn3psPr3p1v6b3oRZ
	ULfbFCcERMY2Ci9Mhmr6NPsFQO2rgQaDPzCQrmxb7ZQgHtXtODpjVgfm8rlEH2sPpsLDEhKxoP2/o
	5xNPf3/6Kvl4BoslyKY49KQTMMR1URTepajOyep1iX2IoYkGEWvPVfGmbCLVmkBwpdR1m3hTLdqLf
	2S85s9v6O3axHH99kX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVrUQ-00DODc-H3; Thu, 30 Sep 2021 08:32:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVrU0-00DO1e-EG; Thu, 30 Sep 2021 08:32:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C49121F449E9
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, eizan@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Crystal Guo <crystal.guo@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Fabien Parent <fparent@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: [PATCH v4 0/7] Add support to the mmsys driver to be a reset
 controller
Date: Thu, 30 Sep 2021 10:31:43 +0200
Message-Id: <20210930083150.3317003-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_013200_655808_60F162C8 
X-CRM114-Status: GOOD (  18.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear all,

The following patchset is a reimplementation of the patch sent by Jitao
Shi [1] some time ago. As suggested by Chun-Kuang Hu, this time the
reset is done using the reset API, where the mmsys driver is the reset
controller and the mtk_dsi driver is the reset consumer.

Note that the first patch is kind of unrelated change, it's just a
cleanup but is needed if you want to apply all the following patches
cleanly.

This patchset is important in order to have the DSI panel working on some
kukui MT8183 Chromebooks (i.e Lenovo IdeaPad Duet). Without it, you just
get a black screen.

Best regards,
  Enric

[1] https://lore.kernel.org/linux-arm-kernel/20210420132614.150242-4-jitao.shi@mediatek.com/


Changes in v4:
- Remove unnused variable as pointed by Hsin-Yi

Changes in v3:
- Based on top of the patch that converts mmsys to schema
- Fix typo in the commit description

Changes in v2:
- Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>
- Added a new patch to describe the dsi reset optional property.

Enric Balletbo i Serra (7):
  arm64: dts: mediatek: Move reset controller constants into common
    location
  dt-bindings: mediatek: Add #reset-cells to mmsys system controller
  dt-bindings: display: mediatek: add dsi reset optional property
  arm64: dts: mt8173: Add the mmsys reset bit to reset the dsi0
  arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0
  soc: mediatek: mmsys: Add reset controller support
  drm/mediatek: mtk_dsi: Reset the dsi0 hardware

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  4 ++
 .../display/mediatek/mediatek,dsi.txt         |  6 ++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  2 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  5 +-
 drivers/soc/mediatek/mtk-mmsys.c              | 68 +++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h              |  2 +
 drivers/watchdog/mtk_wdt.c                    |  6 +-
 .../mt2712-resets.h                           |  0
 include/dt-bindings/reset/mt8173-resets.h     |  2 +
 .../mt8183-resets.h                           |  3 +
 .../mt8192-resets.h                           |  0
 12 files changed, 97 insertions(+), 6 deletions(-)
 rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (98%)
 rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)

-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
