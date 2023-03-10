Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91EEC6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJQQkamtHAcgkCGJ0h3Tqt0rl885miX0Xvw7NZPq2Hg=; b=OkINAlFfOVw30+irEPTgIkAzAm
	KnuewB5CtoIIpIcT2XwSKxqmiu0VlPbpMYPuEKQ+0JeIATaBpBggiBuhHe4GSc6Dq74OMx6PWT5KP
	Ft8GLI7AhoyAqiC0AzwbXeQHXJcZWROAUv45riBRJu31oyE0JrRuKcUUHAcsTT3py2W/jI03Qa2Lu
	T0MkJmR+ySNvGIXUd9EfJAMGcPDa4Vu//Q7NMt1shDW0GDSsfYQpMYpbwtC1jn1MHee2QGECRrJVz
	YXbktoQwuZ1E7tQHrymlR53AhkZrG2nntaMAWDsWaV1NGLbYm2aXQHpmBpMfU0q9FKNQrobtQ5Q9L
	QfE7iyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWBk-00DDxx-Lp; Fri, 10 Mar 2023 06:25:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWBF-00DDj3-Am; Fri, 10 Mar 2023 06:24:42 +0000
X-UUID: 3b3e9342bf0c11eda799af78a38f2b8e-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sJQQkamtHAcgkCGJ0h3Tqt0rl885miX0Xvw7NZPq2Hg=;
	b=nryrrcXeXThH5gc8f8e6+WQNq9oszst3fYEYcY5mYrR9ee71OH9eA5sEeePWdGhOYdunrZMJowOiInhQM1WNK+KARh+oy14HOBLkxs+vt4nvhbPgIcmjoamo5wbBKhZrYpSPgbBKY0QHoU9Zcr6fVPNv9EsgXCsvLoLV86HOTRg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:1beb6b20-fc67-459b-ac1e-b262f57dea02,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:d4b55ff5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 3b3e9342bf0c11eda799af78a38f2b8e-20230309
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 392276688; Thu, 09 Mar 2023 23:24:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 14:23:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 10 Mar 2023 14:23:58 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
	<maoguang.meng@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>
Subject: [V2,2/7] media: mtk-jpeg: add jpeg single core initial function
Date: Fri, 10 Mar 2023 14:23:50 +0800
Message-ID: <20230310062355.9963-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310062355.9963-1-irui.wang@mediatek.com>
References: <20230310062355.9963-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_222441_389597_5DC56793 
X-CRM114-Status: GOOD (  14.98  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: kyrie wu <kyrie.wu@mediatek.com>

add single core initial function to init reg_base,
irq and clk.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 74 +++++++++++--------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 6d052747a15e..daa4a6448311 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1671,10 +1671,50 @@ static void mtk_jpeg_job_timeout_work(struct work_struct *work)
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
 
+static int mtk_jpeg_single_core_init(struct platform_device *pdev,
+				     struct mtk_jpeg_dev *jpeg_dev)
+{
+	struct mtk_jpeg_dev *jpeg = jpeg_dev;
+	int jpeg_irq, ret;
+
+	INIT_DELAYED_WORK(&jpeg->job_timeout_work,
+			  mtk_jpeg_job_timeout_work);
+
+	jpeg->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(jpeg->reg_base)) {
+		ret = PTR_ERR(jpeg->reg_base);
+		return ret;
+	}
+
+	jpeg_irq = platform_get_irq(pdev, 0);
+	if (jpeg_irq < 0)
+		return jpeg_irq;
+
+	ret = devm_request_irq(&pdev->dev,
+			       jpeg_irq,
+			       jpeg->variant->irq_handler,
+			       0,
+			       pdev->name, jpeg);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
+			jpeg_irq, ret);
+		return ret;
+	}
+
+	ret = devm_clk_bulk_get(jpeg->dev,
+				jpeg->variant->num_clks,
+				jpeg->variant->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init clk\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
-	int jpeg_irq;
 	int ret;
 
 	jpeg = devm_kzalloc(&pdev->dev, sizeof(*jpeg), GFP_KERNEL);
@@ -1693,36 +1733,10 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	}
 
 	if (!jpeg->variant->multi_core) {
-		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
-				  mtk_jpeg_job_timeout_work);
-
-		jpeg->reg_base = devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(jpeg->reg_base)) {
-			ret = PTR_ERR(jpeg->reg_base);
-			return ret;
-		}
-
-		jpeg_irq = platform_get_irq(pdev, 0);
-		if (jpeg_irq < 0)
-			return jpeg_irq;
-
-		ret = devm_request_irq(&pdev->dev,
-				       jpeg_irq,
-				       jpeg->variant->irq_handler,
-				       0,
-				       pdev->name, jpeg);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
-				jpeg_irq, ret);
-			return ret;
-		}
-
-		ret = devm_clk_bulk_get(jpeg->dev,
-					jpeg->variant->num_clks,
-					jpeg->variant->clks);
+		ret = mtk_jpeg_single_core_init(pdev, jpeg);
 		if (ret) {
-			dev_err(&pdev->dev, "Failed to init clk\n");
-			return ret;
+			v4l2_err(&jpeg->v4l2_dev, "mtk_jpeg_single_core_init failed.");
+			return -EINVAL;
 		}
 	}
 
-- 
2.18.0


