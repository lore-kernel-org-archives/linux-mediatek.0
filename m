Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7B9C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 117FE22D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 117FE22D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAJjx5avhFYjcTcr39qN/agQn58S5DaZL/RAKu5k9jg=; b=TH1DZTHhBuy56b0FHyVEj1vevb
	dnaeq6iEBVShcLRQ2v8I/FZGImOVDIgxykVIUDUuaSEZl0/2S+xSy57E7Ks+5NjRNEz5dc3z3t6cG
	xHpTYV3ZcQIsX4Qk0JZSWCH3Pu5ExhHpV5wzsfXoqBMmk8o0yz+/2f2RbIiZAfGb1Xo0JoxC2FM+K
	BFSkQFtL4AoaZCDG1BrJlJSpafN+OTlBvhZsS73IA8xe0IH/JLjRof7hQ3YDNuD/dQGics66HRZkj
	PD0FhkDoQWeN8+tBq7J8o6rPPt7fr8OFRFhb9UCd78W8ZAjr/xhx290YM500QRrDXE3ST55bgAJ0K
	VVOLV5Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxI43-0003mX-VF; Wed, 06 Jan 2021 23:18:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxI3j-0003de-QG; Wed, 06 Jan 2021 23:17:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34A202333B;
 Wed,  6 Jan 2021 23:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609975063;
 bh=twgw02Taay/sWVg0dngMR1CiRJClXLEXiaSzITlWvoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m2fQue0iFzGeutPfG564mOyFEGaejgxyOsiMeeNaLIBReCUuux4itudBaaKb0SBKK
 8hyZHi/gmTcIM/w7wkm+Ixn8chzCILwn9yKb79LijyK0xuOp4Ll4xmD2G/lM3h1xPA
 0NPS0tUst40i/xdAN8DD5iLVRJ++r6PHx3nnxNc0TWAIce8u+APSfUGkqgHkgoWMmh
 KErT9RCmj7vKjMEOqfHVua5ErfIZBwfA20fT08jqw7y8keIAomjPCNZK5pl+tf5d/h
 3++Pm/oEi0fPTbhKA85jxcEIoVxg+v62wYL7LvHRP/57evCwd/ooq7O1JejDpqZSDr
 9bFUOeMujiuUw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/5] drm/mediatek: Rename file mtk_drm_ddp to mtk_mutex
Date: Thu,  7 Jan 2021 07:17:26 +0800
Message-Id: <20210106231729.17173-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106231729.17173-1-chunkuang.hu@kernel.org>
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_181744_348957_3B740CBC 
X-CRM114-Status: GOOD (  13.40  )
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

After mmsys routing function is moved out of mtk_drm_ddp.c, mtk_drm_ddp.c
has only mtk mutex function, so rename it to match the function in it.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/Makefile                       | 4 ++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c                 | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_ddp.c => mtk_mutex.c} | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_ddp.h => mtk_mutex.h} | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp.c => mtk_mutex.c} (99%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp.h => mtk_mutex.h} (92%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index a892edec5563..09979c4c340a 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -4,13 +4,13 @@ mediatek-drm-y := mtk_disp_color.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
-		  mtk_drm_ddp.o \
 		  mtk_drm_ddp_comp.o \
 		  mtk_drm_drv.o \
 		  mtk_drm_gem.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
-		  mtk_dpi.o
+		  mtk_dpi.o \
+		  mtk_mutex.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index bf44a14ea0b6..fd97b7d195e3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -19,10 +19,10 @@
 
 #include "mtk_drm_drv.h"
 #include "mtk_drm_crtc.h"
-#include "mtk_drm_ddp.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
+#include "mtk_mutex.h"
 
 /*
  * struct mtk_drm_crtc - MediaTek specific crtc structure.
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_mutex.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_drm_ddp.c
rename to drivers/gpu/drm/mediatek/mtk_mutex.c
index 1f99db6b1a42..1c8a253f4788 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_mutex.c
@@ -10,8 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include "mtk_drm_ddp.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_mutex.h"
 
 #define MT2701_DISP_MUTEX0_MOD0			0x2c
 #define MT2701_DISP_MUTEX0_SOF0			0x30
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_mutex.h
similarity index 92%
rename from drivers/gpu/drm/mediatek/mtk_drm_ddp.h
rename to drivers/gpu/drm/mediatek/mtk_mutex.h
index a1ee21d15334..3abcc20e88fb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
+++ b/drivers/gpu/drm/mediatek/mtk_mutex.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
-#ifndef MTK_DRM_DDP_H
-#define MTK_DRM_DDP_H
+#ifndef MTK_MUTEX_H
+#define MTK_MUTEX_H
 
 struct regmap;
 struct device;
@@ -23,4 +23,4 @@ void mtk_disp_mutex_put(struct mtk_disp_mutex *mutex);
 void mtk_disp_mutex_acquire(struct mtk_disp_mutex *mutex);
 void mtk_disp_mutex_release(struct mtk_disp_mutex *mutex);
 
-#endif /* MTK_DRM_DDP_H */
+#endif /* MTK_MUTEX_H */
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
