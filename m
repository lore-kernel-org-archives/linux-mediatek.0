Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09EAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:23:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36956134F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A36956134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svkJv7CPEIwWMRdxINxF2xdt1M+Mno6ZAvdSP6zgLVI=; b=kbo/jzzDyNWpyx
	35s80Yz9tSrBrUkp8SKCRagZQ2rIsktyqttFQis3dvbTW3snQcyNhG9QJd6tQQvWqSMbWaIj/X9kp
	nt+QalOs0pKhUBAl55pDfuLaymuqZNX0qrHIVFtT5u9hk846BwTGecI72S0WjW365x5LzKaSN7BgL
	YJcRhbP+RMeSLSynk5kk5teHDoQ6WzJKXKc5iNkim9+uml9xrDbUXN8Aghpgfpu4td/LNYnXV1Tx5
	kdKBU5X8F0SSfsczVAPTtxXnnaRdZYNpaSR2+tHS97lmXEt+61mvrIbPxqHbtxHnPJxUcFcefDd6P
	V+92c0COG85V6xsJ0XLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml1cX-007474-6u; Thu, 11 Nov 2021 04:23:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml1Up-006zuO-7Q; Thu, 11 Nov 2021 04:15:42 +0000
X-UUID: 30e741bf204141b6a3bb2a578309f8fd-20211110
X-UUID: 30e741bf204141b6a3bb2a578309f8fd-20211110
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2008375941; Wed, 10 Nov 2021 21:15:23 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Nov 2021 20:15:21 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 12:15:18 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 11 Nov 2021 12:15:17 +0800
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
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v10,
 12/19] media: mtk-vcodec: Add new interface to lock different hardware
Date: Thu, 11 Nov 2021 12:14:53 +0800
Message-ID: <20211111041500.17363-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111041500.17363-1-yunfei.dong@mediatek.com>
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_201531_348247_B3A9F832 
X-CRM114-Status: GOOD (  16.27  )
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

For add new hardware, not only need to lock lat hardware, also
need to lock core hardware in case of different instance start
to decoder at the same time.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c     | 4 ++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 6 +++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 2b334a8a81c6..130ecef2e766 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -105,12 +105,12 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 
 void mtk_vdec_unlock(struct mtk_vcodec_ctx *ctx)
 {
-	mutex_unlock(&ctx->dev->dec_mutex);
+	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);
 }
 
 void mtk_vdec_lock(struct mtk_vcodec_ctx *ctx)
 {
-	mutex_lock(&ctx->dev->dec_mutex);
+	mutex_lock(&ctx->dev->dec_mutex[ctx->hw_id]);
 }
 
 void mtk_vcodec_dec_release(struct mtk_vcodec_ctx *ctx)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 652a5a141887..d687fa57234c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -323,7 +323,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct video_device *vfd_dec;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
-	int ret;
+	int i, ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -355,8 +355,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_dec_pm;
 	}
 
-	mutex_init(&dev->dec_mutex);
-	mutex_init(&dev->dev_mutex);
+	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
+		mutex_init(&dev->dec_mutex[i]);
 	spin_lock_init(&dev->irqlock);
 
 	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 012509670af4..f0359ebfddf6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -501,7 +501,7 @@ struct mtk_vcodec_dev {
 	int dec_irq;
 	int enc_irq;
 
-	struct mutex dec_mutex;
+	struct mutex dec_mutex[MTK_VDEC_HW_MAX];
 	struct mutex enc_mutex;
 
 	struct mtk_vcodec_pm pm;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
