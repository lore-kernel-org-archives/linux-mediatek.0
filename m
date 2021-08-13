Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AA5C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 03:25:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02440603E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 03:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02440603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9XRFoEZhJ6nhCPvL/Opg/1GqBc69aVYYvxo3OLRUeM=; b=46yQeSv2fsUjW2
	3Y/SHhEa7foQG3KCdLC1OvaVzwkjS98Yb0vNybwa6HdV7XSkIxQOWUzQUM1kwhIMYQHFO67GCLS9Q
	Lzks3klO1j9sxYKRlvrH7muE55/6Q/1VAPcrX5d2pHAjR6yWU1IeH9i6aW20QuUhiqcignzMhNyc3
	ngSiJzmt1w2BsLHOlxPSzhWBy2QV6zJWMmlcTsHivAXOm2hPgss0ce8W/Kd7Qk0p8bNIyAcKgDLwc
	LW4VvcjP+SEOlAa3Q6bZNPH+BLPqCfeJ5bwVXIN72wZxvpv2B6/nrIQKCrRzuPesOSGoI8amXIkgk
	5f3M1oFq15bz4d3Xqbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mENpI-00Bd3X-67; Fri, 13 Aug 2021 03:25:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mENoJ-00Bcgl-J0; Fri, 13 Aug 2021 03:24:46 +0000
X-UUID: 0375d6c3269846a4b07d4b77c04aeb7e-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bvPEIm4Ji3kzYv7f/3U+Sccfpn3ueE8uGlNTWdf5QPU=; 
 b=rrWfbwtIy20pP6drY7VjwI4Dl1x16s15F2lh3S6AhpF173Ey9nZ3hciDCkbMHspp7ZTtejBMHrJCLHRA+hcPcwbLei3clnxxTxJ4ojLvpjPgpt6Xg6+oCvLJ0YNy/SX2cIbR37HZyRPC1BRtvbrecuGfvOHC8bZqQqvN0eZ+Dsc=;
X-UUID: 0375d6c3269846a4b07d4b77c04aeb7e-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1287735932; Thu, 12 Aug 2021 20:24:33 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 20:24:32 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 11:24:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 13 Aug 2021 11:24:31 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen
 <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>, Lee Jones <lee.jones@linaro.org>
Subject: [RESEND PATCH 3/4] clk: mediatek: support COMMON_CLK_MT6779 module
 build
Date: Fri, 13 Aug 2021 11:24:28 +0800
Message-ID: <20210813032429.14715-4-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813032429.14715-1-miles.chen@mediatek.com>
References: <20210813032429.14715-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_202443_677319_8A2A582A 
X-CRM114-Status: GOOD (  11.84  )
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

To support COMMON_CLK_MT6779* module build,
add MODULE_LICENSE and export necessary symbols.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Hanks Chen <hanks.chen@mediatek.com>
Cc: Wendell Lin <wendell.lin@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt6779-aud.c  | 2 ++
 drivers/clk/mediatek/clk-mt6779-cam.c  | 2 ++
 drivers/clk/mediatek/clk-mt6779-img.c  | 2 ++
 drivers/clk/mediatek/clk-mt6779-ipe.c  | 2 ++
 drivers/clk/mediatek/clk-mt6779-mfg.c  | 2 ++
 drivers/clk/mediatek/clk-mt6779-mm.c   | 2 ++
 drivers/clk/mediatek/clk-mt6779-vdec.c | 2 ++
 drivers/clk/mediatek/clk-mt6779-venc.c | 2 ++
 drivers/clk/mediatek/clk-mt6779.c      | 2 ++
 9 files changed, 18 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6779-aud.c b/drivers/clk/mediatek/clk-mt6779-aud.c
index 11b209f95e25..439c0bc94b73 100644
--- a/drivers/clk/mediatek/clk-mt6779-aud.c
+++ b/drivers/clk/mediatek/clk-mt6779-aud.c
@@ -4,6 +4,7 @@
  * Author: Wendell Lin <wendell.lin@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -115,3 +116,4 @@ static struct platform_driver clk_mt6779_aud_drv = {
 };
 
 builtin_platform_driver(clk_mt6779_aud_drv);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6779-cam.c b/drivers/clk/mediatek/clk-mt6779-cam.c
