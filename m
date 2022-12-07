Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1740C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 08:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGWtzqysHWwyBDnERg/YWC0l0GaSJFvhb+qWs3XLQOk=; b=tIDR2hYSm55LBGSUI4L2AsjOLm
	YYSp8onjYh900uW/23eWFbrP6KEto5rHxJYcqJZVZKJDFE3iiGmD0zIyTaN7i7jMZcwVdAtr73MfL
	4jvMKGvDNzMSW1XKdRZ4tvZTNY1XCdlK1NO1DIVCsWHIxgdV+WcHTAvuaKkIOgZuxBPUkQL83omqD
	0Qv9dTO09WZPxELk+jexBVjr8i7BxHvU1hfqMD5dnFjdCYNJ2/TWDhUrD64HP6Omq3GsvdyDGSrTf
	0jaFNo8obmYP3nMFRBrHtVMJcpwgLUEpInR+A1usjybRbpDyW37z/aBpHHY5FR/Ga79VDRdUTR1F8
	hZ/vemFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2q4b-00FSmi-7I; Wed, 07 Dec 2022 08:46:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2q4K-00FSWk-TO; Wed, 07 Dec 2022 08:46:22 +0000
X-UUID: da88b37fd60a43f4bfb56c8060a579f5-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XGWtzqysHWwyBDnERg/YWC0l0GaSJFvhb+qWs3XLQOk=;
	b=hOWj7MJ2QaNEqnEZWJoUEoe2Pha7osq0oggBb8eserZyuAlMUqCaLmU+2FDml/j6P9DgAXGlZ8jYMWhgb/U+70I4hCu/HjjYwTGE6aVDrCdWvH6yoz5QmZGUIfF6tQmSo1a2UCrbj7+3fz7n/6PJOxNgXViJBlNsX+dEeVK6Q3o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:ad0bbe38-d211-4218-b37b-397407d37681,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:1c089124-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: da88b37fd60a43f4bfb56c8060a579f5-20221207
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 979049237; Wed, 07 Dec 2022 01:46:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 16:44:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 16:44:14 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v2 08/12] media: platform: mtk-mdp3: avoid multiple driver registrations
Date: Wed, 7 Dec 2022 16:44:08 +0800
Message-ID: <20221207084412.14075-9-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207084412.14075-1-moudy.ho@mediatek.com>
References: <20221207084412.14075-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_004620_984716_212F2E6B 
X-CRM114-Status: GOOD (  14.54  )
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

The number of MDP3 driver probes depends on the registered clocks of MMSYS.
Because VPPSYS0 and VPPSYS1 are used in MT8195 MDP3, it is necessary to
avoid multiple driver registrations.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 7 ++++++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 56c42bd3f16b..6e3abadef6cd 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -187,6 +187,11 @@ static int mdp_probe(struct platform_device *pdev)
 	mdp->pdev = pdev;
 	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
 
+	if (strcmp(dev->of_node->name, MDP_NODE_NAME)) {
+		platform_set_drvdata(pdev, mdp);
+		goto success_return;
+	}
+
 	mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_MMSYS);
 	if (IS_ERR_OR_NULL(mm_pdev)) {
 		ret = -ENODEV;
@@ -224,7 +229,6 @@ static int mdp_probe(struct platform_device *pdev)
 		p = (id && mm2_pdev) ? mm2_pdev : mm_pdev;
 		m = (id && mm2_pdev) ?
 			mdp->mdp_mutex2 : mdp->mdp_mutex;
-
 		if (m[mutex_id])
 			continue;
 		m[mutex_id] = mtk_mutex_get(&p->dev);
@@ -293,6 +297,7 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_unregister_device;
 	}
 
+success_return:
 	dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
 	return 0;
 
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 49b6e9c8e089..e5bd75ff90ee 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -14,6 +14,7 @@
 #include "mtk-mdp3-comp.h"
 #include "mtk-mdp3-vpu.h"
 
+#define MDP_NODE_NAME		"mdp3-rdma0"
 #define MDP_MODULE_NAME		"mtk-mdp3"
 #define MDP_DEVICE_NAME		"MediaTek MDP3"
 #define MDP_PHANDLE_NAME	"mediatek,mdp3"
-- 
2.18.0


