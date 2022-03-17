Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51021C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MOslhCwZwjiU9cpi29ORE1yy914qD6QPw5ACcDueuU=; b=3Yqx2WedlSqvLd
	ee8RDQ7Iq7RD6sPMFTGtbiIuKk6RyPoBlR6mt+o/Sgd+xZV8DOQwxdRcNyldt0V85AMG5l9FzQBKw
	kwZFZehByz8ROaf3Efp6O7x6sCR5gHYk+5roIZhyvcN90PvhJNAU2PuXNiX8Yf5NFkzdRh09LFzWf
	KVYmf5dFYxhF6l7AVCGLSAX33QmBAIFM1ZPNfIFbeCqcy99oVkH6bxm+FbrO34S3wbAavZUyICKqR
	BgaZHGtWMpanzRgSrfRlz09sQFQjptXZSSDG3PFnsFJxPYsxWsyQJH25x799hapb0iJt6fehS4d9V
	zpbhtmUiUS4IaRkOw2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUlbJ-00FLx9-HC; Thu, 17 Mar 2022 08:35:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUlZR-00FKnz-Ix; Thu, 17 Mar 2022 08:33:23 +0000
X-UUID: 372fa3bf190b4fbea92f99e214c52445-20220317
X-UUID: 372fa3bf190b4fbea92f99e214c52445-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 764739763; Thu, 17 Mar 2022 01:33:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 01:23:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 16:23:13 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 16:23:12 +0800
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
Subject: [PATCH v3,
 05/10] media: mtk-vcodec: mtk-vcodec: Rewrite venc power manage
 interface
Date: Thu, 17 Mar 2022 16:22:25 +0800
Message-ID: <20220317082230.23622-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317082230.23622-1-irui.wang@mediatek.com>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_013321_653580_301F10CD 
X-CRM114-Status: GOOD (  15.93  )
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

The args "struct mtk_vcodec_dev *" doesn't appropriate for init_clk
functions because of sub-devices. For main device, it has no "pm/clk"
properties in dtsi, sub-devices will init their own "pm/clk" instead.
So rewrite the pm interface with args "platform_device *" and
"mtk_vcodec_pm*".

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c | 8 ++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 8 ++------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h   | 4 ++--
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c
index 9d3ea5a8afe4..7e376413beaa 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c
@@ -13,6 +13,7 @@
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_enc.h"
 #include "mtk_vcodec_enc_core.h"
+#include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_intr.h"
 
 static const struct of_device_id mtk_venc_core_ids[] = {
@@ -117,6 +118,13 @@ static int mtk_venc_core_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL,
 				     "Invalid core id %d\n", core->core_id);
 
+	ret = mtk_vcodec_init_enc_clk(core->plat_dev, &core->pm);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to get venc core clock source!");
+
+	pm_runtime_enable(&pdev->dev);
+
 	main_dev->enc_core_dev[core->core_id] = core;
 	core->main_dev = main_dev;
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index d540d52191d9..1b1c17b03ef5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -272,7 +272,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	if (!dev->venc_multi_core) {
-		ret = mtk_vcodec_init_enc_clk(dev);
+		ret = mtk_vcodec_init_enc_clk(dev->plat_dev, &dev->pm);
 		if (ret < 0) {
 			dev_err(&pdev->dev,
 				"Failed to get mtk vcodec clock source!");
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 74495edab558..1e814fc3172f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -12,17 +12,13 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_enc_clk(struct mtk_vcodec_dev *mtkdev)
+int mtk_vcodec_init_enc_clk(struct platform_device *pdev,
+			    struct mtk_vcodec_pm *pm)
 {
-	struct platform_device *pdev;
-	struct mtk_vcodec_pm *pm;
 	struct mtk_vcodec_clk *enc_clk;
 	struct mtk_vcodec_clk_info *clk_info;
 	int ret, i;
 
-	pdev = mtkdev->plat_dev;
-	pm = &mtkdev->pm;
-	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
 	pm->dev = &pdev->dev;
 	enc_clk = &pm->venc_clk;
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index bc455cefc0cd..97a394c68f4e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -9,8 +9,8 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_enc_clk(struct mtk_vcodec_dev *dev);
-
+int mtk_vcodec_init_enc_clk(struct platform_device *pdev,
+			    struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
