Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED8DCD11DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 01:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZBzveOcD4UYr7l9OYGUIrOYsEqGdx5b9f8Nu8xM2P4=; b=dgvj3UPM0RDPgC7REYPO0t/xAL
	UawWl3fD7SpVmQdkWYrct0UmFeLS3AHJkbNr6Vk+bGxg61t6ds8iaqry58pHgXkpNxutslKa0Kce6
	Yg4fYaG9zm8lOpy71zx038MNx4OkiLOIjQx1geM5jyKk276gDf7fx1epATdDyO3RWRP5XC85ucgV2
	D6y0n9V/MYp1w9Xnl6WVQWm0D2OawOcUEJIZ8BUIyT1d3WPYByKeXPFPMpPni1CFVTc9PwhxnvSrR
	zkSbgzDJ+8kLQcaDp/B1/JOID6IVMBDQ7mC2YVsXNFqGYZPoxdPw3U2z4AUSYXiGTNXA3mbtVO7gk
	Pe2+vl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnTi3-00000005NJl-3UzI;
	Fri, 22 Mar 2024 01:28:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnThm-00000005N95-39jn;
	Fri, 22 Mar 2024 01:28:25 +0000
X-UUID: 745c2320e7eb11eeacdb61a41848c7d2-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LZBzveOcD4UYr7l9OYGUIrOYsEqGdx5b9f8Nu8xM2P4=;
	b=SA5v/ctmbv6R3IUV5As49WbMdMF2UW+23ZMeXOKlmFEPs9hxqL96NbvNd4sq4B78tXSpfGmpXoeFHxKjwNgWxJi9E6HonbUxPSbFHdCUkpNwSW3vZUepxQYVxMguxS/xhcgLZtxLs6b38pkN4ar/69NeE4W+f3lvNKYBKIvTxqc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:838e7b98-0d70-4bdf-8281-33046c957bf3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:40a82e00-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 745c2320e7eb11eeacdb61a41848c7d2-20240321
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 620060692; Thu, 21 Mar 2024 18:28:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 09:28:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 09:28:11 +0800
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
Subject: [PATCH v4 12/14] drm/mediatek: Rename files "mtk_drm_gem.h" to "mtk_gem.h"
Date: Fri, 22 Mar 2024 09:28:06 +0800
Message-ID: <20240322012808.26234-13-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322012808.26234-1-shawn.sung@mediatek.com>
References: <20240322012808.26234-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.083200-8.000000
X-TMASE-MatchedRID: RU3AOpnwdje4pD9RIlWSGjl/LoO+pjoA1cuIRwt/4Mg1LB46LFAAkjN9
	Th6tMxrkLYexjI/F2s4qwQCg7f5qk8bYnyRUkqHDA9lly13c/gG4vBuE2X0HlQqAIpMpi6GdfdQ
	7p2bSGhbi8zVgXoAltsIJ+4gwXrEtec3QM3secWY8ACT7zOpAxuWhp6A77yhP94nVCUToXRVzN3
	Ft2x+1gdJDzjdeweJ9lExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.083200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 77CA1BB4FE7A9C6F94748F5A65ADF4615380BF5A0A3C74060DD2E971B69010E22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_182822_877643_ECCADB8F 
X-CRM114-Status: UNSURE (   9.67  )
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

Rename files mtk_drm_gem.h to mtk_gem.h.

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c                   | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c                | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} | 0
 drivers/gpu/drm/mediatek/mtk_plane.c                  | 2 +-
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 476376a6ed7bc..d811e4e73a36c 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -22,7 +22,7 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_gem.h"
+#include "mtk_gem.h"
 #include "mtk_plane.h"
 
 /*
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 113fdbaac5a14..b62320f648825 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -27,7 +27,7 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_gem.h"
+#include "mtk_gem.h"
 
 #define DRIVER_NAME "mediatek"
 #define DRIVER_DESC "Mediatek SoC DRM"
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 445fd8a8b8988..166a71dc40860 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -12,7 +12,7 @@
 #include <drm/drm_prime.h>
 
 #include "mtk_drm_drv.h"
-#include "mtk_drm_gem.h"
+#include "mtk_gem.h"
 
 static int mtk_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_gem.h
rename to drivers/gpu/drm/mediatek/mtk_gem.h
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 95a4328a9b0b6..4625deb21d406 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -16,7 +16,7 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_gem.h"
+#include "mtk_gem.h"
 #include "mtk_plane.h"
 
 static const u64 modifiers[] = {
-- 
2.18.0


