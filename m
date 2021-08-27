Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9075C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 03:31:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F1360FD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 03:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75F1360FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UcjVLUym/lWWgRtDtG0ANlIdIjaZI+7H+vDHOPTTM9Y=; b=wVArGx4VNoIAlI
	mETAY+ZKwCHUam0pjH2yINPuZIAIw7cLtCx/TN5LTQebnYwMi0dmDjQ8e1WxXy+ZUkeSdjAQu9YvG
	ypPlefpCFXjtl41E2hLiVTgO/QAuUSLoJedRyCiMFBhdc7JenongWNRcmIVLfErot0IORjGNmaI+E
	irz3DXxkTZ9DcWT779iPIKrsdMVMeE1ZFJU+iI9lj/49RGVs2lcO8oZtV/0QsrAGpxPvVdD+R2Lx9
	EvATgKrlJFhCbL8ttZTC50YYx8wnMGqZDxWBRLuubNC/koOC4esgIUJdz3yuJXMS69xf0jAz/DfwB
	1imAp+lODqeAjyGxuryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJSaW-00BQdJ-U6; Fri, 27 Aug 2021 03:31:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJSaG-00BQaq-0P; Fri, 27 Aug 2021 03:31:15 +0000
X-UUID: 1de08c9f8a9c423da4577e4914de9838-20210826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6jsHEMOMxYRjY3iG4KtKriKug/zewF8PHhD3AIHY88I=; 
 b=LwlzGdWxo6zRIoybXTKzAZvC89R6LbtxZUMhisPaOuIu3hzZ4cPhm+wZqPGO+kqemzx0lPrs+WvbaQKLgJRtBAInkLr9oxdXuBA3NrOn0MahHu5JQklkArgbwW/UPcOeaBaS+INn4LiklF4RnGqlM8ouOTP+bC0Baq96XlNGaa0=;
X-UUID: 1de08c9f8a9c423da4577e4914de9838-20210826
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1553383506; Thu, 26 Aug 2021 20:31:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Aug 2021 20:31:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 27 Aug 2021 11:31:06 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 27 Aug 2021 11:31:06 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH next v3] usb: xhci-mtk: allow bandwidth table rollover
Date: Fri, 27 Aug 2021 11:31:05 +0800
Message-ID: <20210827033105.26595-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_203112_107435_3D6C60C4 
X-CRM114-Status: GOOD (  17.95  )
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
v3: fix conficts with usb-testing branch
v2: new patch
---
 drivers/usb/host/xhci-mtk-sch.c | 54 ++++++++++-----------------------
 drivers/usb/host/xhci-mtk.h     |  3 +-
 2 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index f0ceede85ea5..134f4789bd89 100644
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
@@ -573,27 +573,9 @@ static int load_ep_bw(struct mu3h_sch_bw_info *sch_bw,
 	return 0;
 }
 
-static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
-{
-	u32 boundary = sch_ep->esit;
-
-	if (sch_ep->sch_tt) { /* LS/FS with TT */
-		/*
-		 * tune for CS, normally esit >= 8 for FS/LS,
-		 * not add one for other types to avoid access array
-		 * out of boundary
-		 */
-		if (sch_ep->ep_type == ISOC_OUT_EP && boundary > 1)
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
@@ -606,10 +588,6 @@ static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
 	 * and find a microframe where its worst bandwidth is minimum.
 	 */
 	for (offset = 0; offset < sch_ep->esit; offset++) {
-
-		if ((offset + sch_ep->num_budget_microframes) > esit_boundary)
-			break;
-
 		ret = check_sch_tt(sch_ep, offset);
 		if (ret)
 			continue;
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 9c54a597e66b..4b1ea89f959a 100644
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
