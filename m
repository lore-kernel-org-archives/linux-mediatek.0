Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470D6C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:48:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD8B623D6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD8B623D6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tT6uNgvVXV/OzFXUJMk3lv1jmPdnYt8nj1pi+q9rM5k=; b=goCQstHJzYdL4QdvP9nRwraYe
	HjP5Bw30KcPwgyM8QD/QwZNv27EIFI2mNr/lQpSn5rVVBzX5kqabnmjr/I1QODBslreF0lx2aOota
	dnvbCD2Vc9Mkz2pLHjuBx9W0WCKuX2pi6J/Yuj2SU+ean+zIIIW5iZDBOY9YSdE12FTnLxGV5Mj2y
	Inp46o4cukM2WWYVICMfieWWsQVeYBQAn68D/qtfxtNpoJtv2852ERQr0J/B7sw/is4NcYFTxZVym
	IvoZZE/evdtwlL1se2wwmS6A5waEaljMuLEc04F6vvniIQWJO7DO08jK+iyAe/gNXQKI6Wmf/PKfI
	PKCerEYSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJUe-0002qV-UY; Thu, 10 Dec 2020 10:48:16 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJUQ-0002l3-9m
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 10:48:04 +0000
Received: by mail-pl1-x644.google.com with SMTP id 4so2566570plk.5
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Dec 2020 02:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVxoTM9ZIDuLtAtEZCaE86d03rCpF39qAUQSwcojzBQ=;
 b=mCzBo3T7pjVoucpOnWfWM+ywq7wwbqcufmD7e+j4SDVNHPVXEgjxmw0PgQPIZlYvoN
 FaCLmRNc/fmz9xEqpT/1D8VlDCq9wKCZ/Q1gsvL/uBjrlm2tTLp0BB7l03y0mcOezM80
 kMb0qYWr/YBfzgUq2L+AGo8Hng4rKToF0xWs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bVxoTM9ZIDuLtAtEZCaE86d03rCpF39qAUQSwcojzBQ=;
 b=OadiubfYpwL9NBG6eYriekIO5U7Hb5wsgEJBNZm58RUf4Kz2U5Hq3zqyVPHt0UbKUp
 gE3NNHRPoNTU7wMT+a3Zaax1/LXVZG+xEEVSNp4CgGheMEatb6PPa8wjaAgShsZa56tk
 K1ICjCzmlmuIfiTJiM6xcbp7k+jJ1FrNxCwa58lc850dc8Y0oxpJPNFwX/zI+bAo9srk
 ufazi3/i6vk+X/tKWthlTMCxYsfeyOB4+imO67HeJ8cxNhJ5SalwYz3SrR/wNpHCcgNz
 r0jKPTQk9V0qZ9BTvnsflNHxusaA+9/y6phpa6ZWQYnXWjrB2YoXfpIi0rpWZ/9z6uJr
 xsAg==
X-Gm-Message-State: AOAM5311L7jL3Fxpg6E1g4zDPxQsNXWThshKJo4+GcutwsxhrvrAaphP
 R40zKnWHv1MnJHFms3g1wVrmwVfi2HtFGg==
X-Google-Smtp-Source: ABdhPJxr7DuO4PC45I9h6/PmEATHMWDZamF91OytRBLHd3oflEYtNyuiMontSXkEgPoJ7p6PKKDnnw==
X-Received: by 2002:a17:902:82c7:b029:da:cb88:38f8 with SMTP id
 u7-20020a17090282c7b02900dacb8838f8mr967622plz.49.1607597280180; 
 Thu, 10 Dec 2020 02:48:00 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id y1sm6386658pff.17.2020.12.10.02.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 02:47:59 -0800 (PST)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 2/3] usb: xhci-mtk: delay association of tt and ep
Date: Thu, 10 Dec 2020 18:47:46 +0800
Message-Id: <20201210184700.v2.2.I236cbd6fe27db5a9c776b6d14fe146748373bbce@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201210104747.3416781-1-ikjn@chromium.org>
References: <20201210104747.3416781-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_054802_428408_DD218E1F 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

xhci-mtk creates internal data structures for representing the
relationship between endpoint and TT.

