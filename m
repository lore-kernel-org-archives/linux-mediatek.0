Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5BEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 10:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrnF19PJ5tYrTLxD0yPiRrdZLUCmqNTHlrLTtm25xRs=; b=shCC7EGe9+3ViV
	FXji4TlfK9r2wlM44kHCm5WxhDNODE9V4w3IMS5X9y1sEtIWdwu3EaaPLeKWD40AFWqI9YFv0vpxu
	PdWRzUQMLhdEm7/wg/4K0+pAzdrz/GaSebm3gb0nGAaGTZfE3CCkaJkwfhJrxHHD3MW0TtJO9K5cZ
	8/Hh317j3oyi5psIghUtTjxEBoL9rtYPXZee4PMT73Nzh6lxpvyiEffQEOvyMuWzXJdoOdw2vWmsz
	MNoDRAEb9ShGpWwfI93C9KvrJK2n2gNFsbCeimrQBz17fE8Z9tp6I6Anig7ZNNzxQcQr4mS0g9lTB
	M4xfrAwHsMrLiTh4RAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxndT-004iRm-HG; Thu, 16 Dec 2021 10:05:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxnUk-004eqm-8d; Thu, 16 Dec 2021 09:56:15 +0000
X-UUID: 5d5ed004de244f6ba8b32c4e4dea38e7-20211216
X-UUID: 5d5ed004de244f6ba8b32c4e4dea38e7-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1267546576; Thu, 16 Dec 2021 02:56:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 01:46:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 16 Dec 2021 17:46:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Dec 2021 17:46:18 +0800
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
Subject: [PATCH v16, 18/19] media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm
Date: Thu, 16 Dec 2021 17:45:51 +0800
Message-ID: <20211216094552.19104-19-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216094552.19104-1-yunfei.dong@mediatek.com>
References: <20211216094552.19104-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_015614_346475_944698EF 
X-CRM114-Status: GOOD (  15.17  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c   | 10 +++++++---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c    |  7 +++++--
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c    | 12 ++----------
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h    |  3 +--
 4 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 1c2b96b4930b..d44894fa2f6e 100644
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
@@ -128,12 +129,13 @@ static int mtk_vcodec_init_dec_resources(struct mtk_vcodec_dev *dev)
 		return ret;
 	}
 
-	ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
+	ret = mtk_vcodec_init_dec_clk(pdev, &dev->pm);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to get mt vcodec clock source");
 		return ret;
 	}
 
+	pm_runtime_enable(&pdev->dev);
 	return 0;
 }
 
@@ -446,7 +448,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
 		destroy_workqueue(dev->core_workqueue);
 err_res:
-	mtk_vcodec_release_dec_pm(&dev->pm);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -489,7 +492,8 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	mtk_vcodec_release_dec_pm(&dev->pm);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index 643cee119b60..8e1247d65a93 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "mtk_vcodec_drv.h"
@@ -140,9 +141,10 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	subdev_dev->plat_dev = pdev;
-	ret = mtk_vcodec_init_dec_pm(pdev, &subdev_dev->pm);
+	ret = mtk_vcodec_init_dec_clk(pdev, &subdev_dev->pm);
 	if (ret)
 		return ret;
+	pm_runtime_enable(&pdev->dev);
 
 	of_id = of_match_device(mtk_vdec_hw_match, dev);
 	if (!of_id) {
@@ -181,7 +183,8 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, subdev_dev);
 	return 0;
 err:
-	mtk_vcodec_release_dec_pm(&subdev_dev->pm);
+	pm_runtime_disable(subdev_dev->pm.dev);
+	put_device(subdev_dev->pm.larbvdec);
 	return ret;
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 4cf03d38d141..b9f5ef979c69 100644
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
@@ -73,20 +73,12 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
 		}
 	}
 
-	pm_runtime_enable(&pdev->dev);
 	return 0;
 put_device:
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
