Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B19C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:39:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D596113C
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11D596113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A89OSrUMji/p7FwqEZIqZhHvrYM425FnXaxK/L0Adjk=; b=FRt9jWZTkDAQnTzn+Z2ml7nI5
	4IVuewVQNdWme0uzvYtZjMbpAkLapXwwxlLQd1cwoBsuRSiRgsp0yfRG6dQ+8r/CMDUpo2lTqC9Hp
	u1A8fNTrV52umqmENU/UBUVRBlvrY1ebeBrRGxwPnWDGq9mmMtVSiv/Ft/0NFLTBJ984NWP2TbkSv
	8p7h5zsULpztGlKZoZSZTI2he6N2u3qQrAnDY4plDi44e4oJVGozgRT8t5QsEriLoUgGfR7MJlnHM
	Bey8ayCsuK9HHBn5qvuE1R1thdxCGNv9dkKv9yqfm7JELQhM7odqfhz+FWG+O6krHieDS+MJsmHhJ
	SytriiMZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUR7l-007WTa-24; Thu, 08 Apr 2021 09:38:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUR7J-007WLX-Jy; Thu, 08 Apr 2021 09:38:31 +0000
X-UUID: d466a83a952a4f5d8c96565f7cd5fd80-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=g7ZDAobKGnynFIDghkx63ErYM1ajDq3LoC6bbnHdei0=; 
 b=lw0LlZ9MA+AT6X7EVzUwaNbS7asScYmC3Nvrdf0pxr7i15BEcL3t1XEyHDXxx2ubiCmvcgBsfTZ/qKK0tjZH3YQdZSWcAobV2bx4zZO4heOF0iucd4qV9QMwAuay6CtFURzD9ORczPh3mByn4LO0iWgRkhjizrcfn3okZU+doro=;
X-UUID: d466a83a952a4f5d8c96565f7cd5fd80-20210408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1364197571; Thu, 08 Apr 2021 02:38:19 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 02:35:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 17:35:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 17:35:21 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 5/6] usb: xhci-mtk: use clock bulk to get clocks
Date: Thu, 8 Apr 2021 17:35:13 +0800
Message-ID: <1617874514-12282-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 35884E1CF77416F3359BD1765DBFB508BB3FA0BCEE83CBD35591F1898D4E947D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_103826_000610_BEC3B49C 
X-CRM114-Status: GOOD (  15.28  )
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

Use clock bulk helpers to get/enable/disable clocks, meanwhile
make sys_ck optional, then will be easier to handle clocks.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 109 +++++++-----------------------------
 drivers/usb/host/xhci-mtk.h |  10 ++--
 2 files changed, 24 insertions(+), 95 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 30927f4064d4..d4c455eecb8d 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -7,7 +7,6 @@
  *  Chunfeng Yun <chunfeng.yun@mediatek.com>
  */
 
-#include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -220,89 +219,6 @@ static int xhci_mtk_ssusb_config(struct xhci_hcd_mtk *mtk)
 	return xhci_mtk_host_enable(mtk);
 }
 
-static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
-{
-	struct device *dev = mtk->dev;
-
-	mtk->sys_clk = devm_clk_get(dev, "sys_ck");
-	if (IS_ERR(mtk->sys_clk)) {
-		dev_err(dev, "fail to get sys_ck\n");
-		return PTR_ERR(mtk->sys_clk);
-	}
-
-	mtk->xhci_clk = devm_clk_get_optional(dev, "xhci_ck");
-	if (IS_ERR(mtk->xhci_clk))
-		return PTR_ERR(mtk->xhci_clk);
-
-	mtk->ref_clk = devm_clk_get_optional(dev, "ref_ck");
-	if (IS_ERR(mtk->ref_clk))
-		return PTR_ERR(mtk->ref_clk);
-
-	mtk->mcu_clk = devm_clk_get_optional(dev, "mcu_ck");
-	if (IS_ERR(mtk->mcu_clk))
-		return PTR_ERR(mtk->mcu_clk);
-
-	mtk->dma_clk = devm_clk_get_optional(dev, "dma_ck");
-	return PTR_ERR_OR_ZERO(mtk->dma_clk);
-}
-
-static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
-{
-	int ret;
-
-	ret = clk_prepare_enable(mtk->ref_clk);
-	if (ret) {
-		dev_err(mtk->dev, "failed to enable ref_clk\n");
-		goto ref_clk_err;
-	}
-
-	ret = clk_prepare_enable(mtk->sys_clk);
-	if (ret) {
-		dev_err(mtk->dev, "failed to enable sys_clk\n");
-		goto sys_clk_err;
-	}
-
-	ret = clk_prepare_enable(mtk->xhci_clk);
-	if (ret) {
-		dev_err(mtk->dev, "failed to enable xhci_clk\n");
-		goto xhci_clk_err;
-	}
-
-	ret = clk_prepare_enable(mtk->mcu_clk);
-	if (ret) {
-		dev_err(mtk->dev, "failed to enable mcu_clk\n");
-		goto mcu_clk_err;
-	}
-
-	ret = clk_prepare_enable(mtk->dma_clk);
-	if (ret) {
-		dev_err(mtk->dev, "failed to enable dma_clk\n");
-		goto dma_clk_err;
-	}
-
-	return 0;
-
-dma_clk_err:
-	clk_disable_unprepare(mtk->mcu_clk);
-mcu_clk_err:
-	clk_disable_unprepare(mtk->xhci_clk);
-xhci_clk_err:
-	clk_disable_unprepare(mtk->sys_clk);
-sys_clk_err:
-	clk_disable_unprepare(mtk->ref_clk);
-ref_clk_err:
-	return ret;
-}
-
-static void xhci_mtk_clks_disable(struct xhci_hcd_mtk *mtk)
-{
-	clk_disable_unprepare(mtk->dma_clk);
-	clk_disable_unprepare(mtk->mcu_clk);
-	clk_disable_unprepare(mtk->xhci_clk);
-	clk_disable_unprepare(mtk->sys_clk);
-	clk_disable_unprepare(mtk->ref_clk);
-}
-
 /* only clocks can be turn off for ip-sleep wakeup mode */
 static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
 {
@@ -367,6 +283,19 @@ static void usb_wakeup_set(struct xhci_hcd_mtk *mtk, bool enable)
 		usb_wakeup_ip_sleep_set(mtk, enable);
 }
 
