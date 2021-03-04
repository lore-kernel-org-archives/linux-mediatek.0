Return-Path: <SRS0=K2BI=IC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BA8C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 13:25:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F6064F21
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 13:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F6064F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n226zKMYkGo+T8CitYM4WW2gz7qaLMNfz28a7T90E9s=; b=V7nHf00ilkJFQK3RU3LdUyT/Nu
	Rc+WOvX3PRuzcYF5qtCpRKRWpiKVyWzwQY1XN2e3d/3uWGvmikLe2vnMguaD14D+nrgsS5rmbgige
	OjldQsKCrtMHVQ8L3bQxaLrnJpNZsEdqZV0dEmUL8aF0HWlDvIy+SlrOb2VpNYu5yHEXsvn8cqVVq
	yJOe1MxuHNOwW0ANbg24k8QuB2CFXsfxHMWIjG55P2O1dbL3/uzoSQF5eccCV0vs0r2/94ZHv08tr
	jSI06hOp0he4yDcTZU80rZkSXNQQKfcTs9r4HRCkLn7huTBydAeEt7lMh05C9GfrLLEZntH3Byu5T
	ngRyWMwg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHnz8-008js1-Sw; Thu, 04 Mar 2021 13:25:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHnyz-008jpr-JJ
 for linux-mediatek@lists.infradead.org; Thu, 04 Mar 2021 13:25:43 +0000
X-UUID: da2d24cb76164080bfec326157bb8651-20210304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/bIZFIKuZhS1KaY00v9VcBNLL1ej0s7pxGvIPUKeREs=; 
 b=hESFubvQ9lSXs6bzUbF43s3qAX9mswJMDOcyGAtS7Z12e5ohN2jzMPu48+S6jffqfB0SK6nq6nwSVg633B6rXXFGKuJqfR2UviChWs/jUSzb9VtJjsd8T6iXXOeLoBTEys6WiAr7aR40ZuKXMvytmN4zCs01IcDrjAJuaBXI9nI=;
X-UUID: da2d24cb76164080bfec326157bb8651-20210304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2081214907; Thu, 04 Mar 2021 05:25:27 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Mar 2021 05:25:25 -0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 4 Mar 2021 21:25:24 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/3] mt76: mt7663: fix when beacon filter is being applied
Date: Thu, 4 Mar 2021 21:25:21 +0800
Message-ID: <801a2aa986f5486a0e789065feef7b77c612ea7b.1614863741.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
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

From: Sean Wang <sean.wang@mediatek.com>

HW beacon filter command is being applied until we're in associated state
because the command would rely on the associated access point's beacon
interval and DTIM information.

Fixes: 7124198ab1a4 ("mt76: mt7615: enable beacon filtering by default for offload fw")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 1aa6928f88fc..1cb310bf01ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -217,8 +217,6 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 	ret = mt7615_mcu_add_dev_info(phy, vif, true);
 	if (ret)
 		goto out;
-
-	mt7615_mac_set_beacon_filter(phy, vif, true);
 out:
 	mt7615_mutex_release(dev);
 
@@ -244,7 +242,6 @@ static void mt7615_remove_interface(struct ieee80211_hw *hw,
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->wcid);
 
-	mt7615_mac_set_beacon_filter(phy, vif, false);
 	mt7615_mcu_add_dev_info(phy, vif, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
@@ -548,6 +545,9 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_ARP_FILTER)
 		mt7615_mcu_update_arp_filter(hw, vif, info);
 
+	if (changed & BSS_CHANGED_ASSOC)
+		mt7615_mac_set_beacon_filter(phy, vif, info->assoc);
+
 	mt7615_mutex_release(dev);
 }
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
