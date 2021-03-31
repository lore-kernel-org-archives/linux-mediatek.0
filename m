Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498CCC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:26:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D829B61883
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D829B61883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VC7TBFRpD4c23c4FFcOLxwQ3xzPmONRuuGZ0a+5C4i0=; b=fxZnoG4PySJvxb9ieaB7kV2OCl
	Xi0OJ4GST3VYpzwPvrxYIsVqm48MsQ/0x0GFQBvUm2h0vzWXq5x1mKaFBnKVX21nFRItmz8bGzx9C
	5dw14vlxAMpvgVfbrLt3ZFfM43VXOU8YVzKsDzmMTxs50d+g4lJvER7USM+qY3o82tweXniKoeXT3
	rf4w2WvUTbMO8fWD+YAuTyBycCoKDbTuaAL1ADo061fHx37ww38hU6mYxFGAhNuyoZ9e8ILYrYsHu
	0phvaFLglJfUjrU7w1Uigi3o/0tHoVX2cwTl/emLyT4C7XKQqozEdNcZzy1NCkRlfo9vC2Uqqp3nv
	gvMiqzHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWBC-005wU7-FX; Wed, 31 Mar 2021 08:26:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWAt-005wQl-AF; Wed, 31 Mar 2021 08:26:06 +0000
X-UUID: e6bebcf6e3d2480fa925910cb1d538af-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=A2v4UUGInjD1iVOKC/g/7JQrSr1/U7lVm1JvRTZ0SOQ=; 
 b=m9dolKIfouVuea8Z+V8haTfOvLxsgQkI8dg4iNqxFspvl8uUewDlsmMSLn38daYo6uAnTL2t6nMbpfmIbCbts+ugLtu8Cfjxz9USC9ckzQ+hUIsHpSiSyZtbQXODWC/+EftrDStZeZK2aESetLmquABXevX+Fp8tSXC0MOmnxUc=;
X-UUID: e6bebcf6e3d2480fa925910cb1d538af-20210331
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 141859773; Wed, 31 Mar 2021 01:25:52 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 01:25:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 16:25:45 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 16:25:44 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH next 1/2] usb: xhci-mtk: fix wrong remainder of bandwidth
 budget
Date: Wed, 31 Mar 2021 16:25:41 +0800
Message-ID: <1617179142-2681-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3AAD719846C3AAD1837B7AB546F347E2B72316CB87607FDDEA7BCDCF48BAFCB82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_092604_779202_6622514A 
X-CRM114-Status: GOOD (  13.52  )
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

The remainder of the last bandwidth bugdget is wrong,
it's the value alloacted in last bugdget, not unused.

Reported-by: Yaqii Wu <Yaqii.Wu@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index a59d1f6d4744..7ac76ae28998 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -341,7 +341,6 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 		}
 
 		if (ep_type == ISOC_IN_EP || ep_type == ISOC_OUT_EP) {
-			u32 remainder;
 
 			if (sch_ep->esit == 1)
 				sch_ep->pkts = esit_pkts;
@@ -357,14 +356,12 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 			sch_ep->repeat = !!(sch_ep->num_budget_microframes > 1);
 			sch_ep->bw_cost_per_microframe = maxpkt * sch_ep->pkts;
 
-			remainder = sch_ep->bw_cost_per_microframe;
-			remainder *= sch_ep->num_budget_microframes;
-			remainder -= (maxpkt * esit_pkts);
 			for (i = 0; i < sch_ep->num_budget_microframes - 1; i++)
 				bwb_table[i] = sch_ep->bw_cost_per_microframe;
 
 			/* last one <= bw_cost_per_microframe */
-			bwb_table[i] = remainder;
+			bwb_table[i] = maxpkt * esit_pkts
+				       - i * sch_ep->bw_cost_per_microframe;
 		}
 	} else if (is_fs_or_ls(sch_ep->speed)) {
 		sch_ep->pkts = 1; /* at most one packet for each microframe */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
