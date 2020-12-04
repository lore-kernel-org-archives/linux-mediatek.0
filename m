Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6E9C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:37:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D87225AC
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84D87225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A3w+WAlfvF2+zFO23SPZZ3MU7nEHRTjtP4spJKh+aSU=; b=KOWpamCtYNZmLwHEQrM0Xi3bW
	OLCLdORy2m9gmYFMK+7HH6PEDAlRvC5dY0LVydsveUFTRGgZ//RCZqIcQQKCJo71NGOlOBdgu7xFR
	p0mP9Se9GhqfEruAQy+mLZCSt00mC3x8Se3lCuN66Qj7pJF6xkEoF7BcVXkVTjVCHCQD+s5cZub8Y
	/YqsLoUsW9Nl4sxxAxbdBAjG7JFjvKcsKkWr3uXMn/X/VPsNz8kXeGIZ6dUZo4Xy6SVEScKb6kiIh
	ZR8Tazu3XFQenGQ7OmBGtfOMboMDxPN0q1RYvRTR+LBcXia/Catq9JOFPUZZ1bR/EL+H2GpqVinsn
	LIHcJsQ1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7Wq-0007Oc-ER; Fri, 04 Dec 2020 09:37:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7Wn-0007NP-Jx
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 09:37:26 +0000
X-UUID: 3aa33bb6fe39406289f54a70c0f0002d-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8Yhx4Y/y+S4GWzq2shgf8MgUPZawfj1nLGFOUKrmsnM=; 
 b=KeQhsrUQhXTivyQ0bxBLVfxp6IeNwyb/cq4QdqDRx6kefwX6FpNCHVSVv2DU5uW0BqyiBTp+kw1ljbsaGSmjDcKKbhFwimumrZawzo/9nP8gfjysZbbY6mC4UQHQqGr3qjsywQ7aLWyZerZu1nOvHgvMUjCad+IqFnpYveUkHlk=;
X-UUID: 3aa33bb6fe39406289f54a70c0f0002d-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 944836385; Fri, 04 Dec 2020 01:37:11 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 01:37:19 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 17:37:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Dec 2020 17:37:17 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 3/5] mt76: testmode: move mtd part to mt76_dev
Date: Fri, 4 Dec 2020 17:36:57 +0800
Message-ID: <20201204093659.20384-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201204093659.20384-1-shayne.chen@mediatek.com>
References: <20201204093659.20384-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A00DEBCF65E99FBD6D07904414DF9A35D5ED59FC22E894ED589AD254CB8769712000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_043725_795882_071A972F 
X-CRM114-Status: GOOD (  11.60  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move testmode mtd variables to mt76_dev, since they are the same on
each phy.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c   | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt76.h     | 7 ++++---
 drivers/net/wireless/mediatek/mt76/testmode.c | 6 +++---
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index ffc9d547f4fe..665b54c5c8ae 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -75,8 +75,8 @@ mt76_get_of_eeprom(struct mt76_dev *dev, int len)
 	}
 
 #ifdef CONFIG_NL80211_TESTMODE
-	dev->phy.test.mtd_name = devm_kstrdup(dev->dev, part, GFP_KERNEL);
-	dev->phy.test.mtd_offset = offset;
+	dev->test_mtd.name = devm_kstrdup(dev->dev, part, GFP_KERNEL);
+	dev->test_mtd.offset = offset;
 #endif
 
 out_put_node:
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8752890fc61e..367bbc9b40a9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -543,9 +543,6 @@ struct mt76_testmode_data {
 	u8 tx_power[4];
 	u8 tx_power_control;
 
-	const char *mtd_name;
-	u32 mtd_offset;
-
 	u32 tx_pending;
 	u32 tx_queued;
 	u32 tx_done;
@@ -663,6 +660,10 @@ struct mt76_dev {
 
 #ifdef CONFIG_NL80211_TESTMODE
 	const struct mt76_testmode_ops *test_ops;
+	struct {
+		const char *name;
+		u32 offset;
+	} test_mtd;
 #endif
 	struct workqueue_struct *wq;
 
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index 184964b9bd42..8b14620e16fc 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -482,9 +482,9 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
 	if (nla_put_u32(msg, MT76_TM_ATTR_STATE, td->state))
 		goto out;
 
-	if (td->mtd_name &&
-	    (nla_put_string(msg, MT76_TM_ATTR_MTD_PART, td->mtd_name) ||
-	     nla_put_u32(msg, MT76_TM_ATTR_MTD_OFFSET, td->mtd_offset)))
+	if (dev->test_mtd.name &&
+	    (nla_put_string(msg, MT76_TM_ATTR_MTD_PART, dev->test_mtd.name) ||
+	     nla_put_u32(msg, MT76_TM_ATTR_MTD_OFFSET, dev->test_mtd.offset)))
 		goto out;
 
 	if (nla_put_u32(msg, MT76_TM_ATTR_TX_COUNT, td->tx_count) ||
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
