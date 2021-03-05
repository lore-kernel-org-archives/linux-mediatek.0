Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDCCC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:04:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B9A64F69
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7B9A64F69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JNO2Ytmqh51xulFQhS2Ce94wxtVQ0leiKW9kN2Yd3Js=; b=BK6RPAIIVsiWx6NA8M/NUMkhq
	PnGk+eHzy5tBUR8fV3Z7+WdsqE2IKEiPLWu2qkfFGASxkGR7qX0piaG7FrB7u5Z7HTy03QVujNMBH
	hDoef7MeJGkMflTuN/9kE1qp+PrjIpPmKRNMNcoCzXNc0DX6aKA11XKFLlUiEOhRuxkKOfwJo0b2W
	TVadQXvq2nKwj336WV38zESQp0yMdNNzr/NvZxS9PtVv4n1drpXL/FOVG4EmXTtAAOcgY+RouTcpm
	TdPfat774tGuQ9syl7OvxMYtVBWtSacthSWI+5E++tzlkGOrW4mnfav7ri9u06d7chWky5o4FV2gE
	fhWr+U5/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6NU-00E8cr-7s; Fri, 05 Mar 2021 09:04:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6Ms-00E8QS-8e; Fri, 05 Mar 2021 09:03:34 +0000
X-UUID: 0d72662d1df24cff8f7c76652617279e-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LA4CXle4qPwo4YDy5IXBG05NhCtJSRunZQUdgTJYyXs=; 
 b=srrjHXOdgsU07vya8xs7qrOCIgiCjOBa5R6qYLs+pGZyRIPdw48hof3OG+1li/G6iWA7Dmw7BK36M69TQQiUUMszTX2q6OkU84Md6VnvkBxzk/FI6kQOnnleQxNEMw25GSZtjkh5O48wuQ0XUGlKoGE/G8jilIsxIokTbGygRDk=;
X-UUID: 0d72662d1df24cff8f7c76652617279e-20210305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1564325063; Fri, 05 Mar 2021 01:03:20 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 06/17] usb: xhci-mtk: add a function to (un)load bandwidth info
Date: Fri, 5 Mar 2021 17:02:44 +0800
Message-ID: <1614934975-15188-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_090332_492565_AB5F6798 
X-CRM114-Status: GOOD (  13.27  )
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

Extract a function to load/unload bandwidth info, and remove
a dummy check of TT offset.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 37 ++++++++++++++-------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 9016188eee97..bef82c1f909d 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -375,7 +375,6 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 					sch_ep->bw_budget_table[j];
 		}
 	}
-	sch_ep->allocated = used;
 }
 
 static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
@@ -509,6 +508,19 @@ static void update_sch_tt(struct usb_device *udev,
 		list_del(&sch_ep->tt_endpoint);
 }
 
+static int load_ep_bw(struct usb_device *udev, struct mu3h_sch_bw_info *sch_bw,
+		      struct mu3h_sch_ep_info *sch_ep, bool loaded)
+{
+	if (sch_ep->sch_tt)
+		update_sch_tt(udev, sch_ep, loaded);
+
+	/* update bus bandwidth info */
+	update_bus_bw(sch_bw, sch_ep, loaded);
+	sch_ep->allocated = loaded;
+
+	return 0;
+}
+
 static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
 {
 	u32 boundary = sch_ep->esit;
@@ -535,7 +547,6 @@ static int check_sch_bw(struct usb_device *udev,
 	u32 esit_boundary;
 	u32 min_num_budget;
 	u32 min_cs_count;
-	bool tt_offset_ok = false;
 	int ret;
 
 	/*
@@ -552,8 +563,6 @@ static int check_sch_bw(struct usb_device *udev,
 			ret = check_sch_tt(udev, sch_ep, offset);
 			if (ret)
 				continue;
-			else
-				tt_offset_ok = true;
 		}
 
 		if ((offset + sch_ep->num_budget_microframes) > esit_boundary)
@@ -585,29 +594,15 @@ static int check_sch_bw(struct usb_device *udev,
 	sch_ep->cs_count = min_cs_count;
 	sch_ep->num_budget_microframes = min_num_budget;
 
-	if (sch_ep->sch_tt) {
-		/* all offset for tt is not ok*/
-		if (!tt_offset_ok)
-			return -ERANGE;
-
-		update_sch_tt(udev, sch_ep, 1);
-	}
-
-	/* update bus bandwidth info */
-	update_bus_bw(sch_bw, sch_ep, 1);
-
-	return 0;
+	return load_ep_bw(udev, sch_bw, sch_ep, true);
 }
 
 static void destroy_sch_ep(struct usb_device *udev,
 	struct mu3h_sch_bw_info *sch_bw, struct mu3h_sch_ep_info *sch_ep)
 {
 	/* only release ep bw check passed by check_sch_bw() */
-	if (sch_ep->allocated) {
-		update_bus_bw(sch_bw, sch_ep, 0);
-		if (sch_ep->sch_tt)
-			update_sch_tt(udev, sch_ep, 0);
-	}
+	if (sch_ep->allocated)
+		load_ep_bw(udev, sch_bw, sch_ep, false);
 
 	if (sch_ep->sch_tt)
 		drop_tt(udev);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
