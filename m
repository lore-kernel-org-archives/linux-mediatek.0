Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C50C25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 06:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDOgK5Ukj6Kqp6guWqZHpoQ9zAqLE+sUML9b37sssLU=; b=bFWhkvhoyN1DzLNXAsAx3ntghi
	m7NKBTotSQY35e2J6TMenyJjrQp8iwmP30tcJ9+pccBCrg+j4x9O0s9XaoxwVbdobyE0fFSXdumRx
	IMwQF9bnraMF9cZerT91EDX8+x0Z7KEB45OXLkv/Nbxf2PyBRbQTFIFGODohXxY7kNm1Q6Fum+AgA
	seyOfKA7XV5Vjw8iZpS8s+KIZC2TNB7RySsQF8R25HhoRWqeXHpNA7I+XUNIx1qOO+DeoXwLDD01Y
	SezUXVaCy/wEQvIKB4NfoIWbT1aOoZU9aAU9I9Pa8gczDgL7h5iO8qOtoZjwlbStxK7pt4nn7R7mu
	Nw121sGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvc1-002ast-L4; Fri, 19 Aug 2022 06:36:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvbq-002apN-HI; Fri, 19 Aug 2022 06:35:59 +0000
X-UUID: e37213932e7146069c51a2c7f9c48f9f-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rDOgK5Ukj6Kqp6guWqZHpoQ9zAqLE+sUML9b37sssLU=;
	b=iI21Ia7Qdx7oKP2mZqb0iQ0SaRpr3Z2rN6t8SXbtgG89pzCZCGMfUkklE5hPMjHR7KqJ3BRZTVKYdSOh4txj+qqFiCrSUzsZdG+N9zurIKknRr0t5vPt+iaDhSF1HwFw7RI+utQMZmlxaJuaQUMJel3mKFbPUm3mod/NFDhMYOk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:14d7c30e-9d89-44e4-9332-0bca29a0a200,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:269bc4fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e37213932e7146069c51a2c7f9c48f9f-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 987084271; Thu, 18 Aug 2022 23:35:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 14:14:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 14:14:58 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	<nfraprado@collabora.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v26 4/7] drm/mediatek: add dma dev get function
Date: Fri, 19 Aug 2022 14:14:53 +0800
Message-ID: <20220819061456.8042-5-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220819061456.8042-1-nancy.lin@mediatek.com>
References: <20220819061456.8042-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_233558_607986_F941EE84 
X-CRM114-Status: GOOD (  15.98  )
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

This is a preparation for adding support for the ovl_adaptor sub driver
Ovl_adaptor is a DRM sub driver, which doesn't have dma dev. Add
dma_dev_get function for getting representative dma dev in ovl_adaptor.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioachino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 15 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 112615817dcb..78e20f604158 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -58,6 +58,7 @@ struct mtk_drm_crtc {
 #endif
 
 	struct device			*mmsys_dev;
+	struct device			*dma_dev;
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
@@ -865,6 +866,13 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 	return 0;
 }
 
+struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+
+	return mtk_crtc->dma_dev;
+}
+
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const enum mtk_ddp_comp_id *path, unsigned int path_len)
 {
@@ -953,6 +961,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			return ret;
 	}
 
+	/*
+	 * Default to use the first component as the dma dev.
+	 * In the case of ovl_adaptor sub driver, it needs to use the
+	 * dma_dev_get function to get representative dma dev.
+	 */
+	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv->ddp_comp[path[0]]);
+
 	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index cb9a36c48d4f..f5a6e80c5265 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -22,5 +22,6 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state);
 void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
 			       struct drm_atomic_state *plane_state);
+struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc);
 
 #endif /* MTK_DRM_CRTC_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 2d0052c23dcb..364f3f7f59fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -71,6 +71,7 @@ struct mtk_ddp_comp_funcs {
 	void (*bgclr_in_off)(struct device *dev);
 	void (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
+	struct device * (*dma_dev_get)(struct device *dev);
 };
 
 struct mtk_ddp_comp {
@@ -203,6 +204,13 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
 		comp->funcs->ctm_set(comp->dev, state);
 }
 
+static inline struct device *mtk_ddp_comp_dma_dev_get(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->dma_dev_get)
+		return comp->funcs->dma_dev_get(comp->dev);
+	return comp->dev;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-- 
2.18.0


