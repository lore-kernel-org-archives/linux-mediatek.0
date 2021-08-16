Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADD3C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE4261C13
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CE4261C13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVDh/tUnC04dV1APMC+zzWQiBv07O2rOO1coCmdTRuA=; b=Oe6T/9UpIl9UsT
	ij1kSa0dKO/XaQKNZRMUfxNiankD8mixJJJfeNjc2pP+5Xg1b79oL3uKLeGsDbHeCIbTRyaSlBtSl
	Sdj9DMWQo6xRWUgTnD0vG5FH/X1K6MCe7joEZDi7+3AGoU5uJPbmdZvIRmnLrAe9qK/5DZZAG5UCa
	W6BEYIOuGB+5cI7VSRe2lO9dRi5/yRxAWL8lso9d3ECOLQviBhUmaAA1L+1YxFcPwlguF2ddh4VqS
	VnM6hXJJH0UmrxZIMkUvWA4gDQFq16qiwsLEWhSniWXYSvVXKR0r+eAtl6Q89OhHnO5z9mpI0VBFC
	LjBW+h9X2YqC23LZ5+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFaWd-00GqW5-L8; Mon, 16 Aug 2021 11:11:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFaVi-00Gq7B-W4; Mon, 16 Aug 2021 11:10:34 +0000
X-UUID: e1278920ca0a4d8ca050eef03ce8ab98-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NdkF+SwKKhl023Iui6Q+1UHMJNJdHsbS4C4Ob/cqHe8=; 
 b=jOVHks0SIZN2Qt1ks+clSw7JPIsu8HSZ1MYg+mIqdQYSxzKfAJ23FKz/k913WlfSdrOiOmsMBiz75Dxq9aZDJnaFh9KWAzKmRgyamTJlv3rVJtcA29p2hhIZwy2P3jft4PmY/Z1cY2D5ICC6urb215TCO5TlFfupD/2lX1Hi5qU=;
X-UUID: e1278920ca0a4d8ca050eef03ce8ab98-20210816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 890343422; Mon, 16 Aug 2021 04:10:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 04:00:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 19:00:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:32 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 5/9] media: mtk-vcodec: Rewrite venc clock interface
Date: Mon, 16 Aug 2021 18:59:30 +0800
Message-ID: <20210816105934.28265-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_041031_076697_1491D879 
X-CRM114-Status: GOOD (  19.52  )
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

Frame-racing mode need enable the specific core's clk, add an
another param for clock_on/clock_off interface.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 104 ++++++++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |   4 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |  10 +-
 3 files changed, 86 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index d9df0e3701f1..bfb9e21bfd26 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -86,25 +86,50 @@ void mtk_vcodec_release_enc_pm(struct mtk_vcodec_pm *pm)
 }
 
 
-void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_enc_clock_on(struct mtk_vcodec_dev *dev, int core_id)
 {
-	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
-	int ret, i = 0;
+	struct mtk_venc_comp_dev *venc;
+	struct mtk_vcodec_pm *enc_pm;
+	struct mtk_vcodec_clk *enc_clk;
+	struct clk		*clk;
+	int ret, i;
 
-	for (i = 0; i < enc_clk->clk_num; i++) {
-		ret = clk_prepare_enable(enc_clk->clk_info[i].vcodec_clk);
-		if (ret) {
-			mtk_v4l2_err("venc clk_prepare_enable %d %s fail %d", i,
-				enc_clk->clk_info[i].clk_name, ret);
-			goto clkerr;
+	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
+		venc = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[core_id];
+		enc_pm = &venc->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = 0; i < enc_clk->clk_num; i++) {
+			clk = enc_clk->clk_info[i].vcodec_clk;
+			ret = clk_enable(clk);
+			if (ret) {
+				mtk_v4l2_err("clk_enable %d %s fail %d", i,
+					     enc_clk->clk_info[i].clk_name,
+					     ret);
+				goto comp_clk_err;
+			}
 		}
-	}
+	} else {
+		enc_pm = &dev->pm;
+		enc_clk = &enc_pm->venc_clk;
 
-	ret = mtk_smi_larb_get(pm->larbvenc);
-	if (ret) {
-		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
-		goto clkerr;
+		for (i = 0; i < enc_clk->clk_num; i++) {
+			clk = enc_clk->clk_info[i].vcodec_clk;
+			ret = clk_prepare_enable(clk);
+			if (ret) {
+				mtk_v4l2_err("clk_prepare_enable %d %s fail %d",
+					     i, enc_clk->clk_info[i].clk_name,
+					     ret);
+				goto clkerr;
+			}
+		}
 	}
+
+	return;
+
+comp_clk_err:
+	for (i -= 1; i >= 0; i--)
+		clk_disable(enc_clk->clk_info[i].vcodec_clk);
 	return;
 
 clkerr:
@@ -112,20 +137,35 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
 		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
 }
 
