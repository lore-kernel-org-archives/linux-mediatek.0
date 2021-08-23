Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E52C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B416613AD
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B416613AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=243ALgCvsb4JlUkxDIu8PraLgJW/wAnSxrUkg6sTqpw=; b=28GuCUh/Q9b28v
	gveTzgwiHHPYbQQKHbj5umx7YAR6/+EamFypZ6VFzt8t2vovAHNXa2oCCQzQFrFL7NRxB0mSDLIfH
	JMgPkbKqb1IsjetmA1F4BhOBUz+Nx+1ig4upyj+++zaEc7ueAycESAF1gd03JIOI6TEauhfTxZxAK
	xY6/elI2cwnbFdPU8hfWysrxkC5ZoP8grn+4+evF1xc/FMXq8vBKf9Odem/ftu0ZqI/pqcrIb5f7f
	YC1geAZuqNVPMJTX4a9PTaNhYaV7Yjm8GvDJeJX0zqxbtJoklKF9/Q18r1UnRKftl0tHsIZWCn+KJ
	WVqr7s3A8fltKO6j9LYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9TA-00Gr5M-4Q; Mon, 23 Aug 2021 12:54:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9T2-00Gr0F-8i
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:54:24 +0000
X-UUID: 7dc344969e70400d90f4e58b6c1252d6-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=a74YrD/HIa+DfdPzY+kInX4dhH5g374a3PctHCRgvqY=; 
 b=eI+lrN7GX9g4UQc4DZauD467FQN2l/AdP7nDrlVt2qbbH75YbFOnL/tSE2XPsavIJxdvBskJcPHIVN1koOFFbnD3vVYERm+k7DHUVQsyWo3a8PQx8UNIy+6dl575s/aEHWVlj//L03lsvI5VUpyrEVdmaMRdYdeeN+bn4vmqUds=;
X-UUID: 7dc344969e70400d90f4e58b6c1252d6-20210823
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1113766961; Mon, 23 Aug 2021 05:54:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 05:54:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 20:54:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Aug 2021 20:54:05 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: Yaqii wu <yaqii.wu@mediatek.com>, <srv_wsdupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [RFC PATCH 3/6] usb: xhci-mtk: Do not use xhci's virt_dev in
 drop_endpoint
Date: Mon, 23 Aug 2021 20:53:53 +0800
Message-ID: <1629723236-10768-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629723236-10768-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629723236-10768-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_055420_401017_DE599163 
X-CRM114-Status: GOOD (  21.38  )
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

xhci-mtk depends on xhci's internal virt_dev when it retrieves its
internal data from usb_host_endpoint both in add_endpoint and
drop_endpoint callbacks. But when setup packet was retired by
transaction errors in xhci_setup_device() path, a virt_dev for the slot
is newly created with real_port 0. This leads to xhci-mtks's NULL pointer
dereference from drop_endpoint callback as xhci-mtk assumes that virt_dev's
real_port is always started from one. The similar problems were addressed
by [1] but that can't cover the failure cases from setup_device.

This patch drops the usages of xhci's virt_dev in xhci-mtk's drop_endpoint
callback by adopting hashtable for searching mtk's schedule entity
from a given usb_host_endpoint pointer instead of searching a linked list.
So mtk's drop_endpoint callback doesn't have to rely on virt_dev at all.

[1] f351f4b63dac ("usb: xhci-mtk: fix oops when unbind driver")

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 100 ++++++++++++++++----------------
 drivers/usb/host/xhci-mtk.h     |  11 +++-
 2 files changed, 60 insertions(+), 51 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 54c521524bfc..f3c6f078f82d 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -80,7 +80,7 @@ decode_ep(struct usb_host_endpoint *ep, enum usb_device_speed speed)
 		interval /= 1000;
 	}
 
-	snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d, interval:%d/%d%s\n",
+	snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d, interval:%d/%d%s",
 		 usb_speed_string(speed), usb_endpoint_num(epd),
 		 usb_endpoint_dir_in(epd) ? "in" : "out",
 		 usb_ep_type_string(usb_endpoint_type(epd)),
