Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DB1C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:07:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AE996196C
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AE996196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hGnHVqlpyQGUXHGiYotngvijPeKMAj97xFUXJ+Lg0Tg=; b=I1ZgEpzotOrmIy5EshbCnUzpH
	Wk5lYCZ3Y9CcK66sCkh0MXI6OTbmbom3Gj1efw13eEC47ME2gO7C6bEcNWU4xWGdt28V+SayFHCVi
	lJAXZVTFxjMXhA08iD+flqLsL772H6pj3aEXanScvLzMXhh+WfN4An4EspXNzHM/PE6ZuZDItemTY
	w6sCv2FaBj37m05yEoCE5oXEk9HfVIwoC/Qb/9Q87/dODjQbgwrKptRge1jWUBoH4DIB8sf9+hYTv
	IGaMhz6wRv6w6iAUDpmvyfE94MVHbUTuoQdfIcRPlqBakvxrO9nX2q8LGLDb4+9+ld4JqM3yqnVdY
	daPf8scDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR9P5-002yF3-8v; Tue, 30 Mar 2021 08:07:11 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR9OR-002y9f-GP
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 08:06:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id l76so11152407pga.6
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Mar 2021 01:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rWrsfCjkBFwgPVNkUe2iG5Bi9zKj6TMZ1uqalXdYp0o=;
 b=mlov7D7i3VZ2SRWpFLPFbSYhmbePgjV5r5yCM1t0pcdt3T7Xhr0pTS/KQz24RjrtNf
 gFc4Li1DBth+brP8xqj2rOEniBhGhregxhnQYGnZibbiDK/ZFpQQwWXP9Q+FhoM/cL9j
 VC/1d1JoUFUU3V1RHoE14R9/UZ4DAhqtQoa54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rWrsfCjkBFwgPVNkUe2iG5Bi9zKj6TMZ1uqalXdYp0o=;
 b=PqqWQ44nC6Pp4EaKLJ+2BMA+ke2jH1odDBwKs4Y2zLoVNEvTSAjX/Jfy3nziH8VWRf
 553wzVFtTu5V+PauOrHkNPfO44c7ne9uvZHjBv11Bw1k3edv60cBPfQcDCJI/xgdvrdy
 WZjbfjS1+0eXZ7oQPYss+iCQePTZJzDWAAKNBfbBdRBxXfLRdaBTK/79CWssJCGbwf2u
 m+ZgQPzYLayimYMRkZhYa1Gp5s4q3DEjs7R+7u3r7/GhHfigeVJ1nEwVN0qy8l1mvqqZ
 TBckJr6JoV1uyymLeUpljcAuZfmV9rB29J6QoNLjjKG7H7PHukm3+IF+ypSie54as3my
 xDIw==
X-Gm-Message-State: AOAM532IPhdrIaCo27IIDbu2nVHb8jny3oOIWhEve7bhYCK2yWS2/CuO
 JzZPhO79eJZVY3ubBJgE0gdc/b+aG/VIxw==
X-Google-Smtp-Source: ABdhPJwXDtLXsIlMtVt4P2ZGc9syxpbvMO/GTjwikKMZ1SgMPOeVk2n9UhNehnMFmXIlAYmqRh5J3Q==
X-Received: by 2002:a62:68c4:0:b029:226:5dc5:4082 with SMTP id
 d187-20020a6268c40000b02902265dc54082mr13107032pfc.48.1617091587509; 
 Tue, 30 Mar 2021 01:06:27 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:49fb:d79d:bee6:d970])
 by smtp.gmail.com with ESMTPSA id f23sm19118913pfa.85.2021.03.30.01.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 01:06:27 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-usb@vger.kernel.org
Cc: Ikjoon Jang <ikjn@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] usb: xhci-mtk: relax periodic TT bandwidth checking
Date: Tue, 30 Mar 2021 16:06:17 +0800
Message-Id: <20210330160508.2.I75d28cfec05010524ccef5132c8e39adb1bf6651@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330080617.3746932-1-ikjn@chromium.org>
References: <20210330080617.3746932-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_090632_155826_84D4C3B9 
X-CRM114-Status: GOOD (  23.01  )
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

Software bandwidth checking logics used by xhci-mtk puts
a quite heavy constraints to TT periodic endpoint allocations.

This patch provides a relaxed bandwidth calculation by
- Allowing multiple periodic transactions in a same microframe
  for a device with multiple interrupt endpoints.
- Using best case budget instead of maximum number of
  complete-split when calculating byte budgets on lower speed bus

