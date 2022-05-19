Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94622C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKBSPi/eQAMaDAVeoWb4eSUGomaYr5FaIk5AtCa0CCk=; b=rc/p1dyT8W5tny
	jkRWdz4CALUYSknrsQG64pfe+JTXjoPVa8aS90LrYkagqVLYPbkyV+udiGYF02kulP+4NBpQ1zk0i
	WZt500WsqRJZZMmQxrXOQcS7cC5/qfYSNFmcOtZZfTikCLA/3tClXmKpGjxDtgaJUl/N3E9n/FImh
	rwcbfU//ZW/gwARX/LfMEwBJ8A90z7udZpZAcdDa3fqHLel4TKKS/HxJi4ViXXhOSlmBSPj+kWWw6
	uou0672gTFEjJX9HjhhdLz3AMVA+RaCoF70dBSlETvLF6dOBNTjM6qULu/RaNBK8yMKsFvXxPMgTu
	8huXghLTYXxWhUxmsJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhXq-007coX-0w; Thu, 19 May 2022 14:54:30 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgX8-0078X2-9u; Thu, 19 May 2022 13:49:44 +0000
Received: by mail-qv1-xf32.google.com with SMTP id l1so4632969qvh.1;
 Thu, 19 May 2022 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnrO70dUCs/Oc7OMcEIdWH7iLvsjXCWCC72jYa5eYxw=;
 b=SMcf/ud4YzavnLXbEf3CLeilcehXyS/OikAfy4rBZBLa5uelJq/tEgXZHnI7OwxeVS
 I+VWoCGqXEF15nq6quDNPYqHR+Eqhu9/tKhMtrKtnMRi4/9H1/ReeETZPq1e+1hbCV6x
 hWB1OlPoBt5R/Dc6u6HEU7Wtq3cl0H/CLqxaNiwUG35t4z28zREp1Ld0rU4WxpirR3be
 /HVvawrmuxwImQomxCZ9a/gqzseTT/0h74/weXPJU3RlrAkVI6w22kNZ7PfIhn6MwznG
 WjIdIz3IQOuvnlp+r+n05kMXn7b2R/0OrCEK1CuZFJOqUSfJ33JmcdLU/dpYZVL5p+JK
 y6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnrO70dUCs/Oc7OMcEIdWH7iLvsjXCWCC72jYa5eYxw=;
 b=B+FaF5LkMAntvOt8Me7TYci0qZk9m9c7vlj484S8V9KdLo671h513VjwtsG/iRrfbN
 BlRPnZogRvWGc5A+Hdbsf7tbnr8T5sKK5iPvEgvpGvE0RXETnQkK9EC4To1vWfzY7qxv
 volk6MH7dbZftsDkhfy9EuGdpdjAY/Mr+Y7yOS32A1W+6vaQrqa18XZ0K/B4X+05AnKT
 JPPLfuM422ocO+BT0GUPGoOxBoOguDehnc8arBeCjzP5ydU6jeObKCE8sjpI1txJKR7a
 iTNI9ji7ptWGG3C/6in6bpmgUQHesUdCEWWXC3qLdKE3/xT4S53X1INLjkqXYAMScn37
 ca9A==
X-Gm-Message-State: AOAM532msG2bZrE3euIEhL4J73R1oE4UH/Hqhl7mfbcFOwh8CNzpQav+
 4GNOOfYOL1IKBcxkPlJUYFRrx2juCU4jlLmOCMs=
X-Google-Smtp-Source: ABdhPJx0lMc/1idQ+eV6SdLAcY2CtRWRLioxh54EEVtEWCHH+rVBJcqEEESx886eNWkxmjkSKy4v0g==
X-Received: by 2002:a05:6214:529e:b0:461:d40a:37d9 with SMTP id
 kj30-20020a056214529e00b00461d40a37d9mr4022050qvb.50.1652968178744; 
 Thu, 19 May 2022 06:49:38 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a3754c3000000b0069fc13ce23dsm1315024qkb.110.2022.05.19.06.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:49:38 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 3/6] clk: mediatek: reset: Return reset data pointer on
 register
