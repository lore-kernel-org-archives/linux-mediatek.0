Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884D4C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c9Q3W9lb23cFj+DGwrbVCpopAjiEpJ3qsb46oaSt7qs=; b=S1Dz57gRIGedWZ65w96p4vOTLw
	nrzglp5DDRh7Q/6jBOfX+1FQhZKEP976gF7hwZFrEatnLIuW8N/WYfeOGPG723LoUAdRjIpOFi5ft
	au7UX1ZRa0VPx0d1ieMUVeHHZntUeDKPkPXRfMEXg6TQHdJhdXy6VifFoNU+x30yFqYXhXzBCiKXh
	Y31UjTcM86B3di9HWYaYrjYpPJmL87YZLfGKhd90L3aFIoi3oE5EiD6dnC0wWtotFZDeqJRvVUIGA
	KtTyW9Hfcp5ieCgeJNjDWOT3tOg6k0DLB9oSpTOY0UQ8T7ZWsvTtYAV1MxwpzoMntS/hdKxWfe3IC
	grDMV3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkguZ-009Q1S-12;
	Fri, 07 Apr 2023 07:53:31 +0000
Received: from m12.mail.163.com ([220.181.12.198])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkguU-009Pze-16;
	Fri, 07 Apr 2023 07:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=c9Q3W
	9lb23cFj+DGwrbVCpopAjiEpJ3qsb46oaSt7qs=; b=DgHePW1x0fmO5rVwZvRxs
	swQajzjD27XpQ3DzzAPV1H90U9/arbRxb4oq/KIW3Z9l3HpzcnrJVYqhQV/TnbMP
	95AnwLSCZ6eSkn8UMriTEB28Pm4c/CF6KHmK6XNVY60bsBkMFxoET6VdIEbalCYx
	wFG/nm679CAFZRkgoynEm8=
Received: from ubuntu.localdomain (unknown [115.156.140.143])
	by zwqz-smtp-mta-g1-0 (Coremail) with SMTP id _____wAnBKrWyy9kiP0wAw--.39596S4;
	Fri, 07 Apr 2023 15:52:55 +0800 (CST)
From: Xinyi Hou <Y_Ashley@163.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Xinyi Hou <Y_Ashley@163.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] clk: mediatek: clk-mt7986-infracfg: delete the code related to 'base'
Date: Fri,  7 Apr 2023 15:49:30 +0800
Message-Id: <20230407074931.31247-1-Y_Ashley@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnBKrWyy9kiP0wAw--.39596S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1ktF4rXF1rKr47ur1DAwb_yoW8JF43pF
	y0gF4akFy5Aw4xCr48ZrZ7u343A3Z29Fy5KFy7Z3WDtr13Can2gr18K392g3WkAFWkZa4Y
	qr1j9348AFW2gFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_2NtUUUUUU=
X-Originating-IP: [115.156.140.143]
X-CM-SenderInfo: p1bd2xxoh1qiywtou0bp/xtbB0xxKxFXlyq1mMAAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_005326_860441_5DD60B6F 
X-CRM114-Status: UNSURE (   8.96  )
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

In clk_mt7986_infracfg_probe(), 'base' is allocated but never used,
either not released on both success failure path.

Fix this by deleting 'base' and the code related to it.

Signed-off-by: Xinyi Hou <Y_Ashley@163.com>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
v2 -> v3: Directly deleted 'base' and its related code based on master.
v1 -> v2: Directly deleted 'base' and its related code based on PATCH v1.

 drivers/clk/mediatek/clk-mt7986-infracfg.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index e80c92167c8f..76b32f3a16b2 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -174,16 +174,9 @@ static int clk_mt7986_infracfg_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 	int r;
-	void __iomem *base;
 	int nr = ARRAY_SIZE(infra_divs) + ARRAY_SIZE(infra_muxes) +
 		 ARRAY_SIZE(infra_clks);
 
-	base = of_iomap(node, 0);
-	if (!base) {
-		pr_err("%s(): ioremap failed\n", __func__);
-		return -ENOMEM;
-	}
-
 	clk_data = mtk_alloc_clk_data(nr);
 
 	if (!clk_data)
-- 
2.25.1


