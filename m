Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF68EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gEw4Gu5Gnt8zOHhIWW+1I9wzg2APCr+opeqeiUE5TEE=; b=1bHuohq9s9hcw6+Jrv2RSenyRJ
	FuU9NYDEjnzyElP/FTn5L0q75AkZh3i/CgNlf96FJjDahQ9yDHlFvuVS4CGJ4zt4h6yNDkyL+GGk8
	Me56DyT6RivdUcsilwLUftgFnmb6Cb5gxRGwkSyHCJjgPqBcXgk6PcLMTcVl4vdyDnWDf8SOdNzAP
	YBP0+iFD0QqlicFLu1FbXuwALgi+oh33Cn7qFlQX1OB0Kh3e5GKJMheoxoY5sMed19xPa42h1cg1p
	RrzsFbPTR9/D5fix0CcojZ2zQSLf0cJz9v/ogn7BlmTQmfCZW3ZO+yUZ4ezsrCaaVGqpDdWN0AFD5
	eHRfR0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovz8P-003Wkb-FN; Fri, 18 Nov 2022 11:02:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovz8M-003WjJ-Va; Fri, 18 Nov 2022 11:02:12 +0000
X-UUID: c4bfbc03fbfd466eb9c7ae977c556caa-20221118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gEw4Gu5Gnt8zOHhIWW+1I9wzg2APCr+opeqeiUE5TEE=;
	b=MCAj3A8P+cjwi6PaRieaXBLrJdn5Lhzqtz6BE/1aqNKlR8CAJVQJuW16N5JYBIpIb3hatk7oNAuRf+/8t8QkdJovjJ8xDwAg1jNqHwFosNY2PDM49h3wc1BmofdiFbMnItGGgRt+18P55FwTDJKFNmVsTFotIjHVELOPkad4XF4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:dd94a9ef-feef-404a-b12d-d0fc0c17ddbe,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:62cd327,CLOUDID:05c82c2f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c4bfbc03fbfd466eb9c7ae977c556caa-20221118
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1025382390; Fri, 18 Nov 2022 04:02:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 18 Nov 2022 19:01:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 18 Nov 2022 19:01:24 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Eddie
 Hung" <eddie.hung@mediatek.com>
Subject: [PATCH] usb: host: xhci-mtk: omit shared hcd if either root hub has no ports
Date: Fri, 18 Nov 2022 19:01:16 +0800
Message-ID: <20221118110116.20165-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_030211_044960_2826D2C5 
X-CRM114-Status: GOOD (  15.63  )
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

There is error log when add a usb3 root hub without ports:
"hub 4-0:1.0: config failed, hub doesn't have any ports! (err -19)"

so omit the shared hcd if either of the root hubs has no ports, but
usually there is no usb3 port.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 72 +++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 01705e559c42..cff3c4aea036 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -485,6 +485,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	const struct hc_driver *driver;
 	struct xhci_hcd *xhci;
 	struct resource *res;
+	struct usb_hcd *usb3_hcd;
 	struct usb_hcd *hcd;
 	int ret = -ENODEV;
 	int wakeup_irq;
@@ -593,6 +594,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 
 	xhci = hcd_to_xhci(hcd);
 	xhci->main_hcd = hcd;
+	xhci->allow_single_roothub = 1;
 
 	/*
 	 * imod_interval is the interrupt moderation value in nanoseconds.
@@ -602,24 +604,29 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	xhci->imod_interval = 5000;
 	device_property_read_u32(dev, "imod-interval-ns", &xhci->imod_interval);
 
-	xhci->shared_hcd = usb_create_shared_hcd(driver, dev,
-			dev_name(dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto disable_device_wakeup;
-	}
-
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
-		goto put_usb3_hcd;
+		goto disable_device_wakeup;
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
+	if (!xhci_has_one_roothub(xhci)) {
+		xhci->shared_hcd = usb_create_shared_hcd(driver, dev,
+							 dev_name(dev), hcd);
+		if (!xhci->shared_hcd) {
+			ret = -ENOMEM;
+			goto dealloc_usb2_hcd;
+		}
+	}
+
+	usb3_hcd = xhci_get_usb3_hcd(xhci);
+	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
 	    !(xhci->quirks & XHCI_BROKEN_STREAMS))
-		xhci->shared_hcd->can_do_streams = 1;
+		usb3_hcd->can_do_streams = 1;
 
-	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
-	if (ret)
-		goto dealloc_usb2_hcd;
+	if (xhci->shared_hcd) {
+		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
+		if (ret)
+			goto put_usb3_hcd;
+	}
 
 	if (wakeup_irq > 0) {
 		ret = dev_pm_set_dedicated_wake_irq_reverse(dev, wakeup_irq);
@@ -641,13 +648,13 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	usb_remove_hcd(xhci->shared_hcd);
 	xhci->shared_hcd = NULL;
 
-dealloc_usb2_hcd:
-	usb_remove_hcd(hcd);
-
 put_usb3_hcd:
-	xhci_mtk_sch_exit(mtk);
 	usb_put_hcd(xhci->shared_hcd);
 
+dealloc_usb2_hcd:
+	xhci_mtk_sch_exit(mtk);
+	usb_remove_hcd(hcd);
+
 disable_device_wakeup:
 	device_init_wakeup(dev, false);
 
@@ -679,10 +686,15 @@ static int xhci_mtk_remove(struct platform_device *pdev)
 	dev_pm_clear_wake_irq(dev);
 	device_init_wakeup(dev, false);
 
-	usb_remove_hcd(shared_hcd);
-	xhci->shared_hcd = NULL;
+	if (shared_hcd) {
+		usb_remove_hcd(shared_hcd);
+		xhci->shared_hcd = NULL;
+	}
 	usb_remove_hcd(hcd);
-	usb_put_hcd(shared_hcd);
+
+	if (shared_hcd)
+		usb_put_hcd(shared_hcd);
+
 	usb_put_hcd(hcd);
 	xhci_mtk_sch_exit(mtk);
 	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
@@ -700,13 +712,16 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = mtk->hcd;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct usb_hcd *shared_hcd = xhci->shared_hcd;
 	int ret;
 
 	xhci_dbg(xhci, "%s: stop port polling\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	del_timer_sync(&hcd->rh_timer);
-	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	del_timer_sync(&xhci->shared_hcd->rh_timer);
+	if (shared_hcd) {
+		clear_bit(HCD_FLAG_POLL_RH, &shared_hcd->flags);
+		del_timer_sync(&shared_hcd->rh_timer);
+	}
 
 	ret = xhci_mtk_host_disable(mtk);
 	if (ret)
@@ -718,8 +733,10 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 
 restart_poll_rh:
 	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
-	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	if (shared_hcd) {
+		set_bit(HCD_FLAG_POLL_RH, &shared_hcd->flags);
+		usb_hcd_poll_rh_status(shared_hcd);
+	}
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 	return ret;
@@ -730,6 +747,7 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = mtk->hcd;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct usb_hcd *shared_hcd = xhci->shared_hcd;
 	int ret;
 
 	usb_wakeup_set(mtk, false);
@@ -742,8 +760,10 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 		goto disable_clks;
 
 	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
-	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	if (shared_hcd) {
+		set_bit(HCD_FLAG_POLL_RH, &shared_hcd->flags);
+		usb_hcd_poll_rh_status(shared_hcd);
+	}
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 	return 0;
-- 
2.18.0