Date: Thu, 19 May 2022 17:47:25 +0400
Message-Id: <20220519134728.456643-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519134728.456643-1-y.oudjana@protonmail.com>
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_064942_475287_714DD91A 
X-CRM114-Status: GOOD (  20.13  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Return a struct mtk_clk_rst_data * when registering a reset
controller in preparation for adding an unregister helper
that will take it as an argument. Make the necessary changes
in drivers that do not currently discard the return value
of register functions.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Dependencies:
- clk: mediatek: Move to struct clk_hw provider APIs (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/ 
- Cleanup MediaTek clk reset drivers and support MT8192/MT8195 (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
- Export required symbols to compile clk drivers as module (single patch)
  https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/

 drivers/clk/mediatek/clk-mt8192.c |  7 +++++--
 drivers/clk/mediatek/clk-mtk.c    |  9 +++++---
 drivers/clk/mediatek/reset.c      | 34 ++++++++++++++++---------------
 drivers/clk/mediatek/reset.h      | 14 +++++++------
 4 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index ebbd2798d9a3..a658a74644de 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1255,6 +1255,7 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
+	struct mtk_clk_rst_data *rst_data;
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
@@ -1265,9 +1266,11 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
 	if (r)
 		goto free_clk_data;
 
-	r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (r)
+	rst_data = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
+	if (IS_ERR(rst_data)) {
+		r = PTR_ERR(rst_data);
 		goto free_clk_data;
+	}
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3a8875b6c37f..1b5591733e2b 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -424,6 +424,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	const struct mtk_clk_desc *mcd;
 	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
+	struct mtk_clk_rst_data *rst_data;
 	int r;
 
 	mcd = of_device_get_match_data(&pdev->dev);
@@ -446,10 +447,12 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, clk_data);
 
 	if (mcd->rst_desc) {
-		r = mtk_register_reset_controller_with_dev(&pdev->dev,
-							   mcd->rst_desc);
-		if (r)
+		rst_data = mtk_register_reset_controller_with_dev(&pdev->dev,
+							   	  mcd->rst_desc);
+		if (IS_ERR(rst_data)) {
+			r = PTR_ERR(rst_data);
 			goto unregister_clks;
+		}
 	}
 
 	return r;
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 290ceda84ce4..09862baf1d57 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -110,8 +110,9 @@ static int reset_xlate(struct reset_controller_dev *rcdev,
 	return data->desc->rst_idx_map[reset_spec->args[0]];
 }
 
-int mtk_register_reset_controller(struct device_node *np,
-				  const struct mtk_clk_rst_desc *desc)
+struct mtk_clk_rst_data
+*mtk_register_reset_controller(struct device_node *np,
+			       const struct mtk_clk_rst_desc *desc)
 {
 	struct regmap *regmap;
 	const struct reset_control_ops *rcops = NULL;
@@ -120,7 +121,7 @@ int mtk_register_reset_controller(struct device_node *np,
 
 	if (!desc) {
 		pr_err("mtk clock reset desc is NULL\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	switch (desc->version) {
@@ -132,18 +133,18 @@ int mtk_register_reset_controller(struct device_node *np,
 		break;
 	default:
 		pr_err("Unknown reset version %d\n", desc->version);
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
 		pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	data->desc = desc;
 	data->regmap = regmap;
@@ -163,14 +164,15 @@ int mtk_register_reset_controller(struct device_node *np,
 	if (ret) {
 		pr_err("could not register reset controller: %d\n", ret);
 		kfree(data);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
-	return 0;
+	return data;
 }
 
-int mtk_register_reset_controller_with_dev(struct device *dev,
-					   const struct mtk_clk_rst_desc *desc)
+struct mtk_clk_rst_data
+*mtk_register_reset_controller_with_dev(struct device *dev,
+					const struct mtk_clk_rst_desc *desc)
 {
 	struct device_node *np = dev->of_node;
 	struct regmap *regmap;
@@ -180,7 +182,7 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
 
 	if (!desc) {
 		dev_err(dev, "mtk clock reset desc is NULL\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	switch (desc->version) {
@@ -192,18 +194,18 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
 		break;
 	default:
 		dev_err(dev, "Unknown reset version %d\n", desc->version);
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "Cannot find regmap %pe\n", regmap);
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	data->desc = desc;
 	data->regmap = regmap;
@@ -223,10 +225,10 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
 	ret = devm_reset_controller_register(dev, &data->rcdev);
 	if (ret) {
 		dev_err(dev, "could not register reset controller: %d\n", ret);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
-	return 0;
+	return data;
 }
 EXPORT_SYMBOL_GPL(mtk_register_reset_controller_with_dev);
 
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 913fe676cba7..7418dd0d046f 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -64,19 +64,21 @@ struct mtk_clk_rst_data {
  * @np: Pointer to device node.
  * @desc: Constant pointer to description of clock reset.
  *
- * Return: 0 on success and errorno otherwise.
+ * Return: Pointer to struct mtk_clk_rst_data on success and error pointer otherwise.
  */
-int mtk_register_reset_controller(struct device_node *np,
-				  const struct mtk_clk_rst_desc *desc);
+struct mtk_clk_rst_data
+*mtk_register_reset_controller(struct device_node *np,
+			       const struct mtk_clk_rst_desc *desc);
 
 /**
  * mtk_register_reset_controller - Register mediatek clock reset controller with device
  * @np: Pointer to device.
  * @desc: Constant pointer to description of clock reset.
  *
- * Return: 0 on success and errorno otherwise.
+ * Return: Pointer to struct mtk_clk_rst_data on success and error pointer otherwise.
  */
-int mtk_register_reset_controller_with_dev(struct device *dev,
-					   const struct mtk_clk_rst_desc *desc);
+struct mtk_clk_rst_data
+*mtk_register_reset_controller_with_dev(struct device *dev,
+					const struct mtk_clk_rst_desc *desc);
 
 #endif /* __DRV_CLK_MTK_RESET_H */
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
