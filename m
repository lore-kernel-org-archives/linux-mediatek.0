Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1D2C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Oct 2022 02:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nXkpvt1mtMM4zg0OEjeEBHf/KL9CK47oPYoCQZUJ26c=; b=y0mwCuIGPIEfUQxGe3LrNAqycl
	39t2f6Ilq56aMRh8U+/zlA7J2vnM8Yifq4pvz9XPYOphOnQQey241/BuLJEV7JWrbcQ7fCr2Sh1sv
	JKRxXSaGzEcM9BBweBBVkh4rN/vztGDGkV+w/4NTTB73X+WoP0enoZm/JwYpEnzZ7unS2oYmvX0vn
	dYnvE1Ct3lpS1ygntGNBaF6mbgzHmA2sApjbuw3eFHZSU3FKOIl9XiX6CI0xkoXNRTaypjEMnZ+2z
	gMeyCh0nTqePfQUZ5b8t59w91fZ84WAy2teUYzLWt3uwdtbCVkgW7YsON+eMdJE6Zh+YHgQBexstJ
	QyADI0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohMPr-00EpEq-AT; Sun, 09 Oct 2022 02:51:47 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohMPo-00EpEP-2j
	for linux-mediatek@lists.infradead.org; Sun, 09 Oct 2022 02:51:46 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MlRML1FYpzrS9Y;
	Sun,  9 Oct 2022 10:49:02 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 9 Oct 2022 10:51:30 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sun, 9 Oct
 2022 10:51:29 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
CC: <angelogioacchino.delregno@collabora.com>, <wenst@chromium.org>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH] clk: mediatek: clk-mt8195-topckgen: Fix error return code in clk_mt8195_topck_probe()
Date: Sun, 9 Oct 2022 10:50:56 +0800
Message-ID: <20221009025056.35311-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_195144_331231_D6436EB2 
X-CRM114-Status: UNSURE (   9.22  )
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

If devm_clk_hw_register_mux() fails in clk_mt8195_topck_probe(), it should return
error code.

Fixes: deeb2af77cf6 ("clk: mediatek: clk-mt8195-topckgen: Register mfg_ck_fast_ref as generic mux")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 8cbab5ca2e58..1e016329c1d2 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1270,8 +1270,10 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 	hw = devm_clk_hw_register_mux(&pdev->dev, "mfg_ck_fast_ref", mfg_fast_parents,
 				      ARRAY_SIZE(mfg_fast_parents), CLK_SET_RATE_PARENT,
 				      (base + 0x250), 8, 1, 0, &mt8195_clk_lock);
-	if (IS_ERR(hw))
+	if (IS_ERR(hw)) {
+		r = PTR_ERR(hw);
 		goto unregister_muxes;
+	}
 	top_clk_data->hws[CLK_TOP_MFG_CK_FAST_REF] = hw;
 
 	r = clk_mt8195_reg_mfg_mux_notifier(&pdev->dev,
-- 
2.25.1


