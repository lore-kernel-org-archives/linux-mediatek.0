Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEECC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 10:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QPXAGewbbhBAY1GUjoOddXUADasXHasQgxfe4D2GYl0=; b=rjTdf3zB72DgTONDAq6BTB6d9N
	iGyV7ecHJIvRLV3aneGKiEI6XtJ+MgagtolDFpcBDNEewEYVGQIsLmSGSZu912C1g1XYB+oZxdFiN
	YauucZLNAL6ZzMz3PzBB/CY1UMkh7s6zK3pKcI9ng4iJZ7k4cmuPWpZ/dcqUZYapQMuhUaR0sRiHY
	1UeP6CtY2CrGnQ8YKIsRyM2obUrKe04Tg+KtGpcrRtN5sVD0oR19XGPDEGYtPq8jWe69CBWJZ7o7a
	gzgNFG1QuKuSFZHf05PAPKjNqDjXFBLXnyFJ2GPMIiymXmEP0+JbnpWPgcG/kzkCdLzI3GxNf8LzV
	3Z+ilvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeJj-0046kT-03;
	Fri, 24 Mar 2023 10:06:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeJf-0046j7-0Q;
	Fri, 24 Mar 2023 10:06:36 +0000
X-UUID: 8b2daec2ca2b11edb7d8d11f642b8e78-20230324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QPXAGewbbhBAY1GUjoOddXUADasXHasQgxfe4D2GYl0=;
	b=cXUAJRiB4aJmT4LN7llthGyrjd053o4lM1z2hdWn/Ux2mR7EhF9J4QFynUY2Bjb9wsy7ARt33TCo7tZiHc9YD3zMhmnpMB1+9V4SiGHTVBddoyWZecg77nLRa44mnnWzvaVhNFW4v9sVAhzfYjXGGTtqfgR5es02I5qC70RUDRg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:6b092418-7739-4762-824f-8306d4604b2f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:e909d1f6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 8b2daec2ca2b11edb7d8d11f642b8e78-20230324
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1917570465; Fri, 24 Mar 2023 03:06:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 24 Mar 2023 18:05:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 18:05:54 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, amy zhang
	<Amy.Zhang@mediatek.com>
Subject: [PATCH v6] drm/mediatek: add mediatek-drm of vdosys0 support for mt8188
Date: Fri, 24 Mar 2023 18:05:53 +0800
Message-ID: <20230324100553.13719-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_030635_177160_E7534DD5 
X-CRM114-Status: GOOD (  10.53  )
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

From: Nathan Lu <nathan.lu@mediatek.com>

add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.

Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
Rebase on maintainer's tree[1]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index dce2d86df6d9..6dcb4ba2466c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -176,6 +176,18 @@ static const unsigned int mt8186_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const unsigned int mt8188_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_POSTMASK0,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DP_INTF0,
+};
+
 static const unsigned int mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
@@ -272,6 +284,11 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.mmsys_dev_num = 1,
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
+	.main_path = mt8188_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -308,6 +325,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8183_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8186-mmsys",
 	  .data = &mt8186_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8188-vdosys0",
+	  .data = &mt8188_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8195-mmsys",
@@ -677,6 +696,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8186-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8188-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
-- 
2.18.0


