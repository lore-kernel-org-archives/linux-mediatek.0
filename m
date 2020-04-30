Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F406C83001
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 07:59:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4214320838
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 07:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C33ULiGu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kamgEIWi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4214320838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WLICVeFW52p1Ga0/DM6xTFkNOkBROB3Ue3P3mxLp9Fc=; b=C33ULiGu15sjqS
	Svrxjh77JfwFyXoLkBPDM/vLXx4s42E0zseHnXlCKxMCGGqbvIjVwsE0RvkCwRTLHliZ9iY2OvnDF
	aweb/CrNwLLXZau4vQVmP7whcV62dFFuqnRHFpOmYlSzKdyOZfDWkWyxs5A8KqRDDjN5YtEq9eMyc
	l3jRpek/anFcokGKdrHTW1GfOEB2HcibkFAaT758S1nZt6QKehPsERkY8llj6sXCNNkdNA7n9FUXu
	0kSkqGUk/EDNcEZdeXlc0Tcoz1nzDKU1rWYlYzk3JwJgR2bQ3Duig0xk/6ySt2lcT9TM2VWZ+zOpd
	kAGlyAGN9+MQUSDadlxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU46n-0002st-3P; Thu, 30 Apr 2020 07:59:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU46l-0002sB-4B
 for linux-mediatek@lists.infradead.org; Thu, 30 Apr 2020 07:59:48 +0000
Received: from localhost.localdomain.com (unknown [151.48.130.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C4E820838;
 Thu, 30 Apr 2020 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588233586;
 bh=XwZZ3X2QcyIEbrJyTLwyjUo+RQKYXCcvBb8PPP5q1mw=;
 h=From:To:Cc:Subject:Date:From;
 b=kamgEIWit0T5LfqKCWQZvHL5nB1kQf5y+Cy2/C2hpogLn0uYybt4ISb9XtkK/X99S
 p9Wop5C3MFjXwrk2xcvucfs5XCJEhvFizO/33XeS5Gt0BgiD+FTFn6RY4wQcT9wFM5
 hxe/x8E9AH3ancl5bleKr1TBdeX6wnaL4wyqueLk=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: do not mark sched_scan disabled in
 mt7615_scan_work
Date: Thu, 30 Apr 2020 09:59:31 +0200
Message-Id: <c265ff87ff0286968cb527bf51c1f8b734fad582.1588233520.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_005947_186415_B678C9FE 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For the moment offload firmware supports just one entry in the scheduled
scan plan and so it runs till it is disabled by the userspace.
Do not mark the hw scheduled scan as disabled in mt7615_scan_work
after receiving a scan result

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 23bc7f1262d0..5e54c7ffae0b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -818,7 +818,6 @@ void mt7615_scan_work(struct work_struct *work)
 			clear_bit(MT76_HW_SCANNING, &phy->mt76->state);
 			ieee80211_scan_completed(phy->mt76->hw, &info);
 		} else {
-			clear_bit(MT76_HW_SCHED_SCANNING, &phy->mt76->state);
 			ieee80211_sched_scan_results(phy->mt76->hw);
 		}
 		dev_kfree_skb(skb);
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
