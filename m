Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85342C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 03:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MCV3LWuemSF0zpvHWCgCKEgR1CAQBw+WQx6QagnncE=; b=IHArsxv0cJ+20ZeXTNyIYvaIaM
	uaPJEPdGhbH38KtgTCcRxT8vnVrn7rwunzrze1GlNzu8EDut31ZVuU8Z+KBcqE+kUpL46XTEJhq8v
	lCOjpKrc9jcQdkZBwgw+7cUy588lCSczlq90kqIVTZSOonGVnjejktTOOXX71gHnN4vf4AeE33F1o
	QtgNSxQAAaDvVl84ss8OSRp0mb4W2TBR6RcnEaysRDJ4US1AwnLa2E5PK6jkRa7nexzPtB3NcGYk2
	0Q75lZR8+WLnu9fL5kmuwGpn1iAPh+vw5jnesg2zqV7AsEFUnMiZ2zUvl7gyIUm8rWaolsWrDp9Uo
	WK+TPn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGVf-008Zao-A6; Mon, 16 Jan 2023 03:50:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGOn-008WJ4-8i; Mon, 16 Jan 2023 03:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8MCV3LWuemSF0zpvHWCgCKEgR1CAQBw+WQx6QagnncE=; b=HKtbCvBa0MEUz45wc1cWy6DvoA
	giIhgnsULiVSANBQdqYQPrVxiU6HlqN3lbvMshHlcbqSlpRimpLCWaAA26e1FUl7PJxXLh7h1vbXk
	12iXgIUSOP7D8L1KkiPETgx2FflVmnXjBCyHne6Gj5Shyc3r2pFOTOSJgETfrbpDwfT8ybu4+QJZ0
	PUvZVNxp6QuBM8GJcyuAlZMaBGQ+wAc0oz4t6epUHLQb5D/nI5uMdVlZMMpMSjsr3uYPd13DM6N3L
	neOGBfoxKHcFfMX0TbcDD4BmgpnJr09A663kVNrEgm0qXHTeQ3O+08He98OjlZ8H0KVYDCYSPi3Cu
	Se1h6/7w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHGOZ-005T2Z-2g;
	Mon, 16 Jan 2023 03:42:54 +0000
X-UUID: dc374fd2954f11edbbe3f76fe852e059-20230115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8MCV3LWuemSF0zpvHWCgCKEgR1CAQBw+WQx6QagnncE=;
	b=Idmzp9Qw+cPCJ3pxejJRK49i+a6bac3wrIlUO3vug7x97YM1Te2Rn2rpUGaKDdVnED3E+GOnfnaUHJoddZR/uAS6K7wR9FFULTWb0rUA2WL/WgHyejpVGsn5dJBQZZWDiKdABjjmOlZlWe7ROXbZy5q1Krh0xuZMmMVQaCuqutE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:ab18a3b6-ab90-45ab-af6f-070a535f59e1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:e0fdbb54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: dc374fd2954f11edbbe3f76fe852e059-20230115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1806733751; Sun, 15 Jan 2023 20:42:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 16 Jan 2023 11:21:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 11:21:49 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [RESEND v3 07/13] media: platform: mtk-mdp3: avoid multiple driver registrations
Date: Mon, 16 Jan 2023 11:21:41 +0800
Message-ID: <20230116032147.23607-8-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230116032147.23607-1-moudy.ho@mediatek.com>
References: <20230116032147.23607-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_034252_547810_61396674 
X-CRM114-Status: GOOD (  14.39  )
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


