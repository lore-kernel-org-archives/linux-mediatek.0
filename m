Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2C5C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 06:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=odHPNxoJgK1ykSEXTLXddFlr/rHtx/O2uLjMWUWt2lw=; b=H4JqRYWbsOKRpF5UeJRW4RqM+k
	XKczgh5M4H/ucdXENs+NDnm8Apno1En1F/U7nA5tDR5YJ4LlBkzlGyc5IbzYcEqGDUXzqS7lXxJG/
	fxODYKhGS0SZ5D5T+srzedwsKTB0Ih2jjE+IdmXM3wvAN1N4r60oA7dCKdEPB5v9Wno6df6rs/sNM
	kO8FsCts3zXTxCcToJZaL+GdssGLeOEjRdq+D4zC+K4muAI4318h3/aiLeoRLLO6StB7OZnngMQ60
	dfK0OPYLA2ogTmijwrT2LAYMAOULFH7vYkbzoOotc9bKGw+ZNSG+12eEQo1x0dTVB1HWPqG6KjHhU
	PRb74SPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJqbJ-00CIAN-K8; Fri, 05 Aug 2022 06:14:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJqbF-00CI7I-8h; Fri, 05 Aug 2022 06:14:22 +0000
X-UUID: 664f19bf3e324bcba059c2c4eb77f81f-20220804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:bfb790e2-aa57-43ef-86b1-4c37d9d3be78,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:de0400ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 664f19bf3e324bcba059c2c4eb77f81f-20220804
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1854633892; Thu, 04 Aug 2022 23:14:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 14:03:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 5 Aug 2022 14:03:30 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman
	<mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon
 Jang <ikjn@chromium.org>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 1/2] usb: xhci-mtk: relax TT periodic bandwidth allocation
Date: Fri, 5 Aug 2022 14:03:27 +0800
Message-ID: <20220805060328.6189-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_231421_331391_97713C71 
X-CRM114-Status: GOOD (  13.97  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently uses the worst case byte budgets on FS/LS bus bandwidth,
for example, for an isochronos IN endpoint with 192 bytes budget, it
will consume the whole 5 uframes(188 * 5) while the actual FS bus
budget should be just 192 bytes. It cause that many usb audio headsets
with 3 interfaces (audio input, audio output, and HID) cannot be
configured.
To improve it, changes to use "approximate" best case budget for FS/LS
bandwidth management. For the same endpoint from the above example,
the approximate best case budget is now reduced to (188 * 2) bytes.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: change commit message
---
 drivers/usb/host/xhci-mtk-sch.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 06a6b19acaae..a17bc584ee99 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -425,7 +425,6 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 
 static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 {
-	u32 extra_cs_count;
 	u32 start_ss, last_ss;
 	u32 start_cs, last_cs;
 
@@ -461,18 +460,12 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		if (last_cs > 7)
 			return -ESCH_CS_OVERFLOW;
 
-		if (sch_ep->ep_type == ISOC_IN_EP)
-			extra_cs_count = (last_cs == 7) ? 1 : 2;
-		else /*  ep_type : INTR IN / INTR OUT */
-			extra_cs_count = 1;
-
-		cs_count += extra_cs_count;
 		if (cs_count > 7)
 			cs_count = 7; /* HW limit */
 
 		sch_ep->cs_count = cs_count;
-		/* one for ss, the other for idle */
-		sch_ep->num_budget_microframes = cs_count + 2;
+		/* ss, idle are ignored */
+		sch_ep->num_budget_microframes = cs_count;
 
 		/*
 		 * if interval=1, maxp >752, num_budge_micoframe is larger
-- 
2.18.0