Without this patch, a typical full speed audio headset with
3 periodic endpoints (audio isoc-in/out, input int-in) cannot be
configured with xhci-mtk.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 drivers/usb/host/xhci-mtk-sch.c | 68 ++++++++++-----------------------
 drivers/usb/host/xhci-mtk.h     |  2 -
 2 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 0cb41007ec65..76827e48049a 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -388,13 +388,17 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 		} else { /* INT_IN_EP or ISOC_IN_EP */
 			bwb_table[0] = 0; /* start split */
 			bwb_table[1] = 0; /* idle */
+
+			sch_ep->num_budget_microframes += 2;
+			if (sch_ep->num_budget_microframes > sch_ep->esit)
+				sch_ep->num_budget_microframes = sch_ep->esit;
 			/*
 			 * due to cs_count will be updated according to cs
 			 * position, assign all remainder budget array
 			 * elements as @bw_cost_per_microframe, but only first
 			 * @num_budget_microframes elements will be used later
 			 */
-			for (i = 2; i < TT_MICROFRAMES_MAX; i++)
+			for (i = 2; i < sch_ep->num_budget_microframes; i++)
 				bwb_table[i] =	sch_ep->bw_cost_per_microframe;
 		}
 	}
@@ -449,20 +453,17 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
-	u32 num_esit, tmp;
-	int base;
 	int i, j;
+	const int nr_lower_uframes =
+		DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	for (i = 0; i < num_esit; i++) {
-		base = offset + i * sch_ep->esit;
-
+	for (i = offset; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
 		/*
 		 * Compared with hs bus, no matter what ep type,
 		 * the hub will always delay one uframe to send data
 		 */
-		for (j = 0; j < sch_ep->cs_count; j++) {
-			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
+		for (j = 0; j < nr_lower_uframes; j++) {
+			u32 tmp = tt->fs_bus_bw[i + j + 1] + sch_ep->bw_cost_per_microframe;
 			if (tmp > FS_PAYLOAD_MAX)
 				return -ESCH_BW_OVERFLOW;
 		}
@@ -473,11 +474,9 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 
 static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 {
-	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 extra_cs_count;
 	u32 start_ss, last_ss;
 	u32 start_cs, last_cs;
-	int i;
 
 	if (!sch_ep->sch_tt)
 		return 0;
@@ -494,10 +493,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		if (!(start_ss == 7 || last_ss < 6))
 			return -ESCH_SS_Y6;
 
-		for (i = 0; i < sch_ep->cs_count; i++)
-			if (test_bit(offset + i, tt->ss_bit_map))
-				return -ESCH_SS_OVERLAP;
-
 	} else {
 		u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
@@ -524,19 +519,7 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		if (cs_count > 7)
 			cs_count = 7; /* HW limit */
 
-		if (test_bit(offset, tt->ss_bit_map))
-			return -ESCH_SS_OVERLAP;
-
 		sch_ep->cs_count = cs_count;
-		/* one for ss, the other for idle */
-		sch_ep->num_budget_microframes = cs_count + 2;
-
-		/*
-		 * if interval=1, maxp >752, num_budge_micoframe is larger
-		 * than sch_ep->esit, will overstep boundary
-		 */
-		if (sch_ep->num_budget_microframes > sch_ep->esit)
-			sch_ep->num_budget_microframes = sch_ep->esit;
 	}
 
 	return check_fs_bus_bw(sch_ep, offset);
@@ -545,31 +528,18 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
-	u32 base, num_esit;
-	int bw_updated;
-	int bits;
-	int i, j;
-
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	bits = (sch_ep->ep_type == ISOC_OUT_EP) ? sch_ep->cs_count : 1;
+	int i, j, bw_updated;
+	const int nr_lower_uframes =
+		DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
 	if (used)
 		bw_updated = sch_ep->bw_cost_per_microframe;
 	else
 		bw_updated = -sch_ep->bw_cost_per_microframe;
 
-	for (i = 0; i < num_esit; i++) {
-		base = sch_ep->offset + i * sch_ep->esit;
-
-		for (j = 0; j < bits; j++) {
-			if (used)
-				set_bit(base + j, tt->ss_bit_map);
-			else
-				clear_bit(base + j, tt->ss_bit_map);
-		}
-
-		for (j = 0; j < sch_ep->cs_count; j++)
-			tt->fs_bus_bw[base + j] += bw_updated;
+	for (i = sch_ep->offset; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
+		for (j = 0; j < nr_lower_uframes; j++)
+			tt->fs_bus_bw[i+ j + 1] += bw_updated;
 	}
 
 	if (used)
@@ -634,9 +604,11 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 		if (min_bw > worst_bw) {
 			min_bw = worst_bw;
 			found = i;
+			/* fastpath: bandwidth contributions to host is low
+			 * when it's fs/ls */
+			if (sch_ep->sch_tt || min_bw == 0)
+				break;
 		}
-		if (min_bw == 0)
-			break;
 	}
 
 	/* check bandwidth */
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 621ec1a85009..8a879f99ae1c 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -20,12 +20,10 @@
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
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
