Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C2EC2D0BE
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:50:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8C8C24677
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F5poWDJf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9AB2uaG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8C8C24677
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSEMGMf68GikhM5BAEQyh//YWIBBrr7pVUQREwVsNTo=; b=F5poWDJfFYySp7
	1qY3zeCn5hbFUGX0QYvuTuxvbopUVKNH1tx3NCXp6lSJnrIX+ubm7N52EMzlIy9blPi8Qm9tsE5ml
	9x6PW9zIOu4KBcRxisLBXCCGO29y47TZ63CWIMIsHIk1dXfpLbRmjB47Vk9yhQvS6XvYQ9kWnBcLH
	WfUkz1jmrMc+PQ9hphZCFgtytdegBOr/LjDM/TOL0W3HNgOO9jXQjXYZz95xOs7WTZT0QaIWfTygx
	YjMfEA71BtTuV3XtqwCKtnGvumfuPGLm4WKVVMm/latW9ZtEYYfhW1gfP/kxJYiVrXM/LjJPmpuqi
	Mw4qYyTpQzJXl2XsAvgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idiuG-0006g5-QW; Sat, 07 Dec 2019 22:50:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idisQ-0003WY-Qf; Sat, 07 Dec 2019 22:48:40 +0000
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CB2B2467D;
 Sat,  7 Dec 2019 22:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575758918;
 bh=auWyY9ONWyopnTa7jwZEHJgz7lHXT4cKj+bG2jBUqvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q9AB2uaGjUGVaAu/hrxjaHiMFp5gwlOjJ+TcGlwUYwGRWQQe04sZRIA5LlDtLfOYn
 ZCJ1i/cxlauRwdhfThk21ZZ3E7/CEnjGshfPwK4Oido7fmRgpZs5l3oU/Wpgy+/zSF
 3rcww1J08OVRy8RuEENpoIHB58+lzRXhjl69CPQA=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [resend PATCH v6 07/12] clk: mediatek: mt2712e: switch to platform
 device probing
Date: Sat,  7 Dec 2019 23:47:35 +0100
Message-Id: <20191207224740.24536-8-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_144838_944430_25F1708B 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: matthias.bgg@kernel.org, devicetree@vger.kernel.org, rdunlap@infradead.org,
 frank-w@public-files.de, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Switch probing for the MMSYS to support invocation to a
plain paltform device. The driver will be probed by the DRM subsystem.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/clk/mediatek/clk-mt2712-mm.c | 39 +++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
index 1c5948be35f3..d018db568263 100644
--- a/drivers/clk/mediatek/clk-mt2712-mm.c
+++ b/drivers/clk/mediatek/clk-mt2712-mm.c
@@ -4,14 +4,20 @@
  * Author: Weiyi Lu <weiyi.lu@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
 
 #include <dt-bindings/clock/mt2712-clk.h>
 
+struct clk_mt2712_mm_priv {
+	struct clk_onecell_data *clk_data;
+};
+
 static const struct mtk_gate_regs mm0_cg_regs = {
 	.set_ofs = 0x104,
 	.clr_ofs = 0x108,
@@ -128,16 +134,22 @@ static const struct mtk_gate mm_clks[] = {
 
 static int clk_mt2712_mm_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
 	int r;
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.parent->of_node;
+	struct clk_mt2712_mm_priv *private;
+
+	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
+	if (!private)
+		return -ENOMEM;
 
-	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	platform_set_drvdata(pdev, private);
 
 	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
-			clk_data);
+			private->clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_provider(node, of_clk_src_onecell_get,
+			private->clk_data);
 
 	if (r != 0)
 		pr_err("%s(): could not register clock provider: %d\n",
@@ -146,17 +158,20 @@ static int clk_mt2712_mm_probe(struct platform_device *pdev)
 	return r;
 }
 
-static const struct of_device_id of_match_clk_mt2712_mm[] = {
-	{ .compatible = "mediatek,mt2712-mmsys", },
-	{}
-};
+static int clk_mt2712_mm_remove(struct platform_device *pdev)
+{
+	struct clk_mt2712_mm_priv *private = platform_get_drvdata(pdev);
+
+	kfree(private->clk_data);
+
+	return 0;
+}
 
 static struct platform_driver clk_mt2712_mm_drv = {
 	.probe = clk_mt2712_mm_probe,
+	.remove = clk_mt2712_mm_remove,
 	.driver = {
 		.name = "clk-mt2712-mm",
-		.of_match_table = of_match_clk_mt2712_mm,
 	},
 };
-
-builtin_platform_driver(clk_mt2712_mm_drv);
+module_platform_driver(clk_mt2712_mm_drv);
-- 
2.24.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
