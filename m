Return-Path: <SRS0=EnAX=3O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0438EC35243
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jan 2020 10:43:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD2F22468C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jan 2020 10:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DTCG++lR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD2F22468C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gQ26YdSNI1W20vrlCqktYT3AQ3heGuRl05YGBTqvjs8=; b=DTCG++lRLeH3X8
	Gmx6wRAPrc3LtE9lNtreiuOSEFDUAFmkgh8ZkDj1Db1XaKi2xugoNnYVRFjxgDjMfYT3x22xzbzRr
	HiKCwuQhzD2XVYWtYDr4vyooKYV7ykXFgsQqIO9J5jdmLrSQBlvEdPkNNp+vdU0OA29tGPf1qLMhl
	bO4TMgT1R0TuQMnkuJ0SO9KOD8FZptSjmNqYfiNpMiJsBUDbweITu1GYCrA49djGsn5ZXEylg9XTO
	Mjj9iYiyb7upd24BU3uyWYnXbfxJUEtwxC/QCSm0QIS7nqvlm5lrUnF10KFGwxrfV4yTb1SnsFcTS
	2nzWNBNODM88wgrE3KdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ivIuY-0007a0-U3; Sat, 25 Jan 2020 10:43:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivIuQ-0007Tj-OZ; Sat, 25 Jan 2020 10:43:24 +0000
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1ivIu5-0008V2-8j; Sat, 25 Jan 2020 11:43:01 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 74CF51C1A72;
 Sat, 25 Jan 2020 11:42:48 +0100 (CET)
Date: Sat, 25 Jan 2020 10:42:48 -0000
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: core/rcu] wireless/mediatek: Replace rcu_swap_protected() with
 rcu_replace_pointer()
MIME-Version: 1.0
Message-ID: <157994896823.396.3709123757914257242.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200125_024322_938274_3B221F63 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 x86 <x86@kernel.org>, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The following commit has been merged into the core/rcu branch of tip:

Commit-ID:     a191c9e9f73a78e8801b5eeb3d43bbd6fd73b86f
Gitweb:        https://git.kernel.org/tip/a191c9e9f73a78e8801b5eeb3d43bbd6fd73b86f
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Wed, 11 Dec 2019 10:30:21 -08:00
Committer:     Paul E. McKenney <paulmck@kernel.org>
CommitterDate: Thu, 12 Dec 2019 10:20:51 -08:00

wireless/mediatek: Replace rcu_swap_protected() with rcu_replace_pointer()

This commit replaces the use of rcu_swap_protected() with the more
intuitively appealing rcu_replace_pointer() as a step towards removing
rcu_swap_protected().

Link: https://lore.kernel.org/lkml/CAHk-=wiAsJLw1egFEE=Z7-GGtM6wcvtyytXZA1+BHqta4gg6Hw@mail.gmail.com/
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Reported-by: "Martin K. Petersen" <martin.petersen@oracle.com>
[ paulmck: Apply Matthias Brugger feedback. ]
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: "Martin K. Petersen" <martin.petersen@oracle.com>
Acked-by: Kalle Valo <kvalo@codeaurora.org>
Cc: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Roy Luo <royluo@google.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Cc: <netdev@vger.kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-mediatek@lists.infradead.org>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index 53b5a4b..59c1878 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -281,8 +281,8 @@ void mt76_rx_aggr_stop(struct mt76_dev *dev, struct mt76_wcid *wcid, u8 tidno)
 {
 	struct mt76_rx_tid *tid = NULL;
 
-	rcu_swap_protected(wcid->aggr[tidno], tid,
-			   lockdep_is_held(&dev->mutex));
+	tid = rcu_replace_pointer(wcid->aggr[tidno], tid,
+				  lockdep_is_held(&dev->mutex));
 	if (tid) {
 		mt76_rx_aggr_shutdown(dev, tid);
 		kfree_rcu(tid, rcu_head);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
