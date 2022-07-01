Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A31C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRGKUMBkd/wWQkc85WXYz2KUppj2Dv9nG6sJx9gFxSs=; b=xlxRQ33L9VfCUBFYrYLVkUjpAF
	fKdgARFottk9QXJP0JTa8+vOvfuuGVMZLGrK9YO6eH4ogK45A1s9FnCgjj9giZaufAA2rqIhY23rg
	NMaWZ3BhqzA6Qy3HrJczNOF8PUb6DyZHu0xQgLJXoSfPDzrLo6tiphgHzFy8bOEBCXVmIpF2arZSR
	zHa7r02uUL+S5DTTSCVRz6B/aEzISuUIR7DSVLGKg482d9TAk5vjmZSA5Ob6df0ardx+0OFwPerxw
	j8zoMS4P0499bTP0eU9zL9mEp52yrwNM/rPeo51ckHjYAQ6GGvwlGAOWuDUFgZYGhjBz68MS/fcRK
	K5qwLpAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7CcK-003lsu-HC; Fri, 01 Jul 2022 09:07:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7CcA-003lpY-E5; Fri, 01 Jul 2022 09:07:03 +0000
X-UUID: 655662455b2e46e5914c017b71ef2d99-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:da986b2b-eed9-413d-bbe7-765a3a6fbfb6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:87442a2,CLOUDID:f5ed59d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 655662455b2e46e5914c017b71ef2d99-20220701
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1132285614; Fri, 01 Jul 2022 02:06:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 1 Jul 2022 17:05:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 17:05:48 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 1/6] drm/mediatek: Remove mt8192 display rdma compatible
Date: Fri, 1 Jul 2022 17:05:42 +0800
Message-ID: <20220701090547.21429-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220701090547.21429-1-allen-kh.cheng@mediatek.com>
References: <20220701090547.21429-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_020702_539244_CC732BDD 
X-CRM114-Status: GOOD (  12.62  )
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

The compatible “mediatek,mt8192-disp-rdma” is being used for reading
the data into DMA for back-end panel driver in mt8192 but there is
no difference between mt8183 and mt8192 in rdma driver.

Remove compatible “mediatek,mt8192-disp-rdma” from the driver and
should use “mediatek,mt8183-disp-rdma” as fallback in 8192 DTS
according to the mediatek,rdma.yaml.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 6 ------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 1be4caf9ff96..91add033e7b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -368,10 +368,6 @@ static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
 	.fifo_size = 5 * SZ_1K,
 };
 
-static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
-	.fifo_size = 5 * SZ_1K,
-};
-
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = &mt2701_rdma_driver_data},
@@ -379,8 +375,6 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	  .data = &mt8173_rdma_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-rdma",
 	  .data = &mt8183_rdma_driver_data},
-	{ .compatible = "mediatek,mt8192-disp-rdma",
-	  .data = &mt8192_rdma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6abe6bcacbdc..06bd4483744b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -522,8 +522,6 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8183-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8192-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
-- 
2.18.0


