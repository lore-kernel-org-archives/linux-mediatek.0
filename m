Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF086C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:00:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F8961075
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87F8961075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wBaT6SOJUymc/e5/f5b23gi812uz6OuWJLPeWE51bdQ=; b=mqwVy/gtMjjMZt
	flsXo8y65RHnSN/MURaq/OyskeaCH7BhRNG88p/aPxAdgc0HPmudb9WbeDXNFgA7eQNUuu87/fL/1
	WLXA3/p5FXsjEMR1rF8B8Ym+nfxLUvtTIHXrNmotseIlpYWDv+7LJY8U+5u7SrMZsy9KPb+0XDBsv
	2nE04JYuCknweAa7KdbzJcy1r07NjpcX4yIT3tTsKLpKv7vzt0M9B/yMmyS0hKWrW0OaZDhue42Oo
	8JY1PEi7gVdSp7xgWqeW07kgcH+TzLCXmODtp36skN5MN8L8VgsCHb2byUGfB5tX7oK9NfOaXpqFN
	NLmHoQi0KE18b5ncOy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD18P-00HWur-4r; Mon, 09 Aug 2021 08:59:49 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD18B-00HWsJ-9E
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 08:59:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id z3so15621291plg.8
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Aug 2021 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2YfVJNsD7tSa0DmDvC8fipGN+DYdFYlSD/tL7RdSIE=;
 b=C/SmVNW2ZCRLnOWyxVeL4sBFQNI+egZ7gbiy1I+m0AIzH1nt214EI7M6YK4ZVSu4nL
 F6aMbbIFcbj3ulhQrGkdXcf2KxkndrFa3FMiOFjU67KsHl/6EM2w3FRvMUbh8QgXBhVF
 RNpsaYvHN6vkQzM8nF+7MrkuOUFeIb4zYpdnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2YfVJNsD7tSa0DmDvC8fipGN+DYdFYlSD/tL7RdSIE=;
 b=HZa4ZcVjvN2U3ohkw33KoEt91/O9xPJgfnJ2Dfp0LbMNOONrcZUI4znytukFt5h3YX
 Sx2ud/mMwqAk7tKpb1wC83ocLScIjj1Ed2urbECh7DDLWQQUTlANtlM4K7EkA9q5UQKD
 7b6suFl6aOz/w/qa80Iil7OK7YY1KjnbQcXGhhD23Y3z3P4hlgDYROPDhK9IepPvHPeH
 EKBGMCCqCZoD+aanP+iN1gm9kZkEeT2fobontucEyCb60/r7JMu6usc7LKC9ucpv0Dq/
 8kswJeG/EAPI4uxMn4IvtSPx4fT9x5+F8miokXoBZuXlIDyydqxHg5bp8qfbAlJg9e+m
 7SKw==
X-Gm-Message-State: AOAM533xYE31+BvoJeCEgKD8s3DNASQ71cgI33BsPZfGG5rV/fbG86Bq
 zaM8DDZBWA/Bg4sYNxsTBDMsqg==
X-Google-Smtp-Source: ABdhPJyWLjSHc2jPiGig7zY7HFES8/9xyJkzj+mTO6cEDqBHvYO6PRUQjaEle/2RGiDRrkif0znAqA==
X-Received: by 2002:a65:688f:: with SMTP id e15mr116767pgt.119.1628499574493; 
 Mon, 09 Aug 2021 01:59:34 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:2397:5afb:dd55:fa42])
 by smtp.gmail.com with ESMTPSA id z15sm19932179pfn.90.2021.08.09.01.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 01:59:34 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-usb@vger.kernel.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Mathias Nyman <mathias.nyman@intel.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [RFC PATCH] usb: xhci-mtk: handle bandwidth table rollover
Date: Mon,  9 Aug 2021 16:59:29 +0800
Message-Id: <20210809165904.RFC.1.I5165a4a8da5cac23c9928b1ec3c3a1a7383b7c23@changeid>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_015935_385675_F11BC662 
X-CRM114-Status: GOOD (  17.48  )
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
should be rolled over but the current implementation doesn't.

