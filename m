Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBC6C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F8360FC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87F8360FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYT6NKlClRXmnhzDWlQTuoDQ8K6fbZ8XNDT18C8D46s=; b=jVpWTMcnD8PReo
	8C7nOBoAnSbzEs8Woo9TAY9TGzEDYBmcXhWdFM6PRtdA8at170xQPAgPLgt9RkN7U2rn5tngF+/hg
	sh1mKu3fFE8cl58cusImfJKy5k/j63LeZm2WykS7uv8el+FsgS8CJ6wDY9UuKLJo0Jy9QuDOzDJG8
	Gdtw3WLsgtLbH3wDv9xc8nQF5kp3eKtPrSdGY0NH7NNmGBeFA8HyscoZX7ZrFLi0BHCbLBhzQTTLL
	JEnBxyx6hranOzfDFvYvbyhG5rYTLwNBYB8wO+7C84ZY4e6TI1S6OPuFDoGExBAXpOG8Cyodg4GRa
	mCeeUUuKSexZZZu6u+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE6tr-009OpY-Vp; Thu, 12 Aug 2021 09:21:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE6jU-009KLT-2n; Thu, 12 Aug 2021 09:10:37 +0000
X-UUID: 0cdff05660da41689f95cedbbf5ae4af-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mQMs5UpX3gRb4vBnbfl5YHu5qhRkSwDi9jtWVgDorMQ=; 
 b=VFic8ORDO7EOMpuykoQwI4Ej8a/N9SBc/g+DqHaet7L89qp/k2SlnwFTTGOBR9btDr7Az1ZjkZN9Icy23ylY6BU+fWixpepIm148XeTxDbe3eMxt5KaOxgcZ+AaQW0BKEsk/ZD5uZOOx4VR1/gnp3FHqzXETcfLTF+F1duOwfws=;
X-UUID: 0cdff05660da41689f95cedbbf5ae4af-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1274248671; Thu, 12 Aug 2021 02:10:25 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 02:00:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 17:00:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 Aug 2021 17:00:23 +0800
From: Dawei Chien <dawei.chien@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>,
 "James Liao" <jamesjj.liao@mediatek.com>, Dawei Chien
 <dawei.chien@mediatek.com>
Subject: [V11,PATCH 13/19] interconnect: mediatek: add support for mt8195
Date: Thu, 12 Aug 2021 16:58:40 +0800
Message-ID: <20210812085846.2628-14-dawei.chien@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210812085846.2628-1-dawei.chien@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_021036_292376_9CC68AB6 
X-CRM114-Status: GOOD (  13.15  )
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

add platform data of mt8195

Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
---
 drivers/interconnect/mediatek/mtk-emi.c | 51 +++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/interconnect/mediatek/mtk-emi.c b/drivers/interconnect/mediatek/mtk-emi.c
index 8d650be62b90..379dab77ebfd 100644
--- a/drivers/interconnect/mediatek/mtk-emi.c
+++ b/drivers/interconnect/mediatek/mtk-emi.c
@@ -12,6 +12,7 @@
 #include <linux/soc/mediatek/mtk_dvfsrc.h>
 #include <dt-bindings/interconnect/mtk,mt6873-emi.h>
 #include <dt-bindings/interconnect/mtk,mt8183-emi.h>
