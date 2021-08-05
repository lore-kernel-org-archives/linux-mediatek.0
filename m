Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117B2C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 05:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72DD60F70
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 05:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C72DD60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZhXDlf7Cxd3TUAxwcyrACTv8/DW9H7xOU+LzqrB7Dgo=; b=VYjmnzsbhY2JGb
	Sb3ALXtIhr0VX9e31NKodXK/gOmlkiA+pc1buC0piPuo6Kb9f6ZSL2zEDdav7am70BkAsv5hZxAvj
	Wd/c4cunf0fmZy8nrfNiKDl7ZfFqQ6lqvbQ9A9xzzypRrsJ3IPfLeBnTkc0c7KfpBTeg9BrBdvAsq
	MKcMQ0kgalFxcqBvaFPqlD2bleted8Bn3hbvwzw140EeDSt/8FkY/sZK0GK6PVHq5nkzvS3DCodjh
	oj6zx08anVN6Qe8+OnF+Ffb0jwLyBlcRHMLEsykMGl0iQA3kmP6hhOQ1NqrR+8kkURIU+apcMtauk
	z4HqELMCn5poj7tQ6EIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBW7F-0089fE-7H; Thu, 05 Aug 2021 05:40:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBW6t-0089aW-0F
 for linux-mediatek@lists.infradead.org; Thu, 05 Aug 2021 05:40:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d17so5718074plr.12
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Aug 2021 22:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=51DhxgLLj3oVTgO+Yt93dkTR66UP+XGV38AcifiutDo=;
 b=aZ9gfJt7tWoRAh1e4EZ2vxtE8tdrM3/OkMxB6G+f/d+SsaXKfIKeC+lZJJ4KdaNqXv
 YvRKy7WABqV9WttO1WUR0viz2JPHE/UNqxRlpRKKC6j2SZ381VLtRQ6XvWO/ucbFkAqV
 P1Ghs69qgg4RNDU7X0SJHs/XaDPJe57Wkcecw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=51DhxgLLj3oVTgO+Yt93dkTR66UP+XGV38AcifiutDo=;
 b=t3wuZJJogKg2bxRmTVjgWGaOSg6ckc37Hc7keSgyQN5qeSVAeGBf2qTEzcqBM31pTG
 xu/qxG7/JHjB0mb8q5WvZl7X5EehOGF7sliXDxCPE02eZWc1ijjJWk8P3bdFft9klz9K
 +Vo+F8CkNZTZU4ia40/0Jo4Xs+exVpVzC1KbKFrUMlDTKQlmYmRsLwFh3bzVt6tJ49hV
 dYZlkf3eyaFVFkp7dBYADWGi6epu0o38PV5aBRXMFKEmvQDgOyZqZY/1s1U0O3Mj7PJB
 0bPVHUl8yzzgusB1tQntaiLSpxF0tOUx5nYuazdsDFqJN9v0XISvemJxBPfCyk7bR86+
 6uLA==
X-Gm-Message-State: AOAM531XXgcJqXokp7FXvoGQxa24QaukHEd0V4xAfh8DvIdN6JDbyK47
 lw2T3uKYF3rye7ytwlX8djYK7g==
X-Google-Smtp-Source: ABdhPJyHCuhOyC1Oy4T+eWgglbQq9jy/tHFCTFzoK9gzeT7ihh+02C9vYfXvv+9/aVeXVOSdzr30AA==
X-Received: by 2002:a17:902:7804:b029:12c:de88:7d50 with SMTP id
 p4-20020a1709027804b029012cde887d50mr2329868pll.27.1628142001763; 
 Wed, 04 Aug 2021 22:40:01 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:7a1c:b216:fca0:2cc2])
 by smtp.gmail.com with ESMTPSA id d22sm5448699pgi.73.2021.08.04.22.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 22:40:01 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH] usb: xhci-mtk: relax TT periodic bandwidth allocation
Date: Thu,  5 Aug 2021 13:39:57 +0800
Message-Id: <20210805133937.1.Ia8174b875bc926c12ce427a5a1415dea31cc35ae@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_224003_118674_B3A09584 
X-CRM114-Status: GOOD (  15.39  )
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

Currently xhci-mtk needs software-managed bandwidth allocation for
periodic endpoints, it allocates the microframe index for the first
start-split packet for each endpoint. As this index allocation logic
should avoid the conflicts with other full/low-speed periodic endpoints,
it uses the worst case byte budgets on high-speed bus bandwidth
For example, for an isochronos IN endpoint with 192 bytes budget,
it will consume the whole 4 u-frames(188 * 4) while the actual
full-speed bus budget should be just 192bytes.

This patch changes the low/full-speed bandwidth allocation logic
to use "approximate" best case budget for lower speed bandwidth
management. For the same endpoint from the above example, the
approximate best case budget is now reduced to (188 * 2) bytes.

Without this patch, many usb audio headsets with 3 interfaces
(audio input, audio output, and HID) cannot be configured
on xhci-mtk.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 drivers/usb/host/xhci-mtk-sch.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index f9b4d27ce449..46cbf5d54f4f 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -459,16 +459,17 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 	u32 num_esit, tmp;
 	int base;
 	int i, j;
+	u8 uframes = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
 	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
+
+	if (sch_ep->ep_type == INT_IN_EP || sch_ep->ep_type == ISOC_IN_EP)
+		offset++;
+
 	for (i = 0; i < num_esit; i++) {
 		base = offset + i * sch_ep->esit;
 
-		/*
-		 * Compared with hs bus, no matter what ep type,
-		 * the hub will always delay one uframe to send data
-		 */
-		for (j = 0; j < sch_ep->cs_count; j++) {
+		for (j = 0; j < uframes; j++) {
 			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
 			if (tmp > FS_PAYLOAD_MAX)
 				return -ESCH_BW_OVERFLOW;
@@ -546,6 +547,8 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 	u32 base, num_esit;
 	int bw_updated;
 	int i, j;
+	int offset = sch_ep->offset;
+	u8 uframes = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
 	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
 
@@ -554,10 +557,13 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 	else
 		bw_updated = -sch_ep->bw_cost_per_microframe;
 
+	if (sch_ep->ep_type == INT_IN_EP || sch_ep->ep_type == ISOC_IN_EP)
+		offset++;
+
 	for (i = 0; i < num_esit; i++) {
-		base = sch_ep->offset + i * sch_ep->esit;
+		base = offset + i * sch_ep->esit;
 
-		for (j = 0; j < sch_ep->cs_count; j++)
+		for (j = 0; j < uframes; j++)
 			tt->fs_bus_bw[base + j] += bw_updated;
 	}
 
-- 
2.32.0.554.ge1b32706d8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
