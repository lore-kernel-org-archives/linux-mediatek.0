Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E5CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 01:48:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E356128C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 01:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43E356128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWph2vE8Fibra6mFlIp7YU8GXacguaBQOVoAjDC4OeI=; b=dwfY/72zD4XnDk
	wtgIDzLcv8mKnrtjTY3JWV2Z/OMKLjg5+yN9X7pJ2OtP2GnqILZNzCEf9RlZbn95+Bv19ZsF68JQP
	fD92KpO/hCaBVnUndjq3H+80xuqGT1Wd96YDIAqlBDAnzSXKhw43dkwbLm6VP+j8naKju9rmLHN30
	RaR3wJNOvk9dZ0CsFPLOPK3bpZqpehRpLjTmJuppsHJ7tVT9WQFEwEISfdsxC2RUKM/2zgIR7taMW
	5HzFaWHTF0/jNp6ig1BczI4xLOvUrD2dlcjgOviSOLmx2oAcZTtgXzYnAPh/TfgKqv2O8w4pUdUtr
	vLEQMKocGYbsuaUSKnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVOiE-009deL-Qg; Wed, 29 Sep 2021 01:48:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVOhh-009dV6-Rc; Wed, 29 Sep 2021 01:48:15 +0000
X-UUID: 091862dd4216474f96e120fee6b273df-20210928
X-UUID: 091862dd4216474f96e120fee6b273df-20210928
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 952891816; Tue, 28 Sep 2021 18:48:10 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 18:38:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 29 Sep 2021 09:38:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Sep 2021 09:38:52 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Matthias Kaehlcke
 <mka@chromium.org>, <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>, "Dafna
 Hirschfeld" <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH v8 09/12] media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
Date: Wed, 29 Sep 2021 09:37:16 +0800
Message-ID: <20210929013719.25120-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210929013719.25120-1-yong.wu@mediatek.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_184813_915535_64652A32 
X-CRM114-Status: GOOD (  19.50  )
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

MediaTek IOMMU has already added the device_link between the consumer
and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
the smi-larb's pm_runtime_get_sync also be called automatically.

CC: Tiffany Lin <tiffany.lin@mediatek.com>
CC: Irui Wang <irui.wang@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 +++-------------
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 +++----------------
 4 files changed, 10 insertions(+), 75 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 6038db96f71c..d0bf9aa3b29d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -8,14 +8,12 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
-#include <soc/mediatek/smi.h>
 
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
 
 int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 {
-	struct device_node *node;
 	struct platform_device *pdev;
 	struct mtk_vcodec_pm *pm;
 	struct mtk_vcodec_clk *dec_clk;
@@ -26,18 +24,7 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 	pm = &mtkdev->pm;
 	pm->mtkdev = mtkdev;
 	dec_clk = &pm->vdec_clk;
-	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
-	if (!node) {
-		mtk_v4l2_err("of_parse_phandle mediatek,larb fail!");
-		return -1;
-	}
 
-	pdev = of_find_device_by_node(node);
-	of_node_put(node);
-	if (WARN_ON(!pdev)) {
-		return -1;
-	}
-	pm->larbvdec = &pdev->dev;
 	pdev = mtkdev->plat_dev;
 	pm->dev = &pdev->dev;
 
@@ -47,14 +34,11 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 		dec_clk->clk_info = devm_kcalloc(&pdev->dev,
 			dec_clk->clk_num, sizeof(*clk_info),
 			GFP_KERNEL);
-		if (!dec_clk->clk_info) {
-			ret = -ENOMEM;
-			goto put_device;
-		}
+		if (!dec_clk->clk_info)
+			return -ENOMEM;
 	} else {
 		mtk_v4l2_err("Failed to get vdec clock count");
-		ret = -EINVAL;
-		goto put_device;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < dec_clk->clk_num; i++) {
@@ -63,29 +47,24 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 			"clock-names", i, &clk_info->clk_name);
 		if (ret) {
 			mtk_v4l2_err("Failed to get clock name id = %d", i);
-			goto put_device;
+			return ret;
 		}
 		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
 			clk_info->clk_name);
 		if (IS_ERR(clk_info->vcodec_clk)) {
 			mtk_v4l2_err("devm_clk_get (%d)%s fail", i,
 				clk_info->clk_name);
-			ret = PTR_ERR(clk_info->vcodec_clk);
-			goto put_device;
+			return PTR_ERR(clk_info->vcodec_clk);
 		}
 	}
 
 	pm_runtime_enable(&pdev->dev);
 	return 0;
