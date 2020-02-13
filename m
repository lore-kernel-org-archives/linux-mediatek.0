Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0799BC352A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 20:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38262465D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 20:24:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s/ah6eOY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHNzG2xu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D38262465D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Z1XnNsihp4/K13sgnuPAJu1RaOm4bz/eNg01MV1yN0=; b=s/ah6eOYA4pD/F
	ym32e6s+8nwvwe0PDHtjUuhQt1BvECsVgPh3WIwz6OPKqnFCJI8Ay37ZCPnPcr9HHJKIHJ/7xrrNg
	kbpWUUepJnVc0o3gqh9RsVbCtgkqCyJH9Imak0V80/hJOOVTH69W4WNi7a6rm1Duc58BoyFkQRTnu
	p/qBxzJgXQC1A/oajfTE6+UwguCouk7tDdFac0Fsrk7lQjnelNm3y2o6Ki2tdwMI2iNrFtikaKbjE
	TI2b3WpttFgHQEC8hXyQC3pv9sG5gWldtlvtq2WjgAEU61ezYRXQyz1oL1aiFCJ04v+6KUFMX9SUr
	WsCCiRQNDv4d95uBSrfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2L27-0004HB-3w; Thu, 13 Feb 2020 20:24:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Kyw-0000gj-Ep; Thu, 13 Feb 2020 20:21:08 +0000
Received: from ziggy.cz (unknown [37.223.145.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EABA246DF;
 Thu, 13 Feb 2020 20:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581625265;
 bh=ZI/tFb4x6BCv4qfNVX2na4bTFi0YfD64Z9m/NH97qQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vHNzG2xuW6p2FjjQpvav07lNS2YWexoCTHtkSi9fwBnskGlWiRoZxGCGiy1zB5x+c
 o9tOQSGQcdPRTltYj5Eg9hXgumtjOxmzTU6xFbmpnv2Weehhb6vVVA3b5Zn0RPz9Gf
 GEoANlEkYBHOLpqlMo+3THVsElZlrtgBUXavWcr4=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v7 12/13] clk: mediatek: mt8173: switch mmsys to platform
 device probing
Date: Thu, 13 Feb 2020 21:19:52 +0100
Message-Id: <20200213201953.15268-13-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213201953.15268-1-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_122106_577571_CD13C417 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, devicetree@vger.kernel.org,
 drinkcat@chromium.org, Thomas Gleixner <tglx@linutronix.de>,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Richard Fontana <rfontana@redhat.com>,
 wens@csie.org, Matthias Brugger <mbrugger@suse.com>,
 linux-mediatek@lists.infradead.org, rdunlap@infradead.org,
 matthias.bgg@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
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

Changes in v7:
- add blank line after declaration
- free clk_data->clks as well
- get rid of private data structure

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/clk/mediatek/clk-mt8173.c | 45 ++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 537a7f49b0f7..0608d9fffef7 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -5,8 +5,11 @@
  */
 
 #include <linux/clk.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -783,7 +786,7 @@ static const struct mtk_gate_regs mm1_cg_regs __initconst = {
 		.ops = &mtk_clk_gate_ops_setclr,		\
 	}
 
-static const struct mtk_gate mm_clks[] __initconst = {
+static const struct mtk_gate mm_clks[] = {
 	/* MM0 */
 	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
 	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
@@ -1144,22 +1147,52 @@ static void __init mtk_imgsys_init(struct device_node *node)
 }
 CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
 
-static void __init mtk_mmsys_init(struct device_node *node)
+static int mtk_mmsys_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
 	int r;
+	struct device_node *node;
+	struct clk_onecell_data *clk_data;
+
+	node = pdev->dev.parent->of_node;
+
+	clk_data = devm_kzalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
 
-	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
-						clk_data);
+	platform_set_drvdata(pdev, clk_data);
+
+	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+
+	return r;
+}
+
+static int mtk_mmsys_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+
+	clk_data = platform_get_drvdata(pdev);
+
+	kfree(clk_data->clks);
+	kfree(clk_data);
+
+	return 0;
 }
-CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
+
+static struct platform_driver clk_mt8173_mm_drv = {
+	.probe = mtk_mmsys_probe,
+	.remove = mtk_mmsys_remove,
+	.driver = {
+		.name = "clk-mt8173-mm",
+	},
+};
+module_platform_driver(clk_mt8173_mm_drv);
 
 static void __init mtk_vdecsys_init(struct device_node *node)
 {
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
