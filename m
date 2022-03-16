Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA91CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/bWwQQH/ZIOc2rbAFOuV1f8UNYTFKmy07ivjyMxkI+o=; b=jPKOsTZV6yyBT+
	llJSSqG6r8GZ+jlyJuHX3xRUSfbNCIURXuRdlH14bRLUDIXDS6RlnnipOrQWW4eW/t+3KjhTk3Myn
	36eegOsYdF1JQ0U8Ch4cv9hAptAn2aWnetpykVUjnUNqdoX45/5puAcrnCUcH6uBcxIkuSPCTxpq+
	6JK1vc0SB5Y/2YjW3HoF+jl7ZYhRjxsVOnHKo0sDkMueTlknZk4HmUXFHJb5xJQsdUHji/uYuwzet
	lM4PVlg755zYXGwD3ZLRu2navirVjIFxzSTzzRGAnQuMbUJQFzdj4QXqtbf5yvl4DurARZMlSfO3D
	U1UhjUavpdesRIYQu4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUSdx-00Clmg-4Z; Wed, 16 Mar 2022 12:20:45 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUSdu-00Clkl-Ji
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 12:20:44 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KJTph4kPKzfYnN;
 Wed, 16 Mar 2022 20:19:08 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 20:20:36 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 20:20:36 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
 <mchehab@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <wangxiongfeng2@huawei.com>
Subject: [PATCH -next] media: mtk-vcodec: Add missing of_node_put() in
 mtk_vdec_hw_prob_done()
Date: Wed, 16 Mar 2022 20:34:52 +0800
Message-ID: <20220316123452.186166-1-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_052042_842252_B41DD407 
X-CRM114-Status: UNSURE (   6.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

of_find_compatible_node() will increment the refcount of the returned
device_node. Calling of_node_put() to avoid the refcount leak.

Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
index 8d2a641d92f1..60da59611434 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
@@ -47,6 +47,8 @@ static int mtk_vdec_hw_prob_done(struct mtk_vcodec_dev *vdec_dev)
 		if (!subdev_node)
 			continue;
 
+		of_node_put(subdev_node);
+
 		hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
 		if (!test_bit(hw_idx, vdec_dev->subdev_bitmap)) {
 			dev_err(&pdev->dev, "vdec %d is not ready", hw_idx);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
