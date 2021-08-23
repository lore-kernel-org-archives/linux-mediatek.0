Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FA1C4320E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864C2613A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 864C2613A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HaQZYaniJQst0MULadxbNYYNoQ60ANtaPjPi0jkQ3bI=; b=LgTydgeArPMmXY
	bG0rjttTWZbYiAa+StbbPhn7R5fNeq+xWYmSwSReGY5yqng2OgMOvkvsfBtJSKxm4xq2t0FJpOcwH
	BEwaf3lO0wgoczQZys3sOJJybQW3t3Zs64grAgR31658xYUWoESwdmNyjMV1BpXBIenbOivlRJi5D
	oYnXeytvk2UXL5+a2hc6MrC1DRT21JdDKI4QdbvT9CBeKX7d5J6kxIE3TKPhWVAobQNGBDSPVRlBe
	AOtKCaC+b63DU49tmtwIz+so0ICMi131/uQ8zNMR5lJ59XV1tXfS3z181VhE6EVwYoKlpdrVHKle0
	4NsZE/HjHTGNFHZI7x2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9T8-00Gr4t-SB; Mon, 23 Aug 2021 12:54:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9Sz-00Gr0Y-60
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:54:24 +0000
X-UUID: 000dfeac3ce44f3f8aef729fc07476bf-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=J75S79D3URznFgkRy3FuBHky4UIb0l5nVCykOn27lWc=; 
 b=XQtKUOqKHLU7Y2bA2xAip+Re8QDt+8CYc+GPgBDmeSs26IwzgmDR+V/CGcm3k6QOpXzevrdvN3LVvOtepTGih/DebC9h7cH6NnRMN0eUdZOFGsuQOn+efMt30Cc7jYDCVavg4R/4hKDn4h1nftR1odK+rg2rVMy2cjulBXT/Ggw=;
X-UUID: 000dfeac3ce44f3f8aef729fc07476bf-20210823
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 385329533; Mon, 23 Aug 2021 05:54:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 05:54:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 23 Aug 2021 20:54:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Aug 2021 20:54:06 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: Yaqii wu <yaqii.wu@mediatek.com>, <srv_wsdupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [RFC PATCH 4/6] usb: xhci-mtk: allow bandwidth table rollover
Date: Mon, 23 Aug 2021 20:53:54 +0800
Message-ID: <1629723236-10768-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629723236-10768-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629723236-10768-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_055417_327117_96C2FD4A 
X-CRM114-Status: GOOD (  17.69  )
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

xhci-mtk has 64 slots for periodic bandwidth calculations and each
slot represents byte budgets on a microframe. When an endpoint's
allocation sits on the boundary of the table, byte budgets' slot
can be rolled over but the current implementation doesn't.

This patch allows the microframe index rollover and prevent
out-of-bounds array access.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 51 +++++++++++----------------------
 drivers/usb/host/xhci-mtk.h     |  3 +-
 2 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index f3c6f078f82d..134f4789bd89 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -416,15 +416,14 @@ static u32 get_max_bw(struct mu3h_sch_bw_info *sch_bw,
 {
 	u32 max_bw = 0;
 	u32 bw;
-	int i;
-	int j;
+	int i, j, k;
 
 	for (i = 0; i < sch_ep->num_esit; i++) {
 		u32 base = offset + i * sch_ep->esit;
 
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
-			bw = sch_bw->bus_bw[base + j] +
-					sch_ep->bw_budget_table[j];
+			k = XHCI_MTK_BW_INDEX(base + j);
+			bw = sch_bw->bus_bw[k] + sch_ep->bw_budget_table[j];
 			if (bw > max_bw)
 				max_bw = bw;
 		}
@@ -436,18 +435,16 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 	struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	u32 base;
-	int i;
-	int j;
+	int i, j, k;
 
 	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+			k = XHCI_MTK_BW_INDEX(base + j);
 			if (used)
-				sch_bw->bus_bw[base + j] +=
-					sch_ep->bw_budget_table[j];
+				sch_bw->bus_bw[k] += sch_ep->bw_budget_table[j];
 			else
-				sch_bw->bus_bw[base + j] -=
-					sch_ep->bw_budget_table[j];
+				sch_bw->bus_bw[k] -= sch_ep->bw_budget_table[j];
 		}
 	}
 }
@@ -457,7 +454,7 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 tmp;
 	int base;
-	int i, j;
+	int i, j, k;
 
 	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = offset + i * sch_ep->esit;
@@ -467,7 +464,8 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 		 * the hub will always delay one uframe to send data
 		 */
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
-			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_budget_table[j];
+			k = XHCI_MTK_BW_INDEX(base + j);
+			tmp = tt->fs_bus_bw[k] + sch_ep->bw_budget_table[j];
 			if (tmp > FS_PAYLOAD_MAX)
 				return -ESCH_BW_OVERFLOW;
 		}
@@ -542,16 +540,18 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 base;
-	int i, j;
+	int i, j, k;
 
 	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
 
-		for (j = 0; j < sch_ep->num_budget_microframes; j++)
+		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+			k = XHCI_MTK_BW_INDEX(base + j);
 			if (used)
-				tt->fs_bus_bw[base + j] += sch_ep->bw_budget_table[j];
+				tt->fs_bus_bw[k] += sch_ep->bw_budget_table[j];
 			else
-				tt->fs_bus_bw[base + j] -= sch_ep->bw_budget_table[j];
+				tt->fs_bus_bw[k] -= sch_ep->bw_budget_table[j];
+		}
 	}
 
 	if (used)
@@ -573,25 +573,9 @@ static int load_ep_bw(struct mu3h_sch_bw_info *sch_bw,
 	return 0;
 }
 
-static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
-{
-	u32 boundary = sch_ep->esit;
-
-	if (sch_ep->sch_tt) { /* LS/FS with TT */
-		/* tune for CS */
-		if (sch_ep->ep_type != ISOC_OUT_EP)
-			boundary++;
-		else if (boundary > 1) /* normally esit >= 8 for FS/LS */
-			boundary--;
-	}
-
-	return boundary;
-}
-
 static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
 {
 	struct mu3h_sch_bw_info *sch_bw = sch_ep->bw_info;
-	const u32 esit_boundary = get_esit_boundary(sch_ep);
 	const u32 bw_boundary = get_bw_boundary(sch_ep->speed);
 	u32 offset;
 	u32 worst_bw;
@@ -608,9 +592,6 @@ static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
 		if (ret)
 			continue;
 
-		if ((offset + sch_ep->num_budget_microframes) > esit_boundary)
-			break;
-
 		worst_bw = get_max_bw(sch_bw, sch_ep, offset);
 		if (worst_bw > bw_boundary)
 			continue;
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index dc5e83f5c5cc..7cc0123eada0 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -25,7 +25,8 @@
  * round down to the limit value, that means allocating more
  * bandwidth to it.
  */
-#define XHCI_MTK_MAX_ESIT	64
+#define XHCI_MTK_MAX_ESIT	(1 << 6)
+#define XHCI_MTK_BW_INDEX(x)	((x) & (XHCI_MTK_MAX_ESIT - 1))
 
 /**
  * @fs_bus_bw: array to keep track of bandwidth already used for FS
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
