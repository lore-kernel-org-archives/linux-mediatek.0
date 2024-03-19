Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C7BC54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 07:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cj7ytnNIJI8uiZd0qfP4Jzaf+xdK5mfmZC7zoeIdEbQ=; b=OWPnWoHBVPI7y5KbW5SSX5SVfP
	67b58vNaD86oizHUS3A/ZA1btHhmlCoeoNaizF2rly03/TC92mPP37lJLpgyCnfpZmF7JBF0XNPw1
	hpJuw4gRHWVpjcWd2Mpqn06stbrXUCR2p1bJkDcXxWUyecZCv9gSVLsl8t7geHwtwRSwjGz+ORPuH
	meR9FhalRbfeX/7mjd8OazL7WDialv5ZtY7WBFQai1ja+sZZolCxAATAShQNluTXW8kdjaNXRv2Vr
	Qfyniu22PCtxBVNSgwGWEfxs36IbIFlQlkX/lTcAsw+q/HgbW32QLMXlHV4rldFgkDOee46v3vPHE
	POC6PDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmTpX-0000000Bgnw-30ga;
	Tue, 19 Mar 2024 07:24:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmTpS-0000000Bglr-4910;
	Tue, 19 Mar 2024 07:24:12 +0000
X-UUID: ab661f3ce5c111ee9aa9374d6d45775a-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Cj7ytnNIJI8uiZd0qfP4Jzaf+xdK5mfmZC7zoeIdEbQ=;
	b=pUVvTXA/SUg91X73lNhJKByGrZy+0D9fg2979WeK6Jb/Cm0a3rK28ieFWNZ4jn6a5OkLnKWO4aqbvve0PY3X3lPRBrSEewXLZf3Fvj6gXilHjr1LoFP/O7fFr8U2A7kDEcm1ztJeKr0LEATJhFhXo0soJg9D69NPd2rY8nAgrWA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:afe49981-bdd2-4d52-a266-23d9b717b6fb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:6f543d0,CLOUDID:40dbaa81-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ab661f3ce5c111ee9aa9374d6d45775a-20240319
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1298308036; Tue, 19 Mar 2024 00:24:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 15:03:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 15:03:00 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v2 08/14] drm/mediatek: Rename files "mtk_drm_ddp_comp.h" to "mtk_ddp_comp.h"
Date: Tue, 19 Mar 2024 15:02:51 +0800
Message-ID: <20240319070257.6443-9-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240319070257.6443-1-shawn.sung@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_002411_097883_C79ABCEE 
X-CRM114-Status: GOOD (  10.62  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename files mtk_drm_ddp_comp.h to mtk_ddp_comp.h.

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c                             | 2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.h                             | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} | 0
 drivers/gpu/drm/mediatek/mtk_disp_aal.c                         | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                         | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                        | 2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                              | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c                     | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                          | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h                          | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c                        | 2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                              | 2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c                            | 2 +-
 drivers/gpu/drm/mediatek/mtk_padding.c                          | 2 +-
 19 files changed, 18 insertions(+), 18 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 631c1ef2847ef..7710e539e3da1 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -20,8 +20,8 @@
 #include <drm/drm_vblank.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
index 2d9f28f436aea..fd6c006f0c169 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.h
@@ -7,7 +7,7 @@
 #define MTK_CRTC_H
 
 #include <drm/drm_crtc.h>
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
rename to drivers/gpu/drm/mediatek/mtk_ddp_comp.h
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index ba926e797af8a..92acdaddd648d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -12,8 +12,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_AAL_EN				0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 79bcd3c487563..975ee45a0f72c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -11,8 +11,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_CCORR_EN				0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 4aa41b1ff2602..91e7837a32c86 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -11,8 +11,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_COLOR_CFG_MAIN			0x0400
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 1a1ee77127ee9..51ae4f947c714 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -12,8 +12,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_GAMMA_EN				0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 32a29924bd54c..3b1e04ecb9d45 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -10,7 +10,7 @@
 #include <linux/reset.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_disp_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 7f2219c0119be..0ebeaf9830d83 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -16,8 +16,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_REG_OVL_INTEN			0x0004
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 542dc2a20ea90..d957f5c8ccf92 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -18,8 +18,8 @@
 #include <linux/soc/mediatek/mtk-mutex.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 04f584372214f..f06b048c12479 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -14,8 +14,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_REG_RDMA_INT_ENABLE		0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index beb7d9d08e971..fbf63e0441337 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -26,9 +26,9 @@
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_dpi_regs.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 enum mtk_dpi_out_bit_num {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 24389c6c3561f..ab96b1001de3e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -15,10 +15,10 @@
 #include <drm/drm_print.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
-#include "mtk_drm_ddp_comp.h"
 
 
 #define DISP_REG_DITHER_EN			0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7be3b0546d3df..113fdbaac5a14 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -25,7 +25,7 @@
 #include <drm/drm_vblank.h>
 
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 24c4d59085bd6..78d698ede1bf8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -7,7 +7,7 @@
 #define MTK_DRM_DRV_H
 
 #include <linux/io.h>
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 
 #define MAX_CONNECTOR	2
 #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 720f6b4b08215..63a7a24468c13 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -14,7 +14,7 @@
 #include <linux/align.h>
 
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ec9d96396d7b2..e29c37fb5be09 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -28,8 +28,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DSI_START		0x00
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 41efaafe26f1a..9b0264bd5e731 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -15,7 +15,7 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index ff6a5c695128c..1f91805cd9aac 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -12,8 +12,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 
 #define PADDING_CONTROL_REG	0x00
 #define PADDING_BYPASS			BIT(0)
-- 
2.18.0


