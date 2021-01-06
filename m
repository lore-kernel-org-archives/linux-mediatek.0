Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7873C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DD322D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69DD322D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeBHMOl9oInluT9OVCHNZ0joIu6RCkW3O62uJRTY6YM=; b=q6iLCywzhX+W1aO42BFXP7GtZA
	B+qEWzpklAtx6iC+CVc1CWwWhggoxqxw5sW6y5TaselWOzsNS8ArJSaXIuMc+DV532mIEnTVX/Coj
	atIOTyMK5qV9YRhblWU7kkMy5WlvzkMkHgtYF4edgbWYrKz/TMCHx6XfjjBX13OYqSt0N298ZByxP
	52wKS9xOJURzQOeCRUO8EevwkzRpLK78WMP/oZrwcWUFMCmVsttJaAGcCOrY6UeVS28Zeo7yVIK3N
	yX2f1DQ1NwICm3PZKGvHWDoX7i7o3/ccZyIusSauq0f8UbI2Hv3vrlAGqQDYN0ytw6VwrLxe+9NcK
	VmzBjAyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxI4R-0003zE-Vk; Wed, 06 Jan 2021 23:18:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxI3r-0003hL-6H; Wed, 06 Jan 2021 23:17:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A4AD23333;
 Wed,  6 Jan 2021 23:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609975070;
 bh=Fd+RyZtsrklrOszyS1vSPXkxAj2Vt6n1h2msWK4u7cw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TNW8Dn1rR03bwJjajUXr7Qg7IvEtcIKCVtjxRw2fJKgfGJ90BWLOwUfYWZTmAhz6B
 VnKqQC/9MEA8X1P4ILHQ5wG9xazMX0UUQ1WoaTnbnomjJfby8c8ZiwLbdjl0e1j5mY
 o/csqSFU9HJiohEKWxMimxpv6CSdjhkQSMyIIWTw6iCyP8VVv/O2tsgy/aPkEeG/JV
 t9J1v2aJy2COGzPzTQLWBRdSCSR6VjQCiuVnVYz4K7EPByIAYZfbN4frlkCm/TQJhg
 rEGg/RHlNv5RxCgbRunW5kHpfbXc+SFYjuZLnyJ7mkVb9XaGJvFhSJy/fExIsMfn0X
 +Q3M8TITO71qQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 5/5] soc / drm: mediatek: Move mtk mutex driver to soc
 folder
