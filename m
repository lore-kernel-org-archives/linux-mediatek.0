Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB26CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 05:45:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 912DB2067B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 05:45:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TY9dTKDX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k08Btp7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 912DB2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yoe7bkAJNm/5XjA+jXK7WHPEF8Kbl0s9zBHJPm1PVJ8=; b=TY9dTKDXa+1uLq
	w1MLbjGANlpPrhDn+U6pDdj8kV3pC79/FAAjr5Ol7D9+YuCHnsRe3d+WJud2vMActLnyoC+1nD4zD
	hmF8WLjmvCYj4VEoQH+O3z7vKN9/ZI7dRAeKxzhWXCOml/+JNbzUWrxP75l019560AwoN+gFfA++o
	yczOfrYPK/7ShY5ZQz717un9JaDYCd5dSB1K2FSr69MGtWLjhn+YXIVYeNtkOWygqNFBiWs/b+fqw
	Bbo65rveKb+rl4WVR1S2XiK8ViD5PeOAE95HOYxizBCrfEpqa8pCItx/z+ICu+iLx7RXciyTw12EO
	Sr2AUZxi01CwCC0VF5iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlQsw-0000fN-Rw; Wed, 17 Jun 2020 05:45:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlQsD-0006Cc-So; Wed, 17 Jun 2020 05:44:35 +0000
X-UUID: a92ab15313f54f5c8f959278c43e619c-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rdDoFRdKNzLFxd2DJUrNxctB8vmIe5DS4Jzw+A+aOnM=; 
 b=k08Btp7dRxZ4X80rIgJlrsg0XGjfQR0wqunDWTkJlICe81mnXfzxQSyTF7GjQVHXGi5oAqBOhwBRTjZhkdn/5v5+wGBgmvz4FeMpjbM3syKa2opFPnYzDs11IDrpAyM5IgIM3KxCrlVpSdxOe3RAwfsLkQfRE1YRON0sbW1AqJo=;
X-UUID: a92ab15313f54f5c8f959278c43e619c-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1992425376; Tue, 16 Jun 2020 21:44:20 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 22:43:14 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 13:43:12 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Jun 2020 13:43:12 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Sergey
 Organov" <sorganov@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] usb: gadget: u_serial: improve performance for large data
Date: Wed, 17 Jun 2020 13:42:57 +0800
Message-ID: <1592372577-7986-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592362007-7120-1-git-send-email-macpaul.lin@mediatek.com>
References: <1592362007-7120-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_224433_936810_04C74F60 
X-CRM114-Status: GOOD (  10.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Macpaul Lin <macpaul.lin@gmail.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Nowadays some embedded systems use VCOM to transfer large log and data.
Take LTE MODEM as an example, during the long debugging stage, large
log and data were transfer through VCOM when doing field try or in
operator's lab. Here we suggest slightly increase the transfer buffer
in u_serial.c for performance improving.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
Changes for v2:
  - Drop previous patch for adding flag which indicates hardware capability in
    gadget.h and in DMA engine according to Alan's suggestion. Thanks.
  - Replace requested buffer size "REQ_BUF_SIZE" instead of checking hardware
    capability.
  - Refine commit messages.
Changes for v3:
  - Code: no change.
    Commit: Add missing change log in v2.

 drivers/usb/gadget/function/u_serial.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 3cfc6e2..d7912a9 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -80,6 +80,7 @@
 #define QUEUE_SIZE		16
 #define WRITE_BUF_SIZE		8192		/* TX only */
 #define GS_CONSOLE_BUF_SIZE	8192
+#define REQ_BUF_SIZE		4096
 
 /* console info */
 struct gs_console {
@@ -247,7 +248,7 @@ static int gs_start_tx(struct gs_port *port)
 			break;
 
 		req = list_entry(pool->next, struct usb_request, list);
-		len = gs_send_packet(port, req->buf, in->maxpacket);
+		len = gs_send_packet(port, req->buf, REQ_BUF_SIZE);
 		if (len == 0) {
 			wake_up_interruptible(&port->drain_wait);
 			break;
@@ -514,7 +515,7 @@ static int gs_alloc_requests(struct usb_ep *ep, struct list_head *head,
 	 * be as speedy as we might otherwise be.
 	 */
 	for (i = 0; i < n; i++) {
-		req = gs_alloc_req(ep, ep->maxpacket, GFP_ATOMIC);
+		req = gs_alloc_req(ep, REQ_BUF_SIZE, GFP_ATOMIC);
 		if (!req)
 			return list_empty(head) ? -ENOMEM : 0;
 		req->complete = fn;
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