@@ -129,6 +129,10 @@ get_bw_info(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
 	int bw_index;
 
 	virt_dev = xhci->devs[udev->slot_id];
+	if (!virt_dev->real_port) {
+		WARN_ONCE(1, "%s invalid real_port\n", dev_name(&udev->dev));
+		return NULL;
+	}
 
 	if (udev->speed >= USB_SPEED_SUPER) {
 		if (usb_endpoint_dir_out(&ep->desc))
@@ -236,14 +240,20 @@ static void drop_tt(struct usb_device *udev)
 	}
 }
 
-static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
-	struct usb_host_endpoint *ep, struct xhci_ep_ctx *ep_ctx)
+static struct mu3h_sch_ep_info *
+create_sch_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
+	      struct usb_host_endpoint *ep, struct xhci_ep_ctx *ep_ctx)
 {
 	struct mu3h_sch_ep_info *sch_ep;
+	struct mu3h_sch_bw_info *bw_info;
 	struct mu3h_sch_tt *tt = NULL;
 	u32 len_bw_budget_table;
 	size_t mem_size;
 
+	bw_info = get_bw_info(mtk, udev, ep);
+	if (!bw_info)
+		return ERR_PTR(-ENODEV);
+
 	if (is_fs_or_ls(udev->speed))
 		len_bw_budget_table = TT_MICROFRAMES_MAX;
 	else if ((udev->speed >= USB_SPEED_SUPER)
@@ -266,11 +276,13 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
 		}
 	}
 
+	sch_ep->bw_info = bw_info;
 	sch_ep->sch_tt = tt;
 	sch_ep->ep = ep;
 	sch_ep->speed = udev->speed;
 	INIT_LIST_HEAD(&sch_ep->endpoint);
 	INIT_LIST_HEAD(&sch_ep->tt_endpoint);
+	INIT_HLIST_NODE(&sch_ep->hentry);
 
 	return sch_ep;
 }
@@ -576,9 +588,9 @@ static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
 	return boundary;
 }
 
-static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
-			struct mu3h_sch_ep_info *sch_ep)
+static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
 {
+	struct mu3h_sch_bw_info *sch_bw = sch_ep->bw_info;
 	const u32 esit_boundary = get_esit_boundary(sch_ep);
 	const u32 bw_boundary = get_bw_boundary(sch_ep->speed);
 	u32 offset;
@@ -624,23 +636,26 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 	return load_ep_bw(sch_bw, sch_ep, true);
 }
 
-static void destroy_sch_ep(struct usb_device *udev,
-	struct mu3h_sch_bw_info *sch_bw, struct mu3h_sch_ep_info *sch_ep)
+static void destroy_sch_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
+			   struct mu3h_sch_ep_info *sch_ep)
 {
 	/* only release ep bw check passed by check_sch_bw() */
 	if (sch_ep->allocated)
-		load_ep_bw(sch_bw, sch_ep, false);
+		load_ep_bw(sch_ep->bw_info, sch_ep, false);
 
 	if (sch_ep->sch_tt)
 		drop_tt(udev);
 
 	list_del(&sch_ep->endpoint);
+	hlist_del(&sch_ep->hentry);
 	kfree(sch_ep);
 }
 
