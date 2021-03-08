Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986B9C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:02:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E8CC6186A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E8CC6186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xx87I+xLFRB+yhpngkpVwXvNNVNQMRtYaTlBLQTcd48=; b=LXk+aMc97/jpqsaAN8+LyI3e0
	pMfHY0qsTmbyKVu2wrbs+2mXM7F3Qb6xgRHPzDWlYs+uDyOsx4/6H8eqVf/iLzJJM/nvaKYBX1JDS
	NeGYeBpUlJI2/gnD1kq4yNGlc883xr73rbF9wKdRJiDuRCr27CpGd/H6lJS2gt9oVxIcaqwOkCfKI
	YoLK0wIQ9epEe/umgbigq4gBGdlVbTe58BcYbfZ8IKaWENDw3HTBytgSTY0ZBTukGFgKDvn8+/ua1
	dbgY7udvtYkjY7Tzs7Hmnx4bPz5Kg819fo5gG0bdbDu7wE1FT4WxvjK8wcq1RIOhQqgR8ZBp4Ycwe
	AlEJ5q2ug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ6AL-00EhCz-Vd; Mon, 08 Mar 2021 03:02:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ6AA-00Eh75-Qg; Mon, 08 Mar 2021 03:02:38 +0000
X-UUID: 48408807b9e749918512acacf86d2dcc-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0px39TCcRbkWq2knTC/LgpwrtgktRRpgkAPODEB9sKo=; 
 b=Eh/hOIioP39ME2bYSV+wYYwjprhmw3zntY7qKxrns2h44HBkXoOcLimgnJ7srEPJYyg9zV9Kw2J/VlZHE6PlR5VXAFvTZDAvlTd8jSLW3cXOI7ASPKFnrU8hgHAHBi48rlgmgDSVLC6ojW0mrgHHOomef0WFq7gTERWrTOlwN/Y=;
X-UUID: 48408807b9e749918512acacf86d2dcc-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 852496890; Sun, 07 Mar 2021 19:02:24 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 05/18] usb: xhci-mtk: use @sch_tt to check whether need do
 TT schedule
Date: Mon, 8 Mar 2021 10:51:54 +0800
Message-ID: <324a76782ccaf857a8f01f67aee435e8ec7d0e28.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_030235_206915_8084BFB1 
X-CRM114-Status: GOOD (  13.01  )
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
v2: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 59ba25ca018d..b1da3cb077c9 100644
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
