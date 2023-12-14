Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F83C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 05:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tETS/LaKZJhty2ne6XqtyUydm6rXnPlVK0D5eBzyuak=; b=3+kUq3PcPwHpW6WFy56CYwvwAe
	tarCh95B8qYEjI4NAjmq3THWijFZp3gT2KzI/VngbmlHAhh6EE4MTSGhmypoFzhhZG+iUsvUUG2OU
	/omwzuxuKKui8mDl6A7E2BmI+Q0MEif0Ph7xOeYpdo+WcFwwgLI+DX072QAtY+WWvZ1JQx78OTEDG
	2ZXJmfdhKSEBtiBhKrgTqEHB+c17DlS1nNAtE7/i8MlHm2MXtALuoABgE0sGinIpwI7i5FqEoY7UT
	+7mx+clWW/GTbNVd0zba0kqqstQXNu1jEd2uBSKUlaWOusqXfxqMzbMZR8uVcHnheJkj6oGLHwSzs
	4o/1AFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDekh-00Gs3h-05;
	Thu, 14 Dec 2023 05:59:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDekP-00Grpf-2p;
	Thu, 14 Dec 2023 05:59:05 +0000
X-UUID: dc50a1169a4511ee958cff29c719f35b-20231213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tETS/LaKZJhty2ne6XqtyUydm6rXnPlVK0D5eBzyuak=;
	b=Zg0APQwPNB2Kd6cNqOH48RObIEQ2kocqPxBBsDD16ClQgHhJrXNXwHeUq9HhZKD4TkBtRVUEeQ3ewQMba3X9Wn6ZvKVs7pzKRKYUH4sYWlk3K34pifKtMCrR+WAI5NLmBa/vOv8D+fiuoliAGLs5rCuLu6I0nOPeyTOd00wpjjA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:f99c3c68-d161-472d-991f-bbef31811122,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:9a3c29bd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dc50a1169a4511ee958cff29c719f35b-20231213
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1993819329; Wed, 13 Dec 2023 22:58:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Dec 2023 13:58:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Dec 2023 13:58:50 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, Moudy Ho <moudy.ho@mediatek.com>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, "Roy-CW .
 Yeh" <roy-cw.yeh@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	xinlei lee <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v12 12/23] drm/mediatek: Add component ID to component match structure
Date: Thu, 14 Dec 2023 13:58:36 +0800
Message-ID: <20231214055847.4936-13-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231214055847.4936-1-shawn.sung@mediatek.com>
References: <20231214055847.4936-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.137500-8.000000
X-TMASE-MatchedRID: +0gY6okUAw/wi+JtrEQDF72xWbKjBfWPT5++FIORChDJYIv7y0tu9rsI
	asnPqvyQZClGcL9tHydiFleaZxjZFswdQieqpnTaFYJUGv4DL3zljSRvSGpq3PYST2HmKKfiiDY
	Xi2hIM/kth7GMj8XazrtoEorx7rLzYlldA0POS1JDiyuN5FvFNqp2m4S4J4ZoCqIJhrrDy29DJi
	enRpkiMjalcgn9jL/LojCvEB8eY1zD6egsHKBhOBIRh9wkXSlFfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtw1tMVU7ONTz62tQ01i0/pTZ3KK++KXBqCB5aR9420KRyT8YBnoJBig==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.137500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F055E5BE60AA0F6960934B5382F2E91C52CD838192822F0C0934863AC85AE68B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_215901_922177_9FA8B4B0 
X-CRM114-Status: GOOD (  15.12  )
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

Add component ID to component match structure so we can
configure them with a for-loop.

The main reason we do such code refactoring is that
there is a new hardware component called "Padding" since
MT8188, while MT8195 doesn't have this module, we can't
use the original logic to manage the components.

While MT8195 does not define Padding in the device tree,
the corresponding components will be NULL and being skipped
by the functions.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 69 ++++++++-----------
 1 file changed, 30 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 114eded8177e..9f569d0f52b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -52,6 +52,7 @@ enum mtk_ovl_adaptor_comp_id {
 
 struct ovl_adaptor_comp_match {
 	enum mtk_ovl_adaptor_comp_type type;
+	enum mtk_ddp_comp_id comp_id;
 	int alias_id;
 };
 
@@ -68,19 +69,19 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 };
 
 static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
-	[OVL_ADAPTOR_MDP_RDMA0]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 0 },
-	[OVL_ADAPTOR_MDP_RDMA1]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 1 },
-	[OVL_ADAPTOR_MDP_RDMA2]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 2 },
-	[OVL_ADAPTOR_MDP_RDMA3]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 3 },
-	[OVL_ADAPTOR_MDP_RDMA4]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 4 },
-	[OVL_ADAPTOR_MDP_RDMA5]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 5 },
-	[OVL_ADAPTOR_MDP_RDMA6]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 6 },
-	[OVL_ADAPTOR_MDP_RDMA7]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 7 },
-	[OVL_ADAPTOR_MERGE0]	= { OVL_ADAPTOR_TYPE_MERGE, 1 },
-	[OVL_ADAPTOR_MERGE1]	= { OVL_ADAPTOR_TYPE_MERGE, 2 },
-	[OVL_ADAPTOR_MERGE2]	= { OVL_ADAPTOR_TYPE_MERGE, 3 },
-	[OVL_ADAPTOR_MERGE3]	= { OVL_ADAPTOR_TYPE_MERGE, 4 },
-	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
+	[OVL_ADAPTOR_MDP_RDMA0] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA0, 0 },
+	[OVL_ADAPTOR_MDP_RDMA1] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA1, 1 },
+	[OVL_ADAPTOR_MDP_RDMA2] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA2, 2 },
+	[OVL_ADAPTOR_MDP_RDMA3] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA3, 3 },
+	[OVL_ADAPTOR_MDP_RDMA4] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA4, 4 },
+	[OVL_ADAPTOR_MDP_RDMA5] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA5, 5 },
+	[OVL_ADAPTOR_MDP_RDMA6] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA6, 6 },
+	[OVL_ADAPTOR_MDP_RDMA7] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA7, 7 },
+	[OVL_ADAPTOR_MERGE0] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE1, 1 },
+	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2 },
+	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3 },
+	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4 },
+	[OVL_ADAPTOR_ETHDR0] = { OVL_ADAPTOR_TYPE_ETHDR, DDP_COMPONENT_ETHDR_MIXER, 0 },
 };
 
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
@@ -314,36 +315,26 @@ size_t mtk_ovl_adaptor_get_num_formats(struct device *dev)
 
 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
 {
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA3);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA4);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA5);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA6);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA7);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE1);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE2);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE3);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE4);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
+	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i])
+			continue;
+		mtk_mutex_add_comp(mutex, comp_matches[i].comp_id);
+	}
 }
 
 void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
 {
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA3);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA4);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA5);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA6);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA7);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE1);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE2);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE3);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE4);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
+	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i])
+			continue;
+		mtk_mutex_remove_comp(mutex, comp_matches[i].comp_id);
+	}
 }
 
 void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsigned int next)
-- 
2.18.0