This patch applies a 6 bits mask to the microframe index to handle
its rollover 64 slots and prevent out-of-bounds array access.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 drivers/usb/host/xhci-mtk-sch.c | 79 +++++++++------------------------
 drivers/usb/host/xhci-mtk.h     |  1 +
 2 files changed, 23 insertions(+), 57 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 46cbf5d54f4f..ef16cd124343 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -411,18 +411,13 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 static u32 get_max_bw(struct mu3h_sch_bw_info *sch_bw,
 	struct mu3h_sch_ep_info *sch_ep, u32 offset)
 {
-	u32 num_esit;
-	u32 max_bw = 0;
-	u32 bw;
-	int i;
-	int j;
-
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	for (i = 0; i < num_esit; i++) {
-		u32 base = offset + i * sch_ep->esit;
+	u32 bw, max_bw = 0;
+	int i, j, idx;
 
+	for (i = 0; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
-			bw = sch_bw->bus_bw[base + j] +
+			idx = XHCI_MTK_BW_IDX(i + offset + j);
+			bw = sch_bw->bus_bw[idx] +
 					sch_ep->bw_budget_table[j];
 			if (bw > max_bw)
 				max_bw = bw;
@@ -434,20 +429,16 @@ static u32 get_max_bw(struct mu3h_sch_bw_info *sch_bw,
 static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 	struct mu3h_sch_ep_info *sch_ep, bool used)
 {
-	u32 num_esit;
-	u32 base;
-	int i;
-	int j;
+	int i, j, idx;
 
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	for (i = 0; i < num_esit; i++) {
-		base = sch_ep->offset + i * sch_ep->esit;
+	for (i = 0; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+			idx = XHCI_MTK_BW_IDX(i + sch_ep->offset + j);
 			if (used)
-				sch_bw->bus_bw[base + j] +=
+				sch_bw->bus_bw[idx] +=
 					sch_ep->bw_budget_table[j];
 			else
-				sch_bw->bus_bw[base + j] -=
+				sch_bw->bus_bw[idx] -=
 					sch_ep->bw_budget_table[j];
 		}
 	}
@@ -456,22 +447,18 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
-	u32 num_esit, tmp;
-	int base;
-	int i, j;
+	u32 bw;
+	int i, j, idx;
 	u8 uframes = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-
 	if (sch_ep->ep_type == INT_IN_EP || sch_ep->ep_type == ISOC_IN_EP)
 		offset++;
 
-	for (i = 0; i < num_esit; i++) {
-		base = offset + i * sch_ep->esit;
-
+	for (i = 0; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
 		for (j = 0; j < uframes; j++) {
-			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
-			if (tmp > FS_PAYLOAD_MAX)
+			idx = XHCI_MTK_BW_IDX(i + offset + j);
+			bw = tt->fs_bus_bw[idx] + sch_ep->bw_cost_per_microframe;
+			if (bw > FS_PAYLOAD_MAX)
 				return -ESCH_BW_OVERFLOW;
 		}
 	}
@@ -544,14 +531,11 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
-	u32 base, num_esit;
 	int bw_updated;
-	int i, j;
+	int i, j, idx;
 	int offset = sch_ep->offset;
 	u8 uframes = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-
 	if (used)
 		bw_updated = sch_ep->bw_cost_per_microframe;
 	else
@@ -560,11 +544,11 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 	if (sch_ep->ep_type == INT_IN_EP || sch_ep->ep_type == ISOC_IN_EP)
 		offset++;
 
-	for (i = 0; i < num_esit; i++) {
-		base = offset + i * sch_ep->esit;
-
-		for (j = 0; j < uframes; j++)
-			tt->fs_bus_bw[base + j] += bw_updated;
+	for (i = 0; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
+		for (j = 0; j < uframes; j++) {
+			idx = XHCI_MTK_BW_IDX(i + offset + j);
+			tt->fs_bus_bw[idx] += bw_updated;
+		}
 	}
 
 	if (used)
@@ -586,25 +570,9 @@ static int load_ep_bw(struct mu3h_sch_bw_info *sch_bw,
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
@@ -621,9 +589,6 @@ static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
 		if (ret)
 			continue;
 
-		if ((offset + sch_ep->num_budget_microframes) > esit_boundary)
-			break;
-
 		worst_bw = get_max_bw(sch_bw, sch_ep, offset);
 		if (worst_bw > bw_boundary)
 			continue;
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index ddcf25524f67..f627941c4860 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -23,6 +23,7 @@
  * bandwidth to it.
  */
 #define XHCI_MTK_MAX_ESIT	64
+#define XHCI_MTK_BW_IDX(idx)	((idx) & 63)
 
 /**
  * @fs_bus_bw: array to keep track of bandwidth already used for FS
-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
