Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D387C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:04:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D752464F45
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D752464F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mVSVTSDujx3xc5t536VNKxDR0263tSEA1Hgxf87Eirc=; b=ny5bmCR/3NjF+/564LgTq7WAP
	D/+s4UdPldIcj2mJS9pb8X8uNUO8vboj1ZcLr3hDH9vp72HBpHpRbfIs0RQOd1a18I9LwL8SC5mqK
	+amxcHTBagt5OGUXczTKDVzkKqktUIRVOkgsTWr1kx27TxX5u3FuZ4xB/k8M+ZRZTkUBoerkcN2dt
	ck/s67a9dWBDgGkSoIcnB1FVWA8fYzbNguUnOfxkmQOHOua33xHI+VsYOggMlZyfkBY20fZh6UwVF
	5UwudftxUKOp4Ce7IVHQ4Wq/hhO4rD2HdF02usj7egyNu6Td+0Y1A92oxkukrduxtuLeE7069ZXjd
	fxlWTT5hw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6NV-00E8dJ-FF; Fri, 05 Mar 2021 09:04:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6Ms-00E8QV-AG; Fri, 05 Mar 2021 09:03:34 +0000
X-UUID: a8d030cd3e4a4765985e8fe985fbc983-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GIcGV2WEBcu+psy1pVpYvSZUUkHRlJ90T8HJ23kgdwg=; 
 b=pego6Pr9DreJhNHN5CqThZP1N9vCz1yarPOStZ+74jRijN4RD6xI/w3YFAAQFzsR7xqB2oHeB7LtmtvoO0ZJ41QNzqinVJTyg1mzXeHslRvLFSd7y8+k/e3oKWALJAYEfUm2QMC9qnlcRwNF/mES9oU6yKffl35VA7ssW7Xu4ZQ=;
X-UUID: a8d030cd3e4a4765985e8fe985fbc983-20210305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 592638530; Fri, 05 Mar 2021 01:03:20 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:18 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:16 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 04/17] usb: xhci-mtk: add only one extra CS for FS/LS INTR
Date: Fri, 5 Mar 2021 17:02:42 +0800
Message-ID: <1614934975-15188-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_090332_460016_8446221A 
X-CRM114-Status: GOOD (  14.74  )
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

In USB2 Spec:
"11.18.5 TT Response Generation
In general, there will be two (or more) complete-split
transactions scheduled for a periodic endpoint.
However, for interrupt endpoints, the maximum size of
the full-/low-speed transaction guarantees that it can
never require more than two complete-split transactions.
Two complete-split transactions are only required
when the transaction spans a microframe boundary."

Due to the maxp is 64, and less then 188 (at most in one
microframe), seems never span boundary, so use only one CS
for FS/LS interrupt transfer, this will save some bandwidth.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index e3b18dfca874..817ef2815e67 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -408,13 +408,11 @@ static int check_sch_tt(struct usb_device *udev,
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 extra_cs_count;
-	u32 fs_budget_start;
 	u32 start_ss, last_ss;
 	u32 start_cs, last_cs;
 	int i;
 
 	start_ss = offset % 8;
-	fs_budget_start = (start_ss + 1) % 8;
 
 	if (sch_ep->ep_type == ISOC_OUT_EP) {
 		last_ss = start_ss + sch_ep->cs_count - 1;
@@ -450,16 +448,14 @@ static int check_sch_tt(struct usb_device *udev,
 		if (sch_ep->ep_type == ISOC_IN_EP)
 			extra_cs_count = (last_cs == 7) ? 1 : 2;
 		else /*  ep_type : INTR IN / INTR OUT */
-			extra_cs_count = (fs_budget_start == 6) ? 1 : 2;
+			extra_cs_count = 1;
 
 		cs_count += extra_cs_count;
 		if (cs_count > 7)
 			cs_count = 7; /* HW limit */
 
-		for (i = 0; i < cs_count + 2; i++) {
-			if (test_bit(offset + i, tt->ss_bit_map))
-				return -ERANGE;
-		}
+		if (test_bit(offset, tt->ss_bit_map))
+			return -ERANGE;
 
 		sch_ep->cs_count = cs_count;
 		/* one for ss, the other for idle */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
