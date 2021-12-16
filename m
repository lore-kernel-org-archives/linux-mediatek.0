Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BBBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 09:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2x2mYHwKo2mI90K/LOujB6YZ/UOTUvIeFUysC8Dlpk=; b=AnyFtL1Ar2rq5S
	8yrJpsVqkkdl0X7klwS8XoNG8vsdwyL1/uJ1kFQutTS0SbPbnHeeOcvqxfVkgYloyKvSI4u0wtfvu
	IHoqS01KiVQYFykZa2VLAjqc+g05uIeluAOFGtZK4vVqGdELxzBk0iEdhl+5GMO5VW46ShVgU+Tbz
	Wu7nIzIqXYmxMTL2eYg306onXUbfyYTl83XEI7uIgyGWDZU5Q68x84sgaPDqPjBmc6s2NI2LOeSqY
	vXjx521z6Oba/DFfsZ1F5t9CHFDRUXDea/pwrATJ73Gp2M1XZWaik0g+tz7KBniATR2rAAU447/5O
	YUhEklNz37ESeUsf+pdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxnO0-004bQn-6d; Thu, 16 Dec 2021 09:49:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxnKw-004Zj8-Te; Thu, 16 Dec 2021 09:46:09 +0000
X-UUID: 87937df500864de9a6ae124025861a6a-20211216
X-UUID: 87937df500864de9a6ae124025861a6a-20211216
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1954898708; Thu, 16 Dec 2021 02:45:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 01:45:58 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Dec 2021 17:45:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Dec 2021 17:45:54 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v16,
 02/19] media: mtk-vcodec: Align vcodec wake up interrupt interface
Date: Thu, 16 Dec 2021 17:45:35 +0800
Message-ID: <20211216094552.19104-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216094552.19104-1-yunfei.dong@mediatek.com>
References: <20211216094552.19104-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_014607_000882_9C982EB6 
X-CRM114-Status: GOOD (  14.71  )
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

Vdec and venc can use the same function to wake up interrupt event.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steve Cho <stevecho@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 9 +--------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 8 ++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 8 --------
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e1a82e233971..e5f6e400a587 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -28,13 +28,6 @@
 #define VDEC_IRQ_CLR	0x10
 #define VDEC_IRQ_CFG_REG	0xa4
 
-/* Wake up context wait_queue */
-static void wake_up_ctx(struct mtk_vcodec_ctx *ctx)
-{
-	ctx->int_cond = 1;
-	wake_up_interruptible(&ctx->queue);
-}
-
 static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 {
 	struct mtk_vcodec_dev *dev = priv;
@@ -66,7 +59,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 	writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR),
 		dev->reg_base[VDEC_MISC] + VDEC_IRQ_CFG_REG);
 
-	wake_up_ctx(ctx);
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
 
 	mtk_v4l2_debug(3,
 			"mtk_vcodec_dec_irq_handler :wake up ctx %d, dec_done_status=%x",
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 581522177308..1d2370608d0d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -473,4 +473,12 @@ static inline struct mtk_vcodec_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
 	return container_of(ctrl->handler, struct mtk_vcodec_ctx, ctrl_hdl);
 }
 
+/* Wake up context wait_queue */
+static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
+{
+	ctx->int_cond = 1;
+	ctx->int_type = reason;
+	wake_up_interruptible(&ctx->queue);
+}
+
 #endif /* _MTK_VCODEC_DRV_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index aeaecb8d416e..027546108f44 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -62,14 +62,6 @@ static const struct mtk_video_fmt mtk_video_formats_capture_vp8[] =  {
 	},
 };
 
-/* Wake up context wait_queue */
-static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
-{
-	ctx->int_cond = 1;
-	ctx->int_type = reason;
-	wake_up_interruptible(&ctx->queue);
-}
-
 static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
 {
 	if (irq_status & MTK_VENC_IRQ_STATUS_PAUSE)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
