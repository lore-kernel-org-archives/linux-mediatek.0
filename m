Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674D1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 07:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3541160EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 07:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3541160EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRqBh1bS7SC5Q4ElLpVHUsU08kdGDGDu2SDtxB2gAfg=; b=4ktQZC0SvFdPi1
	OCorAdndU/rJlfBTmH9x247oKaJoQ70IuJKJlIEN+8aKf/hJSeENsIOofql+4RBT/fCMG9s4xiiuk
	YaFsey0u0L3G4vmCjGy4ZSjQWO1t/0JeLV5wEsxjeG+MlqD1do6TYQmdZtHOKr+k3a855IOInGL2c
	ahfZAFxf9YTbmWHWyDQi3lKJ6R1r/S6XrAzL0iKXVYy01A2CV4mTEDHauPYC1wiiYXRCZg5qOsss/
	CcYQargnhjhnS7CmNxYwARhzw6eDztvACd4vSoU+RdqPu2mb57gawRDlD0MIw/NL6ptfilobv2p1k
	u9V/nhDl2VrncHeczVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZpUX-0085Bl-6K; Mon, 11 Oct 2021 07:12:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZpSr-0084Ta-8F; Mon, 11 Oct 2021 07:11:15 +0000
X-UUID: c4efb4eb8664425c8d87dcf2ffa4aa7d-20211011
X-UUID: c4efb4eb8664425c8d87dcf2ffa4aa7d-20211011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1866502325; Mon, 11 Oct 2021 00:11:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Oct 2021 00:02:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Oct 2021 15:02:50 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Oct 2021 15:02:49 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tzung-Bi Shih
 <tzungbi@google.com>
Subject: [PATCH v7, 03/15] media: mtk-vcodec: Refactor vcodec pm interface
Date: Mon, 11 Oct 2021 15:02:35 +0800
Message-ID: <20211011070247.792-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011070247.792-1-yunfei.dong@mediatek.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_001113_327718_253DB3FC 
X-CRM114-Status: GOOD (  16.63  )
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

Using the needed param for pm init/release function and remove unused
param mtkdev in 'struct mtk_vcodec_pm'.

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 22 ++++++++-----------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  5 +++--
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  1 -
 5 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 8db9cdc66043..dd749d41c75a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -249,7 +249,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
-	ret = mtk_vcodec_init_dec_pm(dev);
+	ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
 		goto err_dec_pm;
@@ -379,7 +379,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_dec_alloc:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_res:
-	mtk_vcodec_release_dec_pm(dev);
+	mtk_vcodec_release_dec_pm(&dev->pm);
 err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -422,7 +422,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	mtk_vcodec_release_dec_pm(dev);
+	mtk_vcodec_release_dec_pm(&dev->pm);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 6038db96f71c..20bd157a855c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -13,18 +13,15 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
+int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+	struct mtk_vcodec_pm *pm)
 {
 	struct device_node *node;
-	struct platform_device *pdev;
-	struct mtk_vcodec_pm *pm;
+	struct platform_device *larb_pdev;
 	struct mtk_vcodec_clk *dec_clk;
 	struct mtk_vcodec_clk_info *clk_info;
 	int i = 0, ret = 0;
 
-	pdev = mtkdev->plat_dev;
-	pm = &mtkdev->pm;
-	pm->mtkdev = mtkdev;
 	dec_clk = &pm->vdec_clk;
 	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
 	if (!node) {
@@ -32,13 +29,12 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 		return -1;
 	}
 
-	pdev = of_find_device_by_node(node);
+	larb_pdev = of_find_device_by_node(node);
 	of_node_put(node);
-	if (WARN_ON(!pdev)) {
+	if (WARN_ON(!larb_pdev)) {
 		return -1;
 	}
-	pm->larbvdec = &pdev->dev;
-	pdev = mtkdev->plat_dev;
+	pm->larbvdec = &larb_pdev->dev;
 	pm->dev = &pdev->dev;
 
 	dec_clk->clk_num =
@@ -82,10 +78,10 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 	return ret;
 }
 
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
+void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
 {
-	pm_runtime_disable(dev->pm.dev);
-	put_device(dev->pm.larbvdec);
+	pm_runtime_disable(pm->dev);
+	put_device(pm->larbvdec);
 }
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index 280aeaefdb65..a3df6aef6cb9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -9,8 +9,9 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
+int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+	struct mtk_vcodec_pm *pm);
+void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 3b1e5e3a450e..973b0b3649c6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -195,7 +195,6 @@ struct mtk_vcodec_pm {
 	struct mtk_vcodec_clk	venc_clk;
 	struct device	*larbvenc;
 	struct device	*dev;
-	struct mtk_vcodec_dev	*mtkdev;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 1b2e4930ed27..0c8c8f86788c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -26,7 +26,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 	pdev = mtkdev->plat_dev;
 	pm = &mtkdev->pm;
 	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
-	pm->mtkdev = mtkdev;
 	pm->dev = &pdev->dev;
 	dev = &pdev->dev;
 	enc_clk = &pm->venc_clk;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
