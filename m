Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 13:03:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE9461152
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 13:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AE9461152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AH3Qk//j3HcYnzSreeNBBCwEjGupIeczUhCppw5z9P4=; b=QFYxSsoX0aU/sE
	mKWN3R9Wm3+4GV03x8LEnmhO5fqPAIcwhXtViURmgM8KVBKccpmERHMLyHCoJgOJWNYXabE7UgGfh
	WbLLRKMu/PC4IUJHXA8CPqR8uFEB7edAYoFPbnbvCxCaCSk/cCKJJO3vSxnV8/Xn3ADM9JLPVfLZk
	BX1n1B37/7S6IhKDJxfQ74GxPdwc/oRgjxAfRXhqp8Dneqs6lRJyXe+23WSG8hwZSxNpGi2F1tDz7
	8hzg27wzVgwU6N+S1IEZcts0g1UPyXuoLDmwi/qgIe4gB7z4v8nOJ9P/pT7OxPgI5ILyJclnT2Gs7
	zh2A/2rpUOcd0AppLMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQmf-002DFo-NL; Tue, 09 Nov 2021 13:03:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQjz-002Bua-RL; Tue, 09 Nov 2021 13:00:47 +0000
X-UUID: 6f0b7b14a01b43e3a92eed593cbb12c4-20211109
X-UUID: 6f0b7b14a01b43e3a92eed593cbb12c4-20211109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1664303712; Tue, 09 Nov 2021 06:00:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 04:50:58 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 9 Nov 2021 20:50:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 9 Nov 2021 20:50:55 +0800
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
Subject: [PATCH v9, 18/19] media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm
Date: Tue, 9 Nov 2021 20:50:29 +0800
Message-ID: <20211109125030.26299-19-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109125030.26299-1-yunfei.dong@mediatek.com>
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_050043_929325_F6B838E5 
X-CRM114-Status: GOOD (  16.01  )
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

There are only two lines in mtk_vcodec_release_dec_pm, using
pm_runtime_disable and put_device instead directly.

Move pm_runtime_enable outside mtk_vcodec_init_dec_pm to symmetry with
pm_runtime_disable, after that, rename mtk_vcodec_init_dec_pm to *_clk since
it only has clock operations now.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Yong Wu <yong.wu@mediatek.com>
---
new patch to remove: mtk_vcodec_release_dec_pm
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c    | 10 +++++++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c |  7 +++++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 11 ++---------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h |  3 +--
 4 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index affef6c7c8b5..2f3530eeaa6a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
@@ -164,11 +165,12 @@ static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
 			return ret;
 		}
 
-		ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
+		ret = mtk_vcodec_init_dec_clk(pdev, &dev->pm);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "failed to get mt vcodec clock source");
 			return ret;
 		}
+		pm_runtime_enable(&pdev->dev);
 	}
 
 	return 0;
@@ -482,7 +484,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
 		destroy_workqueue(dev->core_workqueue);
 err_res:
-	mtk_vcodec_release_dec_pm(&dev->pm);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -526,7 +529,8 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	mtk_vcodec_release_dec_pm(&dev->pm);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index c3488e3fa6af..5f61e260a218 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "mtk_vcodec_drv.h"
@@ -113,9 +114,10 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	subdev_dev->plat_dev = pdev;
-	ret = mtk_vcodec_init_dec_pm(pdev, &subdev_dev->pm);
+	ret = mtk_vcodec_init_dec_clk(pdev, &subdev_dev->pm);
 	if (ret)
 		return ret;
+	pm_runtime_enable(&pdev->dev);
 
 	subdev_dev->reg_base[VDEC_HW_MISC] =
 		devm_platform_ioremap_resource_byname(pdev, "misc");
@@ -148,7 +150,8 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, subdev_dev);
 	return 0;
 err:
-	mtk_vcodec_release_dec_pm(&subdev_dev->pm);
+	pm_runtime_disable(subdev_dev->pm.dev);
+	put_device(subdev_dev->pm.larbvdec);
 	return ret;
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 6435ccb13d37..a54871325325 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -15,7 +15,7 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm)
 {
 	struct device_node *node;
@@ -79,14 +79,7 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
 	put_device(pm->larbvdec);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_pm);
-
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
-{
-	pm_runtime_disable(pm->dev);
-	put_device(pm->larbvdec);
-}
-EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
+EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_clk);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index 6ae29fea4e7f..c4121df9764f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -9,9 +9,8 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm);
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
