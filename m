Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADBEC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:51:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0076E233ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0076E233ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nCoBaroFinm7tQbfkyCoVbg1/yMWWc9VBFaZ7T2vRBU=; b=gmDsdDBJ3gadRs6Bse7aj2p9P
	WLPqXQXCFbS8MKUAOcdfW6itmkNeoY9osdMkJie0WzcT5ZX01y+u8V5yOA/rrU5nctLo9UPLCvR95
	4mAUQ/GFDxqtpaK+39DoGhFTgH6FDXvtg0T4kgb8OqsZ3qQM0j0POK+z2CgnamLFkZnbetVlWJbfB
	xtA8HlQlKAPGeLDmeC/uGTvi7qXYUMSFxS0NkURPrFOZTDfZtkddDfMulO8YXNJJPOtcGzE7kyQug
	lMatYaZgRnZ4TH+jfqS5r/gW1ploCxL/1X5CAy9Q+VqlAAIpatfHkkTGtWw5SkkmCOM7cL2zAIdLN
	KtHyc7nFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzegT-0005T9-4u; Wed, 13 Jan 2021 11:51:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzeg5-0005GJ-7y; Wed, 13 Jan 2021 11:51:07 +0000
X-UUID: 4c50c1bc69da4f6ea14287190d603abb-20210113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LBE3uUFv/4mgUf8UnV8/WDBhQdqmDP1xr+zL1jXgky8=; 
 b=cd3D36LXH969HZ31vqKdATiaQvC96TDrIuELrc63jforjzamScyzKqk45gf/HMGJRAoRJyRdTISSSn4/OaRFAh5QzSCD/XN1YxQRoADeTrBFvySBPwG6SSxcZrwie4gpNNkYah8aWEi9OLFSRyMrhmexGftBFyMAlOSvCYcLcNo=;
X-UUID: 4c50c1bc69da4f6ea14287190d603abb-20210113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 790999994; Wed, 13 Jan 2021 03:51:01 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 03:41:01 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 19:40:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 19:40:58 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [v7,6/7] PCI: mediatek-gen3: Add system PM support
Date: Wed, 13 Jan 2021 19:40:00 +0800
Message-ID: <20210113114001.5804-7-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210113114001.5804-1-jianjun.wang@mediatek.com>
References: <20210113114001.5804-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_065105_554871_63CB5A64 
X-CRM114-Status: GOOD (  18.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, anson.chuang@mediatek.com,
 Jianjun Wang <jianjun.wang@mediatek.com>, sin_jieyang@mediatek.com, Sj
 Huang <sj.huang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add suspend_noirq and resume_noirq callback functions to implement
PM system suspend hooks for MediaTek Gen3 PCIe controller.

When system suspend, trigger the PCIe link to L2 state and pull down
the PERST# pin, gating the clocks of MAC layer and power off the
physical layer for the sake of power saving.

When system resum, the PCIe link should be re-established and the
related control register values should be restored.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 78 +++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 152820f28da1..ac6c43cea575 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -49,6 +49,9 @@
 #define PCIE_PE_RSTB			BIT(3)
 
 #define PCIE_LTSSM_STATUS_REG		0x150
+#define PCIE_LTSSM_STATE_MASK		GENMASK(28, 24)
+#define PCIE_LTSSM_STATE(val)		((val & PCIE_LTSSM_STATE_MASK) >> 24)
+#define PCIE_LTSSM_STATE_L2_IDLE	0x14
 
 #define PCIE_LINK_STATUS_REG		0x154
 #define PCIE_PORT_LINKUP		BIT(8)
@@ -76,6 +79,9 @@
 #define PCIE_MSI_SET_ADDR_HI_BASE	0xc80
 #define PCIE_MSI_SET_ADDR_HI_OFFSET	0x04
 
+#define PCIE_ICMD_PM_REG		0x198
+#define PCIE_TURN_OFF_LINK		BIT(4)
+
 #define PCIE_TRANS_TABLE_BASE_REG	0x800
 #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
 #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
@@ -869,6 +875,77 @@ static int mtk_pcie_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused mtk_pcie_turn_off_link(struct mtk_pcie_port *port)
+{
+	u32 val;
+
+	val = readl_relaxed(port->base + PCIE_ICMD_PM_REG);
+	val |= PCIE_TURN_OFF_LINK;
+	writel_relaxed(val, port->base + PCIE_ICMD_PM_REG);
+
+	/* Check the link is L2 */
+	return readl_poll_timeout(port->base + PCIE_LTSSM_STATUS_REG, val,
+				  (PCIE_LTSSM_STATE(val) ==
+				   PCIE_LTSSM_STATE_L2_IDLE), 20,
+				   50 * USEC_PER_MSEC);
+}
+
+static int __maybe_unused mtk_pcie_suspend_noirq(struct device *dev)
+{
+	struct mtk_pcie_port *port = dev_get_drvdata(dev);
+	int err;
+	u32 val;
+
+	/* Trigger link to L2 state */
+	err = mtk_pcie_turn_off_link(port);
+	if (err) {
+		dev_err(port->dev, "can not enter L2 state\n");
+		return err;
+	}
+
+	/* Pull down the PERST# pin */
+	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
+	val |= PCIE_PE_RSTB;
+	writel_relaxed(val, port->base + PCIE_RST_CTRL_REG);
+
+	dev_dbg(port->dev, "enter L2 state success");
+
+	clk_bulk_disable_unprepare(port->num_clks, port->clks);
+
+	phy_power_off(port->phy);
+
+	return 0;
+}
+
+static int __maybe_unused mtk_pcie_resume_noirq(struct device *dev)
+{
+	struct mtk_pcie_port *port = dev_get_drvdata(dev);
+	int err;
+
+	phy_power_on(port->phy);
+
+	err = clk_bulk_prepare_enable(port->num_clks, port->clks);
+	if (err) {
+		dev_dbg(dev, "failed to enable PCIe clocks\n");
+		return err;
+	}
+
+	err = mtk_pcie_startup_port(port);
+	if (err) {
+		dev_err(port->dev, "resume failed\n");
+		return err;
+	}
+
+	dev_dbg(port->dev, "resume done\n");
+
+	return 0;
+}
+
+static const struct dev_pm_ops mtk_pcie_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_pcie_suspend_noirq,
+				      mtk_pcie_resume_noirq)
+};
+
 static const struct of_device_id mtk_pcie_of_match[] = {
 	{ .compatible = "mediatek,mt8192-pcie" },
 	{},
@@ -880,6 +957,7 @@ static struct platform_driver mtk_pcie_driver = {
 	.driver = {
 		.name = "mtk-pcie",
 		.of_match_table = mtk_pcie_of_match,
+		.pm = &mtk_pcie_pm_ops,
 	},
 };
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
