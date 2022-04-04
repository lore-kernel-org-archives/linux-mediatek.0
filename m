Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F65C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CQsS3Jck/D2L3AR4VWX7zK54SjlupsMJ4Hm6vo6fbAA=; b=MKJ5MfrgvwOmaH
	wWFCn1PQxh3jEzf3KQr8WLLgphRqgISggvw0FeZnqfQfHjMTOYpAX6Do2SeA8Ywmq8k35NMyo5k2+
	S08J+t+Yl+ySmCJICsgLDxLX1Mo+qssByQG3syHbzr36j9wC8tPp43med2YEA3iDh5NXbjk5pCP3i
	zFHUVasC7lVjJmaxFJO3qWC+viMp3aO/fF6DqP0uAI5YeW4BkDOuhN+Jfd9zUm4tyjFR27jbIZFfj
	s+gJMNiObfMHjI6j+khPMlB7t7whW4MRL2T6jHc6X2rtV9OP/9Bxsiz+oc2AouKS47s1erOTWdg57
	cFUhkH/pBfCYxNeF9bkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbO7r-00FRWe-KO; Mon, 04 Apr 2022 14:56:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbO7g-00FRTB-TF; Mon, 04 Apr 2022 14:56:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 169781F44CDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649084163;
 bh=L53ghdeLUWVQzV2A3ZJW1vrW7GualNW/UOaTx+cxwGc=;
 h=From:To:Cc:Subject:Date:From;
 b=G64xZBO+iYwNgp1QUxsfrqodzBDNqX27J415NbYquxbYvI0GghMuCpBRIke5XlCSt
 57m7fD99GFJAan7qJ09f6Ih4AZvUIzITKpNd/uOCTtJWmEnkGlp2m653BIEwucjjIf
 g8IoGHT6tlQmlBJAheW21CbhtWVS95Qs84aTxLeomYG5WO/9jM/O7SQ6YWC/FHDMdB
 9F5GKaWFfoeWuFzUe0EQex+viItxcKfMSte0igad3e1QCY552D8JI0KmAXIN/mWE30
 zbh6OAJQilOtmDzbhRIWDj55hyFGlh67cdZXLGz8Lrjxkowr1IMW4S6Ah4ymp2iQH0
 Dv/WjoMPSMcXg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: b-liu@ti.com
Cc: gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] usb: musb: mediatek: Use clk_bulk API to simplify clock
 operations
Date: Mon,  4 Apr 2022 16:55:58 +0200
Message-Id: <20220404145558.93340-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_075605_112879_1B16C514 
X-CRM114-Status: GOOD (  12.11  )
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

This driver uses three clocks and there's no special handling, they're
either enabled or disabled sequentially: migrate to the clk_bulk API
to simplify clock handling.

This patch brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/usb/musb/mediatek.c | 73 +++++--------------------------------
 1 file changed, 10 insertions(+), 63 deletions(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index 1aeb34dbe24f..cad991380b0c 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -36,6 +36,8 @@
 #define DMA_INTR_STATUS_MSK	GENMASK(7, 0)
 #define DMA_INTR_UNMASK_SET_MSK	GENMASK(31, 24)
 
+#define MTK_MUSB_CLKS_NUM	3
+
 struct mtk_glue {
 	struct device *dev;
 	struct musb *musb;
@@ -44,9 +46,7 @@ struct mtk_glue {
 	struct phy *phy;
 	struct usb_phy *xceiv;
 	enum phy_mode phy_mode;
-	struct clk *main;
-	struct clk *mcu;
-	struct clk *univpll;
+	struct clk_bulk_data clks[MTK_MUSB_CLKS_NUM];
 	enum usb_role role;
 	struct usb_role_switch *role_sw;
 };
@@ -55,64 +55,11 @@ static int mtk_musb_clks_get(struct mtk_glue *glue)
 {
 	struct device *dev = glue->dev;
 
-	glue->main = devm_clk_get(dev, "main");
-	if (IS_ERR(glue->main)) {
-		dev_err(dev, "fail to get main clock\n");
-		return PTR_ERR(glue->main);
-	}
-
-	glue->mcu = devm_clk_get(dev, "mcu");
-	if (IS_ERR(glue->mcu)) {
-		dev_err(dev, "fail to get mcu clock\n");
-		return PTR_ERR(glue->mcu);
-	}
-
-	glue->univpll = devm_clk_get(dev, "univpll");
-	if (IS_ERR(glue->univpll)) {
-		dev_err(dev, "fail to get univpll clock\n");
-		return PTR_ERR(glue->univpll);
-	}
-
-	return 0;
-}
+	glue->clks[0].id = "main";
+	glue->clks[1].id = "mcu";
+	glue->clks[2].id = "univpll";
 
-static int mtk_musb_clks_enable(struct mtk_glue *glue)
-{
-	int ret;
-
-	ret = clk_prepare_enable(glue->main);
-	if (ret) {
-		dev_err(glue->dev, "failed to enable main clock\n");
-		goto err_main_clk;
-	}
-
-	ret = clk_prepare_enable(glue->mcu);
-	if (ret) {
-		dev_err(glue->dev, "failed to enable mcu clock\n");
-		goto err_mcu_clk;
-	}
-
-	ret = clk_prepare_enable(glue->univpll);
-	if (ret) {
-		dev_err(glue->dev, "failed to enable univpll clock\n");
-		goto err_univpll_clk;
-	}
-
-	return 0;
-
-err_univpll_clk:
-	clk_disable_unprepare(glue->mcu);
-err_mcu_clk:
-	clk_disable_unprepare(glue->main);
-err_main_clk:
-	return ret;
-}
-
-static void mtk_musb_clks_disable(struct mtk_glue *glue)
-{
-	clk_disable_unprepare(glue->univpll);
-	clk_disable_unprepare(glue->mcu);
-	clk_disable_unprepare(glue->main);
+	return devm_clk_bulk_get(dev, MTK_MUSB_CLKS_NUM, glue->clks);
 }
 
 static int mtk_otg_switch_set(struct mtk_glue *glue, enum usb_role role)
@@ -390,7 +337,7 @@ static int mtk_musb_exit(struct musb *musb)
 	mtk_otg_switch_exit(glue);
 	phy_power_off(glue->phy);
 	phy_exit(glue->phy);
-	mtk_musb_clks_disable(glue);
+	clk_bulk_disable_unprepare(MTK_MUSB_CLKS_NUM, glue->clks);
 
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
@@ -528,7 +475,7 @@ static int mtk_musb_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	ret = mtk_musb_clks_enable(glue);
+	ret = clk_bulk_prepare_enable(MTK_MUSB_CLKS_NUM, glue->clks);
 	if (ret)
 		goto err_enable_clk;
 
@@ -551,7 +498,7 @@ static int mtk_musb_probe(struct platform_device *pdev)
 	return 0;
 
 err_device_register:
-	mtk_musb_clks_disable(glue);
+	clk_bulk_disable_unprepare(MTK_MUSB_CLKS_NUM, glue->clks);
 err_enable_clk:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
