Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BF3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F8F4207BB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CxsR09af";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f8QOemF0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F8F4207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=67kIUi79sh6JiYwulFupxgPtAxnB8rnY/ZUh7nmNOf8=; b=CxsR09afUW2R9et+WybC9O5r/
	s02CoBSqLdZvJbkGf3pIb6ZWhbCsHNl8L30ufszasGd2vPA9W9qVCu7a2xrTL84pcJ/daq179gty+
	yJf+i6KNV76458Az+cYy0MACX7D4un3Zy7d6+lxSExjUJBuyCjTmU2Mrgmajdw6QxHbLNDdUfpgVn
	kb5/m4fxAvPg+2vRKlC8QzyESDgTDE2Xjr+lYKkYj5rxOiZ82wd9SzTQifMUryAC/u6PiUnNRFin3
	mZbufkYyayskyI4CKXxFEjZIN5mLG5z4W0MXrYYjze18Jjt7gJJN23Imx0JzJjhuJ9DlU9ISO1tkd
	Dv7/AT8nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxPS-0006yg-3E; Mon, 27 Jul 2020 07:18:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxPP-0006wk-2G; Mon, 27 Jul 2020 07:18:52 +0000
X-UUID: 0d7e52adc4314189afa57c0c280ed589-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kMaydL2v9BshbyUReMb3wcjNfslH3HmUZia9G0XRnJc=; 
 b=f8QOemF0Ybi/R3Y2gLV5RrHQgGd+/QS0DvA6FC9LbwHengawHYgF+FJWwfSogANP+W+OqSti5+7s1a33onQGtna3AAXxOFSlbAVpbudpfpxOSTqgEBQm1DNSW0SmDrRm32K7zgh6/Btvths5HYA6bSJBIQPp4iCdJTmGtT7yw/U=;
X-UUID: 0d7e52adc4314189afa57c0c280ed589-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 714515834; Sun, 26 Jul 2020 23:18:50 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:43 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:43 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 11/11] usb: mtu3: simplify mtu3_req_complete()
Date: Mon, 27 Jul 2020 15:15:00 +0800
Message-ID: <1595834101-13094-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B2FBB65A761F5069A6267965A8BC72CF8580797430EE14138B9473B4676492382000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_031851_245643_69A46309 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: Eddie Hung <eddie.hung@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use argument req directly instead of mreq->request, they
are the same usb request.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 73a8536..1de5c9a 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -15,15 +15,13 @@ void mtu3_req_complete(struct mtu3_ep *mep,
 __releases(mep->mtu->lock)
 __acquires(mep->mtu->lock)
 {
-	struct mtu3_request *mreq;
-	struct mtu3 *mtu;
+	struct mtu3_request *mreq = to_mtu3_request(req);
+	struct mtu3 *mtu = mreq->mtu;
 
-	mreq = to_mtu3_request(req);
 	list_del(&mreq->list);
-	if (mreq->request.status == -EINPROGRESS)
-		mreq->request.status = status;
+	if (req->status == -EINPROGRESS)
+		req->status = status;
 
-	mtu = mreq->mtu;
 	trace_mtu3_req_complete(mreq);
 	spin_unlock(&mtu->lock);
 
@@ -31,11 +29,10 @@ void mtu3_req_complete(struct mtu3_ep *mep,
 	if (mep->epnum)
 		usb_gadget_unmap_request(&mtu->g, req, mep->is_in);
 
-	dev_dbg(mtu->dev, "%s complete req: %p, sts %d, %d/%d\n", mep->name,
-		req, req->status, mreq->request.actual, mreq->request.length);
-
-	usb_gadget_giveback_request(&mep->ep, &mreq->request);
+	dev_dbg(mtu->dev, "%s complete req: %p, sts %d, %d/%d\n",
+		mep->name, req, req->status, req->actual, req->length);
 
+	usb_gadget_giveback_request(&mep->ep, req);
 	spin_lock(&mtu->lock);
 }
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
