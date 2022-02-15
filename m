Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17E8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HnuHHJdfrlC6AZ3J/5P65/9Yju3SdH0jwor2cnpWrs0=; b=rDP8zOMX9HA+oi
	zLlddNghv4CMhVY7gQdLI/qdCL33VgtVLHND0+OQeQsCkzmKdKAS2P4spilAneVHZ9o13Al8TSYDT
	A7YT0JYxbEOY3bRNVxH+8/AnaPjjgUmjqi6puxcrTY3X9gDJ/em43QfhHPZaYfelAK1wzkTTBxdEW
	LhQUDTv5aTw+ifo2ZU/KVdylNZoGYpEp5pm2HF8LMNqXbX9dRiPqiKxLIdv3ivk7y+OissQysK/wB
	RPEs/p73t0tPI88+tGIrvSVhDzpVR+BiHjDJFmmRMGNjXXEBw2046FFTOqexB9lEviCQ9DYH2kJUT
	GrqTf6sh9jQEPgr9lPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK2r6-0049Dl-Fg; Tue, 15 Feb 2022 18:47:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK2qu-00494k-AA; Tue, 15 Feb 2022 18:47:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id C83521F44C43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644950820;
 bh=Jo+q2iQ2HhAa53Jyc9hotJ72iRGY8gVAx2ZkJDQVWGs=;
 h=From:To:Cc:Subject:Date:From;
 b=O/3tC6A7Y2k4vIRMj3hfKSEHSGeZoMgX6+aVJ82NXCd+tB2+It8IgQtZJQcAjUvZp
 tMZ5HVFsejX4SMoMyUII0+qa0pUH1S+U7I6dfqFR+uCSJ7Mfei4JZx8Lp5dnb7N1l2
 c0FFJRW8s2M/9iAq+GjOAestYeZxGr4egQePe3M4kM3fYkWCMsBlSZuUX1cJqo0EZw
 ynWyFjvHnj4jMbrHz1o/8bp2BFeZtETATMa/S+lzMe+zm4iHdfDryquVxjCD3SClkS
 Q4+VV86gXKLI5Q7rz4fuBF6T/0OAw3yEwnrFebY186J7HSHvq/MYh2dmFC26KLAaJt
 LzjHw7cZuHrsg==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nick Fan <Nick.Fan@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] soc: mediatek: mtk-infracfg: Disable ACP on MT8192
Date: Tue, 15 Feb 2022 13:46:51 -0500
Message-Id: <20220215184651.12168-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_104704_567383_37E5B0E7 
X-CRM114-Status: GOOD (  15.34  )
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

MT8192 contains an experimental Accelerator Coherency Port
implementation, which does not work correctly but was unintentionally
enabled by default. For correct operation of the GPU, we must set a
chicken bit disabling ACP on MT8192.

Adapted from the following downstream change to the out-of-tree, legacy
Mali GPU driver:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2781271/5

Note this change is required for both Panfrost and the legacy kernel
driver.

v2: Move the change from clk-mt8192.c to mtk-infracfg.c (Robin).
Although it does not make sense to add this platform-specific hack to
the GPU driver, it has nothing to do with clocks. We already have
mtk-infracfg.c to manage other infracfg bits; the ACP disable should
live there too.

Co-developed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Nick Fan <Nick.Fan@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-infracfg.c   | 19 +++++++++++++++++++
 include/linux/soc/mediatek/infracfg.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
index 0590b68e0d78..2acf19676af2 100644
--- a/drivers/soc/mediatek/mtk-infracfg.c
+++ b/drivers/soc/mediatek/mtk-infracfg.c
@@ -6,6 +6,7 @@
 #include <linux/export.h>
 #include <linux/jiffies.h>
 #include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 #include <linux/soc/mediatek/infracfg.h>
 #include <asm/processor.h>
 
@@ -72,3 +73,21 @@ int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
 
 	return ret;
 }
+
+static int __init mtk_infracfg_init(void)
+{
+	struct regmap *infracfg;
+
+	/*
+	 * MT8192 has an experimental path to route GPU traffic to the DSU's
+	 * Accelerator Coherency Port, which is inadvertently enabled by
+	 * default. It turns out not to work, so disable it to prevent spurious
+	 * GPU faults.
+	 */
+	infracfg = syscon_regmap_lookup_by_compatible("mediatek,mt8192-infracfg");
+	if (!IS_ERR(infracfg))
+		regmap_set_bits(infracfg, MT8192_INFRA_CTRL,
+				MT8192_INFRA_CTRL_DISABLE_MFG2ACP);
+	return 0;
+}
+postcore_initcall(mtk_infracfg_init);
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index d858e0bab7a2..fcbbd0dd5e55 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -229,6 +229,9 @@
 #define INFRA_TOPAXI_PROTECTEN_SET		0x0260
 #define INFRA_TOPAXI_PROTECTEN_CLR		0x0264
 
+#define MT8192_INFRA_CTRL			0x290
+#define MT8192_INFRA_CTRL_DISABLE_MFG2ACP	BIT(9)
+
 #define REG_INFRA_MISC				0xf00
 #define F_DDR_4GB_SUPPORT_EN			BIT(13)
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
