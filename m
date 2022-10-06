Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A32C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oyQcrxZYCAvggulovd4FRHdXOU2WjZQVKRd7NG1+zj8=; b=vOIren6PIYBqGQe1tamcJhBRUj
	jjP/7+iP3jEQ8df2LtSBJ+FrPfDmfDOu8mJ0f1XEb8BSOF+ei5itxB/fP4f136+IgCfu/AeSXywHJ
	TRdG2m267Zy47uc81Mj4cLMvfI0H10iJ9FZPqwp0HpQfqd0Zc9ezCZXPogamiqEIQQ0vJUJgzZblE
	+NUX62jA13yShGCQ6A4CmXgNGjdb/vnVRbYK62yFG0u73h+4/cASteeJ1yshNod/vNKPPXeaoL5cr
	h+OuKUtVrdjnPT2RbgyPCjhSLbvyzxGZUNdIdxEJt9w1c9O6uSTIbX/fVmRUWqYJMzDipgpbiH8P6
	TJ+noQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogTYA-003kHl-6e; Thu, 06 Oct 2022 16:16:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogTY7-003kFR-KF
	for linux-mediatek@lists.infradead.org; Thu, 06 Oct 2022 16:16:40 +0000
X-UUID: e32609b8e4cf49a28a3614eb85d0d807-20221006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oyQcrxZYCAvggulovd4FRHdXOU2WjZQVKRd7NG1+zj8=;
	b=p8N6h9I1xEIzT+RLRfn+ixVQ/U+pJQIb1WaPlfiZNrSTmi+u5GgLCpMmeRRkcYbHOJ8TCORE0js6QNmZ1IRyfnXOJhVMJQNt+ej4cSSJdxWC4As3hUqzAHWiqqH5bj/ivSm4f5K7o6E6l2pK2vb+ACNzn8LAXN9Ew4B0Op7LNig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:15749c87-5d1b-416e-bf01-c7058533c027,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:98e376fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e32609b8e4cf49a28a3614eb85d0d807-20221006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 511452679; Thu, 06 Oct 2022 09:16:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 6 Oct 2022 23:15:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 6 Oct 2022 23:15:55 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v1] media: platform: mtk-mdp3: fix error handling in mdp_probe()
Date: Thu, 6 Oct 2022 23:15:53 +0800
Message-ID: <20221006151553.28083-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_091639_682243_DFA304F9 
X-CRM114-Status: GOOD (  11.52  )
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

Adjust label "err_return" order to avoid double freeing, and
add two labels for easy traceability.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c  | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index c413e59d4286..2d1f6ae9f080 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -196,27 +196,27 @@ static int mdp_probe(struct platform_device *pdev)
 	mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MMSYS);
 	if (!mm_pdev) {
 		ret = -ENODEV;
-		goto err_return;
+		goto err_destroy_device;
 	}
 	mdp->mdp_mmsys = &mm_pdev->dev;
 
 	mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MUTEX);
 	if (WARN_ON(!mm_pdev)) {
 		ret = -ENODEV;
-		goto err_return;
+		goto err_destroy_device;
 	}
 	for (i = 0; i < MDP_PIPE_MAX; i++) {
 		mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev->dev);
 		if (!mdp->mdp_mutex[i]) {
 			ret = -ENODEV;
-			goto err_return;
+			goto err_free_mutex;
 		}
 	}
 
 	ret = mdp_comp_config(mdp);
 	if (ret) {
 		dev_err(dev, "Failed to config mdp components\n");
-		goto err_return;
+		goto err_free_mutex;
 	}
 
 	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
@@ -287,11 +287,12 @@ static int mdp_probe(struct platform_device *pdev)
 	destroy_workqueue(mdp->job_wq);
 err_deinit_comp:
 	mdp_comp_destroy(mdp);
-err_return:
+err_free_mutex:
 	for (i = 0; i < MDP_PIPE_MAX; i++)
-		if (mdp)
-			mtk_mutex_put(mdp->mdp_mutex[i]);
+		mtk_mutex_put(mdp->mdp_mutex[i]);
+err_destroy_device:
 	kfree(mdp);
+err_return:
 	dev_dbg(dev, "Errno %d\n", ret);
 	return ret;
 }
-- 
2.18.0