-static bool need_bw_sch(struct usb_host_endpoint *ep,
-	enum usb_device_speed speed, int has_tt)
+static bool need_bw_sch(struct usb_device *udev,
+			struct usb_host_endpoint *ep)
 {
+	bool has_tt = udev->tt && udev->tt->hub->parent;
+
 	/* only for periodic endpoints */
 	if (usb_endpoint_xfer_control(&ep->desc)
 		|| usb_endpoint_xfer_bulk(&ep->desc))
@@ -651,7 +666,7 @@ static bool need_bw_sch(struct usb_host_endpoint *ep,
 	 * a TT are also ignored, root-hub will schedule them directly,
 	 * but need set @bpkts field of endpoint context to 1.
 	 */
-	if (is_fs_or_ls(speed) && !has_tt)
+	if (is_fs_or_ls(udev->speed) && !has_tt)
 		return false;
 
 	/* skip endpoint with zero maxpkt */
@@ -666,7 +681,6 @@ int xhci_mtk_sch_init(struct xhci_hcd_mtk *mtk)
 	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
 	struct mu3h_sch_bw_info *sch_array;
 	int num_usb_bus;
-	int i;
 
 	/* ss IN and OUT are separated */
 	num_usb_bus = xhci->usb3_rhub.num_ports * 2 + xhci->usb2_rhub.num_ports;
@@ -675,12 +689,10 @@ int xhci_mtk_sch_init(struct xhci_hcd_mtk *mtk)
 	if (sch_array == NULL)
 		return -ENOMEM;
 
-	for (i = 0; i < num_usb_bus; i++)
-		INIT_LIST_HEAD(&sch_array[i].bw_ep_list);
-
 	mtk->sch_array = sch_array;
 
 	INIT_LIST_HEAD(&mtk->bw_ep_chk_list);
+	hash_init(mtk->sch_ep_hash);
 
 	return 0;
 }
@@ -704,9 +716,7 @@ static int add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
 
-	xhci_dbg(xhci, "%s %s\n", __func__, decode_ep(ep, udev->speed));
-
-	if (!need_bw_sch(ep, udev->speed, !!virt_dev->tt_info)) {
+	if (!need_bw_sch(udev, ep)) {
 		/*
 		 * set @bpkts to 1 if it is LS or FS periodic endpoint, and its
 		 * device does not connected through an external HS hub
@@ -718,13 +728,16 @@ static int add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		return 0;
 	}
 
-	sch_ep = create_sch_ep(udev, ep, ep_ctx);
+	xhci_dbg(xhci, "%s %s\n", __func__, decode_ep(ep, udev->speed));
+
+	sch_ep = create_sch_ep(mtk, udev, ep, ep_ctx);
 	if (IS_ERR_OR_NULL(sch_ep))
 		return -ENOMEM;
 
 	setup_sch_info(ep_ctx, sch_ep);
 
 	list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_chk_list);
+	hash_add(mtk->sch_ep_hash, &sch_ep->hentry, (unsigned long)ep);
 
 	return 0;
 }
@@ -734,22 +747,18 @@ static void drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 {
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct xhci_virt_device *virt_dev;
-	struct mu3h_sch_bw_info *sch_bw;
-	struct mu3h_sch_ep_info *sch_ep, *tmp;
-
-	virt_dev = xhci->devs[udev->slot_id];
-
-	xhci_dbg(xhci, "%s %s\n", __func__, decode_ep(ep, udev->speed));
+	struct mu3h_sch_ep_info *sch_ep;
+	struct hlist_node *hn;
 
-	if (!need_bw_sch(ep, udev->speed, !!virt_dev->tt_info))
+	if (!need_bw_sch(udev, ep))
 		return;
 
-	sch_bw = get_bw_info(mtk, udev, ep);
+	xhci_err(xhci, "%s %s\n", __func__, decode_ep(ep, udev->speed));
 
-	list_for_each_entry_safe(sch_ep, tmp, &sch_bw->bw_ep_list, endpoint) {
+	hash_for_each_possible_safe(mtk->sch_ep_hash, sch_ep,
+				    hn, hentry, (unsigned long)ep) {
 		if (sch_ep->ep == ep) {
-			destroy_sch_ep(udev, sch_bw, sch_ep);
+			destroy_sch_ep(mtk, udev, sch_ep);
 			break;
 		}
 	}
@@ -760,30 +769,22 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_virt_device *virt_dev = xhci->devs[udev->slot_id];
-	struct mu3h_sch_bw_info *sch_bw;
-	struct mu3h_sch_ep_info *sch_ep, *tmp;
+	struct mu3h_sch_ep_info *sch_ep;
 	int ret;
 
 	xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
 
 	list_for_each_entry(sch_ep, &mtk->bw_ep_chk_list, endpoint) {
-		sch_bw = get_bw_info(mtk, udev, sch_ep->ep);
+		struct xhci_ep_ctx *ep_ctx;
+		struct usb_host_endpoint *ep = sch_ep->ep;
+		unsigned int ep_index = xhci_get_endpoint_index(&ep->desc);
 
-		ret = check_sch_bw(sch_bw, sch_ep);
+		ret = check_sch_bw(sch_ep);
 		if (ret) {
 			xhci_err(xhci, "Not enough bandwidth! (%s)\n",
 				 sch_error_string(-ret));
 			return -ENOSPC;
 		}
-	}
-
-	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
-		struct xhci_ep_ctx *ep_ctx;
-		struct usb_host_endpoint *ep = sch_ep->ep;
-		unsigned int ep_index = xhci_get_endpoint_index(&ep->desc);
-
-		sch_bw = get_bw_info(mtk, udev, ep);
-		list_move_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
 
 		ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
 		ep_ctx->reserved[0] = cpu_to_le32(EP_BPKTS(sch_ep->pkts)
@@ -797,22 +798,23 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 			sch_ep->offset, sch_ep->repeat);
 	}
 
-	return xhci_check_bandwidth(hcd, udev);
+	ret = xhci_check_bandwidth(hcd, udev);
+	if (!ret)
+		INIT_LIST_HEAD(&mtk->bw_ep_chk_list);
+
+	return ret;
 }
 
 void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 {
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep, *tmp;
 
 	xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
 
-	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
-		sch_bw = get_bw_info(mtk, udev, sch_ep->ep);
-		destroy_sch_ep(udev, sch_bw, sch_ep);
-	}
+	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint)
+		destroy_sch_ep(mtk, udev, sch_ep);
 
 	xhci_reset_bandwidth(hcd, udev);
 }
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index eb05aaf6edbe..dc5e83f5c5cc 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -10,11 +10,15 @@
 #define _XHCI_MTK_H_
 
 #include <linux/clk.h>
+#include <linux/hashtable.h>
 
 #include "xhci.h"
 
 #define BULK_CLKS_NUM	5
 
+/* support at most 64 ep, use 32 size hash table */
+#define SCH_EP_HASH_BITS	5
+
 /**
  * To simplify scheduler algorithm, set a upper limit for ESIT,
  * if a synchromous ep's ESIT is larger than @XHCI_MTK_MAX_ESIT,
@@ -36,14 +40,12 @@ struct mu3h_sch_tt {
  * struct mu3h_sch_bw_info: schedule information for bandwidth domain
  *
  * @bus_bw: array to keep track of bandwidth already used at each uframes
- * @bw_ep_list: eps in the bandwidth domain
  *
  * treat a HS root port as a bandwidth domain, but treat a SS root port as
  * two bandwidth domains, one for IN eps and another for OUT eps.
  */
 struct mu3h_sch_bw_info {
 	u32 bus_bw[XHCI_MTK_MAX_ESIT];
-	struct list_head bw_ep_list;
 };
 
 /**
@@ -54,8 +56,10 @@ struct mu3h_sch_bw_info {
  * @num_budget_microframes: number of continuous uframes
  *		(@repeat==1) scheduled within the interval
  * @bw_cost_per_microframe: bandwidth cost per microframe
+ * @hentry: hash table entry
  * @endpoint: linked into bandwidth domain which it belongs to
  * @tt_endpoint: linked into mu3h_sch_tt's list which it belongs to
+ * @bw_info: bandwidth domain which this endpoint belongs
  * @sch_tt: mu3h_sch_tt linked into
  * @ep_type: endpoint type
  * @maxpkt: max packet size of endpoint
@@ -84,7 +88,9 @@ struct mu3h_sch_ep_info {
 	u32 num_budget_microframes;
 	u32 bw_cost_per_microframe;
 	struct list_head endpoint;
+	struct hlist_node hentry;
 	struct list_head tt_endpoint;
+	struct mu3h_sch_bw_info *bw_info;
 	struct mu3h_sch_tt *sch_tt;
 	u32 ep_type;
 	u32 maxpkt;
@@ -137,6 +143,7 @@ struct xhci_hcd_mtk {
 	struct usb_hcd *hcd;
 	struct mu3h_sch_bw_info *sch_array;
 	struct list_head bw_ep_chk_list;
+	DECLARE_HASHTABLE(sch_ep_hash, SCH_EP_HASH_BITS);
 	struct mu3c_ippc_regs __iomem *ippc_regs;
 	int num_u2_ports;
 	int num_u3_ports;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
