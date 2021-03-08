Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A54C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:53:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7FF65155
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A7FF65155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I0mOR8iXbkf55oy0L5PsQzG7kBsyG0FSpLFGSQDmVMA=; b=NwQo84RPovWj5XR/Y7UxHa6TS
	+56/wMnSeK2xnfkd1lwG7ueFIlyIbpWJ6yEltjpfkPMCLFyoj2zj5t9+/FcMC4PXS3ANzEbp62U4R
	vU0vckXRA6A3d1P7A9gk+dvgH7UtXwotc34nZIGKQlQPOIzvDuRd6c1vgH7dT8kO7PZquws4DHhPv
	39DOglUY8GqIfJVwqEHUzqYbAoEurG3yfqr6apWecipKv5BYKg+vjvnQ6QCSLjeYmJil7S7S6+uLQ
	lq1a931zBN2Uyq2KcCEBJG43nO1/Zjn0o6nak6yejLGc7Jp9s/RyJwUtMG0PBA4fhZL32cVJQgB7K
	/m8kWIF2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ619-00EdQ7-Js; Mon, 08 Mar 2021 02:53:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ60n-00Ed9q-PH; Mon, 08 Mar 2021 02:52:52 +0000
X-UUID: d06a69c544244574a881e320eb84d041-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aI4p21OduRTGgy2wyxFAIZGqxUI+rr/xZ6gfQ/rtzNQ=; 
 b=DGwx/v/jS9DyAB+WK2yB/rQA4JGjtc42rwMACQiP4/xMP1phUKZFkppSJHsqr/4f3QbQBhgh8owsEH+V8dQLgLESxqE96VL1mWolSBm1cggcHyJ2D6JDRY2YdrAaCOezMV3N5XbS+vPNFWlpRuVqEUr/tV9ik1VGgSWWiP8fhtk=;
X-UUID: d06a69c544244574a881e320eb84d041-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 394462085; Sun, 07 Mar 2021 18:52:35 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:22 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:20 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 08/18] usb: xhci-mtk: remove unnecessary members of
 mu3h_sch_tt struct
Date: Mon, 8 Mar 2021 10:51:57 +0800
Message-ID: <9afecc2411895a3c76658df26ebca1c961a39fbb.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8BEE9C41A6D1BD77277C16C8C503E854EEE51375D952F5DFC1F3215BE4FDA3B72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_025250_589332_733D110B 
X-CRM114-Status: GOOD (  13.05  )
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

The members @usb_tt and @tt_port in mu3h_sch_tt struct
are not used after initialization, so can be removed

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 7 +------
 drivers/usb/host/xhci-mtk.h     | 4 ----
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 8fe4481eb43d..6fb7a040c73c 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -104,7 +104,6 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
 {
 	struct usb_tt *utt = udev->tt;
 	struct mu3h_sch_tt *tt, **tt_index, **ptt;
-	unsigned int port;
 	bool allocated_index = false;
 
 	if (!utt)
@@ -126,10 +125,8 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
 			utt->hcpriv = tt_index;
 			allocated_index = true;
 		}
-		port = udev->ttport - 1;
-		ptt = &tt_index[port];
+		ptt = &tt_index[udev->ttport - 1];
 	} else {
-		port = 0;
 		ptt = (struct mu3h_sch_tt **) &utt->hcpriv;
 	}
 
@@ -144,8 +141,6 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
 			return ERR_PTR(-ENOMEM);
 		}
 		INIT_LIST_HEAD(&tt->ep_list);
-		tt->usb_tt = utt;
-		tt->tt_port = port;
 		*ptt = tt;
 	}
 
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index f42769c69249..f61e53b02706 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -23,15 +23,11 @@
  * @ss_bit_map: used to avoid start split microframes overlay
  * @fs_bus_bw: array to keep track of bandwidth already used for FS
  * @ep_list: Endpoints using this TT
- * @usb_tt: usb TT related
- * @tt_port: TT port number
  */
 struct mu3h_sch_tt {
 	DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
 	u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
 	struct list_head ep_list;
-	struct usb_tt *usb_tt;
-	int tt_port;
 };
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
