Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16745C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 18:36:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A121D22AAB
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 18:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A121D22AAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5x3zQqPSDLmXwCUQz0A4QC9sUyP91Hui5kwBxyymeIg=; b=LuV0MYkG6swZ8+m1/0HNVri1bF
	2fQoM8MB6qYYHMxp3k0zwUgZLYFaGs7bQ/GCrcSNwHjWqugTBV0bOznRE+KEuYXg3SamEFr5TUi76
	jSSm8UtabQllVhiQOp6kTG3qfulyazUbhk7yChKHITZ5YwNYBxDc3KWrAEZQkzuDBS3owhc0EYjoo
	iN2IZ5AegeW9B8EYx+mDEyXVI57ahFj6Hg76PbVMhcGhnFLrPs9RnlqvB61GPbuyUY1i6HucZB68U
	InqeDe/YT1+FOlklpFQcst0ZIKUrzWu1m5doujyu3C4hvvwGjF/DH468yFY0v4YM3VEes88nhPm3U
	+A+h0K1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klFwb-0002rV-V4; Fri, 04 Dec 2020 18:36:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klFwY-0002qP-C2
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 18:36:36 +0000
X-UUID: 6d586d7b1ec643729336c1667d7519ef-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8khkkSPrRWeqkaH2nDJc/uB7dHivC8+bOeYRdgsbBjM=; 
 b=d4XZjJHS+cFV3PogfjTEHYs5ZOvPFvSRm51zs7eF/d8GCaO/Zw3xQB69dy3hB9XuIt6tDpCjF8aPjMfZOiZwgR49kXwTT3H2VU8NZl1T6MvQ2luFvCAq7SEPVOALjZdD8BMePRxZL47N1ghS3EAaQJLQBircamveqEmDe5x7Pt0=;
X-UUID: 6d586d7b1ec643729336c1667d7519ef-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1825843515; Fri, 04 Dec 2020 10:36:56 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 10:36:22 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 02:36:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Dec 2020 02:36:21 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/2] mt76: mt7915: add vif check in mt7915_update_vif_beacon()
Date: Sat, 5 Dec 2020 02:36:21 +0800
Message-ID: <6f63bc0fbba35c3005a9d6999104f41174466cb6.1607104742.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_133635_154247_E8DC3707 
X-CRM114-Status: UNSURE (   8.88  )
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

[ 4522.024382]  ieee80211_tx_dequeue+0x1258/0x1298 [mac80211]
[ 4522.029868]  ieee80211_beacon_get_template+0x10/0x18 [mac80211]
[ 4522.035780]  mt7915_mcu_add_beacon+0x2c/0x208 [mt7915e]
[ 4522.040997]  mt7915_mcu_get_rx_rate+0x304/0x878 [mt7915e]
[ 4522.046394]  ieee80211_delayed_tailroom_dec+0x158/0x180 [mac80211]
[ 4522.052573]  ieee80211_iterate_interfaces+0x48/0x68 [mac80211]
[ 4522.058398]  mt7915_mac_reset_work+0x3b4/0x630 [mt7915e]
[ 4522.063704]  process_one_work+0x1fc/0x390
[ 4522.067703]  worker_thread+0x48/0x4d0
[ 4522.071356]  kthread+0x120/0x128

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index a7fa6fffffff..98f80e77ad7b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1407,7 +1407,13 @@ mt7915_update_vif_beacon(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct ieee80211_hw *hw = priv;
 
-	mt7915_mcu_add_beacon(hw, vif, vif->bss_conf.enable_beacon);
+	switch (vif->type) {
+	case NL80211_IFTYPE_MESH_POINT:
+	case NL80211_IFTYPE_ADHOC:
+	case NL80211_IFTYPE_AP:
+		mt7915_mcu_add_beacon(hw, vif, vif->bss_conf.enable_beacon);
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
