Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD7EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ad/Czb8y13AfUjekHVAQgiK0ZhegVAqp39GfWrD8gIc=; b=oJZ3gmug0QNqYt
	MD8ZNrG6ET5z9OguC8bTCBZBigOR25QKOApKnBQ4WNamdyEght2+fyQARG+qM/yIIBwz8q028osGd
	IlxOjuZduD3OpGBOEEYkkf7YT8BfC1QFqlSnMwOUbDmp/NSesKdNsSJaqDQRJ3xFUQHHWZznXxPk2
	EF/Cz2+s8niW4ZdferoB3Bh0315YXtMXgF0o+yye+Tn3J6uxvD3Enmw/jG1PLafrQesjJobOWLOcJ
	TPCvIivn7mhxaNK+23Vi5gnozUj2hcIGRxhAQAsWMCO2fM2Zo3b5aoVaVGxFLIrAMmc9WAZWkEd5h
	+WXvyqbQJ9hsBPCK3h6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRX2x-003qpF-4s; Tue, 08 Mar 2022 10:26:27 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnU-003kEl-MK
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:32 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so1944259pju.2
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zXk7G6JY4X+JwjWY48i+9FfgXzOs0xnKY40nTgz7InE=;
 b=Iih/7wB0+IpP36es4iTqigsioyu2iHjzDuVZnq/qs9MyOXwxGmVBx7sOTDb5AhnyO+
 2sZwP/aYAtauLIJACxh4+PVzOkF3OJzIatEGocvS1oRGisfVTo3n/ESZu+QrMRY72nDH
 We3fU8biGRDQ2jLWN1UagC6QXVPE59SclSHNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zXk7G6JY4X+JwjWY48i+9FfgXzOs0xnKY40nTgz7InE=;
 b=OaP6F/JZppLdkqJIsa9xuOqmVB3vaqzdbDwWayN/TXGrmY0PRbdrIU8GuxVF4/nQkk
 RgrcVJAuZzkEb8RbSh9PxR0wmPHITdir2GwO9/CscqTG+kfwmQWcZgB1XZtoEB/bqyKT
 1BpNKMvCTt2PEAieqFfL3Dodhq4EQ53gzp5BWZ0aGoH2C7JdXXClkkQq1DR4T3znn5aT
 bniEI0Q5zIyIaCD4wTDgyCKjOXj6IehAfwwqCGD46SLwf9z4/ZrQKRq0c9ytZBL7bN7M
 lPKtXT/PbJqa3G3CmyhOY/risAwwHbSvtmU8R9sQRfjdOGAM4kQaSTAKP1Tpywdjo6FM
 /uZA==
X-Gm-Message-State: AOAM5324YdtoaXNyNpBIshMRKMQZwfGk8Q0E79l91QruRlIJXR9kmUTf
 GIqkLfVDY8rruyzbDvM0fu/sQQ==
X-Google-Smtp-Source: ABdhPJw/CHBw7tkeZMpzpsFv+JZ9TCc08ybAM2WlWG6+8xZ5vVVTWpE3LRP4Tr6krv+ObbHBQi9ZPA==
X-Received: by 2002:a17:903:291:b0:14d:522c:fe3d with SMTP id
 j17-20020a170903029100b0014d522cfe3dmr16734037plr.100.1646734226709; 
 Tue, 08 Mar 2022 02:10:26 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:26 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 11/11] pinctrl: mediatek: pinctrl-mtk-common: Simplify with
 dev_err_probe()
Date: Tue,  8 Mar 2022 18:09:56 +0800
Message-Id: <20220308100956.2750295-12-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021028_815211_661364DB 
X-CRM114-Status: GOOD (  13.26  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Use the dev_err_probe() helper to simplify error handling during probe.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
