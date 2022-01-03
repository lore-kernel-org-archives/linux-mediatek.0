Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD769C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x6dNDH337aR9Cy78g5e8WlbD0rjAq2MwOIRUZA5n4NU=; b=RSSYBS85aUoQUe
	pOveKuqeref2pvsFxzRMhVs5iDoizUTjJLjVgEPHR0t3q58mHDw7CLSTww5hknGYKvL3AkomIRruh
	mvY8dnUY/pzCHhMTiS6RH7+fP2j/+NN8TRA9NQX7XXZvxBqvbgYexfMXjBOBMxv4enot+hsnErWuQ
	ql+NYMJkC1tdIjG5BWXFfWkcIgCEBfJhLSIpAmXYfFH25sxDDNQ11bMturJxi8P+1iXa1LGluD7bV
	M0E3N5lSkcruy3nPr85juhJUmn/r/yGR2DiAamPkTW6+VyJSKgv2ATln6nu3YndLuV6EnAyYlKBkI
	aldF8xFD4x9SjSxKwASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4KQw-008lG3-C5; Mon, 03 Jan 2022 10:19:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4KQj-008lB9-3s; Mon, 03 Jan 2022 10:19:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 76E7F1F41D81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641205143;
 bh=c7Kt7fJqy3XK6npICeqo8aKlK7uv/fvZHkx0HfPLFvI=;
 h=From:To:Cc:Subject:Date:From;
 b=Xe7x8sfNccqTWEMFHcanwwvnmtUGxddKzG7SkdpwV+Cw6dQbCbST09zPX+ELHmGhx
 6JacueS1xPOAQHVDXSazsUZA7D/USuqyE7zeElNx1bPG4nGFwuXEQsxwAGq6+D+gF2
 mUIaDihRZ8DT/d4e7V5uelQha8x5unUiZ78c/DhlwZBlp6zd3JvY5OMaZ8xSmOPWLY
 Y1/byQcSrQzKRKfPoRtHkQvJUK9+uV8w2QZMhw3VgcN71syFdBKSNO5zgDmp1+TIJs
 GYgdMs87g4R/wdAEmFdKTqlugbxzwss7ZarV3UaRHP6V4UWm19ufA0JzMs14JUBVR0
 AJWjzpcgLf5HA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/3] pinctrl: mediatek: pinctrl-moore: Simplify with
 dev_err_probe()
Date: Mon,  3 Jan 2022 11:18:53 +0100
Message-Id: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_021905_341263_7BF07966 
X-CRM114-Status: GOOD (  11.25  )
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

Use the dev_err_probe() helper to simplify error handling during probe.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 25 +++++++++---------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index ad3b67163973..8531206159b7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -606,6 +606,7 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc)
 {
+	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
 	int err, i;
@@ -617,11 +618,9 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 	hw->soc = soc;
 	hw->dev = &pdev->dev;
 
-	if (!hw->soc->nbase_names) {
-		dev_err(&pdev->dev,
+	if (!hw->soc->nbase_names)
+		return dev_err_probe(dev, -EINVAL,
 			"SoC should be assigned at least one register base\n");
-		return -EINVAL;
-	}
 
 	hw->base = devm_kmalloc_array(&pdev->dev, hw->soc->nbase_names,
 				      sizeof(*hw->base), GFP_KERNEL);
@@ -666,17 +665,13 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	/* Setup groups descriptions per SoC types */
 	err = mtk_build_groups(hw);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to build groups\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to build groups\n");
 
 	/* Setup functions descriptions per SoC types */
 	err = mtk_build_functions(hw);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to build functions\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to build functions\n");
 
 	/* For able to make pinctrl_claim_hogs, we must not enable pinctrl
 	 * until all groups and functions are being added one.
@@ -692,10 +687,8 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	/* Build gpiochip should be after pinctrl_enable is done */
 	err = mtk_build_gpiochip(hw, pdev->dev.of_node);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to add gpio_chip\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to add gpio_chip\n");
 
 	platform_set_drvdata(pdev, hw);
 
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