+static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
+{
+	struct clk_bulk_data *clks = mtk->clks;
+
+	clks[0].id = "sys_ck";
+	clks[1].id = "xhci_ck";
+	clks[2].id = "ref_ck";
+	clks[3].id = "mcu_ck";
+	clks[4].id = "dma_ck";
+
+	return devm_clk_bulk_get_optional(mtk->dev, BULK_CLKS_NUM, clks);
+}
+
 static int xhci_mtk_ldos_enable(struct xhci_hcd_mtk *mtk)
 {
 	int ret;
@@ -522,7 +451,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_pm;
 
-	ret = xhci_mtk_clks_enable(mtk);
+	ret = clk_bulk_prepare_enable(BULK_CLKS_NUM, mtk->clks);
 	if (ret)
 		goto disable_ldos;
 
@@ -625,7 +554,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	usb_put_hcd(hcd);
 
 disable_clk:
-	xhci_mtk_clks_disable(mtk);
+	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
 
 disable_ldos:
 	xhci_mtk_ldos_disable(mtk);
@@ -655,7 +584,7 @@ static int xhci_mtk_remove(struct platform_device *pdev)
 	usb_put_hcd(shared_hcd);
 	usb_put_hcd(hcd);
 	xhci_mtk_sch_exit(mtk);
-	xhci_mtk_clks_disable(mtk);
+	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
 	xhci_mtk_ldos_disable(mtk);
 
 	pm_runtime_disable(dev);
@@ -682,7 +611,7 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 	if (ret)
 		goto restart_poll_rh;
 
-	xhci_mtk_clks_disable(mtk);
+	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
 	usb_wakeup_set(mtk, true);
 	return 0;
 
@@ -703,7 +632,7 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	int ret;
 
 	usb_wakeup_set(mtk, false);
-	ret = xhci_mtk_clks_enable(mtk);
+	ret = clk_bulk_prepare_enable(BULK_CLKS_NUM, mtk->clks);
 	if (ret)
 		goto enable_wakeup;
 
@@ -719,7 +648,7 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	return 0;
 
 disable_clks:
-	xhci_mtk_clks_disable(mtk);
+	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
 enable_wakeup:
 	usb_wakeup_set(mtk, true);
 	return ret;
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 621ec1a85009..11996edc1967 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -9,8 +9,12 @@
 #ifndef _XHCI_MTK_H_
 #define _XHCI_MTK_H_
 
+#include <linux/clk.h>
+
 #include "xhci.h"
 
+#define BULK_CLKS_NUM	5
+
 /**
  * To simplify scheduler algorithm, set a upper limit for ESIT,
  * if a synchromous ep's ESIT is larger than @XHCI_MTK_MAX_ESIT,
@@ -140,11 +144,7 @@ struct xhci_hcd_mtk {
 	int u3p_dis_msk;
 	struct regulator *vusb33;
 	struct regulator *vbus;
-	struct clk *sys_clk;	/* sys and mac clock */
-	struct clk *xhci_clk;
-	struct clk *ref_clk;
-	struct clk *mcu_clk;
-	struct clk *dma_clk;
+	struct clk_bulk_data clks[BULK_CLKS_NUM];
 	struct regmap *pericfg;
 	struct phy **phys;
 	int num_phys;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
