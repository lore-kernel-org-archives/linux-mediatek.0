Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01B4C4320E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 08:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67CDE61008
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 08:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67CDE61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zObT67lspiRqyjzCN0o7RxuZtvYTM/qb8B/IAh7hRMw=; b=J2SoVtrZs+wz5R
	Fh5BgmeoSH8obDm8iE1Y7OCq/3WpI3GR8hSOp0eOoueMTUN8mqeHitRCi8yxlS45voV6XR6+bXA0I
	lCshIWTkPsC8d15PFjNkteTE+bdWLnANNyKiDBkmDLvHLirDY6N3/DaZeFsXIFEe2E+9fs8RyEjFH
	WDiKRrhiVMnqHzkp8UO0/mnwwp02juPW8kdsWA9si9esPR0BTkf0oFanQHB/bNVTwuWKo/oeMnp7K
	+Jk+B8g0Iwjxl+TQDQm2ENy4QIPbSoEPYgxyA6VlibZIE79pkFpravGjelgr24hO7yr3jbstob4Pb
	/KeMjrpVpwq0Uyp0v5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9OJU-007lEz-6i; Fri, 30 Jul 2021 08:56:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9OFt-007j9R-2T; Fri, 30 Jul 2021 08:52:34 +0000
X-UUID: a775dfd5217a416da30e7b80aa478895-20210730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=b9KnA39mXYJp+ykyp49jfRJZeQM6PEtQeRRn8gRgKV0=; 
 b=OzUggaLpq6HktGHiFAp9ovyd4z9v1cls9Udj7+NCAzhMWMUH1mPLhktJzB7EAiIA6pV7xogo79k/ETMWHyuG9z5o/0V5OJrxIZhdCWclctn0SXsz2B426kzyZbstaXIEX3s1wca0MLXunPekcxt2Lv5BKgEerVPIqTbaF3YeN00=;
X-UUID: a775dfd5217a416da30e7b80aa478895-20210730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 809881247; Fri, 30 Jul 2021 01:52:29 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 01:50:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 16:50:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 16:50:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 11/11] usb: xhci-mtk: modify the SOF/ITP interval for mt8195
Date: Fri, 30 Jul 2021 16:50:02 +0800
Message-ID: <1627635002-24521-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_015233_243351_48CF2A14 
X-CRM114-Status: GOOD (  16.73  )
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

There are 4 USB controllers on MT8195, the controllers (IP1~IP3,
exclude IP0) have a wrong default SOF/ITP interval which is
calculated from the frame counter clock 24Mhz by default, but
in fact, the frame counter clock is 48Mhz, so we should set
the accurate interval according to 48Mhz for those controllers.
Note: the first controller no need set it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 65 +++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 12b691547438..7ff0cd707ba1 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -57,6 +57,27 @@
 /* u2_phy_pll register */
 #define CTRL_U2_FORCE_PLL_STB	BIT(28)
 
+/* xHCI CSR */
+#define LS_EOF_CFG		0x930
+#define LSEOF_OFFSET		0x89
+
+#define FS_EOF_CFG		0x934
+#define FSEOF_OFFSET		0x2e
+
+#define SS_GEN1_EOF_CFG		0x93c
+#define SSG1EOF_OFFSET		0x78
+
+#define HFCNTR_CFG		0x944
+#define ITP_DELTA_CLK		(0xa << 1)
+#define ITP_DELTA_CLK_MASK	GENMASK(5, 1)
+#define FRMCNT_LEV1_RANG	(0x12b << 8)
+#define FRMCNT_LEV1_RANG_MASK	GENMASK(19, 8)
+
+#define SS_GEN2_EOF_CFG		0x990
+#define SSG2EOF_OFFSET		0x3c
+
+#define XSEOF_OFFSET_MASK	GENMASK(11, 0)
+
 /* usb remote wakeup registers in syscon */
 
 /* mt8173 etc */
@@ -87,6 +108,46 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V1_2,		/* specific revision 1.2 */
 };
 
+/*
+ * MT8195 has 4 controllers, the controller1~3's default SOF/ITP interval
+ * is calculated from the frame counter clock 24M, but in fact, the clock
+ * is 48M, add workaround for it.
+ */
+static void xhci_mtk_set_frame_interval(struct xhci_hcd_mtk *mtk)
+{
+	struct device *dev = mtk->dev;
+	struct usb_hcd *hcd = mtk->hcd;
+	u32 value;
+
+	if (!of_device_is_compatible(dev->of_node, "mediatek,mt8195-xhci"))
+		return;
+
+	value = readl(hcd->regs + HFCNTR_CFG);
+	value &= ~(ITP_DELTA_CLK_MASK | FRMCNT_LEV1_RANG_MASK);
+	value |= (ITP_DELTA_CLK | FRMCNT_LEV1_RANG);
+	writel(value, hcd->regs + HFCNTR_CFG);
+
+	value = readl(hcd->regs + LS_EOF_CFG);
+	value &= ~XSEOF_OFFSET_MASK;
+	value |= LSEOF_OFFSET;
+	writel(value, hcd->regs + LS_EOF_CFG);
+
+	value = readl(hcd->regs + FS_EOF_CFG);
+	value &= ~XSEOF_OFFSET_MASK;
+	value |= FSEOF_OFFSET;
+	writel(value, hcd->regs + FS_EOF_CFG);
+
+	value = readl(hcd->regs + SS_GEN1_EOF_CFG);
+	value &= ~XSEOF_OFFSET_MASK;
+	value |= SSG1EOF_OFFSET;
+	writel(value, hcd->regs + SS_GEN1_EOF_CFG);
+
+	value = readl(hcd->regs + SS_GEN2_EOF_CFG);
+	value &= ~XSEOF_OFFSET_MASK;
+	value |= SSG2EOF_OFFSET;
+	writel(value, hcd->regs + SS_GEN2_EOF_CFG);
+}
+
 static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 {
 	struct mu3c_ippc_regs __iomem *ippc = mtk->ippc_regs;
@@ -368,6 +429,9 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
 		ret = xhci_mtk_ssusb_config(mtk);
 		if (ret)
 			return ret;
+
+		/* workaround only for mt8195 */
+		xhci_mtk_set_frame_interval(mtk);
 	}
 
 	ret = xhci_gen_setup(hcd, xhci_mtk_quirks);
@@ -716,6 +780,7 @@ static const struct dev_pm_ops xhci_mtk_pm_ops = {
 
 static const struct of_device_id mtk_xhci_of_match[] = {
 	{ .compatible = "mediatek,mt8173-xhci"},
+	{ .compatible = "mediatek,mt8195-xhci"},
 	{ .compatible = "mediatek,mtk-xhci"},
 	{ },
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
