Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A823C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 23:37:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D633B22CA0
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 23:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D633B22CA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u/O/x95n4POy6cLnwEBQVLy+l/JB3b2QeFpJeTMyGUI=; b=2f+6nlcO67IhmJpjejDDqtmD+
	3sVqrtsjP45rFJ9gbR5sUS+zKp0NZm/l9LI+ikwCVyhxIt8+K1uCb68sW9O5PCGPP4VUZWjrSGWw4
	2Lm8MmMazwj4pyM/BoY7OiOigT0v+2wp2tkPw6091ylwlmrdTQ3FCngSiL9LBEz0mromaXWtZBk0I
	qE6eOtdNx25oFrb0RDp8p4Xv+AG5EytxfMRg+MEUqJ7LYupcSEs5IqdD+by1ER1cw507CnPzm/VLN
	4AgQMxT71ob5YFMQzzwzGK+5Xj5qRfBv2rLrOssBGdsyaYw+g3McV2Bli8hXzmdFBLefpD36Uh6tM
	+T4Y1M3Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klKdw-00067J-U0; Fri, 04 Dec 2020 23:37:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klKdu-00066k-QS
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 23:37:39 +0000
X-UUID: 80849696b91a4ef09f032b7709d0f415-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=T6rKBuxg3oqhxlbHoAfI4IXHhl0Y87ditum/hb4A9DU=; 
 b=gARxZQaSZCE9zs8mAIzP+XUcpk0/3pktaGNXKw9PP9hFMItHS98e9tsoYEQNinBN7Ir4tRDBKgipUbNB/Ox5cOXlOsheVhPx1KJswmsAhhqSi0MBGFU4h3etfY4ctg2t4aKNgNPpQ9syN2TRzas/+wluTLx9qKmbAkMlM2vI6Ps=;
X-UUID: 80849696b91a4ef09f032b7709d0f415-20201204
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 831948384; Fri, 04 Dec 2020 15:37:34 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 15:37:30 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 07:37:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Dec 2020 07:37:18 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 2/2] mt76: mt7615: add vif check in
 mt7615_update_vif_beacon()
Date: Sat, 5 Dec 2020 07:37:15 +0800
Message-ID: <5e89627ba5632db6da460f153bf00d7a3e8f9254.1607124652.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <65336148b5d440dceb967a401488b119e14b9c5a.1607124652.git.ryder.lee@mediatek.com>
References: <65336148b5d440dceb967a401488b119e14b9c5a.1607124652.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_183739_027032_7520A4CC 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This avoids the WARN_ON(1) calltrace in station mode.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2: add default:
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 0f360be0b885..9e0765ddcb5f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2017,7 +2017,16 @@ mt7615_update_vif_beacon(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	struct ieee80211_hw *hw = priv;
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 
-	mt7615_mcu_add_beacon(dev, hw, vif, vif->bss_conf.enable_beacon);
+	switch (vif->type) {
+	case NL80211_IFTYPE_MESH_POINT:
+	case NL80211_IFTYPE_ADHOC:
+	case NL80211_IFTYPE_AP:
+		mt7615_mcu_add_beacon(dev, hw, vif,
+				      vif->bss_conf.enable_beacon);
+		break;
+	default:
+		break;
+	}
 }
 
 static void
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
