Return-Path: <SRS0=K2BI=IC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4D6C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 09:07:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62DD664F20
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 09:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62DD664F20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IFYquzypJ6lFjISTzYICsqmkG+11UpuCs3kqfzV5anQ=; b=hMYWcwj7xHwvBYmXSqy3LHjmDe
	WSGgC6AMT09Wo2ful+JGmkf5TvsvGr9u8yAAJcpf9di6Zk1KF6/L8whm7kEGXzz90//r5i8yyAE+y
	ozgAuHxsNiKOBkk1xlNAtijgVUfY2xZOn15zxlzxH4OSDC02HEjGqTkA+Bj8D1//zhVMvhUqA+Yy+
	KHe7fTAtdvYvmPXk5kLrghILYiRJe+nYHy6iPEaUmKTmIW+Hj7zt+y8U7Bc9MUlvxqepOQ7R1Hs6u
	DcTTdu5SI55j8L4UorvEo886aTMBd8HoCqzm4TZlcnkVKrf7N6mvigZQgI8TZzIV4huYDIYAEJ4gJ
	PWnOJv+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHjxL-008ESu-Rd; Thu, 04 Mar 2021 09:07:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHjsz-008DNR-PJ
 for linux-mediatek@lists.infradead.org; Thu, 04 Mar 2021 09:03:23 +0000
X-UUID: 32d55987ba1a463c986be1c8061c2fde-20210304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=pmQVdoqfTHq5RKLkZ1XLEzbStJFkEDy/FK4jg5xDjWk=; 
 b=eqiXxk3mSykNVOGVNbpSwR1nbOlcqyA3MeG5g2ipqt+F0RNhC8QOyUgBAT1U2LKvYVijx7gyGwkZbu2jQwdFR5X233/12kE+8L5UG1+G0/FmYrNLbpWf0qZKnhg6BdNjZNjccJb0QcjFjBzWBHfy9UR0kBwccQ7os7N2XejnPJc=;
X-UUID: 32d55987ba1a463c986be1c8061c2fde-20210304
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2077840375; Thu, 04 Mar 2021 01:02:48 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Mar 2021 01:02:47 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Mar 2021 17:02:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 4 Mar 2021 17:02:44 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v4] mt76: mt7615: add missing capabilities for DBDC
Date: Thu, 4 Mar 2021 16:55:05 +0800
Message-ID: <0573b06759c90309b5a6a6e2b6b95796e7db60c7.1614843966.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 963A089E76DA1727F5AD6D7B82587DDEB008139ED7B7D853073BDBB8C5E468822000:8
X-MTK: N
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This improves performance for second phy.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v4 - fix init order.
change since v3 - none.
change since v2 - adjust setup sequence.
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 88a2ee7e7143..e70e852c1af8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -448,6 +448,9 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 
 	/* second phy can only handle 5 GHz */
 	mphy->cap.has_5ghz = true;
+	mphy->sband_5g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
+	mphy->sband_5g.sband.vht_cap.cap |=
+			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
 
 	/* mt7615 second phy shares the same hw queues with the primary one */
 	for (i = 0; i <= MT_TXQ_PSD ; i++)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
