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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9DCC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:03:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3ED66514A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3ED66514A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RYL40SSPccAGbi+2mQBBS83LZxIO55VCiFbTsWFMMBE=; b=W6UynIy3TbLnzofpyovsYsK2L
	moFbA+FcpvE/Wl/cI9EccAtH8TFZBkX7NBATUNIhBn08PY/+2/ExttXrPpahdOW/D+fpEN/ZrRX3O
	4eMmLmy5fV8gxfWMexyf670HQytq61hNUy+bICAMYKKSJI9sKCQSSDbe5sOeMXee4hTIcebcW3jsV
	rypInvEA2cKUaecN3cJN9/1rDY4s5L4XyLHVZ+yv1cTSMnWoZZUxk7aDzs7+bGLZky9uLCky+3lOI
	qKDbcreyDfkZEOzpEcgWQMb1pwy+mITMggjbb6oaRzB9ehFds58mFyLGYdgFHTHPNzmGNZGxavWmv
	Jmq6Oq+yQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ6AT-00EhGJ-4q; Mon, 08 Mar 2021 03:02:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ6AA-00Eh6q-Qg; Mon, 08 Mar 2021 03:02:38 +0000
X-UUID: 95e9cea2e9a245fea2a76fbd7b48e139-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rJHejNPObJ9sSQHo98IXdc9/u+87Js10gWSnB7zK3M0=; 
 b=kCNK2klk21YHn7QZgU4IR02dZafSOzkAC4xDojVXd2Haeq7gye1WBNSSa+A0pMkD/DeBg3J0kRiy9FOzgplVvSZ1uC1uwjN+f1H3KQUsUdIEkiXAuGKbJFjz3t/23w0ef3Ut8+3R0mD5yvG8Xnk0GjrDA1z4XW46ddSQc4EvFCg=;
X-UUID: 95e9cea2e9a245fea2a76fbd7b48e139-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1852058278; Sun, 07 Mar 2021 19:02:24 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:18 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:16 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:15 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 03/18] usb: xhci-mtk: get the microframe boundary for ESIT
Date: Mon, 8 Mar 2021 10:51:52 +0800
Message-ID: <49e5a269a47984f3126a70c3fb471b0c2874b8c2.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B445CB8B7D900E16797BA90FD85FE6E626EC92059A1501F880C6C6B58FCEE0C82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_030235_021774_51B69EAC 
X-CRM114-Status: GOOD (  14.67  )
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
the first SS; for others, the data is already transferred
before the last CS.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: fix typo and use ++/-- suggested by Sergei
---
 drivers/usb/host/xhci-mtk-sch.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 8950d1f10a7f..450fa22b7dc7 100644
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
+			boundary++;
+		else if (boundary > 1) /* normally esit >= 8 for FS/LS */
+			boundary--;
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
