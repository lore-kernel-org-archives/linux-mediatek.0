Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DB6C47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBOUrqsYzm5HnMJR4XCkFV0T3hSQoVjMdySKfTTbo+k=; b=1SYi3HiD2aWoyk9akvWSryWi2p
	M8FOKltAi6FqE2jVUEnO1uT7fi5+PDRsvxIvyinhuVt3R7y7LwGKlvF2uUmLiqiwirTVOj9pFWzqu
	GmXEehmc/rkHDNJGo5DWJc0cekL9fbv1Dd0sYiMNnDRJ8tMOOSayH3D9kDrLk6NUvV3IYmA4C3MED
	3zNz87rNK9+ju8k4s4S+uZiZEL6iUhjDN8850g6dxu/u6q8Hg/CEWcDmp8pMOLh8irOroFYynDh8X
	kVQSXCp5uUIViddx2mNnqNr5UaiBvyjuboDj6l9VU9zjsgGNq7K4AD8YWceiyZl9z7yZiTnV4T4cn
	joS42MmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPeRZ-00BM9D-38;
	Tue, 16 Jan 2024 08:05:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPeRV-00BM6m-2f;
	Tue, 16 Jan 2024 08:05:07 +0000
X-UUID: ef7ea2b4b44511ee9a662f17bb45267e-20240116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fBOUrqsYzm5HnMJR4XCkFV0T3hSQoVjMdySKfTTbo+k=;
	b=PPvGFbhg51arEkkvDf8eHceAfOETUPlkyIAfQk5+1NooZ1IfBnBvxbFL1rU6bTZkA53Kcobkqs21gjpZ0d851tWknNQQebrwh/MCYa+z+41mimdM5xfJSw7ZU95QFooXnNJEY+YmqOF6Mc/M2TJce2xoBpLPZm2wOgHG6oLnxl4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:88a6a105-87bd-4ef3-8703-f745a86af7b4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:1e4be682-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ef7ea2b4b44511ee9a662f17bb45267e-20240116
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1762706342; Tue, 16 Jan 2024 01:04:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 16 Jan 2024 16:04:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 16 Jan 2024 16:04:19 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH 1/1] drm/mediatek: Filter modes according to hardware capability
Date: Tue, 16 Jan 2024 16:04:18 +0800
Message-ID: <20240116080418.28991-2-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240116080418.28991-1-shawn.sung@mediatek.com>
References: <20240116080418.28991-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_000505_898004_FD94322B 
X-CRM114-Status: GOOD (  24.05  )
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

We found that there is a stability issue on MT8188 when connecting an
external monitor in 2560x1440@144Hz mode. Checked with the designer,
there is a function called hardware prefetch that is triggered by VSYNC
and ended before VDE (during VBP). If duration of VBP is too short, the
throughput requirement of hardware prefetch could increase up to 3x, and
could lead to stability issues.

The mode settings that VDOSYS support are mainly affected by clock
rate and throughput. DRM driver should filter these settings according
to the SoC's limitation to avoid unstable conditions.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  7 +++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 15 +++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 62 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  8 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  2 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  7 +++
 9 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index eb738f14f09e3..92d5f5282d68c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -78,6 +78,7 @@ void mtk_ovl_bgclr_in_off(struct device *dev);
 void mtk_ovl_bypass_shadow(struct device *dev);
 int mtk_ovl_clk_enable(struct device *dev);
 void mtk_ovl_clk_disable(struct device *dev);
+unsigned long mtk_ovl_clk_rate(struct device *dev);
 void mtk_ovl_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
@@ -113,6 +114,7 @@ int mtk_ovl_adaptor_power_on(struct device *dev);
 void mtk_ovl_adaptor_power_off(struct device *dev);
 int mtk_ovl_adaptor_clk_enable(struct device *dev);
 void mtk_ovl_adaptor_clk_disable(struct device *dev);
+unsigned long mtk_ovl_adaptor_clk_rate(struct device *dev);
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 			    unsigned int h, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
@@ -156,6 +158,7 @@ int mtk_mdp_rdma_power_on(struct device *dev);
 void mtk_mdp_rdma_power_off(struct device *dev);
 int mtk_mdp_rdma_clk_enable(struct device *dev);
 void mtk_mdp_rdma_clk_disable(struct device *dev);
