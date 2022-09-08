Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B411AECAAD5
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 03:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n4r2lm1O/ZbhYvyH3yAMZYZe4vUkL5cDQs7OSwKuDuk=; b=3diMupCdSo1ecAOSvym1UVZdkZ
	yDKMJFvMyyeUFY3tgCGI3Jl/6zC5d+iyH4FZUjEOzbIfWGS5giebh2egeaG6r99DAFgQWiwd7nsak
	Aqtlj6IhhsGLoT6kSy3bHyXsOl9+jQGSCcAb0wj/V4e82PhX1klAVxrJInPkeqPnqBbolD9wlPoSD
	70hZnnQEtpvG2k07YmA8YGU5kb1pVs5aBoawAfSGcKd+HiAOX2iOJM2tFx0+78QEcrYmLNgJARp3f
	C8LbyR+ZjZVTYFeA9vm5d+JUh8ixNCbqyRgEesy1PCVydYWG35WTVWNpyqbAPSsPDdolcZ1qXqe8p
	iq00Tklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW8KB-00FH9a-UG; Thu, 08 Sep 2022 03:35:31 +0000
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW8K9-00FH1i-14
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 03:35:30 +0000
X-UUID: e59c4c97f7de4a9a8687d8c73367b3b2-20220908
X-CPASD-INFO: 722c919ce29c4a48829d84e484a2a6a8@gIJsg2ZjZ5ORUnuvg6R_clhjaZRoYIW
	Dem6BYo9mjViVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3hnRsg2tfaQ==
X-CLOUD-ID: 722c919ce29c4a48829d84e484a2a6a8
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:185.
	0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:133.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-5
	.0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:2.0,SPC:0,SIG:-
	5,AUF:10,DUF:4332,ACD:73,DCD:73,SL:0,EISP:0,AG:0,CFC:0.419,CFSR:0.04,UAT:0,RA
	F:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,E
	AF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: e59c4c97f7de4a9a8687d8c73367b3b2-20220908
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: e59c4c97f7de4a9a8687d8c73367b3b2-20220908
X-User: chenzhang@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
	(envelope-from <chenzhang@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 289574322; Thu, 08 Sep 2022 11:35:33 +0800
From: chen zhang <chenzhang@kylinos.cn>
To: chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org
Cc: chenzhang_0901@163.com,
	linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] usb: mtu3: Fix spelling typo in comments
Date: Thu,  8 Sep 2022 11:35:02 +0800
Message-Id: <20220908033502.18013-1-chenzhang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_203529_421350_8C254996 
X-CRM114-Status: UNSURE (   9.75  )
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
change for v2: add k2ci tool explain:
K2ci (Kylin Continuous Integration) is a code pre-verification tool 
independently developed by KylinSoft, which is used for ensuring the 
code quality of code submission. K2ci includes the comment check tool
notes_check.

This spelling typo was found using notes_check tool, which reported the following
warning when check the v5.19 kernel release:

python3 notes_check.py 
drivers/usb/mtu3/mtu3_qmu.c emtpy
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


