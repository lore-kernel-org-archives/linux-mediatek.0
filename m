Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0466DC38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 05:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0PybyKkRoZGBJweMDOkzYN3G6xZ4sss53iPjYu6vO4g=; b=umRYoFApz6DQq2x6Km0dY8UZUZ
	cyakn01emoI2XRUXwKWI00izX4Rwvgf9RPMZ+GPO56gFZwzZY44J8Mk/rvICpPpe2SalXp0EbLIWN
	5z3TckHI8MPS6bZ4hWFfSwrjXMr9AonMBBLM0JzeXyICMBab0uY42nzuH8k+jK2WbwKpfU6vdTrw/
	/v5ACCJhikqSkbYohzzNGTzMsvImYzAk4OTEZdgnIq5feVfX5Jt0Id7murILp5gMjy6I6gAwengQj
	8eXrg2NQZwX1JZ6qtGbQt1Cn9Pb0sI7rpIY1xlTUandACFIReaZ5AjD/Hq212OIgyRb7K9+ERWMuS
	I/VGBtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVnUc-002lVM-Su; Wed, 07 Sep 2022 05:20:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVnUU-002lTb-0Q
	for linux-mediatek@bombadil.infradead.org; Wed, 07 Sep 2022 05:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0PybyKkRoZGBJweMDOkzYN3G6xZ4sss53iPjYu6vO4g=; b=YZ/7qrUDHYwJ4RqC6vudiYMajZ
	V3rzupeIx2JwKWCVRntxPZB9H2hamb6DK3TGejE9NXNgqkEjYFanjjr8W0v8IgnfyQ2Rir4daTumy
	qPk2/+3fnVlV22wirBl9/SfHRoulQVlG7t853utudIO22UT4iO3k6S9P/ck8qNmAvYlCEjtdrA32o
	cUExA2UaJQZnCo4YFY3S7DzX/PmS9oo070J7sc0hr08mvZbPYj+THwnXWPZxSmvzy3JaLiErayHqS
	7TouUKTgpREWzwiIFvNa2BPOKOhNsgQdwMpJ6ETDnL8yAE7OtvzEPSq51m47pRw8jSlo5GRnfAhsZ
	vAQ6tLHQ==;
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVnUQ-00B5Jy-CN
	for linux-mediatek@lists.infradead.org; Wed, 07 Sep 2022 05:20:44 +0000
X-UUID: 62c8ddb670804671a2ea9acf19b85d5d-20220907
X-CPASD-INFO: feb4ecfc28a04acd8a34316f8529cc1a@r7WcVJKVlJNeWKN8g6SunliSY2RjXVa
	1em9SaZGTXYGVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3taecVJWRlg==
X-CLOUD-ID: feb4ecfc28a04acd8a34316f8529cc1a
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:185.
	0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:85.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-5.
	0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:0.0,SPC:0,SIG:-5
	,AUF:4,DUF:4240,ACD:73,DCD:73,SL:0,EISP:0,AG:0,CFC:0.434,CFSR:0.077,UAT:0,RAF
	:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,EA
	F:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 62c8ddb670804671a2ea9acf19b85d5d-20220907
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 62c8ddb670804671a2ea9acf19b85d5d-20220907
X-User: chenzhang@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
	(envelope-from <chenzhang@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1473941920; Wed, 07 Sep 2022 13:15:03 +0800
From: chen zhang <chenzhang@kylinos.cn>
To: chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org
Cc: chenzhang_0901@163.com,
	linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] usb: mtu3: Fix spelling typo in comments
Date: Wed,  7 Sep 2022 13:14:36 +0800
Message-Id: <20220907051436.51703-1-chenzhang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_062042_880992_50F76255 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix spelling typo in comments.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: chen zhang <chenzhang@kylinos.cn>
---
 drivers/usb/mtu3/mtu3_qmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index 2ea3157ddb6e..5c3fbfcf6483 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -220,7 +220,7 @@ static struct qmu_gpd *advance_deq_gpd(struct mtu3_gpd_ring *ring)
 	return ring->dequeue;
 }
 
-/* check if a ring is emtpy */
+/* check if a ring is empty */
 static int gpd_ring_empty(struct mtu3_gpd_ring *ring)
 {
 	struct qmu_gpd *enq = ring->enqueue;
-- 
2.25.1


