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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9838BC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:14:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E18364F53
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E18364F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XfxB2eshSOHa5AiWZU9LGm4G1yE2/r2ll0gJ8Q4liVc=; b=edPxG5cSdTwSLOz2Uc1EQstRv
	+D0rz/kMERcu3GYSIyE0AmiA9zWw64guOG9kmnj7dYD84E7TMOlZIqg7vu+tffzcab5JSbdq3mAID
	cUKBDnL89kAnrhdNf7tOx7CGIZ7rynQOAdq1tI9uoe7M0vQGyHv3YY37c262u1Vz2cgnlP2JCVUMY
	j/xoCL2B/QACJR3EIt7q146mbT8D+4+yNvmxo0U5rCGneCeNCVODccobxyVdckftA5bN9s5d9adCz
	Bcq3kkK7HWKZM5lbUbtEqFMmmMfm4mhLclEEW58bSzHBtanHF3xgfbl4P8d2LFUUJxn46sPMmUe45
	EdhjVe2Vw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6XC-00EBxk-Ct; Fri, 05 Mar 2021 09:14:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6WX-00EBgW-NW; Fri, 05 Mar 2021 09:13:31 +0000
X-UUID: 3e6855ed54f440c7b19cdea836247c6b-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rPJQ6jCtgrXXg/QjopAEDo12tkOSxJm9MoiwNkHns0Y=; 
 b=o8Zhb+0x5lkcQcLf3h6BwwaL6V6Y5W60bg2MXlCb5FTzZBh+Z8r6+zj5GvzbJqlzS3Jd9l/mPolcr0dGSLZSE4ErskG4LDMkmoFdOzReozyZe8SZeDTV5WSgLzPyyBoqXPIeOU2SP/URz0aAGhGXrkYHylpRUu+v6F/VcpLSRWM=;
X-UUID: 3e6855ed54f440c7b19cdea836247c6b-20210305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2040166130; Fri, 05 Mar 2021 01:13:20 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:18 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:16 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:15 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 03/17] usb: xhci-mtk: get the microframe boundary for ESIT
Date: Fri, 5 Mar 2021 17:02:41 +0800
Message-ID: <1614934975-15188-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F037F6C908867B89B8E91ED5FD7323317E49810CA8B051728F0C5F89284DE6532000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_091330_224178_4301D260 
X-CRM114-Status: GOOD (  13.26  )
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

Tune the boundary for FS/LS ESIT due to CS:
For ISOC out-ep, the controller starts transfer data after
the first SS; for others, the data is already transfered
before the last CS.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 8950d1f10a7f..e3b18dfca874 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -513,22 +513,35 @@ static void update_sch_tt(struct usb_device *udev,
 		list_del(&sch_ep->tt_endpoint);
 }
 
+static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
+{
+	u32 boundary = sch_ep->esit;
+
+	if (sch_ep->sch_tt) { /* LS/FS with TT */
+		/* tune for CS */
+		if (sch_ep->ep_type != ISOC_OUT_EP)
+			boundary += 1;
+		else if (boundary > 1) /* normally esit >= 8 for FS/LS */
+			boundary -= 1;
+	}
+
+	return boundary;
+}
+
 static int check_sch_bw(struct usb_device *udev,
 	struct mu3h_sch_bw_info *sch_bw, struct mu3h_sch_ep_info *sch_ep)
 {
 	u32 offset;
-	u32 esit;
 	u32 min_bw;
 	u32 min_index;
 	u32 worst_bw;
 	u32 bw_boundary;
+	u32 esit_boundary;
 	u32 min_num_budget;
 	u32 min_cs_count;
 	bool tt_offset_ok = false;
 	int ret;
 
-	esit = sch_ep->esit;
-
 	/*
 	 * Search through all possible schedule microframes.
 	 * and find a microframe where its worst bandwidth is minimum.
@@ -537,7 +550,8 @@ static int check_sch_bw(struct usb_device *udev,
 	min_index = 0;
 	min_cs_count = sch_ep->cs_count;
 	min_num_budget = sch_ep->num_budget_microframes;
-	for (offset = 0; offset < esit; offset++) {
+	esit_boundary = get_esit_boundary(sch_ep);
+	for (offset = 0; offset < sch_ep->esit; offset++) {
 		if (is_fs_or_ls(udev->speed)) {
 			ret = check_sch_tt(udev, sch_ep, offset);
 			if (ret)
@@ -546,7 +560,7 @@ static int check_sch_bw(struct usb_device *udev,
 				tt_offset_ok = true;
 		}
 
-		if ((offset + sch_ep->num_budget_microframes) > sch_ep->esit)
+		if ((offset + sch_ep->num_budget_microframes) > esit_boundary)
 			break;
 
 		worst_bw = get_max_bw(sch_bw, sch_ep, offset);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
