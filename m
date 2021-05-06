Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B79C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 06:34:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB3B613F0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 06:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB3B613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XvTADVk7sZZ96IlDxta/qu2k4/piQvFKgnnCnx1+tEs=; b=rRCPU8lO3qp7GTRNyBMGjjkqQ
	mUJvg9rTeexBcNBCkDhPb4lzF479w/AR2PwQTtEKp8KuYlvYQV+/E7fkQOSlHKTm2bQmgSQoeX7ZH
	C/z4QyKnbWgeQ5u09A1ZjzKBizC65BqHE4QqwIOTWn+ey3Uac1F5Ci7R1IuymhZ/LQxtnQW1fGSuU
	pBu6ROWuxHfSouTWaWNEvoNtORMGSZpU+fKpffk1YcZOYgJoVPYvvGUUj2aPRGDtCK+sTgRARBQSk
	p4OI8vRmNtuhAnMAkNQPU1BJIkKnLVfzU8PYgp35uqrnTKlEEXfm/j4Xb9TjGZzzaxlfBpyJeRLyH
	l4heaxsjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leXa5-003MOM-Hz; Thu, 06 May 2021 06:33:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXZx-003MMV-W3; Thu, 06 May 2021 06:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=MP0PGyz5YTtUzND2VJqFK7YRtkCiKYMQafog4a/V00M=; b=BNPEBtd8KaS1p8GL3R64SB0WwN
 33j+XTsctfEBb/u8PXC8p5ioZgdUBckR77ifCtH9/pPKcGiewV0+dHLmRrba+wSyqbZejeGmvkrOZ
 LjcfN+gfJsyaQLaKXhnIt98xidwHtK48yGZf1TixbwoUJqvDqWtuelW0gs52N7yiwEHXvkU/eN5Xx
 xUKxW86eznkT7UzUqHV5Ab87PrcKxZmoqs8a3XOdUB7HmO7BMzpQ5WWIEWRDkAyJF2+xMAB8ghLlS
 +EOJOgiXWbG33bVQO+wvOuMoGJEGic4XiuKflpbtEw7SDJe0uQrVBihEuiU8j0WhNrWLtP0nFVXD/
 qAArBMAA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXZv-005dYT-15; Thu, 06 May 2021 06:33:44 +0000
X-UUID: b6d110111f604397b6c1cce3f4523faa-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MP0PGyz5YTtUzND2VJqFK7YRtkCiKYMQafog4a/V00M=; 
 b=kaF+qx1CIX/M+1WWjV8c4rsu5HMSltZxDbtPrpMuRwF1nVgwkts49jRgscfPwdBAet79lMNMNaG6LaoSoNjzvN1Aou63uXGOcmQsI9w8UtbVqxMZ3jKnoGRO8ClEpCWtaxXwsK+B8uCq+gcslf6Gz+OrzzAPnhbrqG18CdyLmyE=;
X-UUID: b6d110111f604397b6c1cce3f4523faa-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1188551599; Wed, 05 May 2021 23:33:41 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 23:31:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 14:31:18 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 May 2021 14:31:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 2/3] usb: xhci-mtk: remove unnecessary assignments in
 periodic TT scheduler
Date: Thu, 6 May 2021 14:31:15 +0800
Message-ID: <20210506063116.41757-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
References: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3AD3668E849FEE7EE933129F7B2DD64AFC12A0E253AB5CFDDB7F0114C4F524AB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_233343_097487_896CEA13 
X-CRM114-Status: GOOD (  13.32  )
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

From: Ikjoon Jang <ikjn@chromium.org>

Remove unnecessary variables in check_sch_bw().
No functional changes, just for better readability.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 37 +++++++++++++--------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 8b90da5a6ed1..9fb75085e40f 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -476,6 +476,9 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 	u32 start_cs, last_cs;
 	int i;
 
+	if (!sch_ep->sch_tt)
+		return 0;
+
 	start_ss = offset % 8;
 
 	if (sch_ep->ep_type == ISOC_OUT_EP) {
@@ -603,54 +606,42 @@ static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
 static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 			struct mu3h_sch_ep_info *sch_ep)
 {
+	const u32 esit_boundary = get_esit_boundary(sch_ep);
+	const u32 bw_boundary = get_bw_boundary(sch_ep->speed);
 	u32 offset;
-	u32 min_bw;
-	u32 min_index;
 	u32 worst_bw;
-	u32 bw_boundary;
-	u32 esit_boundary;
-	u32 min_num_budget;
-	u32 min_cs_count;
+	u32 min_bw = ~0;
+	int min_index = -1;
 	int ret = 0;
 
 	/*
 	 * Search through all possible schedule microframes.
 	 * and find a microframe where its worst bandwidth is minimum.
 	 */
-	min_bw = ~0;
-	min_index = 0;
-	min_cs_count = sch_ep->cs_count;
-	min_num_budget = sch_ep->num_budget_microframes;
-	esit_boundary = get_esit_boundary(sch_ep);
 	for (offset = 0; offset < sch_ep->esit; offset++) {
-		if (sch_ep->sch_tt) {
-			ret = check_sch_tt(sch_ep, offset);
-			if (ret)
-				continue;
-		}
+		ret = check_sch_tt(sch_ep, offset);
+		if (ret)
+			continue;
 
 		if ((offset + sch_ep->num_budget_microframes) > esit_boundary)
 			break;
 
 		worst_bw = get_max_bw(sch_bw, sch_ep, offset);
+		if (worst_bw > bw_boundary)
+			continue;
+
 		if (min_bw > worst_bw) {
 			min_bw = worst_bw;
 			min_index = offset;
-			min_cs_count = sch_ep->cs_count;
-			min_num_budget = sch_ep->num_budget_microframes;
 		}
 		if (min_bw == 0)
 			break;
 	}
 
-	bw_boundary = get_bw_boundary(sch_ep->speed);
-	/* check bandwidth */
-	if (min_bw > bw_boundary)
+	if (min_index < 0)
 		return ret ? ret : -ESCH_BW_OVERFLOW;
 
 	sch_ep->offset = min_index;
-	sch_ep->cs_count = min_cs_count;
-	sch_ep->num_budget_microframes = min_num_budget;
 
 	return load_ep_bw(sch_bw, sch_ep, true);
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
