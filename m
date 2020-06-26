Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE04C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 13:18:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6972080C
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 13:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MVjqz/BP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qIxnoRqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6972080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FfoHNzZK1WW5hMFPTqZvzD3S4btY4vc/n6wjjxDo2yU=; b=MVjqz/BPKKQPo5x4fMnisrV+B2
	vjBofLUFxnSihH4IG19JJECX+cW7wUCxbvzQtEpfRbMAJOkXW1loIsHp5IDa3e74wnFD7k/M+EBzi
	aHCv9+lBWEMMmqcYI1ET8DoEbe2h9T9BAJz+sTBkeOHz2jLh6Kpy14NYzupNDfncgvSU+QzNCxZ7R
	5LHPHcoG6Tp66xT2TtHulo4k5M6ZFD86pZaEU9lJDjrcFOQDont0RUlt5COdtsx6cwe3XAkeqVZg8
	Rt/NNda0SD7f3IzPm+Fpm+xSWFQ03ZxeASCu0aJZ1dYD199G1l/+yLee6gJ8b3Xe3aHsLK2KRpYGn
	xuCMQLSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jooFR-00084q-2Q; Fri, 26 Jun 2020 13:18:29 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jooFM-00083w-MV; Fri, 26 Jun 2020 13:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ng5FQUPq9fg/2RMV97J8dqP34n4zcjJCnbHox6bshBI=; b=qIxnoRqrngS1HmCoCu5mRmIcnq
 zIFjBq7sCW9XflCA22uR2G2FSRtwEsP17jpMBSjoRkjlBKTTJ88iQ7mZGmG112rGCD0tLRrRAEyak
 /t7OWJuTsMomHvvrmg0NrB+huJR0gA3o6sTrABp8zolvhF8fY0sW5/p1QsFEdv6vUCwVGiZxG3TK9
 zW2KInWVeUEbv82Uo8y83LEaPNmWQWmsYSXaElBvGElz2ONNhzbWlPq5TDf9HRf1iqUuAmS7J0gkB
 HoXJp3jcDQZ+KX2G/7jDtyLynA53o1LYZTxysPcM61UxT/WxMHeoyZNqa9mPvnGLT126WHB+X2WxB
 enMHOiUQ==;
Received: from winnie.ispras.ru ([83.149.199.91] helo=smtp.ispras.ru)
 by casper.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jooFG-000652-U3; Fri, 26 Jun 2020 13:18:22 +0000
Received: from home.intra.ispras.ru (unknown [10.10.165.12])
 by smtp.ispras.ru (Postfix) with ESMTP id 6A579201D0;
 Fri, 26 Jun 2020 16:18:06 +0300 (MSK)
From: Evgeny Novikov <novikov@ispras.ru>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] usb: gadget: udc: gr_udc: fix memleak on error handling path
 in gr_ep_init()
Date: Fri, 26 Jun 2020 16:17:47 +0300
Message-Id: <20200626131747.18276-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_141819_850933_FE275E07 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: ldv-project@linuxtesting.org, Jason Yan <yanaijie@huawei.com>,
 Evgeny Novikov <novikov@ispras.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

gr_ep_init() does not assign the allocated request anywhere if allocation
of memory for the buffer fails. This is a memory leak fixed by the given
patch.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/usb/gadget/udc/gr_udc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index 7164ad9800f1..7419889ebe9a 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -1980,9 +1980,12 @@ static int gr_ep_init(struct gr_udc *dev, int num, int is_in, u32 maxplimit)
 
 	if (num == 0) {
 		_req = gr_alloc_request(&ep->ep, GFP_ATOMIC);
+		if (!_req)
+			return -ENOMEM;
+
 		buf = devm_kzalloc(dev->dev, PAGE_SIZE, GFP_DMA | GFP_ATOMIC);
-		if (!_req || !buf) {
-			/* possible _req freed by gr_probe via gr_remove */
+		if (!buf) {
+			gr_free_request(&ep->ep, _req);
 			return -ENOMEM;
 		}
 
-- 
2.16.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
