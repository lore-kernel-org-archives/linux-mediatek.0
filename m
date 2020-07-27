Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632E1C433E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FDB420792
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lmE43nsM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NhbC8WoI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FDB420792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zt8v3L+sL1FFLZRWTzTDOsx5NIxPdXkg2wuC7690wMg=; b=lmE43nsMQF2z7O4oYoWCLGewIK
	zZ9synTUgyFMBC4Tsd1Ou7JuVD2BAxRWUC+KKMArW6eBmAZXkQkhponddDfiWBTtaxkhlrfxPN9H3
	8ETRMAEbMmNmeS/crxtbNbWw5gH36Cb5a+xNFyPTNeWhKhfedk5J1XyN/O7WE+rZN9cOvMOWSORoy
	/TgayypxJj80dWe/dWJw2q7M+WZSODRV3jn9U0kQiylZywTJGK2D8+BqE45mK9+TbpGnGPu1nP5Pw
	BgMR7I2dYQc0wCnkXcMIpZEkhY4IFW6PyjXJ5BFGq1d99UtWlx5lUb93mlMGeB5HjGh/6quyv23up
	QlJXoYEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxPR-0006yK-Ir; Mon, 27 Jul 2020 07:18:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxPP-0006we-2l; Mon, 27 Jul 2020 07:18:52 +0000
X-UUID: 3f253ffedb38491985706ff8d4a257af-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CEB+Fd7Gn3H8VZZKWasR7hc+Jw+O8wMVPt6wPu9YgD4=; 
 b=NhbC8WoIzbSfZfcsGRmoI/1hXw/fTejFXPXziqyJFvQJNPw+GrGIOFC1xBZ27vIOf2SdsXYwvoj/1lFstm312qnSXcYRtuI/ARn9SCgbtd2coV01Mz2g/RMK0gu1SJ3RyUHmTG2vGE17rb7MbXhaMRGgm3DQzf5ZUJBZGaod8Kw=;
X-UUID: 3f253ffedb38491985706ff8d4a257af-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1493762560; Sun, 26 Jul 2020 23:18:50 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:31 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:31 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 01/11] usb: mtu3: remove unnecessary pointer checks
Date: Mon, 27 Jul 2020 15:14:50 +0800
Message-ID: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_031851_275706_8CD3FAAD 
X-CRM114-Status: GOOD (  12.53  )
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

The class driver will ensure the parameters are valid
pointers before call the hook function of usb_ep_ops,
so no need check them again.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index f93732e..6b26cb8 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -263,23 +263,15 @@ void mtu3_free_request(struct usb_ep *ep, struct usb_request *req)
 static int mtu3_gadget_queue(struct usb_ep *ep,
 		struct usb_request *req, gfp_t gfp_flags)
 {
-	struct mtu3_ep *mep;
-	struct mtu3_request *mreq;
-	struct mtu3 *mtu;
+	struct mtu3_ep *mep = to_mtu3_ep(ep);
+	struct mtu3_request *mreq = to_mtu3_request(req);
+	struct mtu3 *mtu = mep->mtu;
 	unsigned long flags;
 	int ret = 0;
 
-	if (!ep || !req)
-		return -EINVAL;
-
 	if (!req->buf)
 		return -ENODATA;
 
-	mep = to_mtu3_ep(ep);
-	mtu = mep->mtu;
-	mreq = to_mtu3_request(req);
-	mreq->mtu = mtu;
-
 	if (mreq->mep != mep)
 		return -EINVAL;
 
@@ -303,6 +295,7 @@ static int mtu3_gadget_queue(struct usb_ep *ep,
 		return -ESHUTDOWN;
 	}
 
+	mreq->mtu = mtu;
 	mreq->request.actual = 0;
 	mreq->request.status = -EINPROGRESS;
 
@@ -335,11 +328,11 @@ static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
 	struct mtu3_ep *mep = to_mtu3_ep(ep);
 	struct mtu3_request *mreq = to_mtu3_request(req);
 	struct mtu3_request *r;
+	struct mtu3 *mtu = mep->mtu;
 	unsigned long flags;
 	int ret = 0;
-	struct mtu3 *mtu = mep->mtu;
 
-	if (!ep || !req || mreq->mep != mep)
+	if (mreq->mep != mep)
 		return -EINVAL;
 
 	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);
@@ -379,9 +372,6 @@ static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
 	unsigned long flags;
 	int ret = 0;
 
-	if (!ep)
-		return -EINVAL;
-
 	dev_dbg(mtu->dev, "%s : %s...", __func__, ep->name);
 
 	spin_lock_irqsave(&mtu->lock, flags);
@@ -424,9 +414,6 @@ static int mtu3_gadget_ep_set_wedge(struct usb_ep *ep)
 {
 	struct mtu3_ep *mep = to_mtu3_ep(ep);
 
-	if (!ep)
-		return -EINVAL;
-
 	mep->wedged = 1;
 
 	return usb_ep_set_halt(ep);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