+unsigned long mtk_mdp_rdma_clk_rate(struct device *dev);
 void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 5aaf4342cdbda..2214527e3b787 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -205,6 +205,13 @@ void mtk_ovl_clk_disable(struct device *dev)
 	clk_disable_unprepare(ovl->clk);
 }
 
+unsigned long mtk_ovl_clk_rate(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return clk_get_rate(ovl->clk);
+}
+
 void mtk_ovl_start(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 35bbce35b7b58..002a983b0b0b8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -102,6 +102,7 @@ static const struct mtk_ddp_comp_funcs rdma = {
 	.power_off = mtk_mdp_rdma_power_off,
 	.clk_enable = mtk_mdp_rdma_clk_enable,
 	.clk_disable = mtk_mdp_rdma_clk_disable,
+	.clk_rate = mtk_mdp_rdma_clk_rate,
 };
 
 static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
@@ -337,6 +338,20 @@ void mtk_ovl_adaptor_clk_disable(struct device *dev)
 	}
 }
 
+unsigned long mtk_ovl_adaptor_clk_rate(struct device *dev)
+{
+	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		dev = ovl_adaptor->ovl_adaptor_comp[i];
+		if (!dev || !comp_matches[i].funcs->clk_rate)
+			continue;
+		return comp_matches[i].funcs->clk_rate(dev);
+	}
+	return 0;
+}
+
 unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev)
 {
 	return MTK_OVL_ADAPTOR_LAYER_NUM;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 715453fe7121b..06d7c81325548 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -33,6 +34,7 @@
  * @mutex: handle to one of the ten disp_mutex streams
  * @ddp_comp_nr: number of components in ddp_comp
  * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
+ * @prefetch_rate: hardware prefetch data rate of the vdosys
  *
  * TODO: Needs update: this header is missing a bunch of member descriptions.
  */
@@ -67,6 +69,8 @@ struct mtk_drm_crtc {
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
+
+	u32				prefetch_rate;
 };
 
 struct mtk_crtc_state {
@@ -211,6 +215,61 @@ static void mtk_drm_crtc_destroy_state(struct drm_crtc *crtc,
 	kfree(to_mtk_crtc_state(state));
 }
 
+static enum drm_mode_status
+mtk_drm_crtc_mode_valid(struct drm_crtc *crtc,
+			const struct drm_display_mode *mode)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	unsigned long rate = 0;
+	int i;
+
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		rate = mtk_ddp_comp_clk_rate(mtk_crtc->ddp_comp[i]);
+		if (rate)
+			break;
+	}
+
+	/* Convert to KHz and round the number */
+	rate = (rate + 500) / 1000;
+	if (rate && mode->clock > rate) {
+		pr_debug("crtc-%d: invalid clock: %d KHz (>%lu)\n",
+			 drm_crtc_index(crtc), mode->clock, rate);
+		return MODE_CLOCK_HIGH;
+	}
+
+	/*
+	 * Measure the bandwidth requirement of hardware prefetch (per frame)
+	 * ticks = htotal * vbp
+	 * data  = htotal * vtotal
+	 * rate  = data / ticks
+	 *       = (htotal * vtotal) / (htotal * vbp)
+	 *       = vtotal / vbp
+	 *
+	 * Say 4K60 (CAE-861) is the maximum mode supported by the SoC
+	 * rate = 2250 / 72 ~= 32 pixels per tick interval
+	 *
+	 * For 2560x1440@144 (htotal=2720, vtotal=1490, vbp=17):
+	 * rate = 1490 / 17 ~= 88 (NG)
+	 *
+	 * For 2560x1440@120 (htotal=2720, vtotal=1525, vbp=77):
+	 * rate = 1525 / 77 ~= 20 (OK)
+	 *
+	 * Bandwidth requirement of hardware prefetch increases significantly
+	 * when the VBP decreases (almost 3x in this example).
+	 */
+	i = mode->vtotal - mode->vsync_end; /* vbp */
+	rate = ((mode->vtotal * 10 / i) + 5) / 10;
+
+	if (mtk_crtc->prefetch_rate && rate > mtk_crtc->prefetch_rate) {
+		pr_debug("crtc-%d: invalid rate: %lu (>%u): " DRM_MODE_FMT "\n",
+			 drm_crtc_index(crtc), rate, mtk_crtc->prefetch_rate,
+			 DRM_MODE_ARG(mode));
+		return MODE_BAD;
+	}
+
+	return MODE_OK;
+}
+
 static bool mtk_drm_crtc_mode_fixup(struct drm_crtc *crtc,
 				    const struct drm_display_mode *mode,
 				    struct drm_display_mode *adjusted_mode)
