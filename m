Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D21C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ez78ax+IAmyXi8yCZmd02MD6nag7HUeCstLqVay5EwY=; b=bnJdHxGA3U1I3X
	fTm2AoIy4k2+OY1EQq+Rnx9jtReEPle3c0KLvLV/ImW/eLltRZszYJqRn0+H2rPESqjR7Twyey+P8
	rSBP0Hb2a4EVeGbrepyNbJBsmmb1TUvsLYtvGVaaEg+3upJ8kjClJ+3thqJvgmys/GH1+Of8/ED9+
	CwvhK9zetuZXYaM1ez3ARlqW7ll6HpfYtHgljp7icVD0hGwA6TAY/B9/WXr7lpy4J4pXZHNLwAuMA
	r/kn1hzAZGMfQlPW0qSOuJSFdEIdZ4h4sNAHcEP1laUKEKbBaqWeRSvrIs46xIgv+WC4a746Kby3B
	RqwZE4vWYis0m2UThykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUlaH-00FLIH-He; Thu, 17 Mar 2022 08:34:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUlZQ-00FKmS-Uh; Thu, 17 Mar 2022 08:33:22 +0000
X-UUID: 5e11bfc601c24cda80274702bcb418d0-20220317
X-UUID: 5e11bfc601c24cda80274702bcb418d0-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1137479003; Thu, 17 Mar 2022 01:33:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 01:23:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 17 Mar 2022 16:23:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 16:23:14 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot
 <acourbot@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3, 06/10] media: mtk-vcodec: Add venc power on/off interface
Date: Thu, 17 Mar 2022 16:22:26 +0800
Message-ID: <20220317082230.23622-7-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317082230.23622-1-irui.wang@mediatek.com>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_013321_070744_CAE756D7 
X-CRM114-Status: GOOD (  20.89  )
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

venc_multi_core mode power on/off all venc available power, pm_runtime_xx
helper is not appropriate called directly, add new power on/off
interface for it.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 20 +----
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  7 ++
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 83 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  5 ++
 4 files changed, 98 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 0d1b065048a9..b0bc71f00930 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -12,6 +12,7 @@
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_enc.h"
+#include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
 #include "venc_drv_if.h"
@@ -849,7 +850,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(q);
 	struct venc_enc_param param;
-	int ret, pm_ret;
+	int ret;
 	int i;
 
 	/* Once state turn into MTK_STATE_ABORT, we need stop_streaming
@@ -857,7 +858,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	  */
 	if ((ctx->state == MTK_STATE_ABORT) || (ctx->state == MTK_STATE_FREE)) {
 		ret = -EIO;
-		goto err_start_stream;
+		goto err_set_param;
 	}
 
 	/* Do the initialization when both start_streaming have been called */
@@ -869,12 +870,6 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 			return 0;
 	}
 
-	ret = pm_runtime_resume_and_get(&ctx->dev->plat_dev->dev);
-	if (ret < 0) {
-		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
-		goto err_start_stream;
-	}
-
 	mtk_venc_set_param(ctx, &param);
 	ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
 	if (ret) {
@@ -901,11 +896,6 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 err_set_param:
-	pm_ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
-	if (pm_ret < 0)
-		mtk_v4l2_err("pm_runtime_put fail %d", pm_ret);
-
-err_start_stream:
 	for (i = 0; i < q->num_buffers; ++i) {
 		struct vb2_buffer *buf = vb2_get_buffer(q, i);
 
@@ -988,10 +978,6 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 	if (ret)
 		mtk_v4l2_err("venc_if_deinit failed=%d", ret);
 
-	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
-	if (ret < 0)
-		mtk_v4l2_err("pm_runtime_put fail %d", ret);
-
 	ctx->state = MTK_STATE_FREE;
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 1b1c17b03ef5..d2937e62df29 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -173,6 +173,12 @@ static int fops_vcodec_open(struct file *file)
 		mtk_v4l2_debug(0, "encoder capability %x", dev->enc_capability);
 	}
 
+	ret = mtk_vcodec_enc_pw_on(dev);
+	if (ret < 0) {
+		mtk_v4l2_err("encoder power on failed %d", ret);
+		goto err_load_fw;
+	}
+
 	mtk_v4l2_debug(2, "Create instance [%d]@%p m2m_ctx=%p ",
 			ctx->id, ctx, ctx->m2m_ctx);
 
@@ -207,6 +213,7 @@ static int fops_vcodec_release(struct file *file)
 
 	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	mtk_vcodec_enc_release(ctx);
+	mtk_vcodec_enc_pw_off(dev);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 1e814fc3172f..22b2eb867998 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -9,6 +9,7 @@
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 
+#include "mtk_vcodec_enc_core.h"
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
 
@@ -87,3 +88,85 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
 		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_enc_clock_off);
