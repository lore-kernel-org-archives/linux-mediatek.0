Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Ekr2rpAmcD6WeDkkTKpcNacMELoabtSPW+jKcc55d0=; b=ma8ypJTKZwbpFs
	3XdK7G8qCH1gb4iKaxmWBYsDBAybv13T4nwzhz49rXPUUE9nClvQFc4fh3m5loZv7CS14reqUaMcl
	20kdWUzL82cMpoQrqafMmVBZGc/yj0CF3N5LwpLQ6/dUDmeJigDWnvz4LzhlByfk1pQFd0PQvi+pj
	W6MtJNGBoegS26CmDXLRpzDqRBbi9XVRE1orN40k5N2iy63Fzmg4o21kw0T2ByCt39mLNcstjwu+V
	Vohk9oid7g3qIDaUs4AvtW7I0aHL2+X5yeFP5swbrbH2eTMvNwu8+g0eWNim9UVDby3fjnkw4ZMTK
	NiD0hRm388SrvXzw7HVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyDr-0052wM-FV; Thu, 28 Apr 2022 07:05:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyD1-0052b1-G6; Thu, 28 Apr 2022 07:05:05 +0000
X-UUID: 6ce0099067284434826cd34ed9cae096-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7ff92d73-69fa-478f-a3ae-a2a068000e13, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:80e4c9c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6ce0099067284434826cd34ed9cae096-20220428
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1648053922; Thu, 28 Apr 2022 00:04:56 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 00:04:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 15:04:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 15:04:28 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Yongqiang Niu
 <yongqiang.niu@mediatek.corp-partner.google.com>
Subject: [PATCH v3,
 1/1] drm/mediatek: add lut diff flag for new gamma hardware support
Date: Thu, 28 Apr 2022 15:04:03 +0800
Message-ID: <20220428070403.12968-2-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428070403.12968-1-yongqiang.niu@mediatek.com>
References: <20220428070403.12968-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_000503_604239_5C190CA7 
X-CRM114-Status: GOOD (  17.32  )
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

From: Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com>

mt8183 gamma module usage is different with before soc,
gamma odd(index start from 0) lut value set to hardware
register should be
the difference of current lut value with last lut value.

for example, chrome os user space set lut
like this(only r chanel for example):
2 4 6 8 10 12.
1) mt8183 gamma driver should set the gamma lut to hardware
register like this:
2 [2] 6 [8] 10 [2]
the value with [] is the difference value
2)gamma hardware process display data with original lut

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 34 +++++++++++++++++++----
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index f46d4ab73d6a..0f9d7efb61d7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -66,7 +66,7 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
 
 	if (aal->data && aal->data->has_gamma)
-		mtk_gamma_set_common(aal->regs, state);
+		mtk_gamma_set_common(aal->regs, state, false);
 }
 
 void mtk_aal_start(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 86c3068894b1..3380651c6707 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -51,7 +51,7 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 3a5815ab4079..bbd558a036ec 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -27,6 +27,7 @@
 
 struct mtk_disp_gamma_data {
 	bool has_dither;
+	bool lut_diff;
 };
 
 /*
@@ -53,12 +54,13 @@ void mtk_gamma_clk_disable(struct device *dev)
 	clk_disable_unprepare(gamma->clk);
 }
 
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff)
 {
 	unsigned int i, reg;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	u32 word;
+	u32 diff[3] = {0};
 
 	if (state->gamma_lut) {
 		reg = readl(regs + DISP_GAMMA_CFG);
@@ -67,9 +69,20 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
 		lut_base = regs + DISP_GAMMA_LUT;
 		lut = (struct drm_color_lut *)state->gamma_lut->data;
 		for (i = 0; i < MTK_LUT_SIZE; i++) {
-			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
-				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
-				((lut[i].blue >> 6) & LUT_10BIT_MASK);
+
+			if (!lut_diff || (i % 2 == 0)) {
+				word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
+					(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
+					((lut[i].blue >> 6) & LUT_10BIT_MASK);
+			} else {
+				diff[0] = (lut[i].red >> 6) - (lut[i - 1].red >> 6);
+				diff[1] = (lut[i].green >> 6) - (lut[i - 1].green >> 6);
+				diff[2] = (lut[i].blue >> 6) - (lut[i - 1].blue >> 6);
+
+				word = ((diff[0] & LUT_10BIT_MASK) << 20) +
+					((diff[1] & LUT_10BIT_MASK) << 10) +
+					(diff[2] & LUT_10BIT_MASK);
+			}
 			writel(word, (lut_base + i * 4));
 		}
 	}
@@ -78,8 +91,12 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+	bool lut_diff = false;
+
+	if (gamma->data)
+		lut_diff = gamma->data->lut_diff;
 
-	mtk_gamma_set_common(gamma->regs, state);
+	mtk_gamma_set_common(gamma->regs, state, lut_diff);
 }
 
 void mtk_gamma_config(struct device *dev, unsigned int w,
@@ -176,10 +193,15 @@ static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
 };
 
+static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
+	.lut_diff = true,
+};
+
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = &mt8173_gamma_driver_data},
-	{ .compatible = "mediatek,mt8183-disp-gamma"},
+	{ .compatible = "mediatek,mt8183-disp-gamma",
+	  .data = &mt8183_gamma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
