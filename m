Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85300C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 08:02:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319C620BED
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 08:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CM6Zk8xn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319C620BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5GHiSXQG0KgN54qHGASXV4ulGD4hzCe3+aGuz6zJVio=; b=CM6Zk8xnugPn6gA7bBIkdu31Rg
	MfcIQZTasjIcjm2TVi0Np0DDzXdMEho+ULhCcW/zc8N/TBmn1nj+plN7jVA6nsimLY6ZEjjD4G8v7
	Uxc6+GAFA3usnjZtLhrihjgyMmJVjZ1tF04S+RBdjy9MZSKhZ1VP+vxFYitkOcMVnQ+4+5962GUxl
	Tp2sbd0tDmG4FXc32PTCFOLpJG4OMbTQGhwDpgVvzTuAvdOrIQ0UTXeeONAHFhKjEYGlr+XLmPP6H
	/lvd2liX3paXvmA5SP32HkomKMIuayIU6zGDfweotmQPawPU3Yo7vLlf7cBs5oIxrGJHgzwxw5vW5
	phd3G7Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKGmG-0002nq-JS; Mon, 21 Sep 2020 08:02:24 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGm6-0002kT-SY; Mon, 21 Sep 2020 08:02:15 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B0A93C26A4BEEAB1A8DA;
 Mon, 21 Sep 2020 16:02:08 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:02 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH -next] clk: mediatek: mt7629: simplify the return expression
 of mtk_infrasys_init
Date: Mon, 21 Sep 2020 16:24:26 +0800
Message-ID: <20200921082426.2591042-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_040215_161220_CAF1AF0E 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Liu Shixin <liushixin2@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index b73bdf152836..a0ee079670c7 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -601,7 +601,6 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	struct clk_onecell_data *clk_data;
-	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
 
@@ -611,12 +610,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	mtk_clk_register_cpumuxes(node, infra_muxes, ARRAY_SIZE(infra_muxes),
 				  clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get,
-				clk_data);
-	if (r)
-		return r;
-
-	return 0;
+	return of_clk_add_provider(node, of_clk_src_onecell_get,
+				   clk_data);
 }
 
 static int mtk_pericfg_init(struct platform_device *pdev)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
