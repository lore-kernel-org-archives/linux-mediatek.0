Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C642C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h05dXskwiuRy97ZT3NGbcCELK9sFafx+x6G0NU3Hh9M=; b=N7rLWjzcLefMLB
	lCtr+ZUbaySkKq0dexRuL7Df9yKKtwFHUOFzR2GyqAPjNmzukbJYtM+n1k7nAnlmTlI5KbPgY8YQc
	dNENsSDGR3cjeDZLpxF4B2eKzj2fzsPCDUM6ijquBv9TixaQshPr0TglTfoV6VBG/yUltabd9a9m1
	mPE4tk0LFqJMczLzIQV1jPIZ9eqQLOneabTgQnWgj7jwvE6fbrbkm/8bT6MIfwmprgiiF3T92Rkm/
	aBa6JA4PM2THsaRJ919DkVi4D3v9myGvoEpMEwGNEUMNowVqGywBbRcZ1UntorGwo+HMgKOaNf1uK
	7uXCx5G1I/4mfW/6Oh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4KRL-008lNd-2o; Mon, 03 Jan 2022 10:19:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4KQk-008lBV-Am; Mon, 03 Jan 2022 10:19:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A2B1D1F41DBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641205145;
 bh=NBhQzC7OMqyb+Ilc8knTIcL9ykR6cUFQIBi62GPatTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kg9l0L1xijTRbQcpXp1auJkQF/p+KGv9DH8hFUCnOKkMDzhB/D9jVdYiFne3fc/TZ
 uDKLjMOfpSLdGpgUvcQeC4YmEQvdmzlL2XaFN4PlBOVClWkZiFtOXqQ80qrs/B81Bu
 itSNt17yWQwHB+BsPpTkD6XEq53wi/sPvpq6kQZzzBVqc6Z4UeOP0XJQudt13k1Gkh
 285O+rMvz9Tf34P6fDAYD2Ru79C3FGkpKEf6imp65NyYtdJYKgK9XJ6YokRh+/hH/t
 lOivoEsXVAhF1kmHgBsL0knDvZxt6Caee52XaxWn8ckq6h8QnIwwliyS8Bna8aRrBw
 l5wkfym7S8v1A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/3] pinctrl: mediatek: pinctrl-mtk-common: Simplify with
 dev_err_probe()
Date: Mon,  3 Jan 2022 11:18:55 +0100
Message-Id: <20220103101855.17350-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_021906_537124_DD353D26 
X-CRM114-Status: GOOD (  12.00  )
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
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 5f7c421ab6e7..6f8dfa6ae5a0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1013,10 +1013,12 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	return mtk_eint_do_init(pctl->eint);
 }
 
+/* This is used as a common probe function */
 int mtk_pctrl_init(struct platform_device *pdev,
 		const struct mtk_pinctrl_devdata *data,
 		struct regmap *regmap)
 {
+	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *pctl;
 	struct device_node *np = pdev->dev.of_node, *node;
@@ -1030,10 +1032,9 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	platform_set_drvdata(pdev, pctl);
 
 	prop = of_find_property(np, "pins-are-numbered", NULL);
-	if (!prop) {
-		dev_err(&pdev->dev, "only support pins-are-numbered format\n");
-		return -EINVAL;
-	}
+	if (!prop)
+		return dev_err_probe(dev, -EINVAL,
+				     "only support pins-are-numbered format\n");
 
 	node = of_parse_phandle(np, "mediatek,pctl-regmap", 0);
 	if (node) {
@@ -1043,8 +1044,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	} else if (regmap) {
 		pctl->regmap1  = regmap;
 	} else {
-		dev_err(&pdev->dev, "Pinctrl node has not register regmap.\n");
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL, "Cannot find pinctrl regmap.\n");
 	}
 
 	/* Only 8135 has two base addr, other SoCs have only one. */
@@ -1057,10 +1057,8 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	pctl->devdata = data;
 	ret = mtk_pctrl_build_state(pdev);
-	if (ret) {
-		dev_err(&pdev->dev, "build state failed: %d\n", ret);
-		return -EINVAL;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "build state failed\n");
 
 	pins = devm_kcalloc(&pdev->dev, pctl->devdata->npins, sizeof(*pins),
 			    GFP_KERNEL);
@@ -1081,10 +1079,9 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	pctl->pctl_dev = devm_pinctrl_register(&pdev->dev, &pctl->pctl_desc,
 					       pctl);
-	if (IS_ERR(pctl->pctl_dev)) {
-		dev_err(&pdev->dev, "couldn't register pinctrl driver\n");
-		return PTR_ERR(pctl->pctl_dev);
-	}
+	if (IS_ERR(pctl->pctl_dev))
+		return dev_err_probe(dev, PTR_ERR(pctl->pctl_dev),
+				     "Couldn't register pinctrl driver\n");
 
 	pctl->chip = devm_kzalloc(&pdev->dev, sizeof(*pctl->chip), GFP_KERNEL);
 	if (!pctl->chip)
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
