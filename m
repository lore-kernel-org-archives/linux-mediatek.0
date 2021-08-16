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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB6FC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EBC661C13
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EBC661C13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6u36s7rUPGvm1adQC4qqTS8pj3DW4AXBjo22bVAppdE=; b=pDsNu0eYz4O379
	KjFQyEojmZpJm09+zOzXua7M1kWaea9wji23VA6eZF+6jZebNU4tiENI6OR08F5D95eluhAn4+0XN
	7+D1hpC2uBcdQmzF710eNe+/as3ND4vD+q5fDLVFlUswS801Aa8ltqFXpzKib6WWg7BrdZvBWrd0G
	CuOkaGwVX2N/i6iVm9sY1mQJfPvvepkcirJjQlbsSIBDKHQvLaBDr2glUCGLvKcuals6L6to+nci6
	qZsIn0IFzNhgIK4SPtIzp2RWfSWf6VWHDY7WdpTwtuGq9662Hr4Lh2lXHrPPGrxFF50gglvC5EdO0
	yYzWSvAqUQ8bSQURkgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFaWY-00GqTh-5g; Mon, 16 Aug 2021 11:11:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFaVf-00Gq7W-WC; Mon, 16 Aug 2021 11:10:31 +0000
X-UUID: 693aa550a09f4dd8a8efdf3193b5b41a-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UeMLKcez4oBvwuuniEh0qUx/xvl/lln7eqefjRFL7H4=; 
 b=RpftXzDzl8MOm8shWq980zNf3ip+0flHG0W2Dev6EWEBSNj7Lbc6lvOgL7BNlPfaM51RofojpDNXkKYju2BlJJedXxq6TsVmxS6k0adLQgy+ADYXLW/tEkHnC3Q9TpmwnybEFJXLMLjnq963cxuICXPY7048n//ueztiTWjU3aY=;
X-UUID: 693aa550a09f4dd8a8efdf3193b5b41a-20210816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 413353888; Mon, 16 Aug 2021 04:10:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 04:00:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 16 Aug 2021 19:00:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:26 +0800
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
Subject: [PATCH 3/9] media: mtk-vcodec: Rewrite venc power manage interface
Date: Mon, 16 Aug 2021 18:59:28 +0800
Message-ID: <20210816105934.28265-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_041028_093415_5495887F 
X-CRM114-Status: GOOD (  19.59  )
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

The args "struct mtk_vcodec_dev *" doesn't appropriate for
init/release_enc_pm functions because of component devices. For
master device, it has no "pm/clk" properties in dtsi, component
devices will init their own "pm/clk" instead. So rewrite the pm
interface with args "platform_device *" and "mtk_vcodec_pm*".

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  6 ++--
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 13 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 31 +++++++------------
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  5 +--
 4 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index f7538d4b5cbb..9c2224b199d0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -341,7 +341,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
 	if (dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE) {
-		ret = mtk_vcodec_init_enc_pm(dev);
+		ret = mtk_vcodec_init_enc_pm(dev->plat_dev, &dev->pm);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "Failed to get mtk vcodec clock source!");
 			goto err_enc_pm;
@@ -471,7 +471,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_res:
 	if (dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE)
-		mtk_vcodec_release_enc_pm(dev);
+		mtk_vcodec_release_enc_pm(&dev->pm);
 err_enc_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -568,7 +568,7 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 
 	if (dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE)
-		mtk_vcodec_release_enc_pm(dev);
+		mtk_vcodec_release_enc_pm(&dev->pm);
 
 	mtk_vcodec_fw_release(dev->fw_handler);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
index 4e6a8a81ff67..2a9112b0561d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 
 #include "mtk_vcodec_enc_hw.h"
+#include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_enc.h"
 
 static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
@@ -105,6 +106,14 @@ static int mtk_venc_comp_probe(struct platform_device *pdev)
 
 	comp_dev->plat_dev = pdev;
 
+	ret = mtk_vcodec_init_enc_pm(pdev, &comp_dev->pm);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get venc component clock source!");
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
 	comp_dev->core_id =
 		(enum mtk_venc_hw_id)of_device_get_match_data(&pdev->dev);
 
@@ -146,11 +155,15 @@ static int mtk_venc_comp_probe(struct platform_device *pdev)
 
 	return 0;
 err:
+	mtk_vcodec_release_enc_pm(&comp_dev->pm);
 	return ret;
 }
 
 static int mtk_venc_comp_remove(struct platform_device *pdev)
 {
+	struct mtk_venc_comp_dev *comp_dev = platform_get_drvdata(pdev);
+
+	mtk_vcodec_release_enc_pm(&comp_dev->pm);
 	component_del(&pdev->dev, &mtk_venc_component_ops);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 1b2e4930ed27..5edeb93fca84 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -13,38 +13,29 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
+int mtk_vcodec_init_enc_pm(struct platform_device *pdev,
+			   struct mtk_vcodec_pm *pm)
 {
 	struct device_node *node;
-	struct platform_device *pdev;
-	struct mtk_vcodec_pm *pm;
+	struct platform_device *larb_pdev;
 	struct mtk_vcodec_clk *enc_clk;
 	struct mtk_vcodec_clk_info *clk_info;
 	int ret = 0, i = 0;
-	struct device *dev;
 
-	pdev = mtkdev->plat_dev;
-	pm = &mtkdev->pm;
-	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
-	pm->mtkdev = mtkdev;
-	pm->dev = &pdev->dev;
-	dev = &pdev->dev;
-	enc_clk = &pm->venc_clk;
-
-	node = of_parse_phandle(dev->of_node, "mediatek,larb", 0);
+	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
 	if (!node) {
 		mtk_v4l2_err("no mediatek,larb found");
 		return -ENODEV;
 	}
-	pdev = of_find_device_by_node(node);
+	larb_pdev = of_find_device_by_node(node);
 	of_node_put(node);
-	if (!pdev) {
+	if (!larb_pdev) {
 		mtk_v4l2_err("no mediatek,larb device found");
 		return -ENODEV;
 	}
-	pm->larbvenc = &pdev->dev;
-	pdev = mtkdev->plat_dev;
+	pm->larbvenc = &larb_pdev->dev;
 	pm->dev = &pdev->dev;
+	enc_clk = &pm->venc_clk;
 
 	enc_clk->clk_num = of_property_count_strings(pdev->dev.of_node,
 		"clock-names");
@@ -87,10 +78,10 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 	return ret;
 }
 
-void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
+void mtk_vcodec_release_enc_pm(struct mtk_vcodec_pm *pm)
 {
-	pm_runtime_disable(mtkdev->pm.dev);
-	put_device(mtkdev->pm.larbvenc);
+	pm_runtime_disable(pm->dev);
+	put_device(pm->larbvenc);
 }
 
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index b7ecdfd74823..f4a4aa441185 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -9,8 +9,9 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *dev);
-void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *dev);
+int mtk_vcodec_init_enc_pm(struct platform_device *pdev,
+			   struct mtk_vcodec_pm *pm);
+void mtk_vcodec_release_enc_pm(struct mtk_vcodec_pm *pm);
 
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
