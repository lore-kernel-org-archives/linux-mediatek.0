Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E3BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qa2rwq3HwfQswv5INYpoldRHczTA+Gzzb7Nmrc/sJ4o=; b=pdFMY0x/eEz21Z
	p3YqH6e+Y8n/G3VxRdheCltO173WHX6Fn9yre0gF4Ww2wqEqea9mwPfaoI9yWUGJzMOsxDtVdotuf
	YRsd4c76KMVdK+LZ3PDkvMCtHSWlQDYMMm0dtLFDqbJrWlFS+POTcHpbk9KOWsZ9RPqu6048dgQjd
	XX3a2h1hceK2O2529mQ3KJQpI+zird8jQ/BrrP2exSwAZaEdp2do6Pf5Af3zRWEW8zKYCqrISUiVX
	xqtolqrYHWZfea5zZT/IoN3yqmtVcz3c0b+a2RwCQTYTSL3xkjrTl7Ki5EMNuQuSC3Bj1vnngWxFS
	5GCx7n8Cx80UR7ZbubWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxndO-004iPs-Sm; Thu, 16 Dec 2021 10:05:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxnUj-004eq5-KP; Thu, 16 Dec 2021 09:56:15 +0000
X-UUID: 73ad9bde96004ee0a78f5b59ab312365-20211216
X-UUID: 73ad9bde96004ee0a78f5b59ab312365-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1976978558; Thu, 16 Dec 2021 02:56:04 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 01:46:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 16 Dec 2021 17:46:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Dec 2021 17:46:19 +0800
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
Subject: [PATCH v16, 19/19] media: mtk-vcodec: Remove mtk_vcodec_release_enc_pm
Date: Thu, 16 Dec 2021 17:45:52 +0800
Message-ID: <20211216094552.19104-20-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216094552.19104-1-yunfei.dong@mediatek.com>
References: <20211216094552.19104-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_015613_697103_AE28B926 
X-CRM114-Status: GOOD (  14.33  )
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

There are only two lines in mtk_vcodec_release_enc_pm, using
pm_runtime_disable and put_device instead directly.

Move pm_runtime_enable outside mtk_vcodec_release_enc_pm to symmetry with
pm_runtime_disable, after that, rename mtk_vcodec_init_enc_pm to *_clk since
it only has clock operations now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 9 ++++++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  | 9 +--------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h  | 3 +--
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 347f0d87e2ff..507ad1ea2104 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
@@ -257,7 +258,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return PTR_ERR(dev->fw_handler);
 
 	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
-	ret = mtk_vcodec_init_enc_pm(dev);
+	ret = mtk_vcodec_init_enc_clk(dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to get mtk vcodec clock source!");
 		goto err_enc_pm;
@@ -369,7 +370,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_enc_alloc:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_res:
-	mtk_vcodec_release_enc_pm(dev);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvenc);
 err_enc_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -458,7 +460,8 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_enc);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	mtk_vcodec_release_enc_pm(dev);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvenc);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 0c8c8f86788c..0825c6ec4eb7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -13,7 +13,7 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
+int mtk_vcodec_init_enc_clk(struct mtk_vcodec_dev *mtkdev)
 {
 	struct device_node *node;
 	struct platform_device *pdev;
@@ -86,13 +86,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 	return ret;
 }
 
-void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
-{
-	pm_runtime_disable(mtkdev->pm.dev);
-	put_device(mtkdev->pm.larbvenc);
-}
-
-
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
 {
 	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index b7ecdfd74823..bc455cefc0cd 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -9,8 +9,7 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *dev);
-void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *dev);
+int mtk_vcodec_init_enc_clk(struct mtk_vcodec_dev *dev);
 
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
