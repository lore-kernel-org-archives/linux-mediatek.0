Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702B2C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzFokJBCRU8KuM6OSzAEcgnm/pNcLHIBMzhlTjhj5ks=; b=IWqL0E8EKSyByTqqrkECpd8GhQ
	Z88dHRasOwVHYX4gv0yVsNFoW3CZEfe5wRMNnbJtfV/8ZuaB/mhb3KhQk1xD7lywjaQUTe1YfCBHt
	VE3brsv40fasb57fO82wH+S1uJoKfbSjhRkxwJ97SzyYM0BhV/MXqwrwMNKgqSDJw/LeLM+flMg1k
	1F1k6c2chvW6ZWCR61xoNdgqv8mOA4S4PxSM7ukJF/nKT76+vc1C7rp0WT4GSAKbck6PvFd88mQzu
	MsBot8aJJOArHIE4sYXPQTiSGv3VG67ZMXnrVWHgQy0CIhU73I3JENzodSyQWrQGvn9acwCzbRea8
	Nb02MPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puXF9-007ffl-37;
	Thu, 04 May 2023 11:35:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puXF4-007fd0-1V;
	Thu, 04 May 2023 11:35:23 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 814F966056D2;
	Thu,  4 May 2023 12:35:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683200118;
	bh=lNz84nkQPkKr7TAz+egLElMi8V+budLVrygOS7c2k94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sq9Gg07A2+ggbFLIA2eh0yDroW+O7rNKaLQTrhpuhVgPfdsgC2GGb5nlNTUFZrf4Y
	 RW5Bsn91z2/l7+bd6kxQRU/3YjMczFDwim5t4RKVaJIB6s7TZkJg82b/fIDMR8vWms
	 iPL2epMOl1nVgJ8dX4MA+SgbENgspRuUvZvWsVqhTGVaSlYAw2D+aa+x3BmNf6gqTw
	 fNDEsNYix78N1x2Ns8guR6k+3cB4jZ+8ZvvRU+gOzGfB32NrrrqFEhnzrvX9IGamj+
	 Icoi2cuhLYeprWoCyLi759E/eYB28LWHmSQCZ9zzRwxkQVWWJJn0qa/rf6gto0aDmA
	 P7Uxg+/ISHT2A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ryder.lee@mediatek.com
Cc: jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] PCI: mediatek-gen3: Assert MAC reset only if PHY reset also present
Date: Thu,  4 May 2023 13:35:09 +0200
Message-Id: <20230504113509.184633-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504113509.184633-1-angelogioacchino.delregno@collabora.com>
References: <20230504113509.184633-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_043522_632047_90A375E1 
X-CRM114-Status: GOOD (  14.82  )
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

Some SoCs have two PCI-Express controllers: in the case of MT8195,
one of them is using a dedicated PHY, but the other uses a combo PHY
that is shared with USB and in that case the PHY cannot be reset
from the PCIe driver, or USB functionality will be unable to resume.

Resetting the PCIe MAC without also resetting the PHY will result in
a full system lockup at PCIe resume time and the only option to
resume operation is to hard reboot the system (with a PMIC cut-off).

To resolve this issue, check if we've got both a PHY and a MAC reset
and, if not, never assert resets at PM suspend time: in that case,
the link is still getting powered down as both the clocks and the
power domains will go down anyway.

Fixes: d537dc125f07 ("PCI: mediatek-gen3: Add system PM support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 25 ++++++++++++++-------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 52f52ca5db71..480621ca1450 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -859,17 +859,26 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 	return err;
 }
 
-static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
+static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie, bool is_suspend)
 {
+	bool suspend_reset_supported = pcie->mac_reset && pcie->phy_reset;
+
 	clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
 
 	pm_runtime_put_sync(pcie->dev);
 	pm_runtime_disable(pcie->dev);
-	reset_control_assert(pcie->mac_reset);
+
+	/*
+	 * Assert MAC reset only if we also got a PHY reset, otherwise
+	 * the system will lockup at PM resume time.
+	 */
+	if (is_suspend && suspend_reset_supported)
+		reset_control_assert(pcie->mac_reset);
 
 	phy_power_off(pcie->phy);
 	phy_exit(pcie->phy);
-	reset_control_assert(pcie->phy_reset);
+	if (is_suspend && suspend_reset_supported)
+		reset_control_assert(pcie->phy_reset);
 }
 
 static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
@@ -905,7 +914,7 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	return 0;
 
 err_setup:
-	mtk_pcie_power_down(pcie);
+	mtk_pcie_power_down(pcie, false);
 
 	return err;
 }
@@ -936,7 +945,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	err = pci_host_probe(host);
 	if (err) {
 		mtk_pcie_irq_teardown(pcie);
-		mtk_pcie_power_down(pcie);
+		mtk_pcie_power_down(pcie, false);
 		return err;
 	}
 
@@ -954,7 +963,7 @@ static int mtk_pcie_remove(struct platform_device *pdev)
 	pci_unlock_rescan_remove();
 
 	mtk_pcie_irq_teardown(pcie);
-	mtk_pcie_power_down(pcie);
+	mtk_pcie_power_down(pcie, false);
 
 	return 0;
 }
@@ -1023,7 +1032,7 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 	dev_dbg(pcie->dev, "entered L2 states successfully");
 
 	mtk_pcie_irq_save(pcie);
-	mtk_pcie_power_down(pcie);
+	mtk_pcie_power_down(pcie, true);
 
 	return 0;
 }
@@ -1039,7 +1048,7 @@ static int mtk_pcie_resume_noirq(struct device *dev)
 
 	err = mtk_pcie_startup_port(pcie);
 	if (err) {
-		mtk_pcie_power_down(pcie);
+		mtk_pcie_power_down(pcie, false);
 		return err;
 	}
 
-- 
2.40.1


