Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D62C49361
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 05:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE4B61026
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 05:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AE4B61026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xkmIR1seRb6tOMTwe/IWIsAh0KqFHEkLX+Iwmb6gpwE=; b=Pt2wNV1fxoL49b
	ljJXkffl83oxv0mRFZYbie+xK+4QWMzC6JHbZ9vjRD3hFctAj7Ex0YVwUeub3v7l60/nwJRrdf2oy
	T7QmYyv5S4hr9t4T3JmAJJ2UOndeVlfCHpBwRQrLt3ht4OTK3IMztzkGLx1zUQ7aoKcPCHmgcMCyH
	xgpo5ydVnpq76MOSrWzX8/fR26VfLqgiZGNB7XbRoST4/YTILvMDSXWolcb+Z1CRT8klMciMqrQNP
	8WGIa3c+4r17IGCqxo+w/UQv5lgzSG4ddZJ+vb6bidu5X/XlxcP5YiL10IofQ8AK5HXi7Bva2ewmO
	0GsD2UKT/RQDQOrvQ+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu7UR-00CmSq-8N; Fri, 18 Jun 2021 05:56:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu7UO-00CmSB-Js; Fri, 18 Jun 2021 05:56:26 +0000
X-UUID: c4d4ba4c33b7412c8d00972d8405820a-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=pDt1v7c9f94mCLUloPV846D8TqNhuKHO7PF1Bnf3C3s=; 
 b=pGeVvT3DlAAyGPCK9sW9JIC3KL9kgNQBL2iGQBFIu+E83REKpBCjMOqnaIc7WhsonLZlJpeodyst/Xai/cx8UEYs91ZgzpMue/zCQuvsg6zgo76c1YNJ80iQr8XpHb9+blJah+1CWleig1osDwbEUs6uL76SexWt1x+x8Hb3Dl8=;
X-UUID: c4d4ba4c33b7412c8d00972d8405820a-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1848419764; Thu, 17 Jun 2021 22:56:20 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 22:46:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 13:46:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 13:46:06 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Tianping Fang <tianping.fang@mediatek.com>
Subject: [PATCH v2] usb: xhci-mtk: allow multiple Start-Split in a microframe
Date: Fri, 18 Jun 2021 13:46:05 +0800
Message-ID: <1623995165-25759-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 02BB984D341FF26AAEC4515F05D01F59A1311868CC49A7C74FF13F345B3278832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_225624_710074_F70CA144 
X-CRM114-Status: GOOD (  15.07  )
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

This patch is used to relax bandwidth schedule by allowing multiple
Start-Split in the same microframe.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: fix build warning unused-but-set-variable
---
 drivers/usb/host/xhci-mtk-sch.c | 18 ------------------
 drivers/usb/host/xhci-mtk.h     |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index c07411d9b16f..cffcaf4dfa9f 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -470,11 +470,9 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 
 static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 {
-	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 extra_cs_count;
 	u32 start_ss, last_ss;
 	u32 start_cs, last_cs;
-	int i;
 
 	if (!sch_ep->sch_tt)
 		return 0;
@@ -491,10 +489,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		if (!(start_ss == 7 || last_ss < 6))
 			return -ESCH_SS_Y6;
 
-		for (i = 0; i < sch_ep->cs_count; i++)
-			if (test_bit(offset + i, tt->ss_bit_map))
-				return -ESCH_SS_OVERLAP;
-
 	} else {
 		u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
@@ -521,9 +515,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		if (cs_count > 7)
 			cs_count = 7; /* HW limit */
 
-		if (test_bit(offset, tt->ss_bit_map))
-			return -ESCH_SS_OVERLAP;
-
 		sch_ep->cs_count = cs_count;
 		/* one for ss, the other for idle */
 		sch_ep->num_budget_microframes = cs_count + 2;
@@ -544,11 +535,9 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 base, num_esit;
 	int bw_updated;
-	int bits;
 	int i, j;
 
 	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	bits = (sch_ep->ep_type == ISOC_OUT_EP) ? sch_ep->cs_count : 1;
 
 	if (used)
 		bw_updated = sch_ep->bw_cost_per_microframe;
@@ -558,13 +547,6 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 	for (i = 0; i < num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
 
-		for (j = 0; j < bits; j++) {
-			if (used)
-				set_bit(base + j, tt->ss_bit_map);
-			else
-				clear_bit(base + j, tt->ss_bit_map);
-		}
-
 		for (j = 0; j < sch_ep->cs_count; j++)
 			tt->fs_bus_bw[base + j] += bw_updated;
 	}
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index cd3a37bb73e6..390cb5a86082 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -24,12 +24,10 @@
 #define XHCI_MTK_MAX_ESIT	64
 
 /**
- * @ss_bit_map: used to avoid start split microframes overlay
  * @fs_bus_bw: array to keep track of bandwidth already used for FS
  * @ep_list: Endpoints using this TT
  */
 struct mu3h_sch_tt {
-	DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
 	u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
 	struct list_head ep_list;
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
