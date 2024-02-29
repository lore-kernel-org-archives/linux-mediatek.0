Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D478FC54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QDgi3npwvvsIE/jl/CZlsKo1skX2AbE2tJyqxNAme5M=; b=MiGxugd1xBBAHQKbP260tZqwsv
	4ktS8+MBoUCVgYmzA/wwnok2+u+P+ZZ8WnNxsHiH73b0gWcEZ5/+a0zUhSj0g5ed/aggvLBqc+nCu
	sXDVMqr9sadQnDKkD4kiLuD3GqbOvCvXEJbwY0KvobnRMzjJrLKnGNu8lGTYQfaqgBdobeQw0OuI7
	L0mxN7OZIVQOp42746aaDeoeFZ77d0w2iIk14gF6E5MoAsBP7oELeoaUrRiL3QzGLNJhoQCNWJLQX
	rQUUt0QZC28fFoVdPK5bPEltWtl/nYHzMVRimxT+FJhkKHJS45zL8tMBtDalcs6TzTIhQkYglz+pz
	SYl9U8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfcf4-0000000Cs1G-39Qv;
	Thu, 29 Feb 2024 09:25:06 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfceu-0000000Crvw-3kdK;
	Thu, 29 Feb 2024 09:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709198695;
	bh=XZJdntqJVNSHehc3tw3MJZhLBZVBynJltmGB3n7U+yE=;
	h=From:To:Cc:Subject:Date:From;
	b=FE6Hx8J82488o8NSMy1bbp1JLM8R52Ko3p7GNni4bCB77xmEPIgk44wLbS6SwVxv6
	 8+Y0yrSKNWONxg70YavAoO2hCvpM7HBGnwl0pr9RuwWu5uP7Eu/a5ivZsWLDvHgNRQ
	 X+5GQYWRjzAfEoax51YxfNJIjfe7GIo6ZF5fS3GnGLiLvTKpwE2HeI2kyVP2oGdT2a
	 yGJolz2Uy13th8ImVnm+qQOSaWBthYiwdIN1UbC34CFltTH9AQnYMS/PboDgb5q3TN
	 HDruuLr+Uwrgl46Da1blP6ukhCQojMinmmKGstfNDEtc32ddVV21KO19xHMSsbJX3f
	 7lvPlVLP7Iw/w==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 53A923781FE3;
	Thu, 29 Feb 2024 09:24:54 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	nfraprado@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] PCI: mediatek-gen3: Assert MAC reset only if PHY reset also present
Date: Thu, 29 Feb 2024 10:24:49 +0100
Message-ID: <20240229092449.580971-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_012457_137200_C2CD08FE 
X-CRM114-Status: GOOD (  14.33  )
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

Changes in v2:
 - Rebased over next-20240229

 drivers/pci/controller/pcie-mediatek-gen3.c | 25 ++++++++++++++-------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 975b3024fb08..99b5d7a49be1 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -874,17 +874,26 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
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
@@ -920,7 +929,7 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	return 0;
 
 err_setup:
-	mtk_pcie_power_down(pcie);
+	mtk_pcie_power_down(pcie, false);
 
 	return err;
 }
@@ -951,7 +960,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	err = pci_host_probe(host);
 	if (err) {
 		mtk_pcie_irq_teardown(pcie);
-		mtk_pcie_power_down(pcie);
+		mtk_pcie_power_down(pcie, false);
 		return err;
 	}
 
@@ -969,7 +978,7 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_unlock_rescan_remove();
 
 	mtk_pcie_irq_teardown(pcie);
-	mtk_pcie_power_down(pcie);
+	mtk_pcie_power_down(pcie, false);
 }
 
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
@@ -1044,7 +1053,7 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 	dev_dbg(pcie->dev, "entered L2 states successfully");
 
 	mtk_pcie_irq_save(pcie);
-	mtk_pcie_power_down(pcie);
+	mtk_pcie_power_down(pcie, true);
 
 	return 0;
 }
@@ -1060,7 +1069,7 @@ static int mtk_pcie_resume_noirq(struct device *dev)
 
 	err = mtk_pcie_startup_port(pcie);
 	if (err) {
-		mtk_pcie_power_down(pcie);
+		mtk_pcie_power_down(pcie, false);
 		return err;
 	}
 
-- 
2.44.0


