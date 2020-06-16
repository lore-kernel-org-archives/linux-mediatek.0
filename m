Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC511C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0FD820B1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kXSZnMad";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RrRhHGiG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0FD820B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htNiP4gabq4NLShWsrQ1N+SAYzvQR3X6oC4HyklZI6A=; b=kXSZnMadsKd1Km
	VYUkL9JrZQITe06S+JtaakJmKrzp/nyH5W8kaRhJ3MXkQDP0qmq6dxEc+OT9ang3i0EKCdvsovkFT
	FRkE6THmk3lLcel7onTbw6SRzDExNrDhFgMCBqUAGLhKQHfEN53DqjgOAXkWcklko2+4Ld4fjZkY3
	kaDmsiYUVz5hR4CRJ108wE5Ab5w+QfphBnUw100xOcUeEz1G1jcG+OFYOuftym4XsC3x+0IYkolnO
	YG3U0oIXX0W97O9r6BdbTPawyViwhtKMxqlkiM8G8w8hSlRTiJ0Mp7DWJBXTtkxW9kJii33BINs0A
	3nKCBPmOkrlnAKdfA4GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlAy5-0007Kq-2z; Tue, 16 Jun 2020 12:45:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlAxa-0004VT-Mu; Tue, 16 Jun 2020 12:45:04 +0000
X-UUID: 6ef4f37616c84916b480fb5dab34743b-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+GHnm45hE2jvr2nHAZ9rbe0xkhq/hG963s3MyoZ72c0=; 
 b=RrRhHGiGV0t4OXGgcT7VKiX/vI2w/HIAhYCyfeZ+AsuiQnTp8EFlAMPgxd8sfvF5Pt/VB0aTqvixBIEVIBewSI0t84bfZbQjkmgaAFS1tJSWChW+B5xXY7ueSjRtztyvU06H978JuV4m5hm+3CxfmOQLG087mysYD7b9dsxdC/k=;
X-UUID: 6ef4f37616c84916b480fb5dab34743b-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1551260507; Tue, 16 Jun 2020 04:44:46 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 05:34:58 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:34:49 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Jun 2020 20:34:50 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?=
 <mirq-linux@rere.qmqm.pl>, Sergey Organov <sorganov@gmail.com>, "Fabrice
 Gasnier" <fabrice.gasnier@st.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] usb: gadget: u_serial: improve performance for large data
Date: Tue, 16 Jun 2020 20:34:44 +0800
Message-ID: <1592310884-4307-2-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592310884-4307-1-git-send-email-macpaul.lin@mediatek.com>
References: <1592310884-4307-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EDECF17A48CB3E8AC57607178CD1F115DB62B0B3FEBF009D4986F0C9798111442000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_054502_757898_FE86BC5E 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

If the hardware (like DMA engine) could support large usb request exceeds
maximum packet size, use larger buffer when performing Rx/Tx could reduce
request numbers and improve performance.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/usb/gadget/function/u_serial.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 3cfc6e2..cdcc070 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -80,6 +80,8 @@
 #define QUEUE_SIZE		16
 #define WRITE_BUF_SIZE		8192		/* TX only */
 #define GS_CONSOLE_BUF_SIZE	8192
+/* for hardware can do more than max packet */
+#define REQ_BUF_SIZE		4096
 
 /* console info */
 struct gs_console {
@@ -247,7 +249,8 @@ static int gs_start_tx(struct gs_port *port)
 			break;
 
 		req = list_entry(pool->next, struct usb_request, list);
-		len = gs_send_packet(port, req->buf, in->maxpacket);
+		len = gs_send_packet(port, req->buf, in->can_exceed_maxp ?
+				REQ_BUF_SIZE : in->maxpacket);
 		if (len == 0) {
 			wake_up_interruptible(&port->drain_wait);
 			break;
@@ -514,7 +517,9 @@ static int gs_alloc_requests(struct usb_ep *ep, struct list_head *head,
 	 * be as speedy as we might otherwise be.
 	 */
 	for (i = 0; i < n; i++) {
-		req = gs_alloc_req(ep, ep->maxpacket, GFP_ATOMIC);
+		req = gs_alloc_req(ep, ep->can_exceed_maxp ?
+					REQ_BUF_SIZE : ep->maxpacket,
+					GFP_ATOMIC);
 		if (!req)
 			return list_empty(head) ? -ENOMEM : 0;
 		req->complete = fn;
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
