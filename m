Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 03:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2BybkIaBsb0hfa3FIaSDPY8K19LpehOr1F87bOpi9M=; b=450Antq/t6pbNl
	oA4FfM/n2Xuod4VDVxB2XzZJT6LU5px8BwxP2IwaHfBBlboGegAGvaIR7UmEYioI59kman7vzEb1D
	uLEaAHhYXgV62LH2lUqKyetyfgX0PG2tGfgvW51p2/m0x+B6I2N6NHl6em/hiq7XGUEuVozBdR5Yu
	aEQ8rvX45bGoUa9wMqRND+PLEGjxs2vBNLuIcgonKm9GOhybw3BjZgkR+pRD+43RxRl4G3/32ZfjG
	Cipn6aEixUWgdQumnuKR4Lv1KJZrZvEiBhkz+99nALGOx9i1Os6jugCDOesxKHFA857v2Qo5Xwf/S
	sZiIYQbC6uT78ljQkjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1munNf-00Au57-Gl; Wed, 08 Dec 2021 03:12:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mun6O-00AmwX-9M; Wed, 08 Dec 2021 02:54:43 +0000
X-UUID: be10e082f1c64d1c9826757b524489c1-20211207
X-UUID: be10e082f1c64d1c9826757b524489c1-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2029131561; Tue, 07 Dec 2021 19:54:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 18:44:34 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Dec 2021 10:44:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Dec 2021 10:44:29 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v10 12/22] drm/mediatek: add display merge advance config API
 for MT8195
Date: Wed, 8 Dec 2021 10:44:16 +0800
Message-ID: <20211208024426.15595-13-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211208024426.15595-1-nancy.lin@mediatek.com>
References: <20211208024426.15595-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_185440_426019_95A470D2 
X-CRM114-Status: GOOD (  17.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add merge new advance config API. The original merge API is
mtk_ddp_comp_funcs function prototype. The API interface parameters
cannot be modified, so add a new config API for extension. This is
the preparation for ovl_adaptor merge control.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 52 ++++++++++++++++++++---
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index b3a372cab0bd..c2de53a5892e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -63,6 +63,9 @@ void mtk_merge_config(struct device *dev, unsigned int width,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_merge_start(struct device *dev);
 void mtk_merge_stop(struct device *dev);
+void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
+			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
+			      struct cmdq_pkt *cmdq_pkt);
 
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 45face638153..40da0555416d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -17,6 +17,7 @@
 #define DISP_REG_MERGE_CTRL		0x000
 #define MERGE_EN				1
 #define DISP_REG_MERGE_CFG_0		0x010
+#define DISP_REG_MERGE_CFG_1		0x014
 #define DISP_REG_MERGE_CFG_4		0x020
 #define DISP_REG_MERGE_CFG_10		0x038
 /* no swap */
@@ -25,9 +26,12 @@
 #define DISP_REG_MERGE_CFG_12		0x040
 #define CFG_10_10_1PI_2PO_BUF_MODE		6
 #define CFG_10_10_2PI_2PO_BUF_MODE		8
+#define CFG_11_10_1PI_2PO_MERGE			18
 #define FLD_CFG_MERGE_MODE			GENMASK(4, 0)
 #define DISP_REG_MERGE_CFG_24		0x070
 #define DISP_REG_MERGE_CFG_25		0x074
+#define DISP_REG_MERGE_CFG_26		0x078
+#define DISP_REG_MERGE_CFG_27		0x07c
 #define DISP_REG_MERGE_CFG_36		0x0a0
 #define ULTRA_EN				BIT(0)
 #define PREULTRA_EN				BIT(4)
@@ -98,12 +102,19 @@ static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
 void mtk_merge_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_merge_advance_config(dev, w, 0, h, vrefresh, bpc, cmdq_pkt);
+}
+
+void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
+			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
+			      struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 	unsigned int mode = CFG_10_10_1PI_2PO_BUF_MODE;
 
-	if (!h || !w) {
-		dev_err(dev, "%s: input width(%d) or height(%d) is invalid\n", __func__, w, h);
+	if (!h || !l_w) {
+		dev_err(dev, "%s: input width(%d) or height(%d) is invalid\n", __func__, l_w, h);
 		return;
 	}
 
@@ -112,14 +123,41 @@ void mtk_merge_config(struct device *dev, unsigned int w,
 		mode = CFG_10_10_2PI_2PO_BUF_MODE;
 	}
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+	if (r_w)
+		mode = CFG_11_10_1PI_2PO_MERGE;
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CFG_0);
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+	mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_1);
+	mtk_ddp_write(cmdq_pkt, h << 16 | (l_w + r_w), &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CFG_4);
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+	/*
+	 * DISP_REG_MERGE_CFG_24 is merge SRAM0 w/h
+	 * DISP_REG_MERGE_CFG_25 is merge SRAM1 w/h.
+	 * If r_w > 0, the merge is in merge mode (input0 and input1 merge together),
+	 * the input0 goes to SRAM0, and input1 goes to SRAM1.
+	 * If r_w = 0, the merge is in buffer mode, the input goes through SRAM0 and
+	 * then to SRAM1. Both SRAM0 and SRAM1 are set to the same size.
+	 */
+	mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CFG_24);
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
-		      DISP_REG_MERGE_CFG_25);
+	if (r_w)
+		mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_CFG_25);
+	else
+		mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_CFG_25);
+
+	/*
+	 * DISP_REG_MERGE_CFG_26 and DISP_REG_MERGE_CFG_27 is only used in LR merge.
+	 * Only take effect when the merge is setting to merge mode.
+	 */
+	mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_26);
+	mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_27);
+
 	mtk_ddp_write_mask(cmdq_pkt, SWAP_MODE, &priv->cmdq_reg, priv->regs,
 			   DISP_REG_MERGE_CFG_10, FLD_SWAP_MODE);
 	mtk_ddp_write_mask(cmdq_pkt, mode, &priv->cmdq_reg, priv->regs,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
