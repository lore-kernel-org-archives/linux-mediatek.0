Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE84CC54E71
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 02:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGQFxRad1RNYP+8eyWfwhxRyPeweQOJeZOtIrgnOVcg=; b=e9qQRU4qBd8fzMqAc0No3+YLMu
	h3a1Krb3GKIJikIieF9HiW1NKw7+QaFHSLUfxiXXp0oPdl90QBViSbENFwmGIaSE+IteGhWy4svxc
	yTP6/LLWj8RL8HNIke4htz5etxKZcs1GRAgpGX9gOWrxAej4vXborCAoaGT6FL2q7CbT5hM0v5ngr
	kV8W/HhmXCuWidwWzYdRL7Ay2maE+tu16+UFqEiMhjqMy09e4P3Ic1sxhJ8tLLfVWMF6VximNPKs9
	XB/hR9ZW/FydDl8uaoYdQjJQ53Rin03wdg0q1r5Mt3edVCl0hKhCcykkGDYrlnvXW5ay1wL0iBfLK
	pJukYYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlvM-0000000F6EM-2p4z;
	Wed, 20 Mar 2024 02:43:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlut-0000000F5qE-1BaX;
	Wed, 20 Mar 2024 02:43:02 +0000
X-UUID: 8ce73422e66311eeacdb61a41848c7d2-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pGQFxRad1RNYP+8eyWfwhxRyPeweQOJeZOtIrgnOVcg=;
	b=Gpj09R8lkf4/mIo8qmzKDP+E1ogbwuuaKxmVFFh4wjJZDx0g00Yr1QEWhx5AF+XpXTyr/I4VB+mGL0Fge1EVprPA2UpfeyEcdoNl6Dyh5hhuM9J71736BnIaZJPaMH5KOQePJoeTl65l8g3pfug2K6HSnNInk8e0rMKreyn5kxk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:9532d655-dc84-43db-84a5-eec6a037b57a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:e3b83385-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8ce73422e66311eeacdb61a41848c7d2-20240319
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 126023800; Tue, 19 Mar 2024 19:42:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH v3 06/14] drm/mediatek: Rename files "mtk_drm_crtc.h" to "mtk_crtc.h"
Date: Wed, 20 Mar 2024 10:42:14 +0800
Message-ID: <20240320024222.14234-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320024222.14234-1-shawn.sung@mediatek.com>
References: <20240320024222.14234-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.173300-8.000000
X-TMASE-MatchedRID: PbOQzqqs5Am4pD9RIlWSGjl/LoO+pjoA1cuIRwt/4Mg1LB46LFAAkkfp
	kQx2u0KsbDDGr42tgBN+joSlmQGbUiGdJ77k/6slA9lly13c/gGy4iyjvVWTon5h6y4KCSJccx0
	Y+I7jXmabuQcHZubU2q6ARG1tM8qIr78SC5iivxwURSScn+QSXt0H8LFZNFG7CKFCmhdu5cWJxa
	oDJWdMcrdJYiIjafziroqxsx/C0B4FXcxm7GDo1mpEZoVFAn9l/3dTAdsHk+/6Iz+17IZqc/hmb
	+KiNwnH8cZFtAf2UCIXRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.173300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6DDF028A3DC8977A94973A8F181ADDB683005229FADA84AAA0F84FC2F3783D9A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_194259_360700_0DBBA910 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

Rename files mtk_drm_crtc.h to mtk_crtc.h.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/{mtk_drm_crtc.h => mtk_crtc.h} | 0
 drivers/gpu/drm/mediatek/mtk_disp_aal.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c         | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c             | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                  | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c                | 2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c                    | 2 +-
 drivers/gpu/drm/mediatek/mtk_padding.c                  | 2 +-
 14 files changed, 13 insertions(+), 13 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.h => mtk_crtc.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_crtc.h
rename to drivers/gpu/drm/mediatek/mtk_crtc.h
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 40fe403086c3d..ba926e797af8a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -11,8 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>

+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 465cddce0d324..79bcd3c487563 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -10,8 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>

+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 78ea99f1444fa..4aa41b1ff2602 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -10,8 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>

+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c1bc8b00d9380..1a1ee77127ee9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -11,8 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>

+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2bffe42454666..7f2219c0119be 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -15,8 +15,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>

+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 034d31824d4dc..542dc2a20ea90 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -17,8 +17,8 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>

+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index faa907f2f443e..04f584372214f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -13,8 +13,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>

+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 16a6fc0bbdc9e..631c1ef2847ef 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -19,8 +19,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>

+#include "mtk_crtc.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index a515e96cfefcb..24389c6c3561f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -14,11 +14,11 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <drm/drm_print.h>

+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 #include "mtk_drm_ddp_comp.h"
-#include "mtk_drm_crtc.h"


 #define DISP_REG_DITHER_EN			0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 81e8aa65abd6d..7be3b0546d3df 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -24,7 +24,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>

-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index db63a32c407e3..720f6b4b08215 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -13,7 +13,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <linux/align.h>

-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 6a5d0c345aab9..41efaafe26f1a 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -14,7 +14,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>

-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index 0d6451c149b67..ff6a5c695128c 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -11,8 +11,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>

+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"

 #define PADDING_CONTROL_REG	0x00
--
2.18.0


