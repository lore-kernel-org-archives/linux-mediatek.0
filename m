Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14744C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 08:47:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB37E64FD4
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 08:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB37E64FD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jhiXlGYMY+TV/myWx05GJlzDxuhUJ9+ySCi9Tggq0lE=; b=TbQ54G6r+/aF1ZSdpAYfgU33aq
	eyhLmsPGhNGKGvcPzWmI3qM2MQ27ShqA29F70jgKQf4UU3lH1tnMw42Cn0+tXNRubmsnK0z/DAwYN
	undHznauPwkjMffhDhC7ZVr1JXj2NwWO3m+dfwyjjrSDHjNSu4QbOI+3QSU19AV2RKaJCYlGKUhnG
	bRZNTNcqEi6C3YlrxdAdGfwx9M8NaYVIBN6UdBcG3T0qlco7CTaCJykA7udSWYBf48+YcpQZGzJA0
	9o83rCcQ5AF6IKQSTTkhSLeQVYcM9jOHhNe6qE6NG/48rDNxEvT8LyVXxue3xr9WPlnjy/SwaMoLO
	6J5HJvUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI66v-00E4sr-Ol; Fri, 05 Mar 2021 08:47:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI66p-00E4pY-Uj
 for linux-mediatek@lists.infradead.org; Fri, 05 Mar 2021 08:47:00 +0000
X-UUID: 73147d98afd34fa39f05bfd317c7f5b4-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4NMmkkXC9cZpxWsmFueHASIOqatrx3PeIkti4rX+7p0=; 
 b=X3MwUTLmr5EoYF5Tx0RS7eh3CWBjcKL10LHAo+k+0PMwnsgVc8fC6tiHHBdHT/9SzbcCL+/KmVXvAmXVZ5nBC79ET09bGdt8VHIRBJ+7AD+/A/iv1wJKWZww/jhp3xK+w7ufBWBnJHPP+dCsJ1sModUUS99I1Vy4Hbuh5lljntY=;
X-UUID: 73147d98afd34fa39f05bfd317c7f5b4-20210305
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 662081463; Fri, 05 Mar 2021 00:46:45 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 00:46:44 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 16:46:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 5 Mar 2021 16:46:42 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix possible deadlock while
 mt7915_register_ext_phy()
Date: Fri, 5 Mar 2021 16:46:41 +0800
Message-ID: <96aaea810b92f701e74b27cf030f9ddced6f4a63.1614932804.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_084656_659835_82C96960 
X-CRM114-Status: GOOD (  11.58  )
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

ieee80211_register_hw() is called with rtnl_lock held, and this could be
caused lockdep from a work item that's on a workqueue that is flushed
with the rtnl held.

Move mt7915_register_ext_phy() outside the init_work().

Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 7 ++++---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 4 ++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 165be6abcc96..2ffadd22c259 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -181,8 +181,6 @@ static void mt7915_mac_init(struct mt7915_dev *dev)
 				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 	for (i = 0; i < 2; i++)
 		mt7915_mac_init_band(dev, i);
-
-	mt7915_mcu_set_rts_thresh(&dev->phy, 0x92b);
 }
 
 static int mt7915_txbf_init(struct mt7915_dev *dev)
@@ -295,7 +293,6 @@ static void mt7915_init_work(struct work_struct *work)
 	mt7915_mac_init(dev);
 	mt7915_init_txpower(dev);
 	mt7915_txbf_init(dev);
-	mt7915_register_ext_phy(dev);
 }
 
 static int mt7915_init_hardware(struct mt7915_dev *dev)
@@ -677,6 +674,10 @@ int mt7915_register_device(struct mt7915_dev *dev)
 
 	ieee80211_queue_work(mt76_hw(dev), &dev->init_work);
 
+	ret = mt7915_register_ext_phy(dev);
+	if (ret)
+		return ret;
+
 	return mt7915_init_debugfs(dev);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 255f87aa1830..cde8c1ce3ae0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -65,6 +65,10 @@ static int mt7915_start(struct ieee80211_hw *hw)
 		mt7915_mac_enable_nf(dev, 1);
 	}
 
+	ret = mt7915_mcu_set_rts_thresh(phy, 0x92b);
+	if (ret)
+		goto out;
+
 	ret = mt7915_mcu_set_sku_en(phy, true);
 	if (ret)
 		goto out;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
