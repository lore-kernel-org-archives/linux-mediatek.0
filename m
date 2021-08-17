Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE63C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB0860FBF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AB0860FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zObT67lspiRqyjzCN0o7RxuZtvYTM/qb8B/IAh7hRMw=; b=m9/hYvQIzGTaIm
	XiW6ujZN+nAZ6qNY3nvbki0ynp69WJegdqDoqQ84c2/aPnh78YyuotjZ87NDHuRJAvgVJTSUKnps+
	dImcvqbj8FHQafZjGbRvIYwcDXNR2095QPxOI+0pQUelk0G1UWF/ihpbBFlmFPh1gSRtQrXLv2RtG
	pZ6hkylyQT2c+WbJhFTP/hSBOKJ4US4gVZK1AgV3JvPeKMjFXGd7zYaHBxWqVWLPoa4BqvZNOL4A8
	cL0QrKf90jwZjE5OpgJNPAkkWQkmGTOctItvFkLIXEIku5UGgat5USFDJfqDTcqF2YFPabwoRf2ca
	cBjFDpR3piwvv7w6RR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFudz-001fMD-6y; Tue, 17 Aug 2021 08:40:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFuaj-001dbF-Iw; Tue, 17 Aug 2021 08:37:03 +0000
X-UUID: 6c3f6dfc0c10483686f80d0bfdd1c785-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=b9KnA39mXYJp+ykyp49jfRJZeQM6PEtQeRRn8gRgKV0=; 
 b=I9yf73dA626saYVTIwR1AiMiavmneGqj7KGibm+dLVeti7HMes6DFs5akoARhdbmnfAp/SFqqdSO52XWsRk5zh9NybWx5aKH0vNbES6o0e2pgcjan+lIgENj1tQh4iBlD588QxwjxPJ87cEcQP5v5gedEIFUlIPLdkmwoQA+yPk=;
X-UUID: 6c3f6dfc0c10483686f80d0bfdd1c785-20210817
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1334050869; Tue, 17 Aug 2021 01:36:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 01:36:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 17 Aug 2021 16:36:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 16:36:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH RESEND 9/9] usb: xhci-mtk: modify the SOF/ITP interval for
 mt8195
Date: Tue, 17 Aug 2021 16:36:29 +0800
Message-ID: <1629189389-18779-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629189389-18779-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629189389-18779-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_013701_673928_9AE204A3 
X-CRM114-Status: GOOD (  15.76  )
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
