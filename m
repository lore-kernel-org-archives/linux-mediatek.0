Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA33C54E68
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 02:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKCWVNO/5B3LxPPTIAj8qoriTz/hQl7CWXlq45IQqxQ=; b=MfKEcEy47zDXe3Z5M2dgWbzczX
	hohjxhujT/z8OGvCaKWLh7GfHz6mzQwiT6V0PwhTXE9NfSbwPcLrlny40LLXpTo5Zj47HgkoOzXbf
	BgZfygO/+P/jUFC4WXzbZUsAiINhx1YSvKGpookTys8+5CMNhBhHFTfSD5inY1MtSXqlhLfq35G7B
	v4vCVhzcIxdJmmEq0a9/OFGFzXU/tu7LWxeWMlB6B7bc/QOIxvAj8loRoAeZmOFCMvszyXZaon1US
	zH08SXFXkx1a0G/RQDBz3oUfwbgFggKCpEZUojChVa6M6HCe03EVS4sLGPo89oOCwa9jGLSE1dfVt
	d0BafF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlw8-0000000F6mP-3PWr;
	Wed, 20 Mar 2024 02:44:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlv1-0000000F5uY-0NM1;
	Wed, 20 Mar 2024 02:43:11 +0000
X-UUID: 91c63286e66311eeacdb61a41848c7d2-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XKCWVNO/5B3LxPPTIAj8qoriTz/hQl7CWXlq45IQqxQ=;
	b=fw0cwBxm0DT3T+bVhn9ll3ZF8Tpsaax6qwVVpjzJY5NOND9rlmf+m3RsTPA9QehbnsAjokrH9FrTVH69nFwThM3P5I7lD+BMUiJJe63fqDAIeDrLGCL2adOgndUHDyGuLWZPO8QpHmtmVoY2ahqlgzPYMCFDcFZv7aGNnWvXz+0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:a5df4176-c2e0-46a3-9d76-eddc0014f00d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:72501800-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 91c63286e66311eeacdb61a41848c7d2-20240319
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1053283818; Tue, 19 Mar 2024 19:43:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 10:42:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 10:42:25 +0800
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
Subject: [PATCH v3 10/14] drm/mediatek: Rename files "mtk_drm_plane.h" to "mtk_plane.h"
Date: Wed, 20 Mar 2024 10:42:18 +0800
Message-ID: <20240320024222.14234-11-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320024222.14234-1-shawn.sung@mediatek.com>
References: <20240320024222.14234-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_194307_364094_740141C8 
X-CRM114-Status: GOOD (  10.59  )
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

Rename files mtk_drm_plane.h to mtk_plane.h.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.h                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c                   | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h                   | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c                  | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_plane.h => mtk_plane.h} | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.h => mtk_plane.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 7710e539e3da1..1ba47e65a32da 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -23,7 +23,7 @@
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
-#include "mtk_drm_plane.h"
+#include "mtk_plane.h"

 /*
  * struct mtk_crtc - MediaTek specific crtc structure.
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
index fd6c006f0c169..388e900b6f4de 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.h
@@ -9,7 +9,7 @@
 #include <drm/drm_crtc.h>
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_plane.h"
+#include "mtk_plane.h"

 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index ab96b1001de3e..c3441508f452f 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -18,7 +18,7 @@
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_plane.h"
+#include "mtk_plane.h"


 #define DISP_REG_DITHER_EN			0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 90e64467ea8f8..082ac18fe04aa 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -9,8 +9,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
-#include "mtk_drm_plane.h"
 #include "mtk_mdp_rdma.h"
+#include "mtk_plane.h"

 int mtk_aal_clk_enable(struct device *dev);
 void mtk_aal_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 63a7a24468c13..95a4328a9b0b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -17,7 +17,7 @@
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
-#include "mtk_drm_plane.h"
+#include "mtk_plane.h"

 static const u64 modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_plane.h
rename to drivers/gpu/drm/mediatek/mtk_plane.h
--
2.18.0


