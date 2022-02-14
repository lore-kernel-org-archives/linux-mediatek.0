Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC57EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P50PHT/GLOUB9OWbILZHM8fQb3g0EJWWOkcKXGdVbSY=; b=ryFx4WCvLN1uaH
	9Zx81otHkHzrmoj0NJ5pjnZpRwC6jhXIp9j9+ZaYfFPZ+nJM9gb01i9qMSNr095lUhs57iwHnY6yZ
	54P3YD9pZlTrL9w+Weuom/L4RloEBSUQTQcGeRNitCqK9FpezIkjdjQ9fQLYVS/qtTpFrny+1saGr
	6ER1G229I2WNkC4FBFLqn+Tt08Aci5Y7nWcIUE2kh/g7V5mNcSWavJ2vWi7rNZRu11dbmU7k4D4z9
	QkdM1csNmCnWtG0hk78QjQQD8ElRhQhLEViKodAEfmT4rrr+q9erjB3B67DKkJGfZZDC91q6r77//
	ps059+G8p04xY8wEyfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJaIH-00F4wu-Rl; Mon, 14 Feb 2022 12:17:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJZNw-00ElgN-Ov; Mon, 14 Feb 2022 11:19:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B45B01F43669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644837550;
 bh=/yHhoGENnp5DfoA0yF/nUh7Mr9NPuMCSmEyusu4kgtU=;
 h=From:To:Cc:Subject:Date:From;
 b=K2W0/12Y8kOeoV2TERja1cvvfaN0KlIkfleL8X5BjzFguAx6YDhkDwqELmUFhjtLI
 MZJDiACq4O7v2rhXDmMIiVGdvThbpe1k2nuYz5DqbFeqUBOuLGCdDW5R9+nq60FA+K
 cUvKWgJAzlV9YUvGTOjGB//MB4v4LFrlKz0t/cV0BkRVhiYEhetMW3W3lo/zo664uI
 WM0IvxY+JQKPO1V932VQ6LwHqocInM6EiIO2QhQeoAuB0lJa3momVeIaE9yQgPIfcs
 BBAU7O74zn9E46R7UXhUOS71px58s2Hdxn7rPpmLrpVeg7G1KDTAh9WXXM1RK2hnga
 IIKcFl8/1SSSA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 matthias.bgg@gmail.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] usb: host: xhci-mtk: Simplify supplies handling with
 regulator_bulk
Date: Mon, 14 Feb 2022 12:19:05 +0100
Message-Id: <20220214111905.77903-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_031912_984904_281019D4 
X-CRM114-Status: GOOD (  12.84  )
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

Remove the custom functions xhci_mtk_ldos_{enable,disable}() by
switching to using regulator_bulk to perform the very same thing,
as the regulators are always either both enabled or both disabled.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

v2: Change dynamic vregs array to static definition with new xhci_mtk_vregs_get()
    helper as requested by Chunfeng

 drivers/usb/host/xhci-mtk.c | 44 ++++++++++---------------------------
 drivers/usb/host/xhci-mtk.h |  5 +++--
 2 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index e25bad0894cf..b89b4f159a4d 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -401,29 +401,14 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
 	return devm_clk_bulk_get_optional(mtk->dev, BULK_CLKS_NUM, clks);
 }
 
-static int xhci_mtk_ldos_enable(struct xhci_hcd_mtk *mtk)
+static int xhci_mtk_vregs_get(struct xhci_hcd_mtk *mtk)
 {
-	int ret;
+	struct regulator_bulk_data *supplies = mtk->supplies;
 
-	ret = regulator_enable(mtk->vbus);
-	if (ret) {
-		dev_err(mtk->dev, "failed to enable vbus\n");
-		return ret;
-	}
-
-	ret = regulator_enable(mtk->vusb33);
-	if (ret) {
-		dev_err(mtk->dev, "failed to enable vusb33\n");
-		regulator_disable(mtk->vbus);
-		return ret;
-	}
-	return 0;
-}
+	supplies[0].supply = "vbus";
+	supplies[1].supply = "vusb33";
 
-static void xhci_mtk_ldos_disable(struct xhci_hcd_mtk *mtk)
-{
-	regulator_disable(mtk->vbus);
-	regulator_disable(mtk->vusb33);
+	return devm_regulator_bulk_get(mtk->dev, BULK_VREGS_NUM, supplies);
 }
 
 static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
@@ -513,17 +498,10 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mtk->dev = dev;
-	mtk->vbus = devm_regulator_get(dev, "vbus");
-	if (IS_ERR(mtk->vbus)) {
-		dev_err(dev, "fail to get vbus\n");
-		return PTR_ERR(mtk->vbus);
-	}
 
-	mtk->vusb33 = devm_regulator_get(dev, "vusb33");
-	if (IS_ERR(mtk->vusb33)) {
-		dev_err(dev, "fail to get vusb33\n");
-		return PTR_ERR(mtk->vusb33);
-	}
+	ret = xhci_mtk_vregs_get(mtk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
 	ret = xhci_mtk_clks_get(mtk);
 	if (ret)
@@ -564,7 +542,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	ret = xhci_mtk_ldos_enable(mtk);
+	ret = regulator_bulk_enable(BULK_VREGS_NUM, mtk->supplies);
 	if (ret)
 		goto disable_pm;
 
@@ -673,7 +651,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
 
 disable_ldos:
-	xhci_mtk_ldos_disable(mtk);
+	regulator_bulk_disable(BULK_VREGS_NUM, mtk->supplies);
 
 disable_pm:
 	pm_runtime_put_noidle(dev);
@@ -701,7 +679,7 @@ static int xhci_mtk_remove(struct platform_device *pdev)
 	usb_put_hcd(hcd);
 	xhci_mtk_sch_exit(mtk);
 	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
-	xhci_mtk_ldos_disable(mtk);
+	regulator_bulk_disable(BULK_VREGS_NUM, mtk->supplies);
 
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 4b1ea89f959a..ffd4b493b4ba 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -11,10 +11,12 @@
 
 #include <linux/clk.h>
 #include <linux/hashtable.h>
+#include <linux/regulator/consumer.h>
 
 #include "xhci.h"
 
 #define BULK_CLKS_NUM	5
+#define BULK_VREGS_NUM	2
 
 /* support at most 64 ep, use 32 size hash table */
 #define SCH_EP_HASH_BITS	5
@@ -150,9 +152,8 @@ struct xhci_hcd_mtk {
 	int num_u3_ports;
 	int u2p_dis_msk;
 	int u3p_dis_msk;
-	struct regulator *vusb33;
-	struct regulator *vbus;
 	struct clk_bulk_data clks[BULK_CLKS_NUM];
+	struct regulator_bulk_data supplies[BULK_VREGS_NUM];
 	unsigned int has_ippc:1;
 	unsigned int lpm_support:1;
 	unsigned int u2_lpm_disable:1;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
