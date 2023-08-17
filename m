Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C317C05052
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 02:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTF5GVNXzUVfWTUpIMbtnImlmTSLZCHWRFc13AWUZqo=; b=WNDe7y60Pz9MfOGl8U934dmw3O
	r7tcoq3fi3LZjKuSaj4GKd3ZiJwz9lRyc5gH+EAokurSRaJUL87Bp4v0aDrlx0yrK+5YA6r9RqsSB
	p/6mof2jEfC/zE/rrljLk/jPqWrVtwgJqaloBCQmRGrhPHz66JSGkG1S/ecTRISb0HY4gFmyUgyUj
	Q7uM4O+nzkakaT4eo0gkpjnBVq3T6/fQkTVNo2CLRR/9frTt/QtkdPj70gDBX7swwduh4xe20YZKH
	+04DAkiWuwO6sQFGnIqRdsu2P3jCNdSHcvrMfN5f1GPVXxGN0sxHy0CSmPDu4klw85tLkkFyCC5GA
	BDkFPd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWT1m-005NZA-38;
	Thu, 17 Aug 2023 02:46:26 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWT12-005N0v-12;
	Thu, 17 Aug 2023 02:45:42 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RR8Rz442wzFqjg;
	Thu, 17 Aug 2023 10:42:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:36 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<michal.simek@amd.com>, <vz@mleia.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <michael@walle.cc>, <frank.li@vivo.com>
CC: <robh@kernel.org>, <martin.blumenstingl@googlemail.com>,
	<philmd@linaro.org>, <geert+renesas@glider.be>,
	<u.kleine-koenig@pengutronix.de>, <rogerq@kernel.org>,
	<paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
	<yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
	<christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
	<jinpu.wang@ionos.com>, <lizetao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: [PATCH -next 10/11] mtd: rawnand: vf610_nfc: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:45:08 +0800
Message-ID: <20230817024509.3951629-11-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817024509.3951629-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_194540_807432_BB0AA0D5 
X-CRM114-Status: GOOD (  11.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
prepared and enabled clocks"), it can replace the pair of functions,
devm_clk_get() and clk_prepare_enable() with a single helper function
devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
(or enabled) during the whole lifetime of the driver, it is unnecessary to
unprepare and disable clock explicitly when remove driver or in the error
handling path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index dcdf33dbaef2..1ce9d5c2b1f7 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -834,21 +834,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	if (IS_ERR(nfc->regs))
 		return PTR_ERR(nfc->regs);
 
-	nfc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(nfc->clk))
+	nfc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(nfc->clk)) {
+		dev_err(nfc->dev, "Unable to get and enable clock!\n");
 		return PTR_ERR(nfc->clk);
-
-	err = clk_prepare_enable(nfc->clk);
-	if (err) {
-		dev_err(nfc->dev, "Unable to enable clock!\n");
-		return err;
 	}
 
 	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
-	if (!of_id) {
-		err = -ENODEV;
-		goto err_disable_clk;
-	}
+	if (!of_id)
+		return -ENODEV;
 
 	nfc->variant = (enum vf610_nfc_variant)of_id->data;
 
@@ -858,9 +852,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 			if (nand_get_flash_node(chip)) {
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
-				err = -EINVAL;
 				of_node_put(child);
-				goto err_disable_clk;
+				return -EINVAL;
 			}
 
 			nand_set_flash_node(chip, child);
@@ -869,8 +862,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	if (!nand_get_flash_node(chip)) {
 		dev_err(nfc->dev, "NAND chip sub-node missing!\n");
-		err = -ENODEV;
-		goto err_disable_clk;
+		return -ENODEV;
 	}
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
@@ -880,7 +872,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, nfc);
 	if (err) {
 		dev_err(nfc->dev, "Error requesting IRQ!\n");
-		goto err_disable_clk;
+		return err;
 	}
 
 	vf610_nfc_preinit_controller(nfc);
@@ -892,7 +884,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	/* Scan the NAND chip */
 	err = nand_scan(chip, 1);
 	if (err)
-		goto err_disable_clk;
+		return err;
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -904,8 +896,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 err_cleanup_nand:
 	nand_cleanup(chip);
-err_disable_clk:
-	clk_disable_unprepare(nfc->clk);
 	return err;
 }
 
@@ -918,7 +908,6 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-	clk_disable_unprepare(nfc->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.34.1


