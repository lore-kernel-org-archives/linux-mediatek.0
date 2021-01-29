Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056ECC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:39:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 859BA64DFA
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 859BA64DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SQobwqYqIThe4LSOiftLrLqnevevT3znezTDuMxmTaU=; b=lmGsRPTQOVKH/nB1hghZcnoJji
	dw+RdL3TSBU0yfpFYMldvatUgplXzgqaX+mXW/yIH+y4vIhnDcfgq5l7rsM0LWS+tmH2x8Etie1M3
	eTG8KMcOatCb7cwmYH/FijaLwunWJPQNiDWPsgDL31d1stOtSfAjq0PHgoijplly+xkvDGvnJLIID
	HgF6Ibhg2lW289OGlF1IzHm18laI8VpL89ojUH1gQ2sL57h6vnLzc5bCG2zzCeevzhaxzhqjTKONE
	Lzn3JQEl0zaxVbeb3oD///9AMF/WDlEgYE5jqDaMBUPKYYJq/DH1QaI6CXx0SN3vLK5d+ZdlZ4WJA
	dVWxnqog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QEp-0008W0-Rs; Fri, 29 Jan 2021 09:38:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QEZ-0008Rn-OT; Fri, 29 Jan 2021 09:38:34 +0000
X-UUID: 0c9b5781104f45d8a59c196c31204647-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=dFFbTcaNaiKUmONnRECQMofY20VYSreq24Ap0ugwa58=; 
 b=VQCHAlaqs3y7QknWzZbYe86oemNrXSlPM3A++SWF8CmXLKPcmyUWcNZPpkYalWQCiIlnYz0z7Ohao+nXmk+sAGh3Os6VFXd6arPVl5evhL57ewph1l3+G7nxXEUhdZOPTtIbJVnYR8BcH+8xwTJrTKbxIRve8GRF38aZhKEGhHg=;
X-UUID: 0c9b5781104f45d8a59c196c31204647-20210129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1536874633; Fri, 29 Jan 2021 01:38:29 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 01:38:27 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 17:38:22 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 17:38:21 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v7] usb: xhci-mtk: fix unreleased bandwidth data
Date: Fri, 29 Jan 2021 17:38:19 +0800
Message-ID: <1611913099-25805-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 95D76450FFB332908C87371E4D267C01F5C6A419687E65175EBBC50BDCAC48832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_043832_097447_C2FD778A 
X-CRM114-Status: GOOD (  21.23  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ikjoon Jang <ikjn@chromium.org>

xhci-mtk needs XHCI_MTK_HOST quirk functions in add_endpoint() and
drop_endpoint() to handle its own sw bandwidth management.

It stores bandwidth data into an internal table every time
add_endpoint() is called, and drops those in drop_endpoint().
But when bandwidth allocation fails at one endpoint, all earlier
allocation from the same interface could still remain at the table.

This patch moves bandwidth management codes to check_bandwidth() and
reset_bandwidth() path. To do so, this patch also adds those functions
to xhci_driver_overrides and lets mtk-xhci to release all failed
endpoints in reset_bandwidth() path.

Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
Changes in v7 from Chunfeng:
- rename xhci_mtk_droop_ep() as destroy_sch_ep(), and include parameters
- add member @allocated in mu3h_sch_ep_info struct
  used to skip endpoint not allocated bandwidth
- use xhci_dbg() instead of dev_dbg()
- rename bw_ep_list_new as bw_ep_chk_list

Changes in v6:
- use xhci overrides instead of quirk functions for
  {check|reset}_bandwidth().

Changes in v5:
- Fix a wrong commit id in Fixes tag

Changes in v4:
- bugfix in v3, check_bandwidth() return uninitialized value
  when no new endpoints were added.
- change Fixes tag to keep dependency

Changes in v3:
- drop unrelated code cleanups
- change Fixes tag to keep dependency

Changes in v2:
- fix a 0-day warning from unused variable
- split one big patch into three patches
- fix wrong offset in mediatek hw flags
---
 drivers/usb/host/xhci-mtk-sch.c | 141 ++++++++++++++++++++++----------
 drivers/usb/host/xhci-mtk.c     |   2 +
 drivers/usb/host/xhci-mtk.h     |  15 ++++
 drivers/usb/host/xhci.c         |   8 +-
 drivers/usb/host/xhci.h         |   4 +
 5 files changed, 124 insertions(+), 46 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 45c54d56ecbd..7de56f876b21 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -200,6 +200,8 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
 
 	sch_ep->sch_tt = tt;
 	sch_ep->ep = ep;
+	INIT_LIST_HEAD(&sch_ep->endpoint);
+	INIT_LIST_HEAD(&sch_ep->tt_endpoint);
 
 	return sch_ep;
 }
@@ -373,6 +375,7 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 					sch_ep->bw_budget_table[j];
 		}
 	}