@@ -816,6 +875,7 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
 };
 
 static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
+	.mode_valid	= mtk_drm_crtc_mode_valid,
 	.mode_fixup	= mtk_drm_crtc_mode_fixup,
 	.mode_set_nofb	= mtk_drm_crtc_mode_set_nofb,
 	.atomic_begin	= mtk_drm_crtc_atomic_begin,
@@ -1106,5 +1166,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		mtk_crtc->ddp_comp_nr++;
 	}
 
+	mtk_crtc->prefetch_rate = priv->data->prefetch_rate;
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 9633e860cc3ce..96a2466451dce 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -348,6 +348,7 @@ static const struct mtk_ddp_comp_funcs ddp_od = {
 static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.clk_enable = mtk_ovl_clk_enable,
 	.clk_disable = mtk_ovl_clk_disable,
+	.clk_rate = mtk_ovl_clk_rate,
 	.config = mtk_ovl_config,
 	.start = mtk_ovl_start,
 	.stop = mtk_ovl_stop,
@@ -400,6 +401,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.power_off = mtk_ovl_adaptor_power_off,
 	.clk_enable = mtk_ovl_adaptor_clk_enable,
 	.clk_disable = mtk_ovl_adaptor_clk_disable,
+	.clk_rate = mtk_ovl_adaptor_clk_rate,
 	.config = mtk_ovl_adaptor_config,
 	.start = mtk_ovl_adaptor_start,
 	.stop = mtk_ovl_adaptor_stop,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index f8c7e8d8ddc12..d180307f6f60f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -51,6 +51,7 @@ struct mtk_ddp_comp_funcs {
 	void (*power_off)(struct device *dev);
 	int (*clk_enable)(struct device *dev);
 	void (*clk_disable)(struct device *dev);
+	unsigned long (*clk_rate)(struct device *dev);
 	void (*config)(struct device *dev, unsigned int w,
 		       unsigned int h, unsigned int vrefresh,
 		       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
@@ -125,6 +126,13 @@ static inline void mtk_ddp_comp_clk_disable(struct mtk_ddp_comp *comp)
 		comp->funcs->clk_disable(comp->dev);
 }
 
+static inline unsigned long mtk_ddp_comp_clk_rate(struct mtk_ddp_comp *comp)
+{
+	if (comp && comp->funcs && comp->funcs->clk_rate)
+		return comp->funcs->clk_rate(comp->dev);
+	return 0;
+}
+
 static inline void mtk_ddp_comp_config(struct mtk_ddp_comp *comp,
 				       unsigned int w, unsigned int h,
 				       unsigned int vrefresh, unsigned int bpc,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cc746de91834c..04d54a0c74572 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -317,6 +317,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
 	.mmsys_id = 1,
 	.mmsys_dev_num = 2,
+	.prefetch_rate = 32,
 };
 
 static const struct of_device_id mtk_drm_of_ids[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 33fadb08dc1c7..5c6e4d5c563d9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -46,6 +46,8 @@ struct mtk_mmsys_driver_data {
 	bool shadow_register;
 	unsigned int mmsys_id;
 	unsigned int mmsys_dev_num;
+
+	unsigned int prefetch_rate;
 };
 
 struct mtk_drm_private {
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index 8feeb6dce2177..d761cf522fad3 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -273,6 +273,13 @@ void mtk_mdp_rdma_clk_disable(struct device *dev)
 	clk_disable_unprepare(rdma->clk);
 }
 
+unsigned long mtk_mdp_rdma_clk_rate(struct device *dev)
+{
+	struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);
+
+	return clk_get_rate(rdma->clk);
+}
+
 static int mtk_mdp_rdma_bind(struct device *dev, struct device *master,
 			     void *data)
 {
-- 
2.18.0