+#include <dt-bindings/interconnect/mtk,mt8195-emi.h>
 
 enum mtk_icc_name {
 	SLAVE_DDR_EMI,
@@ -31,7 +32,8 @@ enum mtk_icc_name {
 	MASTER_MDLASYS,
 	MASTER_MDLA_PORT_0,
 	MASTER_UFS,
-	MASTER_PCIE,
+	MASTER_PCIE_0,
+	MASTER_PCIE_1,
 	MASTER_USB,
 	MASTER_WIFI,
 	MASTER_BT,
@@ -102,7 +104,8 @@ DEFINE_MNODE(vpu_port_1, MASTER_VPU_PORT_1, 0, MASTER_VPUSYS);
 DEFINE_MNODE(mdlasys, MASTER_MDLASYS, 0, SLAVE_DDR_EMI);
 DEFINE_MNODE(mdla_port_0, MASTER_MDLA_PORT_0, 0, MASTER_MDLASYS);
 DEFINE_MNODE(ufs, MASTER_UFS, 0, SLAVE_DDR_EMI);
-DEFINE_MNODE(pcie, MASTER_PCIE, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(pcie_0, MASTER_PCIE_0, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(pcie_1, MASTER_PCIE_1, 0, SLAVE_DDR_EMI);
 DEFINE_MNODE(usb, MASTER_USB, 0, SLAVE_DDR_EMI);
 DEFINE_MNODE(wifi, MASTER_WIFI, 0, SLAVE_DDR_EMI);
 DEFINE_MNODE(bt, MASTER_BT, 0, SLAVE_DDR_EMI);
@@ -156,7 +159,7 @@ static struct mtk_icc_node *mt6873_icc_nodes[] = {
 	[MT6873_MASTER_MDLASYS] = &mdlasys,
 	[MT6873_MASTER_MDLA_0] = &mdla_port_0,
 	[MT6873_MASTER_UFS] = &ufs,
-	[MT6873_MASTER_PCIE] = &pcie,
+	[MT6873_MASTER_PCIE] = &pcie_0,
 	[MT6873_MASTER_USB] = &usb,
 	[MT6873_MASTER_WIFI] = &wifi,
 	[MT6873_MASTER_BT] = &bt,
@@ -179,10 +182,52 @@ static struct mtk_icc_desc mt6873_icc = {
 	.num_nodes = ARRAY_SIZE(mt6873_icc_nodes),
 };
 
+static struct mtk_icc_node *mt8195_icc_nodes[] = {
+	[MT8195_SLAVE_DDR_EMI] = &ddr_emi,
+	[MT8195_MASTER_MCUSYS] = &mcusys,
+	[MT8195_MASTER_GPUSYS] = &gpu,
+	[MT8195_MASTER_MMSYS] = &mmsys,
+	[MT8195_MASTER_MM_VPU] = &mm_vpu,
+	[MT8195_MASTER_MM_DISP] = &mm_disp,
+	[MT8195_MASTER_MM_VDEC] = &mm_vdec,
+	[MT8195_MASTER_MM_VENC] = &mm_venc,
+	[MT8195_MASTER_MM_CAM] = &mm_cam,
+	[MT8195_MASTER_MM_IMG] = &mm_img,
+	[MT8195_MASTER_MM_MDP] = &mm_mdp,
+	[MT8195_MASTER_VPUSYS] = &vpusys,
+	[MT8195_MASTER_VPU_0] = &vpu_port_0,
+	[MT8195_MASTER_VPU_1] = &vpu_port_1,
+	[MT8195_MASTER_MDLASYS] = &mdlasys,
+	[MT8195_MASTER_MDLA_0] = &mdla_port_0,
+	[MT8195_MASTER_UFS] = &ufs,
+	[MT8195_MASTER_PCIE_0] = &pcie_0,
+	[MT8195_MASTER_PCIE_1] = &pcie_1,
+	[MT8195_MASTER_USB] = &usb,
+	[MT8195_MASTER_WIFI] = &wifi,
+	[MT8195_MASTER_BT] = &bt,
+	[MT8195_MASTER_NETSYS] = &netsys,
+	[MT8195_MASTER_DBGIF] = &dbgif,
+	[MT8195_SLAVE_HRT_DDR_EMI] = &hrt_ddr_emi,
+	[MT8195_MASTER_HRT_MMSYS] = &hrt_mmsys,
+	[MT8195_MASTER_HRT_MM_DISP] = &hrt_mm_disp,
+	[MT8195_MASTER_HRT_MM_VDEC] = &hrt_mm_vdec,
+	[MT8195_MASTER_HRT_MM_VENC] = &hrt_mm_venc,
+	[MT8195_MASTER_HRT_MM_CAM] = &hrt_mm_cam,
+	[MT8195_MASTER_HRT_MM_IMG] = &hrt_mm_img,
+	[MT8195_MASTER_HRT_MM_MDP] = &hrt_mm_mdp,
+	[MT8195_MASTER_HRT_DBGIF] = &hrt_dbgif,
+};
+
+static struct mtk_icc_desc mt8195_icc = {
+	.nodes = mt8195_icc_nodes,
+	.num_nodes = ARRAY_SIZE(mt8195_icc_nodes),
+};
+
 static const struct of_device_id emi_icc_of_match[] = {
 	{ .compatible = "mediatek,mt8183-dvfsrc", .data = &mt8183_icc },
 	{ .compatible = "mediatek,mt8192-dvfsrc", .data = &mt6873_icc },
 	{ .compatible = "mediatek,mt6873-dvfsrc", .data = &mt6873_icc },
+	{ .compatible = "mediatek,mt8195-dvfsrc", .data = &mt8195_icc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, emi_icc_of_match);
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
