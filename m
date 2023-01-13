Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E22C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MCV3LWuemSF0zpvHWCgCKEgR1CAQBw+WQx6QagnncE=; b=UNQA0voS0hQCJeowN1w8IsFdON
	/XOP8kUyhCVYzgApVFN1p1sBzFee7kd9m98bifPQBrbKFX666FnA/FaXkQTOFL8LG+iIApI4UJBt9
	T0i5EpJH0jJpKjt80yNcf4UVvZ6lW5xVd6qIEPFznNoI3PZ4x5qm19MUMTtFYW9yBxiFwz4QSZdVO
	k9dGMIFxFGpN4+l100kmyIlmXRBjxabZVnOWVUR3A+pQPcO4mcOJ2qBKNUQv+zZ86SxE7ffvlsH2L
	hzBPgx36mebVX9AsSXSKGF0ymvGSdJoNJwY4Dz+DwgctrP/illfs840AnAgFUi8r373f/NliptKZ/
	VTYq4umA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFyr-001N7c-MK; Fri, 13 Jan 2023 09:04:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFyo-001N4V-Ie
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 09:04:07 +0000
X-UUID: 38c5465e932111edbbe3f76fe852e059-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8MCV3LWuemSF0zpvHWCgCKEgR1CAQBw+WQx6QagnncE=;
	b=lf03smHrF0sKpVK3ZAUD43hKvS8ZVH0j8jpF4ApQcQwYEwTNmTdAT5vzyoleex7d85ouktjATG1dqBFFdrtJLjH5CEOF0IymbOfjpR/KtqHGVKobkbfP3uRrViG2UTUORAyB54JT4BLXEpdV8IcMzIlzxsboBHt93dvLWnzqM9k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:14f4101e-0a0f-4463-9009-6358f7da8ae8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:147abaf5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 38c5465e932111edbbe3f76fe852e059-20230113
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 936069632; Fri, 13 Jan 2023 02:04:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 13 Jan 2023 17:03:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 17:03:23 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 07/13] media: platform: mtk-mdp3: avoid multiple driver registrations
Date: Fri, 13 Jan 2023 17:03:15 +0800
Message-ID: <20230113090321.25128-8-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113090321.25128-1-moudy.ho@mediatek.com>
References: <20230113090321.25128-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_010406_647363_92A76568 
X-CRM114-Status: GOOD (  13.98  )
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
index ce9e2b9850e6..e3e60b106c72 100644
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