-put_device:
-	put_device(pm->larbvdec);
-	return ret;
 }
 
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
 {
 	pm_runtime_disable(dev->pm.dev);
-	put_device(dev->pm.larbvdec);
 }
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
@@ -122,11 +101,6 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 		}
 	}
 
-	ret = mtk_smi_larb_get(pm->larbvdec);
-	if (ret) {
-		mtk_v4l2_err("mtk_smi_larb_get larbvdec fail %d", ret);
-		goto error;
-	}
 	return;
 
 error:
@@ -139,7 +113,6 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
 	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
 	int i = 0;
 
-	mtk_smi_larb_put(pm->larbvdec);
 	for (i = dec_clk->clk_num - 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index c6c7672fecfb..64b73dd880ce 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -189,10 +189,7 @@ struct mtk_vcodec_clk {
  */
 struct mtk_vcodec_pm {
 	struct mtk_vcodec_clk	vdec_clk;
-	struct device	*larbvdec;
-
 	struct mtk_vcodec_clk	venc_clk;
-	struct device	*larbvenc;
 	struct device	*dev;
 	struct mtk_vcodec_dev	*mtkdev;
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 416f356af363..9a1515cf862d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -8,7 +8,6 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
-#include <soc/mediatek/smi.h>
 #include <linux/pm_runtime.h>
 
 #include "mtk_vcodec_drv.h"
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 1b2e4930ed27..dffb190267ed 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -8,58 +8,36 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
-#include <soc/mediatek/smi.h>
 
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
 
 int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 {
-	struct device_node *node;
 	struct platform_device *pdev;
 	struct mtk_vcodec_pm *pm;
 	struct mtk_vcodec_clk *enc_clk;
 	struct mtk_vcodec_clk_info *clk_info;
 	int ret = 0, i = 0;
-	struct device *dev;
 
 	pdev = mtkdev->plat_dev;
 	pm = &mtkdev->pm;
 	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
 	pm->mtkdev = mtkdev;
 	pm->dev = &pdev->dev;
-	dev = &pdev->dev;
 	enc_clk = &pm->venc_clk;
 
-	node = of_parse_phandle(dev->of_node, "mediatek,larb", 0);
-	if (!node) {
-		mtk_v4l2_err("no mediatek,larb found");
-		return -ENODEV;
-	}
-	pdev = of_find_device_by_node(node);
-	of_node_put(node);
-	if (!pdev) {
-		mtk_v4l2_err("no mediatek,larb device found");
-		return -ENODEV;
-	}
-	pm->larbvenc = &pdev->dev;
-	pdev = mtkdev->plat_dev;
-	pm->dev = &pdev->dev;
-
 	enc_clk->clk_num = of_property_count_strings(pdev->dev.of_node,
 		"clock-names");
 	if (enc_clk->clk_num > 0) {
 		enc_clk->clk_info = devm_kcalloc(&pdev->dev,
 			enc_clk->clk_num, sizeof(*clk_info),
 			GFP_KERNEL);
-		if (!enc_clk->clk_info) {
-			ret = -ENOMEM;
-			goto put_larbvenc;
-		}
+		if (!enc_clk->clk_info)
+			return -ENOMEM;
 	} else {
 		mtk_v4l2_err("Failed to get venc clock count");
-		ret = -EINVAL;
-		goto put_larbvenc;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < enc_clk->clk_num; i++) {
@@ -68,29 +46,23 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 			"clock-names", i, &clk_info->clk_name);
 		if (ret) {
 			mtk_v4l2_err("venc failed to get clk name %d", i);
-			goto put_larbvenc;
+			return ret;
 		}
 		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
 			clk_info->clk_name);
 		if (IS_ERR(clk_info->vcodec_clk)) {
 			mtk_v4l2_err("venc devm_clk_get (%d)%s fail", i,
 				clk_info->clk_name);
-			ret = PTR_ERR(clk_info->vcodec_clk);
-			goto put_larbvenc;
+			return PTR_ERR(clk_info->vcodec_clk);
 		}
 	}
 
 	return 0;
-
-put_larbvenc:
-	put_device(pm->larbvenc);
-	return ret;
 }
 
 void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
 {
 	pm_runtime_disable(mtkdev->pm.dev);
-	put_device(mtkdev->pm.larbvenc);
 }
 
 
@@ -108,11 +80,6 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
 		}
 	}
 
-	ret = mtk_smi_larb_get(pm->larbvenc);
-	if (ret) {
-		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
-		goto clkerr;
-	}
 	return;
 
 clkerr:
@@ -125,7 +92,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
 	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
 	int i = 0;
 
-	mtk_smi_larb_put(pm->larbvenc);
 	for (i = enc_clk->clk_num - 1; i >= 0; i--)
 		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
