Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A950AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:48:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 380F123D6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 380F123D6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j9NZ5t2bxK9K2KDcw/9wpvt/YF5mR+dcyK0SS+0RXNQ=; b=xd6W9JX974xJjgl8yLbjlAofy
	RpWIa66qMtubnfK3B0ky/C79kRU3uJWGoF4aa8anMsz8AOdItrPhw9RRqc66LB+SNf5x9/fs4vaFG
	9RmGFGTigyBBBwJ9cxGAyP8wRurpTIe+EWE0Lsx7MlN+Fpj97QcbUmEvdJI33u3FzVGO3ELy9wZS3
	KnacuKOoe3wO3FsGlBsBbW84BGQwIF3oq8PbAwTbf4EtC/6aUXP4qvn+6d2bjW7mMEM0KY+27o90e
	CwANAsOqk37mlslpvJCuKVE3uOE7T7WjHmZ26KoFSsVG48Z4Z20EY5U3qOicwKMwsNbkQPDiy2vHf
	G/AjfJccg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJUj-0002s5-2V; Thu, 10 Dec 2020 10:48:21 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJUT-0002ly-3V
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 10:48:07 +0000
Received: by mail-pf1-x444.google.com with SMTP id b26so3683927pfi.3
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Dec 2020 02:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RxDpVAARfEVSt1KTbBHSjn6Mvlgn7UqejTHAGTRSspo=;
 b=e0Cc9TN/PzgddXD+j32xAn9Hd5lPs6ih2YNT0QELyaOAq9jgUrSDzrE9GZ4XbEKewq
 bmg7pP5O8m/woX5pr0xvW0cDLsdHSIWqwaQjKqrlAoOqYxMRwAsUTDkUOxkkvHPxJARG
 1fdRHuBmq1crdb0xdJL+hBOt90Z92GCTVhEfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxDpVAARfEVSt1KTbBHSjn6Mvlgn7UqejTHAGTRSspo=;
 b=VVXJEcNkAuurw3915LaqcqBVc3YKr3A4iE9BRHa+rajQH7AXCNx9nqQK0/gG0zMYJJ
 NHB/WEl5s9Fu2yKg56VQ/LPEqTTVaoasq3VM0mqz55rCA+y0ulVMoU2wfL7V/yGBkkLu
 NUjTcI0Xdl4TkvcZCvGfNqFZOBvyp+PG55dnSlujnFbOQyq/wRoosDCaHC1jxeyfVxlK
 j56LbjoZ2Ht9SdQ1x+EtOYr4WfMjkrIBff7QnmKX/YgNuN4Vkj+4K3bQFL82ATPHPITL
 Erkwv9RkCqwIndIBoltA1qvxJNFEuv9zrgsJp/UPa/LBZ+52gEgVHkc4Ef3sDflpbIag
 RPXg==
X-Gm-Message-State: AOAM5307PygbIK/OLDLSnY+dnAer028ApzVp6pBlW8VCLhZVLiAmvnhR
 HKpu6FD7ZAxpgRozixK7rWZchvtYsKdjHQ==
X-Google-Smtp-Source: ABdhPJyE3B8cGkZZsQXvMrexeiP/exDN9gqSU+j8uRjRb2OTN5I4nWrtU/HlMXKYhMqKggsYsnQwlg==
X-Received: by 2002:a17:90a:ae14:: with SMTP id
 t20mr7076161pjq.13.1607597282900; 
 Thu, 10 Dec 2020 02:48:02 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id y1sm6386658pff.17.2020.12.10.02.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 02:48:02 -0800 (PST)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/3] usb: xhci-mtk: fix unreleased bandwidth data
Date: Thu, 10 Dec 2020 18:47:47 +0800
Message-Id: <20201210184700.v2.3.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201210104747.3416781-1-ikjn@chromium.org>
References: <20201210104747.3416781-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_054805_199630_4990D7AD 
X-CRM114-Status: GOOD (  21.15  )
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
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
to handle its own sw bandwidth managements and stores bandwidth data
into internal table every time add_endpoint() is called,
so when bandwidth allocation fails at one endpoint, all earlier
allocation from the same interface could still remain at the table.

This patch adds two more hooks from check_bandwidth() and
reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
from reset_bandwidth().

Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

Changes in v2:
- fix wrong offset in mediatek hw flags
- fix 0-day warnings

 drivers/usb/host/xhci-mtk-sch.c | 120 ++++++++++++++++++++++----------
 drivers/usb/host/xhci-mtk.h     |  13 ++++
 drivers/usb/host/xhci.c         |   9 +++
 3 files changed, 107 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 439391f1dc78..102d8e0a50f1 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -583,6 +583,8 @@ int xhci_mtk_sch_init(struct xhci_hcd_mtk *mtk)
 
 	mtk->sch_array = sch_array;
 
+	INIT_LIST_HEAD(&mtk->bw_ep_list_new);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_mtk_sch_init);
@@ -597,16 +599,14 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep)
 {
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
-	struct xhci_hcd *xhci;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_ep_ctx *ep_ctx;
 	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_virt_device *virt_dev;
 	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep;
 	unsigned int ep_index;
-	int ret = 0;
 
-	xhci = hcd_to_xhci(hcd);
 	virt_dev = xhci->devs[udev->slot_id];
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
@@ -637,42 +637,37 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 
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
+	list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_list_new);
 
-	list_add_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_mtk_add_ep_quirk);
 
