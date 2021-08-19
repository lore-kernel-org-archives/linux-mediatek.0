Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1633EC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 02:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB990610FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 02:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB990610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RI/gQ6a74ZlbgHZsGwAj/CQKVN/iQx565JYeClMqwQ=; b=o3NIFwMDWNQZl2
	a3kLID0yof5kJovku/4dtpUCCp43pL+JsRdQHJ0CfDup6lgv/yIVump1Ut/4BVTyQKU0qvl8E01YA
	u91xfUOWesXFofGBi22nzCwkUTLhI5MdUplVPpDtFPevjgqDMMSL8bNvVvrGn3tqgFUkUWtcgApHs
	Q9UvnHa9MVQcSLOn1Hf/Rlt0A+KUPjNjBcd5paCAfVBdtFQOLoxF7m86ATwP/BnCjbDbWrMkl5A8A
	Y3GFfxRo8YJBdC+z2dqX8AQIotZPVkINt2Jal+x7rNM9hlRIbURFNyklyW+966JIz8ov65gHBfe3P
	ip150Vo1uoF3jmqAa/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGXrU-0073wj-Ca; Thu, 19 Aug 2021 02:32:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGXix-006zrI-4u; Thu, 19 Aug 2021 02:24:11 +0000
X-UUID: 75fedda06047413db51f2917bbe87320-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SDM2llq8sZyHtGxjWUd5mE8cPQlQziLI5mzSPG3mJKo=; 
 b=IHUpXEbpDSK7kKjVTIdxz09LlGFl8DXZb+mtpMgl4MrY3qA4EMY7fMADTxpSHYYsIQrbplktwc+K2R7tiBt+be0OTUtwa5DYlm5YdtPjmyTblbJg9ZMwElbnxBOZoKm1WfDK/09e/V+q44bt388RMiRkc3OYF0Z9jv6DYD9FoBE=;
X-UUID: 75fedda06047413db51f2917bbe87320-20210818
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2030522709; Wed, 18 Aug 2021 19:23:50 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 19:23:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 10:23:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 10:23:46 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 <fshao@chromium.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 09/13] drm/mediatek: rename the define of register offset
Date: Thu, 19 Aug 2021 10:23:23 +0800
Message-ID: <20210819022327.13040-10-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_192407_244683_3292F82E 
X-CRM114-Status: GOOD (  12.44  )
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

Add DISP_REG prefix for the define of register offset to
make the difference from the define of register value.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 57 +++++++++++----------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index aaa7450b3e2b..93beb980414f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -20,25 +20,25 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_crtc.h"
 
-#define DISP_OD_EN				0x0000
-#define DISP_OD_CFG				0x0020
-#define DISP_OD_SIZE				0x0030
-#define DISP_DITHER_5				0x0114
-#define DISP_DITHER_7				0x011c
-#define DISP_DITHER_15				0x013c
-#define DISP_DITHER_16				0x0140
+#define DISP_REG_OD_EN				0x0000
+#define DISP_REG_OD_CFG				0x0020
+#define DISP_REG_OD_SIZE			0x0030
+#define DISP_REG_DITHER_5			0x0114
+#define DISP_REG_DITHER_7			0x011c
+#define DISP_REG_DITHER_15			0x013c
+#define DISP_REG_DITHER_16			0x0140
 
 #define DISP_REG_UFO_START			0x0000
 
-#define DISP_AAL_EN				0x0000
-#define DISP_AAL_SIZE				0x0030
+#define DISP_REG_AAL_EN				0x0000
+#define DISP_REG_AAL_SIZE			0x0030
 
-#define DISP_DITHER_EN				0x0000
+#define DISP_REG_DITHER_EN			0x0000
 #define DITHER_EN				BIT(0)
-#define DISP_DITHER_CFG				0x0020
+#define DISP_REG_DITHER_CFG			0x0020
 #define DITHER_RELAY_MODE			BIT(0)
 #define DITHER_ENGINE_EN			BIT(1)
-#define DISP_DITHER_SIZE			0x0030
+#define DISP_REG_DITHER_SIZE			0x0030
 
 #define OD_RELAYMODE				BIT(0)
 
@@ -129,19 +129,19 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 		return;
 
 	if (bpc >= MTK_MIN_BPC) {
-		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
-		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
+		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_REG_DITHER_5);
+		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_REG_DITHER_7);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_NEW_BIT_MODE,
-			      cmdq_reg, regs, DISP_DITHER_15);
+			      cmdq_reg, regs, DISP_REG_DITHER_15);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
-			      cmdq_reg, regs, DISP_DITHER_16);
+			      cmdq_reg, regs, DISP_REG_DITHER_16);
 		mtk_ddp_write(cmdq_pkt, dither_en, cmdq_reg, regs, cfg);
 	}
 }
@@ -161,16 +161,16 @@ static void mtk_od_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_OD_SIZE);
-	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_OD_CFG);
-	mtk_dither_set(dev, bpc, DISP_OD_CFG, cmdq_pkt);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_OD_SIZE);
+	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_REG_OD_CFG);
+	mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
 }
 
 static void mtk_od_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(1, priv->regs + DISP_OD_EN);
+	writel(1, priv->regs + DISP_REG_OD_EN);
 }
 
 static void mtk_ufoe_start(struct device *dev)
@@ -186,7 +186,7 @@ static void mtk_aal_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_AAL_SIZE);
 }
 
 static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
@@ -200,14 +200,14 @@ static void mtk_aal_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(AAL_EN, priv->regs + DISP_AAL_EN);
+	writel(AAL_EN, priv->regs + DISP_REG_AAL_EN);
 }
 
 static void mtk_aal_stop(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_AAL_EN);
+	writel_relaxed(0x0, priv->regs + DISP_REG_AAL_EN);
 }
 
 static void mtk_dither_config(struct device *dev, unsigned int w,
@@ -216,9 +216,10 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
-	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_DITHER_CFG,
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_DITHER_CFG);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
 			      DITHER_ENGINE_EN, cmdq_pkt);
 }
 
@@ -226,14 +227,14 @@ static void mtk_dither_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(DITHER_EN, priv->regs + DISP_DITHER_EN);
+	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
 }
 
 static void mtk_dither_stop(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
+	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
