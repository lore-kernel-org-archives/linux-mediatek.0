Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AF6C433EB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D00BB20672
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QfZFwrDg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q4OJbjt1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D00BB20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FAhSsXfSYfp2Favkms7bpClpOhANOh0+12/wVi8h2Lg=; b=QfZFwrDg+1c4crat75792h9/i
	bRdXMRXtKIRTCM0ju8KcjQZNYR7o4aBknrcGGxPL0esYxvbIuzhOSMgqiqeCdCWICeKFCCK2d4ERp
	GvUCnU+y4OkDmUw6FjRlSmr8YvXlJLSNowWZOQ0vKeJb/tOmB3Yl+DujJy7H/1DwkOLklq4wApIRq
	o/HtrcdnZllxHVyCspsLKbwA0ZlsO+WtwEtoGmZTAjj3fZEdlZSrwM/f6CYJ6HDsmmI7VtAgtP15n
	I6kzEdbPYoIiN2C4TgDKIBGpee0NpWHra3znL4cPjaGgKQ8ti8gCRaGo+2zWqxyCixUXLNlB+l8fw
	OKj0OB3Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxPn-00076S-VC; Mon, 27 Jul 2020 07:19:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxPR-0006we-Ua; Mon, 27 Jul 2020 07:18:55 +0000
X-UUID: 261cf3e125914686bd695afbf421cd3c-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IOySdoF/dmmR5ME5Xkb3uJOwAvtUS4UDWtTsJzmoSt8=; 
 b=q4OJbjt1MLYxwuBe+Ssk8MHXyRHATHDvsNnC/fAXHwkRHdjNFi1hicroGvKvrX4OcIti8NsVwYuDj9BdOBX0ZXHOR6r2AofYP4fqErsTgII/r9B8ph4d2V1+h/umDPp5S+IlbtPgU4gzhvI3Rg1iKd+A01ZRZDz7+Wh3FIQkJPU=;
X-UUID: 261cf3e125914686bd695afbf421cd3c-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 193907932; Sun, 26 Jul 2020 23:18:50 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 08/11] usb: mtu3: remove useless member @busy in mtu3_ep struct
Date: Mon, 27 Jul 2020 15:14:57 +0800
Message-ID: <1595834101-13094-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_031854_139417_8BB317B2 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: Eddie Hung <eddie.hung@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The member @busy in mtu3_ep struct is unnecessary, so remove it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h        | 1 -
 drivers/usb/mtu3/mtu3_gadget.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 9d68f25..8fd83bd 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -294,7 +294,6 @@ struct mtu3_ep {
 
 	int flags;
 	u8 wedged;
-	u8 busy;
 };
 
 struct mtu3_request {
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 2bc9a95..ef9fcd5 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -17,7 +17,6 @@ void mtu3_req_complete(struct mtu3_ep *mep,
 {
 	struct mtu3_request *mreq;
 	struct mtu3 *mtu;
-	int busy = mep->busy;
 
 	mreq = to_mtu3_request(req);
 	list_del(&mreq->list);
@@ -25,8 +24,6 @@ void mtu3_req_complete(struct mtu3_ep *mep,
 		mreq->request.status = status;
 
 	mtu = mreq->mtu;
-	mep->busy = 1;
-
 	trace_mtu3_req_complete(mreq);
 	spin_unlock(&mtu->lock);
 
@@ -40,14 +37,12 @@ void mtu3_req_complete(struct mtu3_ep *mep,
 	usb_gadget_giveback_request(&mep->ep, &mreq->request);
 
 	spin_lock(&mtu->lock);
-	mep->busy = busy;
 }
 
 static void nuke(struct mtu3_ep *mep, const int status)
 {
 	struct mtu3_request *mreq = NULL;
 
-	mep->busy = 1;
 	if (list_empty(&mep->req_list))
 		return;
 
@@ -195,7 +190,6 @@ static int mtu3_gadget_ep_enable(struct usb_ep *ep,
 	if (ret)
 		goto error;
 
-	mep->busy = 0;
 	mep->wedged = 0;
 	mep->flags |= MTU3_EP_ENABLED;
 	mtu->active_ep++;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
