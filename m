Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C86AC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 23:37:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EDCA22B4E
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 23:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EDCA22B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J8kuzH8fhFCFppQA63AFhIT8xVQ431wHIhWUoXn7bg8=; b=NMiI3m74L7bjdzhKFFS6jEv5YE
	aiVdzzMV2EGA40CMSyFT9E/nXA2Dtr4g7jaYbirFuGGovCuYkBjraM6Hvc+6z4VI+hKHzGbpAYCqD
	Eenkg82IcCYz1JIL+YUV9ufKJv+vbjg/cfmdapCzZImqjczouVqNrlxU6vCDRUMdD08rWWDAAo6UO
	2hLRTrTh9img6V2BSBEp1LGRmQu29UYfAc8LowIJE9GUxp59cVV3M4/77THliEjkZGTvKlm6X5JCi
	6R9mPVhvKt6HtLbGZifLDRJ/d7WaVw8bczc6CaBQoY3XhVYgzjTEPYJKhP8iqS5/d+iqs7BEMeEZK
	yzEwlyuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klKdn-00066P-HA; Fri, 04 Dec 2020 23:37:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klKdk-000662-14
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 23:37:30 +0000
X-UUID: ed12925666b940fd96c4e8be8dedaf4b-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AqpA6dcWGIYvOKn4gxn5v/65GZ7hmmUhr/9j977MxRE=; 
 b=sfg3pkEpRTLVmcZfGs0H3sWOUhRMDp8Q2+VC6TRPb26huW5JV+VOwK+HQ04BcZHiVNiDuwXo+nzXsT7lsWhK9STStjBZTY4kXZW21QQjBg6LqPgFHmuG7kZ2FLTSJ0smmTtta9wBC7p4HohvS3RVIfr5mrkVGuIOU7mkTklFqwc=;
X-UUID: ed12925666b940fd96c4e8be8dedaf4b-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1788959836; Fri, 04 Dec 2020 15:37:25 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 15:37:21 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 07:37:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Dec 2020 07:37:16 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 1/2] mt76: mt7915: add vif check in
 mt7915_update_vif_beacon()
Date: Sat, 5 Dec 2020 07:37:14 +0800
Message-ID: <65336148b5d440dceb967a401488b119e14b9c5a.1607124652.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_183728_318552_DB68C39A 
X-CRM114-Status: UNSURE (   9.09  )
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

To avoid the warn_on() calltrace in station mode.

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
change since v2: add default:
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index a7fa6fffffff..7f08c88d3282 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1407,7 +1407,15 @@ mt7915_update_vif_beacon(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct ieee80211_hw *hw = priv;
 
-	mt7915_mcu_add_beacon(hw, vif, vif->bss_conf.enable_beacon);
+	switch (vif->type) {
+	case NL80211_IFTYPE_MESH_POINT:
+	case NL80211_IFTYPE_ADHOC:
+	case NL80211_IFTYPE_AP:
+		mt7915_mcu_add_beacon(hw, vif, vif->bss_conf.enable_beacon);
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
