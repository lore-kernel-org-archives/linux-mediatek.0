Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F99FE82CA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqLVNnaswXfnHgCav6ML9PNEHVFPQe3QQ1C79pdOuTY=; b=ULa+rnA9gcmcoaso7HapuqlQ8C
	k8nTWZS55iCpZu3Fpw1BWYcu6LwirTh/HDl8mA8KN1UY1QsdvYHCgTG+ptjjaaJy9An1/BNJ6arZw
	p5AQuOuOE5t7ojxxFjW0+PLMpKVZBq114BxZTmybV0wl5P3KDalWeEe6wVBpbGyJIfr/yCM5VouxQ
	q6aruhYGyQK2ZwPFvlIYrBdSup6PJm3cTY0HtW4/efdC2jK3AXs4+JWxwBoZUF0TANyKvP9aGfbUd
	x9L81zQZ6afd3ff4iJVhbjp5whxU5N6s3Z0Ios5uNX1AdotSIA++I5MvmVgH4tqWba28+ZkxIVIE/
	Xd/BxFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWfR-001LnN-2k;
	Wed, 27 Sep 2023 15:41:37 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWcj-001Iwn-1j;
	Wed, 27 Sep 2023 15:39:01 +0000
X-UUID: ed5534d65d4b11ee9b7791016c24628a-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yqLVNnaswXfnHgCav6ML9PNEHVFPQe3QQ1C79pdOuTY=;
	b=MgEe9dPbdiCVA8nyOcroIpV+N2tAYOG0e1wJiknad9+URfbiDoQ/XZF/ICpshGyIl5Vkvz7ZlwUt8lr7lJKWNDnrYY52+tEaqANv87vDYR5kX1T9t5B5dUIfNWTO/X5BtYzBDx/Ud6Rdi/t7oyRDm5VZGnu/E0uvbTSsRAAHOFM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:a3d3157e-d3b3-4fa6-a74a-dee788b69e8a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:f4be57bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ed5534d65d4b11ee9b7791016c24628a-20230927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1583480024; Wed, 27 Sep 2023 08:38:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 23:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 23:38:34 +0800
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
Subject: [PATCH v10 4/9] drm/mediatek: Add encoder_index interface for mtk_ddp_comp_funcs
Date: Wed, 27 Sep 2023 23:38:28 +0800
Message-ID: <20230927153833.23583-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.945000-8.000000
X-TMASE-MatchedRID: yrAXVheKNuUkavCrxJJxNlz+axQLnAVBuLwbhNl9B5U9APipIEm6xPKC
	81FnsF5IrUhQzMxACbpICsMQxCDS2MZEoJx1HltljtK7dC6UBnl9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO2ytvz1/F3QBWEU1CseH+dgtkSRTliLMWloQsk5IwzWi+NzfoftYbR8Vlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.945000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9C49166296CAA724F348FF512C60A81157D15BC0C0B4E2E6468A0A23A5D4FE582000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_083849_680460_8B4772A5 
X-CRM114-Status: GOOD (  10.69  )
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

To support dynamic connector selection function, each ddp_comp need to
get their encoder_index to identify which connector should be selected.

Add encoder_index interface for mtk_ddp_comp_funcs to get the encoder
identifier by drm_encoder_index().
Then drm driver will call mtk_ddp_comp_encoder_index_set() to store the
encoder_index to each ddp_comp in connector routes.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index febcaeef16a1..0797b3ac75d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -80,12 +80,14 @@ struct mtk_ddp_comp_funcs {
 	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);
 	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
+	unsigned int (*encoder_index)(struct device *dev);
 };
 
 struct mtk_ddp_comp {
 	struct device *dev;
 	int irq;
 	unsigned int id;
+	int encoder_index;
 	const struct mtk_ddp_comp_funcs *funcs;
 };
 
@@ -275,6 +277,12 @@ static inline bool mtk_ddp_comp_disconnect(struct mtk_ddp_comp *comp, struct dev
 	return false;
 }
 
+static inline void mtk_ddp_comp_encoder_index_set(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->encoder_index)
+		comp->encoder_index = (int)comp->funcs->encoder_index(comp->dev);
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-- 
2.18.0


