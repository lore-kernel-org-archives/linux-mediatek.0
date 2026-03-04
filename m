Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2933FEFCE33
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F7XmH5/hs11BL5Bv9gfwXPkKTxvFijq4nvY+SwIm9w=; b=0GM8FloiC5/VYLlX8rvGHZcDci
	PbZj3ltelT+BBVmHMnhflFbHajAHbV2ycIITTuiIyPioe4ig1TSRlJ88CSboTTAvMfJ/NW51wPsqA
	/wNiv1QW/mkijCXDLjcXoL17b/xZry7MHqdKPt1uzK3l4hRw4pSdRsOcUndWf88xHe00rcZ8oGzBX
	Yge20VApToc8D+JzPI0HrWR6PIP2OU5Yx00DEDLkfo4bbo2nh6vRYdvGQ2xE7MugU4CDf4jbOe8bG
	GFR2nI2nCAW7cmOqdRheFpqhOvU8g380dmxvLbcioKWXoKxniUKJaMGJw9Bk3otE7+P5rTbfqLp1g
	N5iY2bNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqhE-00000000JPB-0wnT;
	Wed, 04 Mar 2026 18:11:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqhB-00000000JMj-0MzW
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 18:11:42 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82746ed8cb1so3991174b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647900; x=1773252700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/F7XmH5/hs11BL5Bv9gfwXPkKTxvFijq4nvY+SwIm9w=;
        b=VqUE1FRMQAKVZBpsEHs92R+kLUVaInRuceLucdtY4FsmyRQ+B5TfhGmtmwJxEe1je9
         8eze+PvRe5uvyyp2zmCWpDUvBfeIo81fYodh9o5fnsHZcq0WNcPWShy0u0DHtP/iIirP
         yw3MTJ5L+p3Up4+D6icTBRuCla6WbHfH0/AaHXGSuOnuzY2Xn/NY39AbRXXde9WXQ97+
         2g4aFosd/UnjvxSIXLXgwaQTj1htVNy8cyG3WUeAZFSYsxNzP1y4HWDN2SRWhzF+bKrn
         VAQj7QUDzhitnrH14MCLzk/QrpeC8GrVBFfBbYx7R8zXjXtMExS9dfxMXAjP2idwG/H3
         +UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647900; x=1773252700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/F7XmH5/hs11BL5Bv9gfwXPkKTxvFijq4nvY+SwIm9w=;
        b=mbK+BLJMNtnqUH3oEzbgwzAWhS6mWdAVHJ6ZXEDTWXmM/pPkhyMXdNvlLtrqOA2MER
         ycR4ygMuR/gjkO7PxfPJlvaeQhuya5beDoXTcj/3v7cAQGZ+3Wu2yfctj40YcL9kmhgK
         Db6BYYESeCRwdhgYJbnurbwJzCWM8BqQ1b+7F65n20NSZMETcYojCTmZTWK3wqM0m1L4
         SxjZ9weUkdoqTaOfdiw2s/CTDpqw8Agcqsk5p4ubMUN45Lt2/s4i/SQ2mI5c98i5HLmn
         +nC/Be41CMXcu+mAu90Ip1qOqRYdGHnYIMRRyXOd2ZDZhrI2C96CsNHGUL3qPkXDuUso
         +lGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUL6YmFrAe9jv4JeGKMETaP4KU3Clfzsx+MyWVODEX9OApQd+Oazl/SxwC7zghuw9AkfRWU9FvIu3Ay2AApA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLcC/9gs7j25HiTiSAI0zAh9ocXKu5bDArb1+vJkHrBpktBw5e
	CAyuV9p8OsdB7DQwGg12M5AjzvAhq8IQpbp+zCR8DamIPfz0WR/Ofoi6
X-Gm-Gg: ATEYQzxvH3/+pkcQfEkz8MAD9mwRHPvLp45W+SgVkdJMeI2ziJXKXdDwufnuiBrF+TU
	6QQfAHrliP6Zu6qZ1EEf2bxf3jFanmXQgKBr8fcC3hCRNb6knPoORGBEMEkXBv32A9S98htNxUu
	oypKoBSk7lhoMw8JzYTZS4LkWmWNpI6XTj8qGJr4AvtY9kR7i1YhdUPlas3Sjph4RcNmssv1EcE
	QjLkFLUvnIFIYdSwMHRFEFC+Z+C/nSW3RfVKMVtmtXxMrESXtVpSQjRvre8jp1qEH1o1RYo+woK
	54E2YLz62qtwaOl+mWJHOAW6RUbzW7PxCX518mDJyxeY2Q+qZJ61lyrfOrm17yGd/+DUZWeGnFJ
	x3V2X53tVBs87DmNZJBLx9XvC9GardCW9It/70yJw7lfhQ0wZ/sK+4aFjpsdcxiX0K0MAZm1pZz
	oM9cvdp14Pz2Mt1DXYjIOGBdBYWFkfAitRu4gT0HzX8qmWYD2VlsubsqRC1XtKLs9myM1OLAEtt
	u63vWg=
X-Received: by 2002:a05:6a00:2191:b0:81f:4675:c2a6 with SMTP id d2e1a72fcca58-82972b7584amr2427606b3a.2.1772647900198;
        Wed, 04 Mar 2026 10:11:40 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:39 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 2/3] clk: mediatek: mt6795-infracfg: Switch to common probe/remove helpers
Date: Thu,  5 Mar 2026 03:10:23 +0900
Message-ID: <20260304181024.738391-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304181024.738391-1-akkun11.open@gmail.com>
References: <20260304181024.738391-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101141_140775_5AD6A768 
X-CRM114-Status: GOOD (  14.59  )
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

The MT6795 infracfg driver can use the MediaTek clock framework's common
initialization sequence. Reduce the boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-infracfg.c | 70 ++++------------------
 1 file changed, 11 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..6aefc577ece5 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -8,7 +8,6 @@
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "reset.h"
@@ -77,74 +76,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_idx_map_nr = ARRAY_SIZE(infra_ao_idx_map),
 };
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_gates,
+	.num_clks = ARRAY_SIZE(infra_gates),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt6795_infracfg[] = {
-	{ .compatible = "mediatek,mt6795-infracfg" },
+	{ .compatible = "mediatek,mt6795-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_infracfg);
 
-static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
-				     ARRAY_SIZE(infra_gates), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
-					ARRAY_SIZE(cpu_muxes), clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_cpumuxes;
-
-	return 0;
-
-unregister_cpumuxes:
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt6795_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt6795_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt6795-infracfg",
 		.of_match_table = of_match_clk_mt6795_infracfg,
 	},
-	.probe = clk_mt6795_infracfg_probe,
-	.remove = clk_mt6795_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_infracfg_drv);
 
-- 
2.52.0


