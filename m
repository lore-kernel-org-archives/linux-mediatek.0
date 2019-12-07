Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A543C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:28:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E52724670
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:28:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cVIoC8mx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqqNIeJU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E52724670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bpGYdzvPqVLibaJVI+Hj8EPtGNdGoBqb1Yt3kXAsV0=; b=cVIoC8mx0n+fPL
	7xKMEpfx3x/aPeT5EBWD+bScmiJdiuQ/9/456Aia0lLrG2YusPAqn7fZbVSHicdFm11sMkBe9/0yW
	b9Z78EXs3xYk7rVarWHpO2xZ+tKYG9dl03Bkq3Huq1o78FZsYDLuVVHUknhKoOObZGp0c0nkpIKkL
	XG0BEnv5sAWwIRsnfjHUuQFwWJ0qiH7aDbdKDE26bSW3XR+lbwqtVGGgPa9CkgVdhazmfsjDHP6YE
	y8uzSoD7LZlJHW/O10tA3tTGIQLMbIcKE4EBib2NHoa/tbDsjVseJxiKEfsM2iMsocvVst+DZ3bA+
	m7hF+M6PSK+NecjEp58w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idiYw-00044V-W5; Sat, 07 Dec 2019 22:28:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idiVv-000124-37; Sat, 07 Dec 2019 22:25:24 +0000
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 109F324670;
 Sat,  7 Dec 2019 22:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575757522;
 bh=JSPEnmIDkobd2bvgU/0fVPQfLB35GOvh84DoJ03YQtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PqqNIeJUavGo/1owGDANSu0nVFlZoXq1V7qJcy8wAnGDm/8Adgxi5X5BC3xI4O/fn
 I60wYCSpdh80jnHfaU8/kYROSC/pn6m4MT1HJsDsdRLTFLHPhJYvwMsS3Q0wXf2uXj
 AGUYjqYrJeXuM4hx0WXzBJi0T4Ke3pHgrL5wk1RY=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v6 11/12] clk: mediatek: mt8173: switch mmsys to platform
 device probing
Date: Sat,  7 Dec 2019 23:23:48 +0100
Message-Id: <20191207222349.23161-12-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_142523_182787_AA9F4827 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
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
 drivers/clk/mediatek/clk-mt8173.c | 51 ++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 537a7f49b0f7..1e6a390534e4 100644
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
@@ -1144,22 +1147,56 @@ static void __init mtk_imgsys_init(struct device_node *node)
 }
 CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
 
-static void __init mtk_mmsys_init(struct device_node *node)
-{
+struct mtk_mmsys_priv {
 	struct clk_onecell_data *clk_data;
+};
+
+static int mtk_mmsys_probe(struct platform_device *pdev)
+{
 	int r;
+	struct device_node *node;
+	struct mtk_mmsys_priv *private;
+
+	node = pdev->dev.parent->of_node;
 
-	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
+	if (!private)
+		return -ENOMEM;
+
+	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+
+	platform_set_drvdata(pdev, private);
 
 	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
-						clk_data);
+					private->clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_provider(node, of_clk_src_onecell_get,
+					private->clk_data);
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+
+	return r;
+}
+
+static int mtk_mmsys_remove(struct platform_device *pdev)
+{
+	struct mtk_mmsys_priv *private;
+	private = platform_get_drvdata(pdev);
+
+	kfree(private->clk_data);
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
2.24.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
