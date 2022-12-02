Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076AFC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ljvlXmPb96WTUq5/Bc+qm2n+k16hBj30HLCndQ2YvCA=; b=2hlv1lcqe/YntqzPMDW7yQg5Ew
	bNtQg5i+/DLd/NqNDYp7ntr7IVVGMxJYaFCKn1MYljP4olyqXbq/q+6q1ROEvgOEHNuvSE/dOaln7
	gO8J7YJlMpPOYXakyi3rxX0pO5EupbHh5nCJGHZKVfCICOUOUk4t0Hz8CJfefjBTSm7Aqyb46YwU0
	hh3Fs9YdYxBKbzs0uLQVj8h2tTZ63cLHaRQCfnWaaYs0WZsZpNIG3hdecbadjQwD+NcLNfCljVe99
	Ox0mxdsdymu1ephHiRqUYJ0pYTgldUnfzvyQh/JSD2KtuT/VkP5rsIWo7KVSsDJEDu7AW7PZXnfy5
	45nH1CcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11Ts-00EYkY-5R; Fri, 02 Dec 2022 08:33:12 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11Tg-00EYaX-AH; Fri, 02 Dec 2022 08:33:02 +0000
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NNmQC52h9zmWWj;
	Fri,  2 Dec 2022 16:32:03 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 2 Dec
 2022 16:32:46 +0800
From: Yuan Can <yuancan@huawei.com>
To: <nbd@nbd.name>, <john@phrozen.org>, <sean.wang@mediatek.com>,
	<Mark-MC.Lee@mediatek.com>, <lorenzo@kernel.org>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<matthias.bgg@gmail.com>, <sujuan.chen@mediatek.com>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <yuancan@huawei.com>
Subject: [PATCH] net: ethernet: mtk_wed: Fix missing of_node_put() in mtk_wed_wo_hardware_init()
Date: Fri, 2 Dec 2022 08:30:29 +0000
Message-ID: <20221202083029.87834-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_003300_544669_5DD14CCC 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

The np needs to be released through of_node_put() in the error handling
path of mtk_wed_wo_hardware_init().

Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_wed_wo.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
index 4754b6db009e..d61bd0b11331 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
@@ -407,8 +407,10 @@ mtk_wed_wo_hardware_init(struct mtk_wed_wo *wo)
 		return -ENODEV;
 
 	wo->mmio.regs = syscon_regmap_lookup_by_phandle(np, NULL);
-	if (IS_ERR_OR_NULL(wo->mmio.regs))
-		return PTR_ERR(wo->mmio.regs);
+	if (IS_ERR_OR_NULL(wo->mmio.regs)) {
+		ret = PTR_ERR(wo->mmio.regs);
+		goto error_put;
+	}
 
 	wo->mmio.irq = irq_of_parse_and_map(np, 0);
 	wo->mmio.irq_mask = MTK_WED_WO_ALL_INT_MASK;
@@ -456,7 +458,8 @@ mtk_wed_wo_hardware_init(struct mtk_wed_wo *wo)
 
 error:
 	devm_free_irq(wo->hw->dev, wo->mmio.irq, wo);
-
+error_put:
+	of_node_put(np);
 	return ret;
 }
 
-- 
2.17.1


