Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MEmdFsLYLCKPXLyUIPdb9VrykBFeXSLpDO8tsbQwz/c=; b=tVU/uAfVip1SGe
	RhxwJGvKGYQlRYlvcjwbfOs21MYHBQgIgbIgzbcp2H9DDX+IXaoLPllULSmk2ox4cS51YvrhuOtbd
	plKO6xcGl/oCpvlyOjC19lkwY7KYxTF6VkPpW5/QhhwO/7vTI9aUYTYPfAAr452qUadQ+xClhkZJn
	0auxGoVq4qw0kHHUJOqj8ACe0uzBI6as3Vx0X3yUIXDqCXuhA0/Mbx3WBJ6TQQYdfwwwG6r5laupV
	HGUMhVCgAoKWe8Lgqd8ebdDO0NJVkXch2nFReO/aDMe4P25LiQdrVrAZOwZjtx8hH2yXAtnaeDbGp
	uGxtEOJvjFV/sBcfNa2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ocm-001fYf-CY; Tue, 18 Jan 2022 13:34:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9oca-001fX0-0J; Tue, 18 Jan 2022 13:34:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 276141F43EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642512835;
 bh=dyzC6UDmMXDPgDAbF5EHytgo8xi3QjCJwOmX3JXKm64=;
 h=From:To:Cc:Subject:Date:From;
 b=eNT0A23wVjHpGk/5uTLMZb/Z5SEaGBovtyUKak0cbUjmQaoRa+JHGaytB3jNQf98l
 V4s3OoxyFz0EBHnK8+9tBXLY7LOleKZGV38LiHMoZciuXbaJFw6XJmk6iLtyeukKY8
 hlzQDxF7zBpcGhm7HWNjY1DE3dr9wPVZhLJ6Dn41eZ8u7YYvgqeI+xUWQT7XGce/fi
 LOguWwYGY36i4OKW2syBzyNQbSbXAtYEOz1WKZUotbvtN+v6GG2uEqoEt13Ocj7G8h
 Y28t5/nzv1CEHdFC6pGozlab8NYL69ArYOZMtQQlgR5aHjXjJ8Mv4LAhQYD7ITgqsI
 FKeDu/gV/2j3A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 matthias.bgg@gmail.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] usb: host: xhci-mtk: Simplify supplies handling with
 regulator_bulk
Date: Tue, 18 Jan 2022 14:33:48 +0100
Message-Id: <20220118133348.111860-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_053400_223511_4DE4681B 
X-CRM114-Status: GOOD (  12.67  )
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
 drivers/usb/host/xhci-mtk.c | 56 ++++++++++++-------------------------
 drivers/usb/host/xhci-mtk.h |  4 +--
 2 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 62c835d446be..3b81931e5b77 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -395,31 +395,6 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
 	return devm_clk_bulk_get_optional(mtk->dev, BULK_CLKS_NUM, clks);
 }
 
-static int xhci_mtk_ldos_enable(struct xhci_hcd_mtk *mtk)
-{
-	int ret;
-
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
-
-static void xhci_mtk_ldos_disable(struct xhci_hcd_mtk *mtk)
-{
-	regulator_disable(mtk->vbus);
-	regulator_disable(mtk->vusb33);
-}
-
 static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
@@ -475,6 +450,10 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
 	return ret;
 }
 
+static const char * const xhci_mtk_supply_names[] = {
+	"vusb33", "vbus",
+};
+
 static const struct xhci_driver_overrides xhci_mtk_overrides __initconst = {
 	.reset = xhci_mtk_setup,
 	.add_endpoint = xhci_mtk_add_ep,
@@ -507,17 +486,18 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mtk->dev = dev;
-	mtk->vbus = devm_regulator_get(dev, "vbus");
-	if (IS_ERR(mtk->vbus)) {
-		dev_err(dev, "fail to get vbus\n");
-		return PTR_ERR(mtk->vbus);
-	}
+	mtk->num_supplies = ARRAY_SIZE(xhci_mtk_supply_names);
+	mtk->supplies = devm_kcalloc(dev, mtk->num_supplies,
+				     sizeof(*mtk->supplies), GFP_KERNEL);
+	if (!mtk->supplies)
+		return -ENOMEM;
 
-	mtk->vusb33 = devm_regulator_get(dev, "vusb33");
-	if (IS_ERR(mtk->vusb33)) {
-		dev_err(dev, "fail to get vusb33\n");
-		return PTR_ERR(mtk->vusb33);
-	}
+	regulator_bulk_set_supply_names(mtk->supplies, xhci_mtk_supply_names,
+					mtk->num_supplies);
+
+	ret = devm_regulator_bulk_get(dev, mtk->num_supplies, mtk->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
 	ret = xhci_mtk_clks_get(mtk);
 	if (ret)
@@ -558,7 +538,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	ret = xhci_mtk_ldos_enable(mtk);
+	ret = regulator_bulk_enable(mtk->num_supplies, mtk->supplies);
 	if (ret)
 		goto disable_pm;
 
@@ -667,7 +647,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
 
 disable_ldos:
-	xhci_mtk_ldos_disable(mtk);
+	regulator_bulk_disable(mtk->num_supplies, mtk->supplies);
 
 disable_pm:
 	pm_runtime_put_noidle(dev);
@@ -695,7 +675,7 @@ static int xhci_mtk_remove(struct platform_device *pdev)
 	usb_put_hcd(hcd);
 	xhci_mtk_sch_exit(mtk);
 	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
-	xhci_mtk_ldos_disable(mtk);
+	regulator_bulk_disable(mtk->num_supplies, mtk->supplies);
 
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 4b1ea89f959a..9b78cd2ba0ac 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -150,9 +150,9 @@ struct xhci_hcd_mtk {
 	int num_u3_ports;
 	int u2p_dis_msk;
 	int u3p_dis_msk;
-	struct regulator *vusb33;
-	struct regulator *vbus;
 	struct clk_bulk_data clks[BULK_CLKS_NUM];
+	struct regulator_bulk_data *supplies;
+	u8 num_supplies;
 	unsigned int has_ippc:1;
 	unsigned int lpm_support:1;
 	unsigned int u2_lpm_disable:1;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