+	sch_ep->allocated = used;
 }
 
 static int check_sch_tt(struct usb_device *udev,
@@ -541,6 +544,22 @@ static int check_sch_bw(struct usb_device *udev,
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
@@ -583,6 +602,8 @@ int xhci_mtk_sch_init(struct xhci_hcd_mtk *mtk)
 
 	mtk->sch_array = sch_array;
 
+	INIT_LIST_HEAD(&mtk->bw_ep_chk_list);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_mtk_sch_init);
@@ -597,23 +618,17 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep)
 {
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
-	struct xhci_hcd *xhci;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_ep_ctx *ep_ctx;
 	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_virt_device *virt_dev;
-	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep;
-	struct mu3h_sch_bw_info *sch_array;
 	unsigned int ep_index;
-	int bw_index;
-	int ret = 0;
 
-	xhci = hcd_to_xhci(hcd);
 	virt_dev = xhci->devs[udev->slot_id];
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
-	sch_array = mtk->sch_array;
 
 	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpkt:%d, dir:%d, ep:%p\n",
 		__func__, usb_endpoint_type(&ep->desc), udev->speed,
@@ -632,35 +647,13 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		return 0;
 	}
 
-	bw_index = get_bw_index(xhci, udev, ep);
-	sch_bw = &sch_array[bw_index];
-
 	sch_ep = create_sch_ep(udev, ep, ep_ctx);
 	if (IS_ERR_OR_NULL(sch_ep))
 		return -ENOMEM;
 
 	setup_sch_info(udev, ep_ctx, sch_ep);
 
-	ret = check_sch_bw(udev, sch_bw, sch_ep);
-	if (ret) {
-		xhci_err(xhci, "Not enough bandwidth!\n");
-		if (is_fs_or_ls(udev->speed))
-			drop_tt(udev);
-
-		kfree(sch_ep);
-		return -ENOSPC;
-	}
-
-	list_add_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
-
-	ep_ctx->reserved[0] |= cpu_to_le32(EP_BPKTS(sch_ep->pkts)
-		| EP_BCSCOUNT(sch_ep->cs_count) | EP_BBM(sch_ep->burst_mode));
-	ep_ctx->reserved[1] |= cpu_to_le32(EP_BOFFSET(sch_ep->offset)
-		| EP_BREPEAT(sch_ep->repeat));
-
-	xhci_dbg(xhci, " PKTS:%x, CSCOUNT:%x, BM:%x, OFFSET:%x, REPEAT:%x\n",
-			sch_ep->pkts, sch_ep->cs_count, sch_ep->burst_mode,
-			sch_ep->offset, sch_ep->repeat);
+	list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_chk_list);
 
 	return 0;
 }
