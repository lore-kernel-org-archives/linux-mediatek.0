Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0CEE8FDC3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 03:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBHPkbibqF6QHos8lVb7eZSoWqUEMyx40nIKQfYmeOw=; b=n5jV2kRNpmNSnDNiG/wjx73WBv
	UlsgeBjs8CLgMPx5U8sK0/WxKL7+R8XCb9IuwmxSqnc2m6FDQYMpDUpmGkqP/4vfGK/imJ1TMxen5
	WmWcMkDZ0r5tnEtp2M0kDq+LMH2skjN8E+AtXzn9tEdKTaNonmwag5KFWu8ioo2YH/lDfj64O21bg
	ZXEItsRVJoB5yaCGS0vD18HESCKrC3cCgepf+qenEpudJw7uoEimpJrxXfI749WtdYjf9t3WyxQJS
	UlQ3G38iQQ32ExP1HkOtZ1R3MEN+bIth/fW3t53JG/VQvldx8fO3ira7BLyjkHtJ/M9BpZitGb8vq
	++4qr0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qns8A-00Fq9a-1R;
	Wed, 04 Oct 2023 03:00:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qns86-00Fq90-1y;
	Wed, 04 Oct 2023 03:00:56 +0000
X-UUID: 394afbda626211ee9b7791016c24628a-20231003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TBHPkbibqF6QHos8lVb7eZSoWqUEMyx40nIKQfYmeOw=;
	b=ssjY0fYviZApXXLbE5wkzjzoQvy73ajz/Ipp/meRrSsy8pKPgFnoinoouW4Wz21NMfXcxIHtks2kBQvhbdkeEuvoJ1XzajL99l98NaRfWrwm+PxlPkTHwD1v683ZGu0DWI3bPTGCeO07NLZbKJj4loyYzATKV5D8/QkgZWtlbwA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:cb58825d-5692-49bd-8467-ad7eb1993450,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:eba98ebf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 394afbda626211ee9b7791016c24628a-20231003
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 627692944; Tue, 03 Oct 2023 20:00:50 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 10:40:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 10:40:14 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 2/9] drm/mediatek: Add crtc path enum for all_drm_priv array
Date: Wed, 4 Oct 2023 10:40:06 +0800
Message-ID: <20231004024013.18956-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_200054_681407_7D5C3144 
X-CRM114-Status: GOOD (  13.39  )
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

Add mtk_drm_crtc_path enum for each display path.

Instead of using array index of all_drm_priv in mtk_drm_kms_init(),
mtk_drm_crtc_path enum can make code more readable.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 +++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h | 8 +++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 2d6a979afe8f..efe36eace8f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -469,21 +469,21 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		for (j = 0; j < private->data->mmsys_dev_num; j++) {
 			priv_n = private->all_drm_private[j];
 
-			if (i == 0 && priv_n->data->main_len) {
+			if (i == CRTC_MAIN && priv_n->data->main_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
 							  priv_n->data->main_len, j);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
-			} else if (i == 1 && priv_n->data->ext_len) {
+			} else if (i == CRTC_EXT && priv_n->data->ext_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
 							  priv_n->data->ext_len, j);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
-			} else if (i == 2 && priv_n->data->third_len) {
+			} else if (i == CRTC_THIRD && priv_n->data->third_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
 							  priv_n->data->third_len, j);
 				if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index eb2fd45941f0..f4de8bb27685 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -9,11 +9,17 @@
 #include <linux/io.h>
 #include "mtk_drm_ddp_comp.h"
 
-#define MAX_CRTC	3
 #define MAX_CONNECTOR	2
 #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
 #define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVL_ADAPTOR + 1)
 
+enum mtk_drm_crtc_path {
+	CRTC_MAIN,
+	CRTC_EXT,
+	CRTC_THIRD,
+	MAX_CRTC,
+};
+
 struct device;
 struct device_node;
 struct drm_crtc;
-- 
2.18.0


