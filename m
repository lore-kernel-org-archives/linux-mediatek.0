Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B692EC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:33:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A24F64DD9
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A24F64DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6BOg+upg9rwZWvBbPIYgUXrrTarnUnQd/HFf9KoSg2Q=; b=hZMAXcOCLgKz+MXmr1+N0R+yD
	IgKph/+2LdpVRwTSeRimE6u9lqjsO6uPZ080uD5fubtm/+Cdnat5Sjs+4fjoyDfShT36jrgm4me0Q
	HmZpQwYPW0X1e1xoq8t6Gm8YmxWclY0841kJSeqDBeqDQkMnG/fg3nlZiayqCyh/T0DqKdGpYaCZX
	1OmPLkLRiucMcO8Acmm64IZsSKitbFoYDlzr/SOAw1IlOofGPQbVTU9SHMGZ9k9vL34pd5KPWEPA5
	vOpR1H5+y+UyCBBdtFugZLUqrI7xTFEptP6jmgrrguxo4VUIl6LPhIum1O7psUeHN0IH92J1Fj+9n
	fSKuTTA7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Bir-0001vz-SW; Wed, 03 Feb 2021 06:33:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Bip-0001uW-1G; Wed, 03 Feb 2021 06:33:04 +0000
X-UUID: 0d741269ae8b4766b05ad8b05656a445-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=avkqul/hJQ/XrEB+TAwmq5gAEcanSQm+jDT5myaH9Qk=; 
 b=fmdK8/w3xTnDq2WP7itdEq+iCCgbBN4Iak4/t0E3fDdkgBF/z5XUgBg9lUbe0e7x1FIstNHAiTl2Ue3Bh8zPnqOtp2cmNQST7T0eklEaTM7WF0FVrG64TFZqdzgErsmsQP10AKdKNUbmsz00QuT9EZ0VuWdU1WQXdF53fdzYBbM=;
X-UUID: 0d741269ae8b4766b05ad8b05656a445-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1953532940; Tue, 02 Feb 2021 22:32:56 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 22:32:54 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 14:32:46 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Feb 2021 14:32:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>
Subject: [RFC PATCH 2/3] usb: xhci-mtk: modify the SOF/ITP interval for mt8195
Date: Wed, 3 Feb 2021 14:31:58 +0800
Message-ID: <20210203063159.11021-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210203063159.11021-1-chunfeng.yun@mediatek.com>
References: <20210203063159.11021-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0FA1531C6694A62EFDE4D90B1C8DFA06C11E33CB4DF011C1C11CBC09E44189482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_013303_217598_040296AD 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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
 drivers/usb/host/xhci-mtk.c | 63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 8f321f39ab96..45651b2ba2b3 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -68,11 +68,71 @@
 #define SSC_IP_SLEEP_EN	BIT(4)
 #define SSC_SPM_INT_EN		BIT(1)
 
+/* xHCI csr */
+#define LS_EOF			0x930
+#define LS_EOF_OFFSET		0x89
+
+#define FS_EOF			0x934
+#define FS_EOF_OFFSET		0x2e
+
+#define SS_GEN1_EOF		0x93c
+#define SS_GEN1_EOF_OFFSET	0x78
+
+#define HFCNTR_CFG		0x944
+#define ITP_DELTA_CLK		(0xa << 1)
+#define ITP_DELTA_CLK_MASK	GENMASK(5, 1)
+#define FRMCNT_LEV1_RANG	(0x12b << 8)
+#define FRMCNT_LEV1_RANG_MASK	GENMASK(19, 8)
+
+#define SS_GEN2_EOF		0x990
+#define SS_GEN2_EOF_OFFSET	0x3c
+#define EOF_OFFSET_MASK		GENMASK(11, 0)
+
 enum ssusb_uwk_vers {
 	SSUSB_UWK_V1 = 1,
 	SSUSB_UWK_V2,
 };
 
+/*
+ * MT8195 has 4 controllers, the controller1~3's default SOF/ITP interval
+ * is calculated from the frame counter clock 24M, but in fact, the clock
+ * is 48M, so need change the interval.
+ */
+static void xhci_mtk_set_frame_interval(struct xhci_hcd_mtk *mtk)
+{
+	struct device *dev = mtk->dev;
+	struct usb_hcd *hcd = mtk->hcd;
+	u32 value;
+
+	if (!of_device_is_compatible(dev->of_node, "mediatek,mt819-xhci"))
+		return;
+
+	value = readl(hcd->regs + HFCNTR_CFG);
+	value &= ~(ITP_DELTA_CLK_MASK | FRMCNT_LEV1_RANG_MASK);
+	value |= (ITP_DELTA_CLK | FRMCNT_LEV1_RANG);
+	writel(value, hcd->regs + HFCNTR_CFG);
+
+	value = readl(hcd->regs + LS_EOF);
+	value &= ~EOF_OFFSET_MASK;
+	value |= LS_EOF_OFFSET;
+	writel(value, hcd->regs + LS_EOF);
+
+	value = readl(hcd->regs + FS_EOF);
+	value &= ~EOF_OFFSET_MASK;
+	value |= FS_EOF_OFFSET;
+	writel(value, hcd->regs + FS_EOF);
+
+	value = readl(hcd->regs + SS_GEN1_EOF);
+	value &= ~EOF_OFFSET_MASK;
+	value |= SS_GEN1_EOF_OFFSET;
+	writel(value, hcd->regs + SS_GEN1_EOF);
+
+	value = readl(hcd->regs + SS_GEN2_EOF);
+	value &= ~EOF_OFFSET_MASK;
+	value |= SS_GEN2_EOF_OFFSET;
+	writel(value, hcd->regs + SS_GEN2_EOF);
+}
+
 static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 {
 	struct mu3c_ippc_regs __iomem *ippc = mtk->ippc_regs;
@@ -407,6 +467,8 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
 		ret = xhci_mtk_ssusb_config(mtk);
 		if (ret)
 			return ret;
+
+		xhci_mtk_set_frame_interval(mtk);
 	}
 
 	ret = xhci_gen_setup(hcd, xhci_mtk_quirks);
@@ -655,6 +717,7 @@ static const struct dev_pm_ops xhci_mtk_pm_ops = {
 #ifdef CONFIG_OF
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