index 244d4208b7fb..c99ddb210b70 100644
--- a/drivers/clk/mediatek/clk-mt6779-cam.c
+++ b/drivers/clk/mediatek/clk-mt6779-cam.c
@@ -4,6 +4,7 @@
  * Author: Wendell Lin <wendell.lin@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/mt6779-clk.h>
@@ -64,3 +65,4 @@ static struct platform_driver clk_mt6779_cam_drv = {
 };
 
 builtin_platform_driver(clk_mt6779_cam_drv);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6779-img.c b/drivers/clk/mediatek/clk-mt6779-img.c
index 26292a45c613..bf652052879c 100644
--- a/drivers/clk/mediatek/clk-mt6779-img.c
+++ b/drivers/clk/mediatek/clk-mt6779-img.c
@@ -4,6 +4,7 @@
  * Author: Wendell Lin <wendell.lin@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/mt6779-clk.h>
@@ -56,3 +57,4 @@ static struct platform_driver clk_mt6779_img_drv = {
 };
 
 builtin_platform_driver(clk_mt6779_img_drv);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6779-ipe.c b/drivers/clk/mediatek/clk-mt6779-ipe.c
index bb519075639c..a1a1c9cb329a 100644
--- a/drivers/clk/mediatek/clk-mt6779-ipe.c
+++ b/drivers/clk/mediatek/clk-mt6779-ipe.c
@@ -4,6 +4,7 @@
  * Author: Wendell Lin <wendell.lin@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/mt6779-clk.h>
@@ -58,3 +59,4 @@ static struct platform_driver clk_mt6779_ipe_drv = {
 };
 
 builtin_platform_driver(clk_mt6779_ipe_drv);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6779-mfg.c b/drivers/clk/mediatek/clk-mt6779-mfg.c
index c6ee2a89c070..9bf48c56d852 100644
--- a/drivers/clk/mediatek/clk-mt6779-mfg.c
+++ b/drivers/clk/mediatek/clk-mt6779-mfg.c
@@ -4,6 +4,7 @@
  * Author: Wendell Lin <wendell.lin@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
@@ -53,3 +54,4 @@ static struct platform_driver clk_mt6779_mfg_drv = {
 };
 
 builtin_platform_driver(clk_mt6779_mfg_drv);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6779-mm.c b/drivers/clk/mediatek/clk-mt6779-mm.c
index 059c1a41ac7a..d5ead5531026 100644
--- a/drivers/clk/mediatek/clk-mt6779-mm.c
+++ b/drivers/clk/mediatek/clk-mt6779-mm.c
@@ -4,6 +4,7 @@
  * Author: Wendell Lin <wendell.lin@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/mt6779-clk.h>
@@ -106,3 +107,4 @@ static struct platform_driver clk_mt6779_mm_drv = {
 };
 
 builtin_platform_driver(clk_mt6779_mm_drv);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6779-vdec.c b/drivers/clk/mediatek/clk-mt6779-vdec.c
index 1900da2586a1..ff7390e4c5f5 100644
--- a/drivers/clk/mediatek/clk-mt6779-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6779-vdec.c
@@ -4,6 +4,7 @@
  * Author: Wendell Lin <wendell.lin@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
@@ -65,3 +66,4 @@ static struct platform_driver clk_mt6779_vdec_drv = {
 };
 
 builtin_platform_driver(clk_mt6779_vdec_drv);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6779-venc.c b/drivers/clk/mediatek/clk-mt6779-venc.c
index b41d1f859edc..489bf64346e3 100644
--- a/drivers/clk/mediatek/clk-mt6779-venc.c
+++ b/drivers/clk/mediatek/clk-mt6779-venc.c
@@ -4,6 +4,7 @@
  * Author: Wendell Lin <wendell.lin@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
@@ -56,3 +57,4 @@ static struct platform_driver clk_mt6779_venc_drv = {
 };
 
 builtin_platform_driver(clk_mt6779_venc_drv);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 6e0d3a166729..9825385c9f94 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -4,6 +4,7 @@
  * Author: Wendell Lin <wendell.lin@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -1314,3 +1315,4 @@ static int __init clk_mt6779_init(void)
 }
 
 arch_initcall(clk_mt6779_init);
+MODULE_LICENSE("GPL");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
