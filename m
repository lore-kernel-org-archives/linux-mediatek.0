Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F23CC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:20:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499312070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z6GUKhfQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jXOcOWcX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 499312070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=67+gj9kKB71f3bDrygX2C4Rt9+rxWwvHCKLHiyGgJgY=; b=Z6GUKhfQ33m7m3BQzdiUgI7+T
	IGv4Z/QkLHTiJj1yNxFIigfNELhIFIRJX1OXNDDumTP3Z4FQQTNEz4Z9luijvkHhMTPnNUFnTt8pj
	73dn5eXk4WUcEfNGPKt18GwcOktr6UyXo1KGb48ALPnRqheZ4xX+cV+gO5tIN99VkX4EX+KGXr3JS
	FXIM5dweyEWaLW/Jo50o6wqLUxeM2HfTKIu4rOWoeUzU2nykKOF0D/cNKksL04WN/R8TVz/U+pFMG
	UgceI88N4ss7kc1qNEnhJojzN/JP/6KDyZhsp0cHfUK/z1Xs7YlGZgLwAz6JRvqXk4YbqW5TOLO4J
	TqgTRuuqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxRB-0007ql-GE; Mon, 27 Jul 2020 07:20:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxR7-0007ll-HM; Mon, 27 Jul 2020 07:20:38 +0000
X-UUID: cf2dcb5436e84e5888340bcb03cc88c9-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ufjzZjNOHimcMX86Fnfqnwe5QrRh888Z/o+t/Lvqu3o=; 
 b=jXOcOWcXga2m3FwL2ncjk9L+LprcPR6TvBrJfS1kK54uIRiivkSpW9fZsgo7z6zwqX/UG2HprZl9NZBzmND7Vb42ze7FpS+bkeSjZYH8wc2zSZS9mkzf23m302FWVhpDn5d7T/VyI8ltWQZemVXGb7kISCtOWtYJX2tWJ+NOXcQ=;
X-UUID: cf2dcb5436e84e5888340bcb03cc88c9-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1543982542; Sun, 26 Jul 2020 23:20:33 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:38 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 07/11] usb: mtu3: remove repeated error log
Date: Mon, 27 Jul 2020 15:14:56 +0800
Message-ID: <1595834101-13094-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 00A026CDA25A030254C6AB9822EE2914ADBAA6D88F98B076D42B2123E33AE3752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_032037_727148_5293DBF1 
X-CRM114-Status: GOOD (  10.58  )
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

The caller already print error log.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 3d13129..2bc9a95 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -673,8 +673,6 @@ static void mtu3_gadget_init_eps(struct mtu3 *mtu)
 
 int mtu3_gadget_setup(struct mtu3 *mtu)
 {
-	int ret;
-
 	mtu->g.ops = &mtu3_gadget_ops;
 	mtu->g.max_speed = mtu->max_speed;
 	mtu->g.speed = USB_SPEED_UNKNOWN;
@@ -685,11 +683,7 @@ int mtu3_gadget_setup(struct mtu3 *mtu)
 
 	mtu3_gadget_init_eps(mtu);
 
-	ret = usb_add_gadget_udc(mtu->dev, &mtu->g);
-	if (ret)
-		dev_err(mtu->dev, "failed to register udc\n");
-
-	return ret;
+	return usb_add_gadget_udc(mtu->dev, &mtu->g);
 }
 
 void mtu3_gadget_cleanup(struct mtu3 *mtu)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
