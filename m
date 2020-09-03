Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A97C433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:40:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279392080C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cvXm7i70";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FffztwOY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279392080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+cMCUIvNMx5Nusf2TdG33MUd1pCs/zwYfv1wavz3/Qo=; b=cvXm7i70Gty/9YR0mPKzpur8rs
	LNjxGvTs2tikDMDPjXuoXqpFq1MRXnVG9Bjt3IEY1jxDvvwu8FAcM/O7NmqyjYx/vCZJEDV+YLj3E
	cuwyMuxjwnb2dXwE/JIz938carYnRJlqFpnq6DzXFumZth27HY+W0fCChwYJf3xnCjdy1BbE1Ewvv
	n5RhyXrZ/VbSNYDnKOiRoD0IeU5P2EvxnDKfin7CggRSHRUOXvktauCN4fgoIefkW8CbHxROYweoS
	lIjTi+MSBxGHWd5dj0WzDYY1poGaXYsJWyh6d+67+oyVdueJIoNzVwhnCrnXehTBYwUtl2gQh82pa
	vsQvfsUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDg6W-00071D-7c; Thu, 03 Sep 2020 03:40:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDg6J-0006sp-5r; Thu, 03 Sep 2020 03:39:53 +0000
X-UUID: 48386b4ca6804a4295eb9bb0a362fce7-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=l3EbkQdRiEbnD4eo5ajOcZQMO9Q+g+tkG31DY7MaqFw=; 
 b=FffztwOYLryYV1Vq/dAMIIwDcdrJGyG7luRROUF+Xt88tmQX+3jVkywN9c9B7JCx4Synl3ZZbgnTeqYWdo/Ls1ofPPFV3btM1MZT/ilNXFAPvig6kuFPPpv4BzuE7LmW4ebc1KXEsvvcxACy4v/y+8IcNXRTQcVYcXRSBOaE8Cg=;
X-UUID: 48386b4ca6804a4295eb9bb0a362fce7-20200902
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1937873644; Wed, 02 Sep 2020 19:31:21 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:31:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:31:14 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Sep 2020 11:31:14 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Zhanyong Wang <zhanyong.wang@mediatek.com>
Subject: [RFC PATCH 1/4] usb: xhci-mtk: improve bandwidth scheduling with
 multi-TT
Date: Thu, 3 Sep 2020 11:28:56 +0800
Message-ID: <1599103739-7873-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3D133A1F43B1CBBF7B1690D57DB5E46500CA11DE79EDFE7DC8771C4CA5147A0A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_233951_378808_A4B5EB33 
X-CRM114-Status: GOOD (  19.89  )
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
Cc: Yaqii Wu <yaqii.wu@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Zhanyong Wang <zhanyong.wang@mediatek.com>

After inserted the usb type-c 3.5mm dongle with headset, dmesg showed:
usb 1-1.1: new full-speed USB device number 5 using xhci-mtk
usb 1-1.1: New USB device found, idVendor=05ac, idProduct=110a, bcdDevice=26.11
usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1.1: Product: USB-C to 3.5mm Headphone Jack Adapter
usb 1-1.1: Manufacturer: Apple, Inc.
usb 1-1.1: SerialNumber: DWH915501TFJKLTAM
xhci-mtk 11200000.xhci: Not enough bandwidth!
usb 1-1.1: can't set config #2, error -28

improve low-speed/full-speed INT/ISOC bandwidth scheduling with USB
muli-TT.

