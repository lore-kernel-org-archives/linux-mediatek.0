Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60D4C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:14:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C08D64F53
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C08D64F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hmEVfqLCL9Qi9BOUlg/2ZE3cOT0qpSeqqhv7RQKtZyY=; b=c8zDclanVequOn0463REzqsmF
	zlod2Ge3ydXjjsOdAk6kTWopugEGJvud/p1KAoQyOgJP0AbYfR7PXbYhNAhpQwkXPHYefVrILC1rr
	Eq9QgU0EvbQE4nBFu0kEPlNv+iEahB9xLedOUN5h7oKCTKKLOAHkrLpyy5weM916sSknYSCDgVtVC
	UveZ9eFbX+Y2l5OzuCiQmZXvCZk7LlTmRSPdYekCNoL9x7hDmH47l559USjPqrHs1pS6CKQObSK7Q
	VbT99FYNYNiWjmqg2siKRZGX7QUV4u09Oopo9bPJaoGEgHsL4otQRd5ifVcUwE9zy5y1yp+JfIeVe
	HjXkLx1aw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6XB-00EBx8-7R; Fri, 05 Mar 2021 09:14:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6WX-00EBgM-O4; Fri, 05 Mar 2021 09:13:31 +0000
X-UUID: 117623dfd1814d11a317b2c1cb669e29-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dsNG3dCGLrHDrJIiisuOnkSvQXqjds7oXVSqZn9ta+k=; 
 b=pkelfA6tH1YxOVxXcAb9NymJZavJV/bZ6RKrLvr8a2/C+vOVW77b3Hk0tip2kBNGf3uoXNC6K2SEkiCMujs9JKtWH2KNO59+6Tf3FUV+L1PNL+rO+5/1Q7VS6+GgN1hV+86UryJuvdfPxf1prV/8K4LemxHBzJnjnyxI2LPxbBM=;
X-UUID: 117623dfd1814d11a317b2c1cb669e29-20210305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1605087725; Fri, 05 Mar 2021 01:13:20 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 05/17] usb: xhci-mtk: use @sch_tt to check whether need do TT
 schedule
Date: Fri, 5 Mar 2021 17:02:43 +0800
Message-ID: <1614934975-15188-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C8CA46DBE9EC354CE8400F4C949113AA506A2C98DBF3A7B081DE440F7DA555E22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_091330_221506_1B6CDC64 
X-CRM114-Status: GOOD (  11.22  )
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

It's clearer to use @sch_tt to check whether need do TT schedule,
no function is changed.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 817ef2815e67..9016188eee97 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -548,7 +548,7 @@ static int check_sch_bw(struct usb_device *udev,
 	min_num_budget = sch_ep->num_budget_microframes;
 	esit_boundary = get_esit_boundary(sch_ep);
 	for (offset = 0; offset < sch_ep->esit; offset++) {
-		if (is_fs_or_ls(udev->speed)) {
+		if (sch_ep->sch_tt) {
 			ret = check_sch_tt(udev, sch_ep, offset);
 			if (ret)
 				continue;
@@ -585,7 +585,7 @@ static int check_sch_bw(struct usb_device *udev,
 	sch_ep->cs_count = min_cs_count;
 	sch_ep->num_budget_microframes = min_num_budget;
 
-	if (is_fs_or_ls(udev->speed)) {
+	if (sch_ep->sch_tt) {
 		/* all offset for tt is not ok*/
 		if (!tt_offset_ok)
 			return -ERANGE;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
