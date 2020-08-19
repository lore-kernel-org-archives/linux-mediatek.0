Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD38C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:45:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CBB720888
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tyQ6OdGS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xPxpD+12"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CBB720888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pvoAg9fiDPHNUAKl61p827icBtShCh/OiLq9e/fknc=; b=tyQ6OdGSjsaH9MyBBqS8M9E/iT
	gkVGnmRRZj3Qt7KQAA7EMR4SUo6Ngkr/HYZ0BU53brzlcnCgUV1qr+SqekwBXsRXRG7EJPxgZgTrO
	arCrgBIiSaQYr2H/4QSZkxqOaLTHGzBTX6jrNE7whmIgQrOrHqKGza+EX3q4u5irbUTbAlcaB7EV7
	o/Ph1xoQlcryjrJdGrnPHZoGKUQrrqhuQSZFT8wDD0ndnmYhm51a1GSICJcuC32j06cF3+wLSNoZh
	/krFP2/2gugOPpC/LUylr1nMnftUAiLRn40NXz6b2ROeC+GPFGPsof0hUsgrzfvQw840z8jjfnxso
	HaZlNoUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8QH1-0000Mz-OT; Wed, 19 Aug 2020 15:45:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8QGy-0000Ko-E0
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 15:45:09 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6E9D2063A;
 Wed, 19 Aug 2020 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597851907;
 bh=aj8Ss0R/pLvQIvzSu+78Z0ImfgD7gwnfBA75eQ2/xSc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xPxpD+12Wx8IgQEeb1o5sC7gm6ePHnFijSgPmeRDyBO4NydqQiwjbLkzgOd5LXYuo
 MC1D6fHo7yyPBCGJyVdRyaToFwjA0lCJX3oyR06N66BFCgsfq0YcOLP4QUJPv1VHxK
 k0012Lk6i7maiJ/XZ751czJHHibJ1WYsHKPpGR5g=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v4 2/4] drm/mediatek: Separate mtk_hdmi_phy to an independent
 module
Date: Wed, 19 Aug 2020 23:44:19 +0800
Message-Id: <20200819154421.7013-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819154421.7013-1-chunkuang.hu@kernel.org>
References: <20200819154421.7013-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_114508_626737_72891E57 
X-CRM114-Status: GOOD (  18.56  )
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

mtk_hdmi_phy is a part of mtk_hdmi module, but phy driver should be an
independent module rather than be part of drm module, so separate the phy
driver to an independent module.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/gpu/drm/mediatek/Kconfig        |  9 ++++++++-
 drivers/gpu/drm/mediatek/Makefile       | 11 +++++++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c     |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.h     |  1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.c |  1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h |  1 -
 6 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index aa74aac3cbcc..ca3cd871a350 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -24,6 +24,13 @@ config DRM_MEDIATEK_HDMI
 	tristate "DRM HDMI Support for Mediatek SoCs"
 	depends on DRM_MEDIATEK
 	select SND_SOC_HDMI_CODEC if SND_SOC
-	select GENERIC_PHY
+	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
+
+config PHY_MTK_HDMI
+    tristate "MediaTek HDMI-PHY Driver"
+    depends on ARCH_MEDIATEK && OF
+    select GENERIC_PHY
+    help
+          Enable this to support HDMI-PHY
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index b7a82ed5788f..fcbef23aa6ce 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -19,9 +19,12 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
 mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi.o \
-			  mtk_hdmi_ddc.o \
-			  mtk_mt2701_hdmi_phy.o \
-			  mtk_mt8173_hdmi_phy.o \
-			  mtk_hdmi_phy.o
+			  mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
+
+phy-mtk-hdmi-drv-objs := mtk_hdmi_phy.o \
+			 mtk_mt2701_hdmi_phy.o \
+			 mtk_mt8173_hdmi_phy.o
+
+obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index d44348c7ecbe..0ed7b0b1a022 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of.h>
@@ -1832,7 +1833,6 @@ static struct platform_driver mtk_hdmi_driver = {
 };
 
 static struct platform_driver * const mtk_hdmi_drivers[] = {
-	&mtk_hdmi_phy_driver,
 	&mtk_hdmi_ddc_driver,
 	&mtk_cec_driver,
 	&mtk_hdmi_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.h b/drivers/gpu/drm/mediatek/mtk_hdmi.h
index bb3653de6bd1..472bf141c92b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.h
@@ -5,7 +5,6 @@
  */
 #ifndef _MTK_HDMI_CTRL_H
 #define _MTK_HDMI_CTRL_H
-#include "mtk_hdmi_phy.h"
 
 struct platform_driver;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
index 5223498502c4..fe022acddbef 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
@@ -205,6 +205,7 @@ struct platform_driver mtk_hdmi_phy_driver = {
 		.of_match_table = mtk_hdmi_phy_match,
 	},
 };
+module_platform_driver(mtk_hdmi_phy_driver);
 
 MODULE_DESCRIPTION("MediaTek HDMI PHY Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
index fc1c2efd1128..b13e1d5f8e78 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
@@ -49,7 +49,6 @@ void mtk_hdmi_phy_mask(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
 		       u32 val, u32 mask);
 struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw);
 
-extern struct platform_driver mtk_hdmi_phy_driver;
 extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_8173_conf;
 extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf;
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