@@ -670,15 +663,14 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep)
 {
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
-	struct xhci_hcd *xhci;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_virt_device *virt_dev;
 	struct mu3h_sch_bw_info *sch_array;
 	struct mu3h_sch_bw_info *sch_bw;
-	struct mu3h_sch_ep_info *sch_ep;
+	struct mu3h_sch_ep_info *sch_ep, *tmp;
 	int bw_index;
 
-	xhci = hcd_to_xhci(hcd);
 	virt_dev = xhci->devs[udev->slot_id];
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
 	sch_array = mtk->sch_array;
@@ -694,17 +686,78 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	bw_index = get_bw_index(xhci, udev, ep);
 	sch_bw = &sch_array[bw_index];
 
-	list_for_each_entry(sch_ep, &sch_bw->bw_ep_list, endpoint) {
-		if (sch_ep->ep == ep) {
-			update_bus_bw(sch_bw, sch_ep, 0);
-			list_del(&sch_ep->endpoint);
-			if (is_fs_or_ls(udev->speed)) {
-				list_del(&sch_ep->tt_endpoint);
-				drop_tt(udev);
-			}
-			kfree(sch_ep);
-			break;
-		}
+	list_for_each_entry_safe(sch_ep, tmp, &sch_bw->bw_ep_list, endpoint) {
+		if (sch_ep->ep == ep)
+			destroy_sch_ep(udev, sch_bw, sch_ep);
 	}
 }
 EXPORT_SYMBOL_GPL(xhci_mtk_drop_ep_quirk);
+
+int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_virt_device *virt_dev = xhci->devs[udev->slot_id];
+	struct mu3h_sch_bw_info *sch_bw;
+	struct mu3h_sch_ep_info *sch_ep, *tmp;
+	int bw_index, ret;
+
+	xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
+
+	list_for_each_entry(sch_ep, &mtk->bw_ep_chk_list, endpoint) {
+		bw_index = get_bw_index(xhci, udev, sch_ep->ep);
+		sch_bw = &mtk->sch_array[bw_index];
+
+		ret = check_sch_bw(udev, sch_bw, sch_ep);
+		if (ret) {
+			xhci_err(xhci, "Not enough bandwidth!\n");
+			return -ENOSPC;
+		}
+	}
+
+	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
+		struct usb_host_endpoint *ep = sch_ep->ep;
+		struct xhci_ep_ctx *ep_ctx;
+		unsigned int ep_index;
+
+		bw_index = get_bw_index(xhci, udev, ep);
+		sch_bw = &mtk->sch_array[bw_index];
+
+		list_move_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
+
+		ep_index = xhci_get_endpoint_index(&ep->desc);
+		ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
+		ep_ctx->reserved[0] |= cpu_to_le32(EP_BPKTS(sch_ep->pkts)
+			| EP_BCSCOUNT(sch_ep->cs_count)
+			| EP_BBM(sch_ep->burst_mode));
+		ep_ctx->reserved[1] |= cpu_to_le32(EP_BOFFSET(sch_ep->offset)
+			| EP_BREPEAT(sch_ep->repeat));
+
+		xhci_dbg(xhci, " PKTS:%x, CSCOUNT:%x, BM:%x, OFFSET:%x, REPEAT:%x\n",
+			sch_ep->pkts, sch_ep->cs_count, sch_ep->burst_mode,
+			sch_ep->offset, sch_ep->repeat);
+	}
+
+	return xhci_check_bandwidth(hcd, udev);
+}
+EXPORT_SYMBOL_GPL(xhci_mtk_check_bandwidth);
+
+void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct mu3h_sch_bw_info *sch_bw;
+	struct mu3h_sch_ep_info *sch_ep, *tmp;
+	int bw_index;
+
+	xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
+
+	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
+		bw_index = get_bw_index(xhci, udev, sch_ep->ep);
+		sch_bw = &mtk->sch_array[bw_index];
+		destroy_sch_ep(udev, sch_bw, sch_ep);
+	}
+
+	xhci_reset_bandwidth(hcd, udev);
+}
+EXPORT_SYMBOL_GPL(xhci_mtk_reset_bandwidth);
diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 8f321f39ab96..fe010cc61f19 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -347,6 +347,8 @@ static void usb_wakeup_set(struct xhci_hcd_mtk *mtk, bool enable)
 static int xhci_mtk_setup(struct usb_hcd *hcd);
 static const struct xhci_driver_overrides xhci_mtk_overrides __initconst = {
 	.reset = xhci_mtk_setup,
+	.check_bandwidth = xhci_mtk_check_bandwidth,
+	.reset_bandwidth = xhci_mtk_reset_bandwidth,
 };
 
 static struct hc_driver __read_mostly xhci_mtk_hc_driver;
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index a93cfe817904..cbb09dfea62e 100644
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
@@ -131,6 +133,7 @@ struct xhci_hcd_mtk {
 	struct device *dev;
 	struct usb_hcd *hcd;
 	struct mu3h_sch_bw_info *sch_array;
+	struct list_head bw_ep_chk_list;
 	struct mu3c_ippc_regs __iomem *ippc_regs;
 	bool has_ippc;
 	int num_u2_ports;
@@ -166,6 +169,8 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep);
 void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep);
+int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
+void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
 
 #else
 static inline int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd,
@@ -179,6 +184,16 @@ static inline void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd,
 {
 }
 
+static inline int xhci_mtk_check_bandwidth(struct usb_hcd *hcd,
+		struct usb_device *udev)
+{
+	return 0;
+}
+
+static inline void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd,
+		struct usb_device *udev)
+{
+}
 #endif
 
 #endif		/* _XHCI_MTK_H_ */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 91ab81c3fc79..33bda397f91f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2985,7 +2985,7 @@ static void xhci_check_bw_drop_ep_streams(struct xhci_hcd *xhci,
  * else should be touching the xhci->devs[slot_id] structure, so we
  * don't need to take the xhci->lock for manipulating that.
  */
-static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
+int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 {
 	int i;
 	int ret = 0;
@@ -3083,7 +3083,7 @@ static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 	return ret;
 }
 
-static void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
+void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 {
 	struct xhci_hcd *xhci;
 	struct xhci_virt_device	*virt_dev;
@@ -5510,6 +5510,10 @@ void xhci_init_driver(struct hc_driver *drv,
 			drv->reset = over->reset;
 		if (over->start)
 			drv->start = over->start;
+		if (over->check_bandwidth)
+			drv->check_bandwidth = over->check_bandwidth;
+		if (over->reset_bandwidth)
+			drv->reset_bandwidth = over->reset_bandwidth;
 	}
 }
 EXPORT_SYMBOL_GPL(xhci_init_driver);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 25e57bc9c3cc..07ff95016f11 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1920,6 +1920,8 @@ struct xhci_driver_overrides {
 	size_t extra_priv_size;
 	int (*reset)(struct usb_hcd *hcd);
 	int (*start)(struct usb_hcd *hcd);
+	int (*check_bandwidth)(struct usb_hcd *, struct usb_device *);
+	void (*reset_bandwidth)(struct usb_hcd *, struct usb_device *);
 };
 
 #define	XHCI_CFC_DELAY		10
@@ -2074,6 +2076,8 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks);
 void xhci_shutdown(struct usb_hcd *hcd);
 void xhci_init_driver(struct hc_driver *drv,
 		      const struct xhci_driver_overrides *over);
+int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
+void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id);
 int xhci_ext_cap_init(struct xhci_hcd *xhci);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
