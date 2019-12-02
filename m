Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBE4C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 07:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3D8215E5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 07:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QMFR9eRp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WjqhFtT+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C3D8215E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HEwAL/6lwFzvWgdhuqREgg0LgUu2BgTDk2qEhQp3itY=; b=QMFR9eRp4OX57B
	xgTdJMyytb6xRRwxiP8gk+3vGVsyGUooO0Bo2SsqdnqDmLWASDzn9Ojke5xn1BXISP2YwdFdxAk57
	9zWz1ymyqHqxjbE+TuQDXz1cKDJBKo6+dfFfoRb1hHVx6bP/EobwTd2a0xyEKtI1b/iVuHIbOWhvg
	fJZoZRYeco3M3r/OJ72v3O3bVme2dnTOij8vDUBpCzgwd2iZo+OyWTbXzC15/awgaSf1EEekr63VE
	vq45tVQwPGXmSED1Icv2NshTGIecjlHZdtk8jfMWxbf+WhdqSiKav3aHBd7fg9vHI4IlMuga5L/mT
	c0WWuCB8BkRYC9Ax/BNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibgH5-0007ct-A3; Mon, 02 Dec 2019 07:37:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibgH2-0007bi-57; Mon, 02 Dec 2019 07:37:37 +0000
X-UUID: bd4a02df2a1c45b3a52f7877c4fbffe2-20191201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=a5jrEc352xLH4E1s0PphYrET7imYAjDTOReZgNhh1M0=; 
 b=WjqhFtT+ODJTbcI7PX3tnXSIa6l/QE5ytSY94MIzfmFr8u2UMCmx9qN14Evm6Kgt0XzOADaZ9U28l6SabDAA/BKasRvQCrOflUSp8p8zecTbq3dSKXX/cF2e6+mOlYM3PrrHLMZqw4ferSYhNgy/ra8PXda73UFaHqRqMPwGUrQ=;
X-UUID: bd4a02df2a1c45b3a52f7877c4fbffe2-20191201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1406023877; Sun, 01 Dec 2019 23:37:28 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 1 Dec 2019 23:32:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 15:31:22 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Dec 2019 15:31:20 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1] drm/mediatek: add ctm property support
Date: Mon, 2 Dec 2019 15:31:32 +0800
Message-ID: <1575271892-25117-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191201_233736_208266_6CCA1B4B 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

add ctm property support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  7 +++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 59 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++
 3 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 4fb346c..e7e3aa9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -666,10 +666,13 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	int i;
 
 	if (crtc->state->color_mgmt_changed)
-		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
+		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i],
 					  crtc->state,
 					  mtk_crtc_state->cmdq_handle);
+			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
+		}
+
 #ifdef CONFIG_MTK_CMDQ
 	if (mtk_crtc->cmdq_client) {
 		drm_atomic_state_get(old_atomic_state);
@@ -891,7 +894,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	if (ret < 0)
 		return ret;
 	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
-	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, true, MTK_LUT_SIZE);
 	priv->num_pipes++;
 #ifdef CONFIG_MTK_CMDQ
 	mtk_crtc->cmdq_client =
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 9cc12af..4bbbac7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -38,7 +38,15 @@
 #define CCORR_EN				BIT(0)
 #define DISP_CCORR_CFG				0x0020
 #define CCORR_RELAY_MODE			BIT(0)
+#define CCORR_ENGINE_EN				BIT(1)
+#define CCORR_GAMMA_OFF				BIT(2)
+#define CCORR_WGAMUT_SRC_CLIP			BIT(3)
 #define DISP_CCORR_SIZE				0x0030
+#define DISP_CCORR_COEF_0			0x0080
+#define DISP_CCORR_COEF_1			0x0084
+#define DISP_CCORR_COEF_2			0x0088
+#define DISP_CCORR_COEF_3			0x008C
+#define DISP_CCORR_COEF_4			0x0090
 
 #define DISP_DITHER_EN				0x0000
 #define DITHER_EN				BIT(0)
@@ -187,7 +195,7 @@ static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_CCORR_SIZE);
-	mtk_ddp_write(cmdq_pkt, CCORR_RELAY_MODE, comp, DISP_CCORR_CFG);
+	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, DISP_CCORR_CFG);
 }
 
 static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
@@ -200,6 +208,54 @@ static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
 	writel_relaxed(0x0, comp->regs + DISP_CCORR_EN);
 }
 
+/* Converts a DRM S31.32 value to the HW S0.11 format. */
+static u16 mtk_ctm_s31_32_to_s0_11(u64 in)
+{
+	u16 r;
+
+	/* Sign bit. */
+	r = in & BIT_ULL(63) ? BIT(11) : 0;
+
+	if ((in & GENMASK_ULL(62, 33)) > 0) {
+		/* We have zero integer bits so we can only saturate here. */
+		r |= GENMASK(10, 0);
+	} else {
+		/* Otherwise take the 9 most important fractional bits. */
+		r |= (in >> 22) & GENMASK(10, 0);
+	}
+
+	return r;
+}
+
+static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
+			      struct drm_crtc_state *state)
+{
+	struct drm_property_blob *blob = state->ctm;
+	struct drm_color_ctm *ctm;
+	const u64 *input;
+	uint16_t coeffs[9] = { 0 };
+	int i;
+
+	if (!blob)
+		return;
+
+	ctm = (struct drm_color_ctm *)blob->data;
+	input = ctm->matrix;
+
+	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
+		coeffs[i] = mtk_ctm_s31_32_to_s0_11(input[i]);
+
+	writel_relaxed(coeffs[0] << 16 | coeffs[1],
+		       comp->regs + DISP_CCORR_COEF_0);
+	writel_relaxed(coeffs[2] << 16 | coeffs[3],
+		       comp->regs + DISP_CCORR_COEF_1);
+	writel_relaxed(coeffs[4] << 16 | coeffs[5],
+		       comp->regs + DISP_CCORR_COEF_2);
+	writel_relaxed(coeffs[6] << 16 | coeffs[7],
+		       comp->regs + DISP_CCORR_COEF_3);
+	writel_relaxed(coeffs[8] << 16, comp->regs + DISP_CCORR_COEF_4);
+}
+
 static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -269,6 +325,7 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 	.config = mtk_ccorr_config,
 	.start = mtk_ccorr_start,
 	.stop = mtk_ccorr_stop,
+	.ctm_set = mtk_ccorr_ctm_set,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_dither = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 5b0a3d4..5100c3d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -95,6 +95,8 @@ struct mtk_ddp_comp_funcs {
 			  struct cmdq_pkt *cmdq_pkt);
 	void (*bgclr_in_on)(struct mtk_ddp_comp *comp);
 	void (*bgclr_in_off)(struct mtk_ddp_comp *comp);
+	void (*ctm_set)(struct mtk_ddp_comp *comp,
+			struct drm_crtc_state *state);
 };
 
 struct mtk_ddp_comp {
@@ -213,6 +215,13 @@ static inline void mtk_ddp_comp_bgclr_in_off(struct mtk_ddp_comp *comp)
 		comp->funcs->bgclr_in_off(comp);
 }
 
+static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
+				   struct drm_crtc_state *state)
+{
+	if (comp->funcs && comp->funcs->ctm_set)
+		comp->funcs->ctm_set(comp, state);
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
