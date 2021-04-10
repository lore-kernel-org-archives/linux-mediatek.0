Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D22C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:11:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC13A611AE
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC13A611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b/IXv16cNyyQ5xLAf7QR9cHuhn5ILWlLiNlGEeiCZqk=; b=PuRheQPnTttCYameuED2wHVWjP
	g4Qgbw5jbTsbq4/iUlNrfjCuqK95H73jtv4tWoiuPKqMMozWHDPZlcq6lc3z1Ua2BzihnXOgV4SaW
	ZWQuR69eRDXvc7xmybPaLw7w1IYMtxQC6LqKBSstNy620hHlPGEnBedztpmlikqzQl7oDAv4Rr2ZR
	Gbj+f8/N5oWcRMOyVlPpZXHkkJT7uPBcGY9w6/ybEytOrgvjoCDRKjLpuNMnOT2FeFShwN+PzaJQG
	iFPuFLota8FnMvn956FmS4jHXIa+qMZvD0OGGBtXu99EZrHR9CpythiTlb4OF4gF6xB5kxU04M8+K
	oFPmZAIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV5uM-002C01-Gu; Sat, 10 Apr 2021 05:11:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5t6-002BnC-3c; Sat, 10 Apr 2021 05:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=m34EP+vtULrb01573Z6/tRKTrlVuQzPz01IbHzGKP18=; b=mJSak0PTX70Ba/+XUYG1RK+A9e
 UmgYtxeW0ljRNmdRJAXFoEjL4ofZWbtDfvZXQfZuYBGoDWqXTYXJbKq7EcCLex/D7FkcgE95YybHr
 N0qUZyWG/h5lw5RlRqpjkuOOQpL2d0Bm5x0UoADIJSKKSWLHavWNfeXf69a3oBm6GqLtWa6mLtxMN
 /z1F0vx4oMCOceLWGXxLFHTNjJfWqjGx9pkk8swWeTLruDz6awFQsoh7+94eP43lw5Ox3XaKiJCvq
 fRUKtrSrgntYIqZnhUcsRd9TS+KDSzl4BCOG4wnMNuxg6okpo+afyTSC9sc9Es+olHr21cxt4ZEvk
 jj6w4o+w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5t2-004wG5-EG; Sat, 10 Apr 2021 05:10:25 +0000
X-UUID: 6827273441ed46ffb3a626205ee2643e-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=m34EP+vtULrb01573Z6/tRKTrlVuQzPz01IbHzGKP18=; 
 b=Ke65rZHxGwonM1CDjnwB09RCN+lqKdZs4zMmY1o7YWIqZdMgObs43uYZRcyF8+Ttlpg+PTPAcF0ISoKJEJa+7lhqmdvTmjSQKCotD+ceb5r+wBCtBNhKiQXOGKEyanqkcil/MI+Ssnx2tm2OeYTwJuNt3pC6SApNnsiD9pfKGI0=;
X-UUID: 6827273441ed46ffb3a626205ee2643e-20210409
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1578271561; Fri, 09 Apr 2021 22:10:20 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 22:10:18 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 13:10:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 13:10:09 +0800
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
Subject: [PATCH v2 1/5] usb: xhci-mtk: check return value in suspend/resume
 hooks
Date: Sat, 10 Apr 2021 13:10:02 +0800
Message-ID: <1618031406-15347-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_221024_509109_139D03DF 
X-CRM114-Status: GOOD (  15.31  )
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

Return error number if encounter errors during suspend and resume.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/host/xhci-mtk.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index c1bc40289833..a74764ab914a 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -630,18 +630,12 @@ static int xhci_mtk_remove(struct platform_device *dev)
 	return 0;
 }
 
-/*
- * if ip sleep fails, and all clocks are disabled, access register will hang
- * AHB bus, so stop polling roothubs to avoid regs access on bus suspend.
- * and no need to check whether ip sleep failed or not; this will cause SPM
- * to wake up system immediately after system suspend complete if ip sleep
- * fails, it is what we wanted.
- */
 static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 {
 	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = mtk->hcd;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	int ret;
 
 	xhci_dbg(xhci, "%s: stop port polling\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
@@ -649,10 +643,21 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
 	del_timer_sync(&xhci->shared_hcd->rh_timer);
 
-	xhci_mtk_host_disable(mtk);
+	ret = xhci_mtk_host_disable(mtk);
+	if (ret)
+		goto restart_poll_rh;
+
 	xhci_mtk_clks_disable(mtk);
 	usb_wakeup_set(mtk, true);
 	return 0;
+
+restart_poll_rh:
+	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
+	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
+	usb_hcd_poll_rh_status(hcd);
+	return ret;
 }
 
 static int __maybe_unused xhci_mtk_resume(struct device *dev)
@@ -660,10 +665,16 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = mtk->hcd;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	int ret;
 
 	usb_wakeup_set(mtk, false);
-	xhci_mtk_clks_enable(mtk);
-	xhci_mtk_host_enable(mtk);
+	ret = xhci_mtk_clks_enable(mtk);
+	if (ret)
+		goto enable_wakeup;
+
+	ret = xhci_mtk_host_enable(mtk);
+	if (ret)
+		goto disable_clks;
 
 	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
 	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
@@ -671,6 +682,12 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 	return 0;
+
+disable_clks:
+	xhci_mtk_clks_disable(mtk);
+enable_wakeup:
+	usb_wakeup_set(mtk, true);
+	return ret;
 }
 
 static const struct dev_pm_ops xhci_mtk_pm_ops = {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
