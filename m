Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3866BC43460
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 06:18:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A46B1608FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 06:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A46B1608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dgSY8HR/CLdFHqnf7udXFuloHvat6fHSZCtOOONS0JM=; b=V1mu5xIf/Y66NgHS82F3X4BtG
	Vwe1LX6S/UD/bPnYVctDtyVVRC0eEhSuh2LQkBJXDeOYt3+ghIzMbU9K3DqNx/Llj5b3hE0/eYFw/
	o0ZeIFjeGhABkwk3n3xAuvjbebIahIFXJS85Gy26ZGjctmSPV5cd8bEe/+TzlCdvzyAdhflOZjm8r
	MaYbelqxxYdwNQ7KFWq3Y1mXE4163GbwDCTCZkLZ661+pUlDMYs0bidJ4bh3OJCwE87twjtMG0YjD
	SJ4bQnArsWp7G7H7rLnxV7P7frBB5z89TF5U8PPT2RPfrK66wGUtrRV1Yp0TAIhaQTjMFZHlWnt30
	Vbv/L+yyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYjiK-00BJ7V-4k; Tue, 20 Apr 2021 06:18:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjhu-00BJ3f-L4; Tue, 20 Apr 2021 06:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=OC+XkJbwY20QJjbDa5YJsLfNmXhUgC0Z71MeXi6ltYU=; b=jJf/06CQ5Qt2QHdwOfhmc83Lf5
 5mFUE9VERB5Bzh+MPXlwOaIhDXnk14O1zav5dG/JLJuk5YrY7fhKytqaJIf5m1tPlS7Dg+W72+w36
 Iyoh20g74881T4d++QItxMA9MAjXqXMzSbPK/i/h5nvU6vyMdZUxp8y/LzZsAjlg5Xe551USdVDro
 b9AVUlQHWQRReGI72GzyCLlUf2qfwZtvOWVrVi5QMOzKOzS7WcqaFcHEL7WVVZkx/UbeZI2wfNZH6
 zzIK0DGSj04HSXr4HjkRHFX/b0SUjqWuqP57DT28lPQuJ3tS4spQPJgEfIiWUfvUpiq50XCM9IJ2p
 QiMIWnyA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjhq-00Bq2D-7k; Tue, 20 Apr 2021 06:17:57 +0000
X-UUID: cd237491356d4237a316458e7f49219f-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OC+XkJbwY20QJjbDa5YJsLfNmXhUgC0Z71MeXi6ltYU=; 
 b=fBv2tJSnHXr84D9gI7BQMR6GuuuXkz6sqluDwVT7yKVpZNmtxraQuWIISriphkX/L5j/mVTB1yFi2afiP1scdrG9Tdnb2Eb57NrqGkG7ZCIM5XVunREwExH4UTFIZmZsbPEefo8gvnXEOy1KlPns7FB/0ugH+KotjHJywjqSBfI=;
X-UUID: cd237491356d4237a316458e7f49219f-20210419
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1655738179; Mon, 19 Apr 2021 23:17:50 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 23:17:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Apr 2021 14:17:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Apr 2021 14:17:45 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Ryder Lee <ryder.lee@mediatek.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, <anson.chuang@mediatek.com>, Krzysztof Wilczyski
 <kw@linux.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v10 6/7] PCI: mediatek-gen3: Add system PM support
Date: Tue, 20 Apr 2021 14:17:22 +0800
Message-ID: <20210420061723.989-7-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210420061723.989-1-jianjun.wang@mediatek.com>
References: <20210420061723.989-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_231754_330197_16A38437 
X-CRM114-Status: GOOD (  21.13  )
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

Add suspend_noirq and resume_noirq callback functions to implement PM
system suspend and resume hooks for the MediaTek Gen3 PCIe controller.

When the system suspends, trigger the PCIe link to enter the L2 state
and pull down the PERST# pin, gating the clocks of the MAC layer, and
then power-off the physical layer to provide power-saving.

When the system resumes, the PCIe link should be re-established and the
related control register values should be restored.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 113 ++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index ee1b51207d11..20165e4a75b2 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -45,6 +45,9 @@
 #define PCIE_PE_RSTB			BIT(3)
 
 #define PCIE_LTSSM_STATUS_REG		0x150