+
+int mtk_venc_core_pw_on(struct mtk_vcodec_dev *dev)
+{
+	int i, ret;
+	struct mtk_venc_core_dev *core;
+
+	/* power on all available venc cores */
+	for (i = 0; i < MTK_VENC_CORE_MAX; i++) {
+		core = (struct mtk_venc_core_dev *)dev->enc_core_dev[i];
+		if (!core)
+			return 0;
+
+		ret = pm_runtime_resume_and_get(&core->plat_dev->dev);
+		if (ret < 0) {
+			mtk_v4l2_err("power on core[%d] fail %d", i, ret);
+			goto pw_on_fail;
+		}
+	}
+	return 0;
+
+pw_on_fail:
+	for (i -= 1; i >= 0; i--) {
+		core = (struct mtk_venc_core_dev *)dev->enc_core_dev[i];
+		pm_runtime_put_sync(&core->plat_dev->dev);
+	}
+	return ret;
+}
+
+int mtk_venc_core_pw_off(struct mtk_vcodec_dev *dev)
+{
+	int i, ret;
+	struct mtk_venc_core_dev *core;
+
+	/* power off all available venc cores */
+	for (i = 0; i < MTK_VENC_CORE_MAX; i++) {
+		core = (struct mtk_venc_core_dev *)dev->enc_core_dev[i];
+		if (!core)
+			return 0;
+
+		ret = pm_runtime_put_sync(&core->plat_dev->dev);
+		if (ret < 0)
+			mtk_v4l2_err("power off core[%d] fail %d", i, ret);
+	}
+	return ret;
+}
+
+int mtk_vcodec_enc_pw_on(struct mtk_vcodec_dev *dev)
+{
+	int ret;
+
+	if (dev->venc_multi_core) {
+		ret = mtk_venc_core_pw_on(dev);
+		if (ret < 0) {
+			mtk_v4l2_err("venc core power on fail: %d", ret);
+			return ret;
+		}
+	} else {
+		ret = pm_runtime_resume_and_get(&dev->plat_dev->dev);
+		if (ret < 0) {
+			mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+int mtk_vcodec_enc_pw_off(struct mtk_vcodec_dev *dev)
+{
+	int ret;
+
+	if (dev->venc_multi_core) {
+		ret = mtk_venc_core_pw_off(dev);
+		if (ret < 0)
+			mtk_v4l2_err("venc core power off fail: %d", ret);
+
+	} else {
+		ret = pm_runtime_put_sync(&dev->plat_dev->dev);
+		if (ret < 0)
+			mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
+	}
+	return ret;
+}
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index 97a394c68f4e..99b6b6e29e35 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -14,4 +14,9 @@ int mtk_vcodec_init_enc_clk(struct platform_device *pdev,
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
 
+int mtk_venc_core_pw_on(struct mtk_vcodec_dev *dev);
+int mtk_venc_core_pw_off(struct mtk_vcodec_dev *dev);
+int mtk_vcodec_enc_pw_on(struct mtk_vcodec_dev *dev);
+int mtk_vcodec_enc_pw_off(struct mtk_vcodec_dev *dev);
+
 #endif /* _MTK_VCODEC_ENC_PM_H_ */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
