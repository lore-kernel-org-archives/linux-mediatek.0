Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B37C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 02:57:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54BB220786
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 02:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JVGdKz2D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HHtqY77A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54BB220786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NNdu4zfbzv8nGn9v1hD/iWa/GEsj8aZbdvPhRdkerg=; b=JVGdKz2D1hBbgY
	okkhGfmFAnKc7bgBxvTCTr9cAm4GfZaguPzwycheGZ4j/njO9+x1lxCEmEplVEgkwnOY8MvzwkNQo
	LVlUFeP9KqhbqPgVcYjQDYlWyNqGew7Ht/Ww55L7NNT0GpAk3R0hBCgkLvak0OgXG1FAQQy5yoM4t
	rDc7o6OnZhCrWiaxXwATNkHyJ5xefFF+Xamq06bE4uNY0Et6+ns2G+WYHRQHTQjABg/Kt3QpGcj1h
	NH908PcZAY2266Cj9cW47kS+lzV1yUQpT3oqBBIMY3cyjMOp1PiFNJaj7N3fQt1/QdboAumrkt4QU
	Y5YJeQtjEDiPF1kWgQdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlOGP-0006fA-OH; Wed, 17 Jun 2020 02:57:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlOGG-0006Yk-AR; Wed, 17 Jun 2020 02:57:14 +0000
X-UUID: 18ebf655ae5e496d986a4b1957c55d33-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZB3PDgfcBojaJ/fPpU6l0md70bnLTvLTU3jl+XWvIfE=; 
 b=HHtqY77AKdEdRl5uRlzh+xBaDieKv9n3wLZ7vxZ/3F77PEfWNqIW1WWu/u4+NxP0FxRfH1MVvBLMY5OOpIBdAP5i894qcpT5D4VqEgj+4weCxqnq5M0qJuWUpEe8HbOeHxfQw/lgWNBQNhdjR7CckXA+wVAEJU+kGTQhpNHvttI=;
X-UUID: 18ebf655ae5e496d986a4b1957c55d33-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 576697989; Tue, 16 Jun 2020 18:57:05 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 19:46:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 10:46:50 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Jun 2020 10:46:52 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Sergey
 Organov" <sorganov@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] usb: gadget: u_serial: improve performance for large data
Date: Wed, 17 Jun 2020 10:46:47 +0800
Message-ID: <1592362007-7120-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592310884-4307-1-git-send-email-macpaul.lin@mediatek.com>
References: <1592310884-4307-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 341107C8CF0BF6B3E6614FF7FFDF49CB2287241339A1BF5421EE54432FA9522B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_195712_371596_90FED3A7 
X-CRM114-Status: GOOD (  10.06  )
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
