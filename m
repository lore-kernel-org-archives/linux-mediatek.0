Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E3DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 10:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jzjdb0dFRiJUs8tDyEh4gCqyfEl112KLIlqBhEanH6E=; b=IK66VHfWpXxF7J
	c3fABmsiFhKBXqINEz3eZz8HWCkSALf/SO7iTemLLY1G7YirOpqRVnvu3Z6KV7d886lJDnud/BYE3
	b8BJ9tV5iuctUCWxgVXzTVoQVk6qwbDdu/p4BbU/0CTciX/mFGGeDjYBPhvOb9Vd7qfMKnjEA0Z0v
	lVP3V5sz6l7w9KRrM9fzUvFjYD+oF8qg6yfjg3xFb67owZSIScZKPEgk0awR2Rac0mObjzFf8uhEN
	VgMHolTs2YsCfKPbaAdpAxYThpC85sLuqKmC8c25uj7cJapRsc5rLNSJSirCdH/9nMAddzmIep0Pz
	mjypUXHu9Cw+XFAWxi5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlpi9-0058po-5b; Tue, 03 May 2022 10:24:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlphH-0058Bq-02; Tue, 03 May 2022 10:24:01 +0000
X-UUID: 2afd8ebed69b46f58312d880936acb20-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:699219ff-0f7e-4355-81b3-ce960e395cd1, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:181f892f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2afd8ebed69b46f58312d880936acb20-20220503
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 232666835; Tue, 03 May 2022 03:23:51 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 03:23:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 18:23:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 3 May 2022 18:23:48 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
 <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v19 14/25] drm/mediatek: add display merge advance config API
 for MT8195
Date: Tue, 3 May 2022 18:23:34 +0800
Message-ID: <20220503102345.22817-15-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503102345.22817-1-nancy.lin@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_032359_111671_B45A4D1E 
X-CRM114-Status: GOOD (  18.41  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 52 ++++++++++++++++++++---
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index bb91518cdc93..53aa988dde3b 100644
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