This patch simply delays its association between endpoint and TT
when it's really loaded onto internal bandwidth table.

This is a preparation step for fixing unreleased periodic
TT bandwidth data, no functional changes.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 drivers/usb/host/xhci-mtk-sch.c | 40 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index c334b6d76479..439391f1dc78 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -174,7 +174,6 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
 	struct usb_host_endpoint *ep, struct xhci_ep_ctx *ep_ctx)
 {
 	struct mu3h_sch_ep_info *sch_ep;
-	struct mu3h_sch_tt *tt = NULL;
 	u32 len_bw_budget_table;
 	size_t mem_size;
 
@@ -192,15 +191,6 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
 	if (!sch_ep)
 		return ERR_PTR(-ENOMEM);
 
-	if (is_fs_or_ls(udev->speed)) {
-		tt = find_tt(udev);
-		if (IS_ERR(tt)) {
-			kfree(sch_ep);
-			return ERR_PTR(-ENOMEM);
-		}
-	}
-
-	sch_ep->sch_tt = tt;
 	sch_ep->ep = ep;
 
 	return sch_ep;
@@ -377,10 +367,10 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 	}
 }
 
-static int check_sch_tt(struct usb_device *udev,
-	struct mu3h_sch_ep_info *sch_ep, u32 offset)
+static int check_sch_tt(struct mu3h_sch_tt *tt,
+			struct mu3h_sch_ep_info *sch_ep,
+			u32 offset)
 {
-	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 extra_cs_count;
 	u32 fs_budget_start;
 	u32 start_ss, last_ss;
@@ -450,10 +440,9 @@ static int check_sch_tt(struct usb_device *udev,
 	return 0;
 }
 
-static void update_sch_tt(struct usb_device *udev,
-	struct mu3h_sch_ep_info *sch_ep)
+static void update_sch_tt(struct mu3h_sch_tt *tt,
+			  struct mu3h_sch_ep_info *sch_ep)
 {
-	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 base, num_esit;
 	int i, j;
 
@@ -465,10 +454,12 @@ static void update_sch_tt(struct usb_device *udev,
 	}
 
 	list_add_tail(&sch_ep->tt_endpoint, &tt->ep_list);
+	sch_ep->sch_tt = tt;
 }
 
 static int check_sch_bw(struct usb_device *udev,
-	struct mu3h_sch_bw_info *sch_bw, struct mu3h_sch_ep_info *sch_ep)
+			struct mu3h_sch_bw_info *sch_bw,
+			struct mu3h_sch_ep_info *sch_ep)
 {
 	u32 offset;
 	u32 esit;
@@ -480,8 +471,14 @@ static int check_sch_bw(struct usb_device *udev,
 	u32 min_cs_count;
 	bool tt_offset_ok = false;
 	int ret;
+	struct mu3h_sch_tt *tt = NULL;
 
 	esit = sch_ep->esit;
+	if (is_fs_or_ls(udev->speed)) {
+		tt = find_tt(udev);
+		if (IS_ERR(tt))
+			return -ENOMEM;
+	}
 
 	/*
 	 * Search through all possible schedule microframes.
@@ -493,7 +490,7 @@ static int check_sch_bw(struct usb_device *udev,
 	min_num_budget = sch_ep->num_budget_microframes;
 	for (offset = 0; offset < esit; offset++) {
 		if (is_fs_or_ls(udev->speed)) {
-			ret = check_sch_tt(udev, sch_ep, offset);
+			ret = check_sch_tt(tt, sch_ep, offset);
 			if (ret)
 				continue;
 			else
@@ -531,10 +528,11 @@ static int check_sch_bw(struct usb_device *udev,
 
 	if (is_fs_or_ls(udev->speed)) {
 		/* all offset for tt is not ok*/
-		if (!tt_offset_ok)
+		if (!tt_offset_ok) {
+			drop_tt(udev);
 			return -ERANGE;
-
-		update_sch_tt(udev, sch_ep);
+		}
+		update_sch_tt(tt, sch_ep);
 	}
 
 	/* update bus bandwidth info */
-- 
2.29.2.576.ga3fc446d84-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
