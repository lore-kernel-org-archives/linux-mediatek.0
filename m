Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3CCC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:01:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A92C123132
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q2LcyzA9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kp2T8ika"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A92C123132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j6/xmnCZ7YOJyG9cczpOwpmhYfAme9IqD7I3urOLTgM=; b=Q2LcyzA9aeSe0wc9GK53Un4Xi
	duB9bHUy9toB5O4otFoTxtl1nf1DiYCJhz3U3htwKwSd5ayhl//99FmfWcra/2EUQOPPzwKk+9bs7
	M1XCPcbrcilIU75EAf71il70pSFGGxo7eI83pCugoX2CK8kKqNZr+4itYVb+F7qyAiyIbELE14C5m
	T6l2LYyJclxxe/HunEKvjjOKjgK1316DJwK5WSzFv8TJ2mxT8JJOrctyX9zT9MO4xTf8ADS/oN9CD
	vcxssSkl4bmRihdcUncAs3DCgzHg7o3B/gzPTr5jsP9LbQqlUiSybONqLbdRDSixscPlbp3pBj7dh
	f7bLSkZ8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpmqq-0002Gd-OK; Mon, 29 Jun 2020 06:01:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpmqo-0002Fj-6K; Mon, 29 Jun 2020 06:01:07 +0000
X-UUID: 95aade42b7bb4c0eaea1d06bb5a06143-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NwS9jy7CIdaWYOmPmW3wkHO2uEs/CxdTSonBcS5TmwQ=; 
 b=kp2T8ikaRIDd/Tck19M6CDoHpibcOL2enKMzf/PFuMkh1oOHovHO5ellSR2Yy+4sIl8FDss4Q87d9RVnBeU7x+GZKaHwthEGCywBDYC7mYIYgnszt+c1C5eHspDdjL6cD8GOkaJRCxUVIHqaJoiLLv46kTXN+xH7QoqCMvakyWw=;
X-UUID: 95aade42b7bb4c0eaea1d06bb5a06143-20200628
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 940440364; Sun, 28 Jun 2020 22:00:56 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Jun 2020 23:00:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 14:00:53 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 14:00:55 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <felipe.balbi@linux.intel.com>
Subject: [PATCH 2/2] usb: mtu3: fix NULL pointer dereference
Date: Mon, 29 Jun 2020 14:00:34 +0800
Message-ID: <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7B37AF07867A61C3DD88A4B9EB1AE839680AB059AAFF40C70514E259127CB69D2000:8
X-MTK: N
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some pointers are dereferenced before successful checks.

Reported-by: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index f93732e..1689ca8 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -332,14 +332,21 @@ static int mtu3_gadget_queue(struct usb_ep *ep,
 
 static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
 {
-	struct mtu3_ep *mep = to_mtu3_ep(ep);
-	struct mtu3_request *mreq = to_mtu3_request(req);
+	struct mtu3_ep *mep;
+	struct mtu3_request *mreq;
 	struct mtu3_request *r;
+	struct mtu3 *mtu;
 	unsigned long flags;
 	int ret = 0;
-	struct mtu3 *mtu = mep->mtu;
 
-	if (!ep || !req || mreq->mep != mep)
+	if (!ep || !req)
+		return -EINVAL;
+
+	mep = to_mtu3_ep(ep);
+	mtu = mep->mtu;
+
+	mreq = to_mtu3_request(req);
+	if (mreq->mep != mep)
 		return -EINVAL;
 
 	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);
@@ -373,8 +380,8 @@ static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
  */
 static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
 {
-	struct mtu3_ep *mep = to_mtu3_ep(ep);
-	struct mtu3 *mtu = mep->mtu;
+	struct mtu3_ep *mep;
+	struct mtu3 *mtu;
 	struct mtu3_request *mreq;
 	unsigned long flags;
 	int ret = 0;
@@ -382,6 +389,9 @@ static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
 	if (!ep)
 		return -EINVAL;
 
+	mep = to_mtu3_ep(ep);
+	mtu = mep->mtu;
+
 	dev_dbg(mtu->dev, "%s : %s...", __func__, ep->name);
 
 	spin_lock_irqsave(&mtu->lock, flags);
@@ -422,11 +432,12 @@ static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
 /* Sets the halt feature with the clear requests ignored */
 static int mtu3_gadget_ep_set_wedge(struct usb_ep *ep)
 {
-	struct mtu3_ep *mep = to_mtu3_ep(ep);
+	struct mtu3_ep *mep;
 
 	if (!ep)
 		return -EINVAL;
 
+	mep = to_mtu3_ep(ep);
 	mep->wedged = 1;
 
 	return usb_ep_set_halt(ep);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