Signed-off-by: Yaqii Wu <yaqii.wu@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 91 ++++++++++++++++++++++++++++++++++-------
 drivers/usb/host/xhci-mtk.h     |  8 +++-
 2 files changed, 84 insertions(+), 15 deletions(-)
 mode change 100644 => 100755 drivers/usb/host/xhci-mtk-sch.c

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
old mode 100644
new mode 100755
index 45c54d56..94292b9
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -383,7 +383,9 @@ static int check_sch_tt(struct usb_device *udev,
 	u32 fs_budget_start;
 	u32 start_ss, last_ss;
 	u32 start_cs, last_cs;
-	int i;
+	u32 num_esit, base;
+	int i, j;
+	u32 tmp;
 
 	start_ss = offset % 8;
 	fs_budget_start = (start_ss + 1) % 8;
@@ -398,10 +400,13 @@ static int check_sch_tt(struct usb_device *udev,
 		if (!(start_ss == 7 || last_ss < 6))
 			return -ERANGE;
 
-		for (i = 0; i < sch_ep->cs_count; i++)
-			if (test_bit(offset + i, tt->split_bit_map))
+		for (i = 0; i < sch_ep->cs_count; i++) {
+			if (test_bit(offset + i, tt->ss_bit_map))
 				return -ERANGE;
 
+			if (test_bit(offset + i, tt->cs_bit_map))
+				return -ERANGE;
+		}
 	} else {
 		u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
@@ -428,8 +433,10 @@ static int check_sch_tt(struct usb_device *udev,
 		if (cs_count > 7)
 			cs_count = 7; /* HW limit */
 
-		for (i = 0; i < cs_count + 2; i++) {
-			if (test_bit(offset + i, tt->split_bit_map))
+		if (test_bit(offset, tt->ss_bit_map))
+			return -ERANGE;
+		for (i = 0; i < cs_count; i++) {
+			if (test_bit(offset + 2 + i, tt->cs_bit_map))
 				return -ERANGE;
 		}
 
@@ -445,11 +452,22 @@ static int check_sch_tt(struct usb_device *udev,
 			sch_ep->num_budget_microframes = sch_ep->esit;
 	}
 
+	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
+	for (i = 0; i < num_esit; i++) {
+		base = sch_ep->offset + i * sch_ep->esit;
+		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+			tmp = tt->fs_bus_bw[base + j]
+			      + sch_ep->bw_cost_per_microframe;
+			if (tmp > FS_PAYLOAD_MAX)
+				return -ERANGE;
+		}
+	}
+
 	return 0;
 }
 
 static void update_sch_tt(struct usb_device *udev,
-	struct mu3h_sch_ep_info *sch_ep)
+	struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 base, num_esit;
@@ -458,11 +476,52 @@ static void update_sch_tt(struct usb_device *udev,
 	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
 	for (i = 0; i < num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
-		for (j = 0; j < sch_ep->num_budget_microframes; j++)
-			set_bit(base + j, tt->split_bit_map);
+		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+			if (used)
+				set_bit(base + j, tt->split_bit_map);
+			else
+				clear_bit(base + j, tt->split_bit_map);
+		}
+
+		if (sch_ep->ep_type == ISOC_OUT_EP) {
+			for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+				if (used) {
+					set_bit(base + j, tt->ss_bit_map);
+					set_bit(base + j, tt->cs_bit_map);
+					tt->fs_bus_bw[base + j] +=
+						sch_ep->bw_cost_per_microframe;
+				} else {
+					clear_bit(base + j, tt->ss_bit_map);
+					clear_bit(base + j, tt->cs_bit_map);
+					tt->fs_bus_bw[base + j] -=
+						sch_ep->bw_cost_per_microframe;
+				}
+			}
+		} else {
+			if (used)
+				set_bit(base, tt->ss_bit_map);
+			else
+				clear_bit(base, tt->ss_bit_map);
+
+			for (j = 0; j < sch_ep->cs_count; j++) {
+				if (used) {
+					set_bit(base + 2 + j, tt->cs_bit_map);
+
+					tt->fs_bus_bw[base + 2 + j] +=
+						sch_ep->bw_cost_per_microframe;
+				} else {
+					clear_bit(base + 2 + j, tt->cs_bit_map);
+					tt->fs_bus_bw[base + 2 + j] -=
+						sch_ep->bw_cost_per_microframe;
+				}
+			}
+		}
 	}
 
-	list_add_tail(&sch_ep->tt_endpoint, &tt->ep_list);
+	if (used)
+		list_add_tail(&sch_ep->tt_endpoint, &tt->ep_list);
+	else
+		list_del(&sch_ep->tt_endpoint);
 }
 
 static int check_sch_bw(struct usb_device *udev,
@@ -470,6 +529,7 @@ static int check_sch_bw(struct usb_device *udev,
 {
 	u32 offset;
 	u32 esit;
+	u32 boundary;
 	u32 min_bw;
 	u32 min_index;
 	u32 worst_bw;
@@ -487,10 +547,13 @@ static int check_sch_bw(struct usb_device *udev,
 	 */
 	min_bw = ~0;
 	min_index = 0;
+	boundary = esit;
 	min_cs_count = sch_ep->cs_count;
 	min_num_budget = sch_ep->num_budget_microframes;
 	for (offset = 0; offset < esit; offset++) {
 		if (is_fs_or_ls(udev->speed)) {
+			if (sch_ep->ep_type != ISOC_OUT_EP)
+				boundary = esit + 1;
 			ret = check_sch_tt(udev, sch_ep, offset);
 			if (ret)
 				continue;
@@ -498,7 +561,7 @@ static int check_sch_bw(struct usb_device *udev,
 				tt_offset_ok = true;
 		}
 
-		if ((offset + sch_ep->num_budget_microframes) > sch_ep->esit)
+		if ((offset + sch_ep->num_budget_microframes) > boundary)
 			break;
 
 		worst_bw = get_max_bw(sch_bw, sch_ep, offset);
@@ -532,7 +595,7 @@ static int check_sch_bw(struct usb_device *udev,
 		if (!tt_offset_ok)
 			return -ERANGE;
 
-		update_sch_tt(udev, sch_ep);
+		update_sch_tt(udev, sch_ep, 1);
 	}
 
 	/* update bus bandwidth info */
@@ -696,12 +759,12 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 
 	list_for_each_entry(sch_ep, &sch_bw->bw_ep_list, endpoint) {
 		if (sch_ep->ep == ep) {
-			update_bus_bw(sch_bw, sch_ep, 0);
-			list_del(&sch_ep->endpoint);
 			if (is_fs_or_ls(udev->speed)) {
-				list_del(&sch_ep->tt_endpoint);
+				update_sch_tt(udev, sch_ep, 0);
 				drop_tt(udev);
 			}
+			update_bus_bw(sch_bw, sch_ep, 0);
+			list_del(&sch_ep->endpoint);
 			kfree(sch_ep);
 			break;
 		}
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index a93cfe8..323b281 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -21,12 +21,18 @@
 
 /**
  * @split_bit_map: used to avoid split microframes overlay
+ * @ss_bit_map: used to avoid start split microframes overlay
+ * @cs_bit_map: used to avoid complete split microframes overlay
+ * @fs_bus_bw: array to keep track of bandwidth already used at full speed
  * @ep_list: Endpoints using this TT
  * @usb_tt: usb TT related
  * @tt_port: TT port number
  */
 struct mu3h_sch_tt {
 	DECLARE_BITMAP(split_bit_map, XHCI_MTK_MAX_ESIT);
+	DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
+	DECLARE_BITMAP(cs_bit_map, XHCI_MTK_MAX_ESIT + 1);
+	u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
 	struct list_head ep_list;
 	struct usb_tt *usb_tt;
 	int tt_port;
@@ -42,7 +48,7 @@ struct mu3h_sch_tt {
  * two bandwidth domains, one for IN eps and another for OUT eps.
  */
 struct mu3h_sch_bw_info {
-	u32 bus_bw[XHCI_MTK_MAX_ESIT];
+	u32 bus_bw[XHCI_MTK_MAX_ESIT + 1];
 	struct list_head bw_ep_list;
 };
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
