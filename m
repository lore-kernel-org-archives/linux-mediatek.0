Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47387C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/S05PTONsUDXQH/53Ay+iMTzYpn16xDxy7lh5wY6T0=; b=yst9XaMbH1eu8S4MiJbu6c1gzg
	CDte/EjGnEl4L3x2eYS1mZ2lAw8TDvdQLwC+023ZaD3HMek/b2qLGvYBq506wQZiQPZzU8k3ZTOEl
	YNC64ikETsXC/uNu+DbSMnDtueBwVn7rbm3xxBhfx5Pjy+mnCxWPx9LmfjN4Hrj9Zhu0xpY8O5bfQ
	CLOrZIZfq/CKeoPBsmNxdlZ6gNp01qZMRPDliUThs7THiqH1RWqDyaZM6Di7pkTgBM+s3uBvB2lDC
	mTXuT1Yt8r/4SrS5NiRao6d8xZtGoBiVV0wMsriVpw/Pqpzaj2PgFJqQ9hOT1k+URvk8hMY16Z+MY
	cFeANA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2c4-0000000AogZ-3dd5;
	Wed, 03 Jul 2024 16:13:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2bf-0000000AoUt-0pLh;
	Wed, 03 Jul 2024 16:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EFDC6231E;
	Wed,  3 Jul 2024 16:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F63C2BD10;
	Wed,  3 Jul 2024 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720023198;
	bh=OgKWE5raRMdQzYYFIeI9oRWJDLJrgr/vHR/+EGZ8/l4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CM5Sp7VS4JHQPMl34jmwBebrlTfbmNF/sxRFKNCLpCyfiPPTa0GJ0N+39ehNTJ6Ka
	 pK3JEvhgZWeg/kOj9FDm+R3ODmKFeTjGcOXSeLMgSLComuuXkmvWTzvk/hbNFan/hP
	 XsGzOGb2LQeYGarYFUg3lh6jZWhYwIO43QM+3ntd0gH9NwqeWWvydzSijJ1FmTatop
	 u8xqnorZHslzqg+JE4trupmXi5rMMsg1IHW/Z8YADdMKLUcjHo3UKz8FHEc++iGiA6
	 6vAfryIgRTx6yUVnHdhJD5HPwhtW+Y2DtEyy+qGggkB4scs2WXn6Bo8aXuKi3iSsfw
	 FA/tHw4tHYqng==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	dd@embedd.com,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v4 2/4] PCI: mediatek-gen3: Add mtk_gen3_pcie_pdata data structure
Date: Wed,  3 Jul 2024 18:12:42 +0200
Message-ID: <c193d1a87505d045e2e0ef33317bce17012ee095.1720022580.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720022580.git.lorenzo@kernel.org>
References: <cover.1720022580.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_091319_357885_8893ABF5 
X-CRM114-Status: GOOD (  14.61  )
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

Introduce mtk_gen3_pcie_pdata data structure in order to define
multiple callbacks for each supported SoC. This is a preliminary
patch to introduce EN7581 PCIe support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 24 ++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 975b3024fb08..db0210803731 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -100,6 +100,16 @@
 #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
+struct mtk_gen3_pcie;
+
+/**
+ * struct mtk_gen3_pcie_pdata - differentiate between host generations
+ * @power_up: pcie power_up callback
+ */
+struct mtk_gen3_pcie_pdata {
+	int (*power_up)(struct mtk_gen3_pcie *pcie);
+};
+
 /**
  * struct mtk_msi_set - MSI information for each set
  * @base: IO mapped register base
@@ -131,6 +141,7 @@ struct mtk_msi_set {
  * @msi_sets: MSI sets information
  * @lock: lock protecting IRQ bit map
  * @msi_irq_in_use: bit map for assigned MSI IRQ
+ * @soc: pointer to SoC-dependent operations
  */
 struct mtk_gen3_pcie {
 	struct device *dev;
@@ -151,6 +162,8 @@ struct mtk_gen3_pcie {
 	struct mtk_msi_set msi_sets[PCIE_MSI_SET_NUM];
 	struct mutex lock;
 	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
+
+	const struct mtk_gen3_pcie_pdata *soc;
 };
 
 /* LTSSM state in PCIE_LTSSM_STATUS_REG bit[28:24] */
@@ -904,7 +917,7 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	usleep_range(10, 20);
 
 	/* Don't touch the hardware registers before power up */
-	err = mtk_pcie_power_up(pcie);
+	err = pcie->soc->power_up(pcie);
 	if (err)
 		return err;
 
@@ -939,6 +952,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	pcie = pci_host_bridge_priv(host);
 
 	pcie->dev = dev;
+	pcie->soc = device_get_match_data(dev);
 	platform_set_drvdata(pdev, pcie);
 
 	err = mtk_pcie_setup(pcie);
@@ -1054,7 +1068,7 @@ static int mtk_pcie_resume_noirq(struct device *dev)
 	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
 	int err;
 
-	err = mtk_pcie_power_up(pcie);
+	err = pcie->soc->power_up(pcie);
 	if (err)
 		return err;
 
@@ -1074,8 +1088,12 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 				  mtk_pcie_resume_noirq)
 };
 
+static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
+	.power_up = mtk_pcie_power_up,
+};
+
 static const struct of_device_id mtk_pcie_of_match[] = {
-	{ .compatible = "mediatek,mt8192-pcie" },
+	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
-- 
2.45.2


