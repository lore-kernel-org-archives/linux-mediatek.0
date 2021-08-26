Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC81C4320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 02:52:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B54DA60FD9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 02:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B54DA60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SnIlTrGn6ymz1Ur6VNdJGtt0nWpG20dbzOw9GBIf14=; b=poQdwHJPIJJs//
	aptaq50Z8i7yu9B5fjGvdkYM9CsfK1MCh5UeSssh/e555S+mrLAdfFGztym6tKNc4j0yNG8SM1Lq1
	aHZdQ3rt1X/WWQbKeeqdAn2cH2YM1mrHGL/Bw06ocGOQNYNJuHOx2cwrjsH2Xui8yfZqxXeRn51rT
	hjQu/n294s6ChOqerhqiMohLTDDo6m2Ze2qbIORh5gRjjyUCJFNiOnqS+mpcE/+awbhQOPANH91Ba
	ueQtMIZGHIBRWmI7jm+9Aaf4nxygO6Okvp+SgYArjM/XenILzpq1PLcx2b5bByh1hzTgE6ozieioW
	yVL5u25w0EKHrEfbMoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ5Ux-008xlR-GM; Thu, 26 Aug 2021 02:52:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ5Us-008xjb-Bw; Thu, 26 Aug 2021 02:52:10 +0000
X-UUID: 8472f3e41805441aac7e603ae06eb29c-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZXDJ0TE6N08HnmOOJMB2bdokcDG9hkhnn+Apj3hRgRU=; 
 b=TRZbafnXytUgdJnPfhAnI8z/J5yh0FYiVKY8rlYi3zEtbxE7gt0oBMJ3lfzGZbwmbnNVhRyMpCD30Pr+2oCJN8DL8p8uYAmiN3UtISFEmZMudpnB5pEEZEDb/Z5eT7LVaJjHyjbjY8IJL8MMUA7vFcq1qWM8nsFkUMS1L2BcPLY=;
X-UUID: 8472f3e41805441aac7e603ae06eb29c-20210825
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 839315995; Wed, 25 Aug 2021 19:52:03 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 19:52:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Aug 2021 10:52:00 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 26 Aug 2021 10:51:59 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ikjoon Jang <ikjn@chromium.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Yaqii wu <yaqii.wu@mediatek.com>
Subject: [PATCH next v2 3/6] usb: xhci-mtk: update fs bus bandwidth by
 bw_budget_table
Date: Thu, 26 Aug 2021 10:51:41 +0800
Message-ID: <20210826025144.51992-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210826025144.51992-1-chunfeng.yun@mediatek.com>
References: <20210826025144.51992-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_195206_506486_1CC4182A 
X-CRM114-Status: GOOD (  13.31  )
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

Use @bw_budget_table[] to update fs bus bandwidth due to
not all microframes consume @bw_cost_per_microframe, see
setup_sch_info().

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch, move from another series
---
 drivers/usb/host/xhci-mtk-sch.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index cffcaf4dfa9f..83abd28269ca 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -458,8 +458,8 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 		 * Compared with hs bus, no matter what ep type,
 		 * the hub will always delay one uframe to send data
 		 */
-		for (j = 0; j < sch_ep->cs_count; j++) {
-			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
+		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_budget_table[j];
 			if (tmp > FS_PAYLOAD_MAX)
 				return -ESCH_BW_OVERFLOW;
 		}
@@ -534,21 +534,18 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 base, num_esit;
-	int bw_updated;
 	int i, j;
 
 	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
 
-	if (used)
-		bw_updated = sch_ep->bw_cost_per_microframe;
-	else
-		bw_updated = -sch_ep->bw_cost_per_microframe;
-
 	for (i = 0; i < num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
 
-		for (j = 0; j < sch_ep->cs_count; j++)
-			tt->fs_bus_bw[base + j] += bw_updated;
+		for (j = 0; j < sch_ep->num_budget_microframes; j++)
+			if (used)
+				tt->fs_bus_bw[base + j] += sch_ep->bw_budget_table[j];
+			else
+				tt->fs_bus_bw[base + j] -= sch_ep->bw_budget_table[j];
 	}
 
 	if (used)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