-	ep_ctx->reserved[0] |= cpu_to_le32(EP_BPKTS(sch_ep->pkts)
-		| EP_BCSCOUNT(sch_ep->cs_count) | EP_BBM(sch_ep->burst_mode));
-	ep_ctx->reserved[1] |= cpu_to_le32(EP_BOFFSET(sch_ep->offset)
-		| EP_BREPEAT(sch_ep->repeat));
+static void xhci_mtk_drop_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
+			     struct mu3h_sch_ep_info *sch_ep)
+{
+	struct mu3h_sch_bw_info *sch_bw = get_bw_info(mtk, udev, sch_ep->ep);
 
-	xhci_dbg(xhci, " PKTS:%x, CSCOUNT:%x, BM:%x, OFFSET:%x, REPEAT:%x\n",
-			sch_ep->pkts, sch_ep->cs_count, sch_ep->burst_mode,
-			sch_ep->offset, sch_ep->repeat);
+	update_bus_bw(sch_bw, sch_ep, 0);
+	list_del(&sch_ep->endpoint);
 
-	return 0;
+	if (sch_ep->sch_tt) {
+		list_del(&sch_ep->tt_endpoint);
+		drop_tt(udev);
+	}
+	kfree(sch_ep);
 }
-EXPORT_SYMBOL_GPL(xhci_mtk_add_ep_quirk);
 
 void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
-		struct usb_host_endpoint *ep)
+			    struct usb_host_endpoint *ep)
 {
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
-	struct xhci_hcd *xhci;
-	struct xhci_slot_ctx *slot_ctx;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_virt_device *virt_dev;
+	struct xhci_slot_ctx *slot_ctx;
 	struct mu3h_sch_bw_info *sch_bw;
-	struct mu3h_sch_ep_info *sch_ep;
+	struct mu3h_sch_ep_info *sch_ep, *tmp;
 
-	xhci = hcd_to_xhci(hcd);
 	virt_dev = xhci->devs[udev->slot_id];
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
 
@@ -686,17 +681,72 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 
 	sch_bw = get_bw_info(mtk, udev, ep);
 
-	list_for_each_entry(sch_ep, &sch_bw->bw_ep_list, endpoint) {
+	list_for_each_entry_safe(sch_ep, tmp, &sch_bw->bw_ep_list, endpoint) {
 		if (sch_ep->ep == ep) {
-			update_bus_bw(sch_bw, sch_ep, 0);
-			list_del(&sch_ep->endpoint);
-			if (is_fs_or_ls(udev->speed)) {
-				list_del(&sch_ep->tt_endpoint);
-				drop_tt(udev);
-			}
-			kfree(sch_ep);
+			xhci_mtk_drop_ep(mtk, udev, sch_ep);
 			break;
 		}
 	}
 }
 EXPORT_SYMBOL_GPL(xhci_mtk_drop_ep_quirk);
+
+int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_virt_device *virt_dev = xhci->devs[udev->slot_id];
+	struct mu3h_sch_ep_info *sch_ep, *tmp;
+
+	dev_dbg(&udev->dev, "%s\n", __func__);
+
+	list_for_each_entry(sch_ep, &mtk->bw_ep_list_new, endpoint) {
+		int ret;
+		struct mu3h_sch_bw_info *sch_bw;
+
+		sch_bw = get_bw_info(mtk, udev, sch_ep->ep);
+
+		ret = check_sch_bw(udev, sch_bw, sch_ep);
+		if (ret) {
+			xhci_err(xhci, "Not enough bandwidth!\n");
+			return ret;
+		}
+	}
+
+	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
+		struct mu3h_sch_bw_info *sch_bw;
+		struct xhci_ep_ctx *ep_ctx;
+		struct usb_host_endpoint *ep = sch_ep->ep;
+		unsigned int ep_index = xhci_get_endpoint_index(&ep->desc);
+
+		sch_bw = get_bw_info(mtk, udev, ep);
+
+		list_move_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
+
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
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_mtk_check_bandwidth);
+
+void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
+	struct mu3h_sch_ep_info *sch_ep, *tmp;
+
+	dev_dbg(&udev->dev, "%s\n", __func__);
+
+	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
+		xhci_mtk_drop_ep(mtk, udev, sch_ep);
+	}
+}
+EXPORT_SYMBOL_GPL(xhci_mtk_reset_bandwidth);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 8be8c5f7ff62..05ca989985fc 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -130,6 +130,7 @@ struct mu3c_ippc_regs {
 struct xhci_hcd_mtk {
 	struct device *dev;
 	struct usb_hcd *hcd;
+	struct list_head bw_ep_list_new;
 	struct mu3h_sch_bw_info *sch_array;
 	struct mu3c_ippc_regs __iomem *ippc_regs;
 	bool has_ippc;
@@ -165,6 +166,8 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep);
 void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *ep);
+int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
+void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
 
 #else
 static inline int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd,
@@ -178,6 +181,16 @@ static inline void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd,
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
index 2bf6c526ac7a..5a9e01b33688 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2854,6 +2854,12 @@ static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 	xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
 	virt_dev = xhci->devs[udev->slot_id];
 
+	if (xhci->quirks & XHCI_MTK_HOST) {
+		ret = xhci_mtk_check_bandwidth(hcd, udev);
+		if (ret < 0)
+			return ret;
+	}
+
 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
 		return -ENOMEM;
@@ -2941,6 +2947,9 @@ static void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 		return;
 	xhci = hcd_to_xhci(hcd);
 
+	if (xhci->quirks & XHCI_MTK_HOST)
+		xhci_mtk_reset_bandwidth(hcd, udev);
+
 	xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
 	virt_dev = xhci->devs[udev->slot_id];
 	/* Free any rings allocated for added endpoints */
-- 
2.29.2.576.ga3fc446d84-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
