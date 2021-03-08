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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2E8C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:06:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 368C96514C
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 368C96514C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C0weJXbTA4dHWpJRbfcFVADIYsfskjq6Wyoz8VPeQ2c=; b=m7yuzxAK+S1t99ZJ2Vkd/3vd5
	2YtKuQb9UhrOPz3rcEBT3UXDrhx0wiHCnUTAjzs3tRZFj1lrMVgv/98bnCsfqlofEw1wkPRE1j+gW
	OwfiB6rWP3KUC/YOf7IMiqdR9XA07TdU20wrMGt6vVSadNbvlJ57NGveaUp8hMd8ELssZkses2/9o
	IPEtHs8QTXacHnISiFoYY4gHJjHUXDIP1d2fihjDdZBlEgZNZBdvJUCXmYpp4aIvLHKXaPH9+BG5G
	mCxigJWEufQM/r0+4quBqfgZlJ8SiIrizNr5/1VyTp4n8d5osqC+GTQolUIuT3gvKcQCowYHX34oM
	uVa2ZMTrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ6DM-00Eiso-Ks; Mon, 08 Mar 2021 03:05:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ6Ai-00Eh75-CB; Mon, 08 Mar 2021 03:03:06 +0000
X-UUID: 5e57440cad0741049d844ab5c95e8a91-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RyL0Mas8sxgiBQHrpwkPdKOyS6pvbx76ZMa4n8+Vp6c=; 
 b=HTc2rIuxeLTTkbGTJs2+wpaG3RrmxIUm5am+/sY9IMSZpXvfD+PShaivNA6naOzxNnkt60qdYzfMrmzE8dxlhJmPiMcDbcqBlh9NR6fgeNTfclKTr/rCK/OFfR+uv8KxLAAXOrBBl08ctDY+mHsNL3aSO72eIhnAEnaZ0zq+jaw=;
X-UUID: 5e57440cad0741049d844ab5c95e8a91-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 771509407; Sun, 07 Mar 2021 19:02:24 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 06/18] usb: xhci-mtk: add a function to (un)load bandwidth
 info
Date: Mon, 8 Mar 2021 10:51:55 +0800
Message-ID: <6fbc000756a4a4a7efbce651b785fee7561becb6.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_030304_944479_1D29A6A8 
X-CRM114-Status: GOOD (  14.05  )
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
v2: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 37 ++++++++++++++-------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index b1da3cb077c9..9a9685f74940 100644
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
