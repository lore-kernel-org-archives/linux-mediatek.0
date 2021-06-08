Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556DDC47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:06:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27CA860FE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27CA860FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iNK3Iu2SzSJ+Oz8fbr270grXidd4FZVUt3W/uHBxsDw=; b=B5RlVjWq1iqxoM
	dVXbwW8bTWNkkn3d/dL/vdb3jRV5yb4or5SjPlKY6nSPc803DEp67iX76Mft0ovXnYpuuV2YlepAR
	WqlT+kR1kjsEcu/c7G8qmuX53zPv8W2R5zbvKkBTJLBCHXxe4QCyjLxOC6e5vmcdgrYixBpTP65Yb
	qQK7QGHImEfsbqjiA9RKlmr4Inxw1NRU0YxHTfDILo+zyZSq1rmg4LxwRtv8Q1rHif24Pri+2OKTR
	LZRPZ9XyKA4+mW76GY5mixUkZYS8ObSbUr/BSbrRK6tEPL8rktcrjlVRbp+742YCok7vuCr7rcPgS
	pYRsdOMdCNDy3Cmt5zeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqVom-006nVq-Ag; Tue, 08 Jun 2021 07:06:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqVoj-006nUA-4I
 for linux-mediatek@lists.infradead.org; Tue, 08 Jun 2021 07:06:30 +0000
X-UUID: e015881005464b50b0abf87e9e5bf058-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Og0R84mleBShfSiMOZRABj+Khoe9tkRKPbtbJpbMGNY=; 
 b=jZEI5+nPt3T05FM6YteRlEsCcRxhKrEvCU99YrqYICxQD61iTIIpSo1lS6fiWHDT8ASHGs9TeAoUsFIEDXGBd781CRLhkcO/iBKEr+Mp1KkKvDhzr7g3FFkPEveuxW0sVV+I8yJHwKEU2BBSZgGEjgv+USTzws10GXq+aHdfmnA=;
X-UUID: e015881005464b50b0abf87e9e5bf058-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1043330497; Tue, 08 Jun 2021 00:06:22 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 23:56:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 14:56:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Jun 2021 14:56:18 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 1/2] mt76: testmode: move chip-specific stats dump before
 common stats
Date: Tue, 8 Jun 2021 14:55:57 +0800
Message-ID: <20210608065558.8117-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_000629_200939_3F2F5BF5 
X-CRM114-Status: GOOD (  11.35  )
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

Move chip-specific stats dumping part before common stats dumping
to provide flexibility for per-chip driver to modify the value of
common stats.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/testmode.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index c6a85a0..f73ffbd 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -521,6 +521,14 @@ mt76_testmode_dump_stats(struct mt76_phy *phy, struct sk_buff *msg)
 	u64 rx_fcs_error = 0;
 	int i;
 
+	if (dev->test_ops->dump_stats) {
+		int ret;
+
+		ret = dev->test_ops->dump_stats(phy, msg);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(td->rx_stats.packets); i++) {
 		rx_packets += td->rx_stats.packets[i];
 		rx_fcs_error += td->rx_stats.fcs_error[i];
@@ -535,9 +543,6 @@ mt76_testmode_dump_stats(struct mt76_phy *phy, struct sk_buff *msg)
 			      MT76_TM_STATS_ATTR_PAD))
 		return -EMSGSIZE;
 
-	if (dev->test_ops->dump_stats)
-		return dev->test_ops->dump_stats(phy, msg);
-
 	return 0;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