+#define PCIE_LTSSM_STATE_MASK		GENMASK(28, 24)
+#define PCIE_LTSSM_STATE(val)		((val & PCIE_LTSSM_STATE_MASK) >> 24)
+#define PCIE_LTSSM_STATE_L2_IDLE	0x14
 
 #define PCIE_LINK_STATUS_REG		0x154
 #define PCIE_PORT_LINKUP		BIT(8)
@@ -73,6 +76,9 @@
 #define PCIE_MSI_SET_ADDR_HI_BASE	0xc80
 #define PCIE_MSI_SET_ADDR_HI_OFFSET	0x04
 
+#define PCIE_ICMD_PM_REG		0x198
+#define PCIE_TURN_OFF_LINK		BIT(4)
+
 #define PCIE_TRANS_TABLE_BASE_REG	0x800
 #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
 #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
@@ -95,10 +101,12 @@
  * struct mtk_msi_set - MSI information for each set
  * @base: IO mapped register base
  * @msg_addr: MSI message address
+ * @saved_irq_state: IRQ enable state saved at suspend time
  */
 struct mtk_msi_set {
 	void __iomem *base;
 	phys_addr_t msg_addr;
+	u32 saved_irq_state;
 };
 
 /**
@@ -112,6 +120,7 @@ struct mtk_msi_set {
  * @clks: PCIe clocks
  * @num_clks: PCIe clocks count for this port
  * @irq: PCIe controller interrupt number
+ * @saved_irq_state: IRQ enable state saved at suspend time
  * @irq_lock: lock protecting IRQ register access
  * @intx_domain: legacy INTx IRQ domain
  * @msi_domain: MSI IRQ domain
@@ -131,6 +140,7 @@ struct mtk_pcie_port {
 	int num_clks;
 
 	int irq;
+	u32 saved_irq_state;
 	raw_spinlock_t irq_lock;
 	struct irq_domain *intx_domain;
 	struct irq_domain *msi_domain;
@@ -894,6 +904,108 @@ static int mtk_pcie_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void __maybe_unused mtk_pcie_irq_save(struct mtk_pcie_port *port)
+{
+	int i;
+
+	raw_spin_lock(&port->irq_lock);
+
+	port->saved_irq_state = readl_relaxed(port->base + PCIE_INT_ENABLE_REG);
+
+	for (i = 0; i < PCIE_MSI_SET_NUM; i++) {
+		struct mtk_msi_set *msi_set = &port->msi_sets[i];
+
+		msi_set->saved_irq_state = readl_relaxed(msi_set->base +
+					   PCIE_MSI_SET_ENABLE_OFFSET);
+	}
+
+	raw_spin_unlock(&port->irq_lock);
+}
+
+static void __maybe_unused mtk_pcie_irq_restore(struct mtk_pcie_port *port)
+{
+	int i;
+
+	raw_spin_lock(&port->irq_lock);
+
+	writel_relaxed(port->saved_irq_state, port->base + PCIE_INT_ENABLE_REG);
+
+	for (i = 0; i < PCIE_MSI_SET_NUM; i++) {
+		struct mtk_msi_set *msi_set = &port->msi_sets[i];
+
+		writel_relaxed(msi_set->saved_irq_state,
+			       msi_set->base + PCIE_MSI_SET_ENABLE_OFFSET);
+	}
+
+	raw_spin_unlock(&port->irq_lock);
+}
+
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
+		dev_err(port->dev, "cannot enter L2 state\n");
+		return err;
+	}
+
+	/* Pull down the PERST# pin */
+	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
+	val |= PCIE_PE_RSTB;
+	writel_relaxed(val, port->base + PCIE_RST_CTRL_REG);
+
+	dev_dbg(port->dev, "entered L2 states successfully");
+
+	mtk_pcie_irq_save(port);
+	mtk_pcie_power_down(port);
+
+	return 0;
+}
+
+static int __maybe_unused mtk_pcie_resume_noirq(struct device *dev)
+{
+	struct mtk_pcie_port *port = dev_get_drvdata(dev);
+	int err;
+
+	err = mtk_pcie_power_up(port);
+	if (err)
+		return err;
+
+	err = mtk_pcie_startup_port(port);
+	if (err) {
+		mtk_pcie_power_down(port);
+		return err;
+	}
+
+	mtk_pcie_irq_restore(port);
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
@@ -905,6 +1017,7 @@ static struct platform_driver mtk_pcie_driver = {
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