-void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_enc_clock_off(struct mtk_vcodec_dev *dev, int core_id)
 {
-	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
-	int i = 0;
+	struct mtk_venc_comp_dev *venc;
+	struct mtk_vcodec_pm *enc_pm;
+	struct mtk_vcodec_clk *enc_clk;
+	int i;
 
-	mtk_smi_larb_put(pm->larbvenc);
-	for (i = enc_clk->clk_num - 1; i >= 0; i--)
-		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
+	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
+		venc = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[core_id];
+		enc_pm = &venc->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = enc_clk->clk_num - 1; i >= 0; i--)
+			clk_disable(enc_clk->clk_info[i].vcodec_clk);
+	} else {
+		enc_pm = &dev->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = enc_clk->clk_num - 1; i >= 0; i--)
+			clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
+	}
 }
 
 int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev)
 {
 	int i, ret;
 	struct mtk_venc_comp_dev *venc_comp;
+	struct mtk_vcodec_clk *enc_clk;
+	int j = 0;
 
 	/*
 	 * frame_racing mode needs power on all available component devices.
@@ -140,23 +180,38 @@ int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev)
 			mtk_v4l2_err("power on core[%d] fail %d", i, ret);
 				goto pw_err;
 		}
+
+		enc_clk = &venc_comp->pm.venc_clk;
+		for (j = 0; j < enc_clk->clk_num; j++) {
+			ret = clk_prepare(enc_clk->clk_info[j].vcodec_clk);
+			if (ret) {
+				mtk_v4l2_err("prepare clk [%s] fail %d",
+					     enc_clk->clk_info[j].clk_name,
+					     ret);
+				goto pw_err;
+			}
+		}
 	}
 	return 0;
 
 pw_err:
 	for (i -= 1; i >= 0; i--) {
 		venc_comp = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[i];
+		enc_clk = &venc_comp->pm.venc_clk;
+
+		for (j -= 1; j >= 0; j--)
+			clk_unprepare(enc_clk->clk_info[j].vcodec_clk);
 
 		mtk_smi_larb_put(venc_comp->pm.larbvenc);
 	}
-
 	return ret;
 }
 
 int mtk_venc_disable_comp_hw(struct mtk_vcodec_dev *dev)
 {
-	int i;
+	int i, j;
 	struct mtk_venc_comp_dev *venc_comp;
+	struct mtk_vcodec_clk *enc_clk;
 
 	/*power off all available component device*/
 	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
@@ -164,6 +219,11 @@ int mtk_venc_disable_comp_hw(struct mtk_vcodec_dev *dev)
 		if (!venc_comp)
 			return 0;
 
+		enc_clk = &venc_comp->pm.venc_clk;
+
+		for (j = enc_clk->clk_num - 1; j >= 0; j--)
+			clk_unprepare(enc_clk->clk_info[j].vcodec_clk);
+
 		mtk_smi_larb_put(venc_comp->pm.larbvenc);
 	}
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index 2e76b858fed1..f3a819cc0e56 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -13,8 +13,8 @@ int mtk_vcodec_init_enc_pm(struct platform_device *pdev,
 			   struct mtk_vcodec_pm *pm);
 void mtk_vcodec_release_enc_pm(struct mtk_vcodec_pm *pm);
 
-void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
+void mtk_vcodec_enc_clock_on(struct mtk_vcodec_dev *dev, int core_id);
+void mtk_vcodec_enc_clock_off(struct mtk_vcodec_dev *dev, int core_id);
 
 int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev);
 int mtk_venc_disable_comp_hw(struct mtk_vcodec_dev *dev);
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index ce0bce811615..6cbdb7e30bb3 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -32,9 +32,7 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 	}
 
 	mtk_venc_lock(ctx);
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->init(ctx);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
 	return ret;
@@ -46,9 +44,7 @@ int venc_if_set_param(struct mtk_vcodec_ctx *ctx,
 	int ret = 0;
 
 	mtk_venc_lock(ctx);
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->set_param(ctx->drv_handle, type, in);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
 	return ret;
@@ -68,10 +64,10 @@ int venc_if_encode(struct mtk_vcodec_ctx *ctx,
 	ctx->dev->curr_ctx = ctx;
 	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
 
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
+	mtk_vcodec_enc_clock_on(ctx->dev, 0);
 	ret = ctx->enc_if->encode(ctx->drv_handle, opt, frm_buf,
 				  bs_buf, result);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
+	mtk_vcodec_enc_clock_off(ctx->dev, 0);
 
 	spin_lock_irqsave(&ctx->dev->irqlock, flags);
 	ctx->dev->curr_ctx = NULL;
@@ -89,9 +85,7 @@ int venc_if_deinit(struct mtk_vcodec_ctx *ctx)
 		return 0;
 
 	mtk_venc_lock(ctx);
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->deinit(ctx->drv_handle);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
 	ctx->drv_handle = NULL;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
