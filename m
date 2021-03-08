Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE50C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:54:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F1C16514C
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F1C16514C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uQprfNgkN27LVhFlHppU4lXkbmksQez4n0mjMvEOrd4=; b=nvg0FLNIMEk1FAGZqKDOaVBlp
	svxMjyNDxTyGHJ6sj8ZCNDld1uQlxFi1mVas5Z6EoDHLpfv18nSJpmjfl7hO/N2P5JxRdjEFjK0dL
	MnHl95qDhmh+IaNCy+Xe10Kj5du0m1Dp1NKa86bS6/RfQv660EI5VbBFaqCD+l4UBUT8RXZCrFPuO
	GjsfFeAfBEkr0Hxp2uZx5p67Re7i3Xw+GitBF4goRMAxV/I4YWml1ru8qpkay5i2oi5LfrJumX1y7
	y/NnhnnpREVPNl2edDN9BcuFyBU2ISbHq1+qiRJs1LxT5ARH14sYDkyg0yJlVNtWb9CmFjzyGXh6S
	sC3toX8AA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ62V-00EeAT-Q4; Mon, 08 Mar 2021 02:54:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ60u-00Ed9q-U4; Mon, 08 Mar 2021 02:53:02 +0000
X-UUID: e5dbedd30480419a9036dfd3cd0f8032-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=a4U0GU9JsH2mcQ5EP1gDFV3sLL0xtwinZZ3HlLaR7ts=; 
 b=aKK+H90wIHcp3eRn6584GTcRIS87VaJeN//jH0s++wivXxPtW4V6jcX0SSNMuMrBB5oUf/vs0lzk5uarNQ4gQifo3UMTq9fl4hxxfGFbs0TDkaFpTK36DLRVecRb6RWzFxoZJM4J+5lUacZQYt5qL9vXJh8cutzKmURZxOMGpS8=;
X-UUID: e5dbedd30480419a9036dfd3cd0f8032-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 100402120; Sun, 07 Mar 2021 18:52:35 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:23 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:22 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:21 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 10/18] usb: xhci-mtk: add a member @speed in
 mu3h_sch_ep_info struct
Date: Mon, 8 Mar 2021 10:51:59 +0800
Message-ID: <cda0833e44d6027cc8fdee1e29ce2b5b2a6ac03d.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_025300_547284_340592D3 
X-CRM114-Status: GOOD (  18.79  )
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

This is used to drop parameter @udev for some functions,
meanwhile remove some unused @udev parameter.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 37 ++++++++++++++++-----------------
 drivers/usb/host/xhci-mtk.h     |  1 +
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 6fb7a040c73c..3dc727b820aa 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -214,14 +214,15 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
 
 	sch_ep->sch_tt = tt;
 	sch_ep->ep = ep;
+	sch_ep->speed = udev->speed;
 	INIT_LIST_HEAD(&sch_ep->endpoint);
 	INIT_LIST_HEAD(&sch_ep->tt_endpoint);
 
 	return sch_ep;
 }
 
