Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF75C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 08:41:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3772560EFE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 08:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3772560EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMM8XaNH+u4aPq+i8ayq2UVrN4oiBv0QjM3LjtzmftI=; b=z62FXeZpIkevHA
	oR6Yke6wSglDBrom3igugJgvR4RygDE7ZU4ZCfUaOkomr+kdrbZSWY4cT5d7QPkj6tcn2ACOUr9he
	l6NkojrFEIUc+q8CWssCt1sQk/xFpzxsS4aGaNwm8KVvYCvP2VP0WEvn2WMBkPcxshR1Gr0afS7iV
	owy6muoZ8LOv6ul3O5AzLmTcikmXkm0VG6VYqOtIZ83hGN4YFiPYXb1e4Ndd0wzjGIck9IqC4kqMC
	oUovbxXUiHW/WQeNF035M5FqLCFKPgQOaoS9H7+6/WKLMzkRmY1pBA7/KvgSz6lvMhEKm14/U4g9H
	b11e3zr1xifQPnoTZptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFuep-001fnE-2J; Tue, 17 Aug 2021 08:41:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFuak-001dbg-FI; Tue, 17 Aug 2021 08:37:06 +0000
X-UUID: 0d54c46310f049f99cc3c4d38cc12335-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ERtrJ8k6kdWvRYmvXupPxPbwBTup5yaQSj9D/l5R5Gg=; 
 b=HrlQi5sZcITaZE1RZ4acyYtcYjEnI/ZTwWTVvs+PxCReV9+VfpjbJAprCeEK6Vs1KyaIkItce282rGSfOamH4iYsncEdXgQzUFWJb7n9D6FxXKxl4iwDQCQKEHreIGELA7+076yZutjKyxVB6W54A3DQg0hqyYTSWbtNn12ieDQ=;
X-UUID: 0d54c46310f049f99cc3c4d38cc12335-20210817
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1903517962; Tue, 17 Aug 2021 01:36:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 01:36:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 17 Aug 2021 16:36:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 16:36:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH RESEND 8/9] usb: xhci-mtk: add a member of num_esit
Date: Tue, 17 Aug 2021 16:36:28 +0800
Message-ID: <1629189389-18779-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629189389-18779-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629189389-18779-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_013702_572021_4A0DEF68 
X-CRM114-Status: GOOD (  15.20  )
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

Add a member num_esit to save the number of esit, then no need
caculate it in some functions.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 20 +++++++-------------
 drivers/usb/host/xhci-mtk.h     |  2 ++
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index c2f13d69c607..a9fcf7e30c41 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -297,6 +297,7 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 		 CTX_TO_MAX_ESIT_PAYLOAD(le32_to_cpu(ep_ctx->tx_info));
 
 	sch_ep->esit = get_esit(ep_ctx);
+	sch_ep->num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
 	sch_ep->ep_type = ep_type;
 	sch_ep->maxpkt = maxpkt;
 	sch_ep->offset = 0;
@@ -401,14 +402,12 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 static u32 get_max_bw(struct mu3h_sch_bw_info *sch_bw,
 	struct mu3h_sch_ep_info *sch_ep, u32 offset)
 {
-	u32 num_esit;
 	u32 max_bw = 0;
 	u32 bw;
 	int i;
 	int j;
 
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	for (i = 0; i < num_esit; i++) {
+	for (i = 0; i < sch_ep->num_esit; i++) {
 		u32 base = offset + i * sch_ep->esit;
 
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
@@ -424,13 +423,11 @@ static u32 get_max_bw(struct mu3h_sch_bw_info *sch_bw,
 static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 	struct mu3h_sch_ep_info *sch_ep, bool used)
 {
-	u32 num_esit;
 	u32 base;
 	int i;
 	int j;
 
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	for (i = 0; i < num_esit; i++) {
+	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
 			if (used)
@@ -446,12 +443,11 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
-	u32 num_esit, tmp;
+	u32 tmp;
 	int base;
 	int i, j;
 
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	for (i = 0; i < num_esit; i++) {
+	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = offset + i * sch_ep->esit;
 
 		/*
@@ -533,12 +529,10 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
-	u32 base, num_esit;
+	u32 base;
 	int i, j;
 
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-
-	for (i = 0; i < num_esit; i++) {
+	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
 
 		for (j = 0; j < sch_ep->num_budget_microframes; j++)
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 0466bc8f7500..56dc348349af 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -50,6 +50,7 @@ struct mu3h_sch_bw_info {
  * struct mu3h_sch_ep_info: schedule information for endpoint
  *
  * @esit: unit is 125us, equal to 2 << Interval field in ep-context
+ * @num_esit: number of @esit in a period
  * @num_budget_microframes: number of continuous uframes
  *		(@repeat==1) scheduled within the interval
  * @bw_cost_per_microframe: bandwidth cost per microframe
@@ -79,6 +80,7 @@ struct mu3h_sch_bw_info {
  */
 struct mu3h_sch_ep_info {
 	u32 esit;
+	u32 num_esit;
 	u32 num_budget_microframes;
 	u32 bw_cost_per_microframe;
 	struct list_head endpoint;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
