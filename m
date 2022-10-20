Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B2EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyQcrxZYCAvggulovd4FRHdXOU2WjZQVKRd7NG1+zj8=; b=OYvCyQQPkFRIDVY/ub2bUuK2Ea
	bVl1b0G2OwYYRCRdWeDh1eepIU+PTtDqnkKvqWBmLRYejYjNxHIZK6fqVr0DrYi6qXiYBu62Zo6JR
	x6jtaSpKaAPQv8xu20NP0F01KbDaMJ/hk0oBrQT2lXcjUvIBNGZD9druWxXUKvT0mZIa3PKCoJe4W
	Y413O4kHvdKd514oJAZEMxuSosW8Lz+R9v/BsHE3ZF+GfDsaK5EAObbLQwldWALiaXUelyhb2+XUb
	3+4gEd++ix5NljHd+IiTrd1D0X/r7WArX6yY011eGIiZkb8H9PzQ0K4A3ZSfWmgNowSYew4dQvzNf
	uMVA5NVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPpG-00BaSH-H4; Thu, 20 Oct 2022 07:18:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPpC-00BaQK-AJ
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 07:18:43 +0000
X-UUID: 41772c5224be4fc8b04c0c70a09b75e6-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oyQcrxZYCAvggulovd4FRHdXOU2WjZQVKRd7NG1+zj8=;
	b=ByhDzTpYCFzjWm1qSQJjbRkLtm2f8JTZfj4d6d1o8DPc4UaTRpqRfpVDCYZYSgHyLbkMLSRX9uxPcGd70Q0iTA8nkVUlTF37BsC2cjuy4IUXTxDNdPZGyE9Ap9RF7J4/KY1qrg5Oh1W7Y5qoHnfVWWeL/u6hxwq0q0IYwxn3Fyc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:aacd62ec-7d2c-4689-95ac-4e2d0e888e8f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.12,REQID:aacd62ec-7d2c-4689-95ac-4e2d0e888e8f,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:62cd327,CLOUDID:4954e0ee-314c-4293-acb8-ca4299dd021f,B
	ulkID:2210201518393XPPEBUT,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 41772c5224be4fc8b04c0c70a09b75e6-20221020
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 667049822; Thu, 20 Oct 2022 00:18:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 20 Oct 2022 15:18:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 15:18:02 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 3/3] media: platform: mtk-mdp3: fix error handling in mdp_probe()
Date: Thu, 20 Oct 2022 15:18:00 +0800
Message-ID: <20221020071800.20487-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221020071800.20487-1-moudy.ho@mediatek.com>
References: <20221020071800.20487-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_001842_411276_20CA71E4 
X-CRM114-Status: GOOD (  12.24  )
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


