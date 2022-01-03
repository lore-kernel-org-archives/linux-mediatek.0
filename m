Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1399C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 10:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPRSP0fS/C7Zry+3nqw1aTH0f+a/kHL6jDPNiEiDVsI=; b=mQ+Tzv6I9ePFzZ
	4/hQ8smF9YdE0Siqx0CG+VTSvfGxaad2md6SFDP0zxaVX0DCTM0Cr1CnYqCFnQHtl5OfE28q2vn0G
	YU8aStlPcs53i1miBWn1hnl2c2BZeCesAvkBXnm7wK6KyeueEYhSbQhgx1WOd9pj/+3OUvhmFA/6n
	7LwiJSZN+wRSwkQpUIqFwAUz+wSp6DgKk4S14E+e5Zj2UKv5FF0+lqunHQLQignWAJdLtzyaoBDCM
	PTqXj1DxpkqnlmSmrAZE1rZH/p+H9Nhr3XiGsK3zxdz2OekzHn+IsdObKIFlGSWrxf5hTjbs0kLoe
	t4ajmlZkDeWCx/DnjmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4KR9-008lJ4-35; Mon, 03 Jan 2022 10:19:31 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4KQj-008lBC-Jb; Mon, 03 Jan 2022 10:19:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 126CC1F41D8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641205144;
 bh=mGsQoC3yAKQfojVeguaBxYZrtaLtq1wmqI0wIpEb3gw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PcphB17zDrBeDVMj1gM6wEFjcxGh4VuFeag/FNaH7oBscazIGHE628ONwKpQeM6to
 ZNSWLmdMeP8455P9S7qadtUxc4nXqSADKOBij0mjIUrrEyJiT/6az+ThZQRTRS+Ear
 ht6ZPsVuTX5oC2MtrzXJsN6lbqOU3hdeacoU7e2Ff6edQDmxKYOWIn3k1N6/GPowcd
 TUIbVdJ6XV3ShSUZSk0LduMILDp800CVegTWbaT0YFyzy12MaWi5WT8LuqdE+m0M/k
 dTGNSHUA7zCKQkVIGPBh36NUQpz0lxTgj/p7b0T/+gCa9fbu3Qy9RW6OQSKYesAXBF
 vliDnPYjG6zKA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/3] pinctrl: mediatek: pinctrl-paris: Simplify with
 dev_err_probe()
Date: Mon,  3 Jan 2022 11:18:54 +0100
Message-Id: <20220103101855.17350-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_021905_810272_F308BD75 
X-CRM114-Status: GOOD (  12.39  )
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
 drivers/pinctrl/mediatek/pinctrl-paris.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 4c6f6d967b18..70849d393917 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -956,6 +956,7 @@ static int mtk_pctrl_build_state(struct platform_device *pdev)
 int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc)
 {
+	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
 	int err, i;
@@ -968,11 +969,9 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
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
@@ -997,10 +996,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 	spin_lock_init(&hw->lock);
 
 	err = mtk_pctrl_build_state(pdev);
-	if (err) {
-		dev_err(&pdev->dev, "build state failed: %d\n", err);
-		return -EINVAL;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "build state failed\n");
 
 	/* Copy from internal struct mtk_pin_desc to register to the core */
 	pins = devm_kmalloc_array(&pdev->dev, hw->soc->npins, sizeof(*pins),
@@ -1038,10 +1035,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
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
