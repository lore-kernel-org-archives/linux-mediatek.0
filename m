Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073E6C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:58:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF2F64E2A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF2F64E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=21jFFzO+k0d5YuUwijcW6XziQ8XC78ZXiWywgXax5iA=; b=vmbIW0Ni5IlFT13TUs/jZczCXL
	kL09GTJTZwta5eWxTgFio+43HP8mqPWawcfUSRPz10k2H7+bAgXoxnvFdOAHgHeDLUYjikM3kLHou
	WnLR17en0PqNJm/g12qopnW7OI+T1OiuueMxKGQCubKMu7ewGWQ85YFoRBAYYsPGxguPZkCL1/5vn
	RNfPP53WqBFv37a9+n2+W+HIkG9oqCDclTQvIM+0OaGFJmLCRlPq20gDSqfYKR8Ah+ZAZIO6o4zKw
	dqKUCnfjJ90bjfwEw/9DT8YwNWOAZNQhl8mlm5ZdXit6TTxbVfT+8cKAv8KVvbLV+7SovZ07oAynB
	tBtyPUow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6SE4-00083O-KQ; Mon, 01 Feb 2021 05:58:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6SE0-00081z-3j; Mon, 01 Feb 2021 05:58:13 +0000
X-UUID: 67b43fa81a51488b82755c43b1279b36-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=A/qdQCLDxuFQRUsW9pZ2Ea+l0Qwoqsb/NF+ih5xUETo=; 
 b=qhoZTc5qa+ceGrE2+69JDZf5/16pveiyIgoY4zN8UoDtCZQmjcQvR+KNZW5fZc7kkiMJX2zw7mXNO3mURpL+nOqsFPno1SikMp4gI2VjHUoLgnHztNZtsOXWwLm63oZkP4JZT1KOHhLdz6JuxFTuen7giUYnMY65zEdNZvhnvFY=;
X-UUID: 67b43fa81a51488b82755c43b1279b36-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1645978269; Sun, 31 Jan 2021 21:58:03 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 21:58:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 13:57:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Feb 2021 13:57:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
Subject: [next PATCH] usb: xhci-mtk: skip dropping bandwidth of unchecked
 endpoints
Date: Mon, 1 Feb 2021 13:57:44 +0800
Message-ID: <1612159064-28413-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7B8658DABE72D61BB90A22D8DACFB89029C9D3F4800EC3985BB294711E3736262000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_005812_423962_213E7C20 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For those unchecked endpoints, we don't allocate bandwidth for
them, so no need free the bandwidth, otherwise will decrease
the allocated bandwidth.
Meanwhile use xhci_dbg() instead of dev_dbg() to print logs and
rename bw_ep_list_new as bw_ep_chk_list.

Fixes: 1d69f9d901ef ("usb: xhci-mtk: fix unreleased bandwidth data")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 61 ++++++++++++++++++---------------
 drivers/usb/host/xhci-mtk.h     |  4 ++-
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index a313e75ff1c6..dee8a329076d 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -200,6 +200,7 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
 
 	sch_ep->sch_tt = tt;
 	sch_ep->ep = ep;
+	INIT_LIST_HEAD(&sch_ep->endpoint);
 	INIT_LIST_HEAD(&sch_ep->tt_endpoint);
 
 	return sch_ep;
@@ -374,6 +375,7 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 					sch_ep->bw_budget_table[j];
 		}
 	}
+	sch_ep->allocated = used;
 }
 
 static int check_sch_tt(struct usb_device *udev,
@@ -542,6 +544,22 @@ static int check_sch_bw(struct usb_device *udev,
 	return 0;
 }
 
+static void destroy_sch_ep(struct usb_device *udev,
+	struct mu3h_sch_bw_info *sch_bw, struct mu3h_sch_ep_info *sch_ep)
+{
+	/* only release ep bw check passed by check_sch_bw() */
+	if (sch_ep->allocated)
+		update_bus_bw(sch_bw, sch_ep, 0);
+
+	list_del(&sch_ep->endpoint);
+
+	if (sch_ep->sch_tt) {
+		list_del(&sch_ep->tt_endpoint);
+		drop_tt(udev);
+	}
+	kfree(sch_ep);
+}
+
 static bool need_bw_sch(struct usb_host_endpoint *ep,
 	enum usb_device_speed speed, int has_tt)
 {
@@ -584,7 +602,7 @@ int xhci_mtk_sch_init(struct xhci_hcd_mtk *mtk)
 
 	mtk->sch_array = sch_array;
 
-	INIT_LIST_HEAD(&mtk->bw_ep_list_new);
+	INIT_LIST_HEAD(&mtk->bw_ep_chk_list);
 
 	return 0;
 }
@@ -636,29 +654,12 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 
 	setup_sch_info(udev, ep_ctx, sch_ep);
 
-	list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_list_new);
+	list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_chk_list);
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_mtk_add_ep_quirk);
 