-static void setup_sch_info(struct usb_device *udev,
-		struct xhci_ep_ctx *ep_ctx, struct mu3h_sch_ep_info *sch_ep)
+static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
+			   struct mu3h_sch_ep_info *sch_ep)
 {
 	u32 ep_type;
 	u32 maxpkt;
@@ -248,7 +249,7 @@ static void setup_sch_info(struct usb_device *udev,
 	sch_ep->burst_mode = 0;
 	sch_ep->repeat = 0;
 
-	if (udev->speed == USB_SPEED_HIGH) {
+	if (sch_ep->speed == USB_SPEED_HIGH) {
 		sch_ep->cs_count = 0;
 
 		/*
@@ -266,7 +267,7 @@ static void setup_sch_info(struct usb_device *udev,
 		sch_ep->pkts = max_burst + 1;
 		sch_ep->bw_cost_per_microframe = maxpkt * sch_ep->pkts;
 		bwb_table[0] = sch_ep->bw_cost_per_microframe;
-	} else if (udev->speed >= USB_SPEED_SUPER) {
+	} else if (sch_ep->speed >= USB_SPEED_SUPER) {
 		/* usb3_r1 spec section4.4.7 & 4.4.8 */
 		sch_ep->cs_count = 0;
 		sch_ep->burst_mode = 1;
@@ -311,7 +312,7 @@ static void setup_sch_info(struct usb_device *udev,
 			/* last one <= bw_cost_per_microframe */
 			bwb_table[i] = remainder;
 		}
-	} else if (is_fs_or_ls(udev->speed)) {
+	} else if (is_fs_or_ls(sch_ep->speed)) {
 		sch_ep->pkts = 1; /* at most one packet for each microframe */
 
 		/*
@@ -416,8 +417,7 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 	return 0;
 }
 
-static int check_sch_tt(struct usb_device *udev,
-	struct mu3h_sch_ep_info *sch_ep, u32 offset)
+static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 extra_cs_count;
@@ -485,8 +485,7 @@ static int check_sch_tt(struct usb_device *udev,
 	return check_fs_bus_bw(sch_ep, offset);
 }
 
-static void update_sch_tt(struct usb_device *udev,
-	struct mu3h_sch_ep_info *sch_ep, bool used)
+static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 base, num_esit;
@@ -522,11 +521,11 @@ static void update_sch_tt(struct usb_device *udev,
 		list_del(&sch_ep->tt_endpoint);
 }
 
-static int load_ep_bw(struct usb_device *udev, struct mu3h_sch_bw_info *sch_bw,
+static int load_ep_bw(struct mu3h_sch_bw_info *sch_bw,
 		      struct mu3h_sch_ep_info *sch_ep, bool loaded)
 {
 	if (sch_ep->sch_tt)
-		update_sch_tt(udev, sch_ep, loaded);
+		update_sch_tt(sch_ep, loaded);
 
 	/* update bus bandwidth info */
 	update_bus_bw(sch_bw, sch_ep, loaded);
@@ -550,8 +549,8 @@ static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
 	return boundary;
 }
 
-static int check_sch_bw(struct usb_device *udev,
-	struct mu3h_sch_bw_info *sch_bw, struct mu3h_sch_ep_info *sch_ep)
+static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
+			struct mu3h_sch_ep_info *sch_ep)
 {
 	u32 offset;
 	u32 min_bw;
@@ -574,7 +573,7 @@ static int check_sch_bw(struct usb_device *udev,
 	esit_boundary = get_esit_boundary(sch_ep);
 	for (offset = 0; offset < sch_ep->esit; offset++) {
 		if (sch_ep->sch_tt) {
-			ret = check_sch_tt(udev, sch_ep, offset);
+			ret = check_sch_tt(sch_ep, offset);
 			if (ret)
 				continue;
 		}
@@ -593,7 +592,7 @@ static int check_sch_bw(struct usb_device *udev,
 			break;
 	}
 
-	bw_boundary = get_bw_boundary(udev->speed);
+	bw_boundary = get_bw_boundary(sch_ep->speed);
 	/* check bandwidth */
 	if (min_bw > bw_boundary)
 		return -ERANGE;
@@ -602,7 +601,7 @@ static int check_sch_bw(struct usb_device *udev,
 	sch_ep->cs_count = min_cs_count;
 	sch_ep->num_budget_microframes = min_num_budget;
 
-	return load_ep_bw(udev, sch_bw, sch_ep, true);
+	return load_ep_bw(sch_bw, sch_ep, true);
 }
 
 static void destroy_sch_ep(struct usb_device *udev,
@@ -610,7 +609,7 @@ static void destroy_sch_ep(struct usb_device *udev,
 {
 	/* only release ep bw check passed by check_sch_bw() */
 	if (sch_ep->allocated)
-		load_ep_bw(udev, sch_bw, sch_ep, false);
+		load_ep_bw(sch_bw, sch_ep, false);
 
 	if (sch_ep->sch_tt)
 		drop_tt(udev);
@@ -711,7 +710,7 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	if (IS_ERR_OR_NULL(sch_ep))
 		return -ENOMEM;
 
-	setup_sch_info(udev, ep_ctx, sch_ep);
+	setup_sch_info(ep_ctx, sch_ep);
 
 	list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_chk_list);
 
@@ -771,7 +770,7 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 		bw_index = get_bw_index(xhci, udev, sch_ep->ep);
 		sch_bw = &mtk->sch_array[bw_index];
 
-		ret = check_sch_bw(udev, sch_bw, sch_ep);
+		ret = check_sch_bw(sch_bw, sch_ep);
 		if (ret) {
 			xhci_err(xhci, "Not enough bandwidth!\n");
 			return -ENOSPC;
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 076b9bbc89dd..d25bf9e49136 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -85,6 +85,7 @@ struct mu3h_sch_ep_info {
 	u32 ep_type;
 	u32 maxpkt;
 	struct usb_host_endpoint *ep;
+	enum usb_device_speed speed;
 	bool allocated;
 	/*
 	 * mtk xHCI scheduling information put into reserved DWs
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
