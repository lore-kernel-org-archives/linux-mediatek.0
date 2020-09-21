Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148F1C43464
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 08:02:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B963E20BED
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 08:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HiyZAfUM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B963E20BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HUixcSP6+8wFyPVMmTdrGQ9PP9uvigi8Cls4bluX2PE=; b=HiyZAfUMpd6sAhK695nd1qaFNG
	MaoJSlmWNoA73WgljpTWPmbDw9jvUNeclTir9cMZrpyx0gyCpt5w0LN5GNVgd5NrEYXMtr6Kc2k54
	n0B8wkujLlZCLgxbgJAtaYal64u8arl6/uDJKGlYFAahLcFYMuQD2uQYVfe0Ij2H2eV6f/GuZCIqu
	4An7Q7qbhTxzEfozVRoGWF3uukU2LYxDiNxXuy/vJCYc1Bjvlm3te6qeteplQ9mxikUcbjqyC3COh
	oouoAEtqsSW87btbXNimLIWvkZHP+SVtSbZttPuuEGatf0Fb4jvK16jokYwZDxK3QlpOeZmhJwjBJ
	2ud9GJyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKGmI-0002oP-65; Mon, 21 Sep 2020 08:02:26 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGm7-0002kd-64; Mon, 21 Sep 2020 08:02:16 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 521C1F4E9771BEDF25CD;
 Mon, 21 Sep 2020 16:02:11 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:00 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH -next] clk: mediatek: mt6797: simplify the return expression
 of mtk_infrasys_init
Date: Mon, 21 Sep 2020 16:24:25 +0800
Message-ID: <20200921082425.2590990-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_040215_473035_727A8F33 
X-CRM114-Status: GOOD (  10.32  )
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
 drivers/clk/mediatek/clk-mt6797.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
index f35389a11af1..428eb24ffec5 100644
--- a/drivers/clk/mediatek/clk-mt6797.c
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -582,7 +582,7 @@ CLK_OF_DECLARE_DRIVER(mtk_infra, "mediatek,mt6797-infracfg",
 
 static int mtk_infrasys_init(struct platform_device *pdev)
 {
-	int r, i;
+	int i;
 	struct device_node *node = pdev->dev.of_node;
 
 	if (!infra_clk_data) {
@@ -599,11 +599,7 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
 				 infra_clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, infra_clk_data);
-	if (r)
-		return r;
-
-	return 0;
+	return of_clk_add_provider(node, of_clk_src_onecell_get, infra_clk_data);
 }
 
 #define MT6797_PLL_FMAX		(3000UL * MHZ)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