-static void xhci_mtk_drop_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
-			     struct mu3h_sch_ep_info *sch_ep)
-{
-	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
-	int bw_index = get_bw_index(xhci, udev, sch_ep->ep);
-	struct mu3h_sch_bw_info *sch_bw = &mtk->sch_array[bw_index];
-
-	update_bus_bw(sch_bw, sch_ep, 0);
-	list_del(&sch_ep->endpoint);
-
-	if (sch_ep->sch_tt) {
-		list_del(&sch_ep->tt_endpoint);
-		drop_tt(udev);
-	}
-	kfree(sch_ep);
-}
-
 void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep)
 {
@@ -688,9 +689,8 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	sch_bw = &sch_array[bw_index];
 
 	list_for_each_entry_safe(sch_ep, tmp, &sch_bw->bw_ep_list, endpoint) {
-		if (sch_ep->ep == ep) {
-			xhci_mtk_drop_ep(mtk, udev, sch_ep);
-		}
+		if (sch_ep->ep == ep)
+			destroy_sch_ep(udev, sch_bw, sch_ep);
 	}
 }
 EXPORT_SYMBOL_GPL(xhci_mtk_drop_ep_quirk);
@@ -704,9 +704,9 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 	struct mu3h_sch_ep_info *sch_ep, *tmp;
 	int bw_index, ret;
 
-	dev_dbg(&udev->dev, "%s\n", __func__);
+	xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
 
-	list_for_each_entry(sch_ep, &mtk->bw_ep_list_new, endpoint) {
+	list_for_each_entry(sch_ep, &mtk->bw_ep_chk_list, endpoint) {
 		bw_index = get_bw_index(xhci, udev, sch_ep->ep);
 		sch_bw = &mtk->sch_array[bw_index];
 
@@ -717,7 +717,7 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 		}
 	}
 
-	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
+	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
 		struct xhci_ep_ctx *ep_ctx;
 		struct usb_host_endpoint *ep = sch_ep->ep;
 		unsigned int ep_index = xhci_get_endpoint_index(&ep->desc);
@@ -746,12 +746,17 @@ EXPORT_SYMBOL_GPL(xhci_mtk_check_bandwidth);
 void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 {
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep, *tmp;
+	int bw_index;
 
-	dev_dbg(&udev->dev, "%s\n", __func__);
+	xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
 
-	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
-		xhci_mtk_drop_ep(mtk, udev, sch_ep);
+	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
+		bw_index = get_bw_index(xhci, udev, sch_ep->ep);
+		sch_bw = &mtk->sch_array[bw_index];
+		destroy_sch_ep(udev, sch_bw, sch_ep);
 	}
 
 	xhci_reset_bandwidth(hcd, udev);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 577f431c5c93..cbb09dfea62e 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -59,6 +59,7 @@ struct mu3h_sch_bw_info {
  * @ep_type: endpoint type
  * @maxpkt: max packet size of endpoint
  * @ep: address of usb_host_endpoint struct
+ * @allocated: the bandwidth is aready allocated from bus_bw
  * @offset: which uframe of the interval that transfer should be
  *		scheduled first time within the interval
  * @repeat: the time gap between two uframes that transfers are
@@ -86,6 +87,7 @@ struct mu3h_sch_ep_info {
 	u32 ep_type;
 	u32 maxpkt;
 	void *ep;
+	bool allocated;
 	/*
 	 * mtk xHCI scheduling information put into reserved DWs
 	 * in ep context
@@ -130,8 +132,8 @@ struct mu3c_ippc_regs {
 struct xhci_hcd_mtk {
 	struct device *dev;
 	struct usb_hcd *hcd;
-	struct list_head bw_ep_list_new;
 	struct mu3h_sch_bw_info *sch_array;
+	struct list_head bw_ep_chk_list;
 	struct mu3c_ippc_regs __iomem *ippc_regs;
 	bool has_ippc;
 	int num_u2_ports;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
