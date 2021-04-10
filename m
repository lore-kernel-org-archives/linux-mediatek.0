Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC62C43460
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:11:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7052611AF
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7052611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xD7nvUeyLsr1vDJ9u6T4zqGz+p/iiXrDih3YQG4uWmc=; b=EH7K7xFmRsxdiixdq2mlh9y4M
	wfGn+f9i4zN7/pywa4XebVyzxrOmETC5AuIwU9zGRK5Ynl7oBxmYWU3zSgBcop2hk+us8i17DYwCs
	WL7GlD3Spz/vxUkZoMsomL5R3RihghejWsblv1xj/Liil21uklyx5ana1usbzuvVYq/ta5CXcsIOc
	5MGI4BuyPUW9JklVaMQVzK9ZdkButvogXmLEe85zQ7xJ5JUI+vaV0dF46kkpxQaTHFKjFxUpCB4JX
	6aeHEUIuBWUwxhTP6d/7dM3v+PYsaXYRYA9K5tB9gavAENAAB5/2eH/SUtH9IEKoFLP0y5C2a2j9H
	/KCu+XtjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV5uJ-002Byx-8o; Sat, 10 Apr 2021 05:11:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5t7-002BnQ-Oy; Sat, 10 Apr 2021 05:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Fn1iUg6z1RjceEPXTwLr2EfU4RaExIVd5Dvqso8rjEM=; b=JarRt6ag2CJTOWeYeDMsALKPHr
 8xvJs5kdxNRrcgBpzlyewKGsf/vB9vdB71VENfmD738P0DdWSTuxceA7Olw3aDyzRpulaMjEk7uLS
 UqtCqHgUSgX+RMEjP07VE1JSHCnXz1NjxYWoduHbbAz2eVufO+KlxH6+EHblV0BusI425pVBKu9zS
 +XUf0W7yRbaj4L5BoCcOG0P22Cox02F4hicZjTf+un1JMt7ZEP8T8OjWAb0cwlNq5WNxNSlh34yGy
 aWTa28QzmI/ff2oPkQDjsdQaLKRsMCr+rVs7fE770pFmG4hGZmDJssWL6x7GqDxjhpoYyOsqe5aiO
 JMcMr/HQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5t4-004wGz-VG; Sat, 10 Apr 2021 05:10:28 +0000
X-UUID: 53a9306d501b4cec996a4fcfe3038b89-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Fn1iUg6z1RjceEPXTwLr2EfU4RaExIVd5Dvqso8rjEM=; 
 b=K10uYg50ovvuswct5wsHlIy2m2CK11gFEL68+rjeAuPtxliOFH+X8CrGNShfl60oFmMZNqltnvQqQ5KiZvPHscpJjs+tkr9AqxhBIWB8oIHKfx65+ZSrvX4iv7swBgzL4N7eSWIFla8pjwKYAEwcwJXHvAtT8RLrI8hyr/+X9Us=;
X-UUID: 53a9306d501b4cec996a4fcfe3038b89-20210409
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1669994066; Fri, 09 Apr 2021 22:10:24 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 22:10:22 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 13:10:20 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 13:10:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek
 <pavel@ucw.cz>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 4/5] usb: xhci-mtk: use clock bulk to get clocks
Date: Sat, 10 Apr 2021 13:10:05 +0800
Message-ID: <1618031406-15347-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618031406-15347-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1618031406-15347-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3408E7EF8C2E42DC0C4F27BD6ECB1B867776072322ACE32B3E880F291C4878E82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_221027_034753_65CF3A17 
X-CRM114-Status: GOOD (  16.07  )
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
v2: no changes
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
