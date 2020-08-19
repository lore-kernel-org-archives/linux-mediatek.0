Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2722BC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:45:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E91F520888
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LnWdh+Wd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIwEbgGb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E91F520888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsylKdEHh+aPq1uetOBlDvkcUBls434LxjTA/I+aea0=; b=LnWdh+WdTajJqH/5OLQMnxFnYf
	khEilIyg3p9LJAgkx4BNRZkY2MAA8FktFqVAaFWZOladQTnym1cNqNScarnUZ5pfNLNVlYTWqLgQh
	ONIasRX03xG2W1Ns0D/kKBADfKMNyZ7GpJKE65yiLL/zfNagJbQmISgVFHCydSkVZu8+sx6GyWob1
	Q5Jzp8TzESaWKvMEDmxMTq8+WAX+FVp4o3c9SoVEj24l7xs6ykRVOHirKtxIoCySuPb9fiR8GpX8C
	fdqIzJpvXEFdMOLxqc7zEHQwrei94kEmEXfZ7JVogVKribkGkObfpqUEP5Aa+ENf9/SL1C9N4IzOo
	9VRYvvjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8QH4-0000Od-Lu; Wed, 19 Aug 2020 15:45:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8QH0-0000Lz-Rn
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 15:45:12 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48E1B20639;
 Wed, 19 Aug 2020 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597851910;
 bh=R5Z6bqabkMn5pCz+XcphT+I6QicEpU4V5GBXmXwSgOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VIwEbgGbQtkfHLlngg0e3NLy7LCzKeRlBHc2REiUpck8LJytLy1/S9I2G4HIHPZN8
 DPNI37xdY9MD8D9vY/hOusEPjDqAbF6ozfSqf657sc87owZj4OV+rTi4cGa7wuI1f1
 jgsO5YeT6DQO+BbTbUb1OGlSwbPdFjhLIDasQxYA=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v4 3/4] phy: mediatek: Move mtk_hdmi_phy driver into
 drivers/phy/mediatek folder
Date: Wed, 19 Aug 2020 23:44:20 +0800
Message-Id: <20200819154421.7013-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819154421.7013-1-chunkuang.hu@kernel.org>
References: <20200819154421.7013-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_114511_046177_91222B56 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

mtk_hdmi_phy is currently placed inside mediatek drm driver, but it's
more suitable to place a phy driver into phy driver folder, so move
mtk_hdmi_phy driver into phy driver folder.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/gpu/drm/mediatek/Kconfig                           | 7 -------
 drivers/gpu/drm/mediatek/Makefile                          | 6 ------
 drivers/phy/mediatek/Kconfig                               | 7 +++++++
 drivers/phy/mediatek/Makefile                              | 6 ++++++
 .../mediatek/phy-mtk-hdmi-mt2701.c}                        | 2 +-
 .../mediatek/phy-mtk-hdmi-mt8173.c}                        | 2 +-
 .../mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c}         | 2 +-
 .../mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h}         | 0
 8 files changed, 16 insertions(+), 16 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index ca3cd871a350..65cd03a4be29 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -27,10 +27,3 @@ config DRM_MEDIATEK_HDMI
 	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
-
-config PHY_MTK_HDMI
-    tristate "MediaTek HDMI-PHY Driver"
-    depends on ARCH_MEDIATEK && OF
-    select GENERIC_PHY
-    help
-          Enable this to support HDMI-PHY
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index fcbef23aa6ce..77b0fd86063d 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -22,9 +22,3 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
-
-phy-mtk-hdmi-drv-objs := mtk_hdmi_phy.o \
-			 mtk_mt2701_hdmi_phy.o \
-			 mtk_mt8173_hdmi_phy.o
-
-obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index dee757c957f2..10f0ec2d5b54 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -35,3 +35,10 @@ config PHY_MTK_XSPHY
 	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
 	  USB3.1 GEN2 controllers on MediaTek chips. The driver supports
 	  multiple USB2.0, USB3.1 GEN2 ports.
+
+config PHY_MTK_HDMI
+    tristate "MediaTek HDMI-PHY Driver"
+    depends on ARCH_MEDIATEK && OF
+    select GENERIC_PHY
+    help
+          Enable this to support HDMI-PHY
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index 08a8e6a97b1e..c9a3641f0b16 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -6,3 +6,9 @@
 obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
 obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
 obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
+
+phy-mtk-hdmi-drv-objs := phy-mtk-hdmi.o \
+			 phy-mtk-hdmi-mt2701.o \
+			 phy-mtk-hdmi-mt8173.o
+
+obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
rename to drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index 99fe05cd3598..a6cb1dea3d0c 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -4,7 +4,7 @@
  * Author: Chunhui Dai <chunhui.dai@mediatek.com>
  */
 
-#include "mtk_hdmi_phy.h"
+#include "phy-mtk-hdmi.h"
 
 #define HDMI_CON0	0x00
 #define RG_HDMITX_DRV_IBIAS		0
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
rename to drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index 827b93786fac..6cdfdf5a698a 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -4,7 +4,7 @@
  * Author: Jie Qiu <jie.qiu@mediatek.com>
  */
 
-#include "mtk_hdmi_phy.h"
+#include "phy-mtk-hdmi.h"
 
 #define HDMI_CON0		0x00
 #define RG_HDMITX_PLL_EN		BIT(31)
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
rename to drivers/phy/mediatek/phy-mtk-hdmi.c
index fe022acddbef..8fc83f01a720 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -4,7 +4,7 @@
  * Author: Jie Qiu <jie.qiu@mediatek.com>
  */
 
-#include "mtk_hdmi_phy.h"
+#include "phy-mtk-hdmi.h"
 
 static int mtk_hdmi_phy_power_on(struct phy *phy);
 static int mtk_hdmi_phy_power_off(struct phy *phy);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
rename to drivers/phy/mediatek/phy-mtk-hdmi.h
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