Date: Thu,  7 Jan 2021 07:17:29 +0800
Message-Id: <20210106231729.17173-6-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106231729.17173-1-chunkuang.hu@kernel.org>
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_181751_438907_E1265BEF 
X-CRM114-Status: GOOD (  16.10  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

mtk mutex is used by DRM and MDP driver, and its function is SoC-specific,
so move it to soc folder.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/Makefile                 |  3 +--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c           |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c            |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.h            |  1 -
 drivers/soc/mediatek/Makefile                     |  1 +
 .../mtk_mutex.c => soc/mediatek/mtk-mutex.c}      | 15 +++++++++++++--
 .../linux/soc/mediatek/mtk-mutex.h                |  0
 7 files changed, 16 insertions(+), 7 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mutex.c => soc/mediatek/mtk-mutex.c} (96%)
 rename drivers/gpu/drm/mediatek/mtk_mutex.h => include/linux/soc/mediatek/mtk-mutex.h (100%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 09979c4c340a..01d06332f767 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -9,8 +9,7 @@ mediatek-drm-y := mtk_disp_color.o \
 		  mtk_drm_gem.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
-		  mtk_dpi.o \
-		  mtk_mutex.o
+		  mtk_dpi.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 1e3a9450680b..e9b6788d52cd 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
+#include <linux/soc/mediatek/mtk-mutex.h>
 
 #include <asm/barrier.h>
 #include <soc/mediatek/smi.h>
@@ -22,7 +23,6 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
-#include "mtk_mutex.h"
 
 /*
  * struct mtk_drm_crtc - MediaTek specific crtc structure.
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b99a06e6834e..5d39dd54255d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -588,7 +588,6 @@ static struct platform_driver mtk_drm_platform_driver = {
 };
 
 static struct platform_driver * const mtk_drm_drivers[] = {
-	&mtk_mutex_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index ae366868d01a..e8238fa4aa2a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -46,7 +46,6 @@ struct mtk_drm_private {
 	struct drm_atomic_state *suspend_state;
 };
 
-extern struct platform_driver mtk_mutex_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index b6908db534c2..90270f8114ed 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
 obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
+obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.c b/drivers/soc/mediatek/mtk-mutex.c
similarity index 96%
rename from drivers/gpu/drm/mediatek/mtk_mutex.c
rename to drivers/soc/mediatek/mtk-mutex.c
index 66344759e622..f531b119da7a 100644
--- a/drivers/gpu/drm/mediatek/mtk_mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -10,8 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
-
-#include "mtk_mutex.h"
+#include <linux/soc/mediatek/mtk-mutex.h>
 
 #define MT2701_MUTEX0_MOD0			0x2c
 #define MT2701_MUTEX0_SOF0			0x30
@@ -241,6 +240,7 @@ struct mtk_mutex *mtk_mutex_get(struct device *dev)
 
 	return ERR_PTR(-EBUSY);
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_get);
 
 void mtk_mutex_put(struct mtk_mutex *mutex)
 {
@@ -251,6 +251,7 @@ void mtk_mutex_put(struct mtk_mutex *mutex)
 
 	mutex->claimed = false;
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_put);
 
 int mtk_mutex_prepare(struct mtk_mutex *mutex)
 {
@@ -258,6 +259,7 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex)
 						 mutex[mutex->id]);
 	return clk_prepare_enable(mtx->clk);
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_prepare);
 
 void mtk_mutex_unprepare(struct mtk_mutex *mutex)
 {
@@ -265,6 +267,7 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
 						 mutex[mutex->id]);
 	clk_disable_unprepare(mtx->clk);
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
 
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id)
@@ -316,6 +319,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 		       mtx->regs +
 		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
 
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			   enum mtk_ddp_comp_id id)
@@ -355,6 +359,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 		break;
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
 
 void mtk_mutex_enable(struct mtk_mutex *mutex)
 {
@@ -365,6 +370,7 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
 
 	writel(1, mtx->regs + DISP_REG_MUTEX_EN(mutex->id));
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_enable);
 
 void mtk_mutex_disable(struct mtk_mutex *mutex)
 {
@@ -375,6 +381,7 @@ void mtk_mutex_disable(struct mtk_mutex *mutex)
 
 	writel(0, mtx->regs + DISP_REG_MUTEX_EN(mutex->id));
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_disable);
 
 void mtk_mutex_acquire(struct mtk_mutex *mutex)
 {
@@ -388,6 +395,7 @@ void mtk_mutex_acquire(struct mtk_mutex *mutex)
 				      tmp, tmp & INT_MUTEX, 1, 10000))
 		pr_err("could not acquire mutex %d\n", mutex->id);
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_acquire);
 
 void mtk_mutex_release(struct mtk_mutex *mutex)
 {
@@ -396,6 +404,7 @@ void mtk_mutex_release(struct mtk_mutex *mutex)
 
 	writel(0, mtx->regs + DISP_REG_MUTEX(mutex->id));
 }
+EXPORT_SYMBOL_GPL(mtk_mutex_release);
 
 static int mtk_mutex_probe(struct platform_device *pdev)
 {
@@ -461,3 +470,5 @@ struct platform_driver mtk_mutex_driver = {
 		.of_match_table = mutex_driver_dt_match,
 	},
 };
+
+builtin_platform_driver(mtk_mutex_driver);
diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_mutex.h
rename to include/linux/soc/mediatek/mtk-mutex.h
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
