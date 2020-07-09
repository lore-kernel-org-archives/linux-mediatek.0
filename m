Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C345C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 07:17:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F5820674
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 07:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1uWsc92O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UAPYBQ5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67F5820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=guPF65Wga1JXtxHgG3kMbYCo/BllZj1pASSWFygD5yg=; b=1uWsc92O2HIOE0tHwxWNcawfvH
	gztX9ENGSPRXM2KOJeG2SjQMQdcK8YUw/K3W185KQrQ+T0b6N6To4o3jGQYTyUn8GfQLKT5KZKbXH
	CPww29Q8uUl8J66EmqlXDchhXYyR1xyfss8qEQMxp2s/pa6N+i3ZY+OHpKSbtMw7f04a8CLSfHied
	roiQ9dfGzcP+pvLRwjMwQuRhISBDNS3fqjPhawRab0+AI8/LXL1YbHkzcUvFR3cRT7qEx74xT63ZU
	NQ7AaR6gj0NL+6Z+qGsOZiM4+FpSThPPL1o76gZWBrycxUCiiwNRTnDfFNpk52BDRhc8yqWtUlXEE
	l9H2Imzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtQoO-00026I-By; Thu, 09 Jul 2020 07:17:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtQoL-00025k-6H; Thu, 09 Jul 2020 07:17:38 +0000
X-UUID: 83a000ca4e4f48a1848fd7eff380c830-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=KN9hhzoH05uLeemQtJA/oz8qydIgDPv4Z3bmecE5HhY=; 
 b=UAPYBQ5shMTeK3m01pYEwcU3+kokwT2eBJO7UG9yllafqBt3pjL+Gmea8VXejA3JVAmGhXHEAIkgzhUKOVN8DNLj+Y6lytNYM/pTKfnmHBegb8r9LpiFk7iCOF11KKuMv+JT7mJILqqRBnh8Y2iMrpNSE9z2EslPXLHwkqbs4gY=;
X-UUID: 83a000ca4e4f48a1848fd7eff380c830-20200708
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2125917086; Wed, 08 Jul 2020 23:17:24 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 00:09:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 15:09:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Jul 2020 15:09:40 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [v3 PATCH] usb: mtu3: remove unnecessary NULL pointer checks
Date: Thu, 9 Jul 2020 15:09:01 +0800
Message-ID: <1594278541-24968-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: E0704D007BDFE6557E27D3F2225493E6F51B016FC12D4C256CBF91EF0F07D15E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_031737_477167_6DE622B7 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The class driver will ensure the parameters are not NULL
pointers before call the hook function of usb_ep_ops,
so no need check them again.

Reported-by: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: remove unnecessary NULL pointer checks but not add more checks.

v2: nothing changed, but abandon another patch.
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
