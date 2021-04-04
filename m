Return-Path: <SRS0=JQRm=JB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347F3C433B4
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Apr 2021 07:59:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAB06137B
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Apr 2021 07:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDAB06137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=45I9u291XR9gCdAIQJ4C5WriHQ8CaRRZaWx/Zj2vXqA=; b=dkKGW0GhljwUwVFObjjMYeh8c
	7OtxZACSYMMIS74JEZwFcw75mqWoDBFCag+EnBBAStOpVtvLxFrQqxaCZjmUR6bdsgMr2XETj3aF8
	CPa1hHF0B4GvG+0pFypu57WOynqlqSpduLpm4tsijFFFzefOh3UotgJ9grw52rlgsF0wTv3NaJRcG
	0YrxtU1j6KmvfpAXTlpWaj0Zceq3WNI/ilm8u9SZw3bfGFB/0vZF0mY8dg3L/DVVnLoblwRA34Xlx
	wiGTE1u/hprdVNchdD6dlkChrn3QWRJzPhlZBfhNcEXTXeDp5EO29aB8HLhNVU1dsmKPY8ISiC8S+
	Gn5d4uyAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSxem-00FXOZ-6j; Sun, 04 Apr 2021 07:58:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSxeg-00FXNG-E7
 for linux-mediatek@lists.infradead.org; Sun, 04 Apr 2021 07:58:49 +0000
X-UUID: 316d3593eea04598893a2744499cca0a-20210404
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tJaskgiHVZT6qDIi3RSVNxiYZMZGWC42ByfLlmAkf4E=; 
 b=Qx93qhlGq+CjQkweORDIwsV2GWvOoaRGLh2D2hrBngNFi8PAJLS4FIlM5LN7OvndeC4gtFfTKRoT0WE6fKq37k7KIBV6U7Qq76fPDiIP2OVskUUvVf+/ZXCSkQWfafV8f5wWPVCQlAlFMsMCVrjEFaHCDE6tv02GMZKf3PNSlSk=;
X-UUID: 316d3593eea04598893a2744499cca0a-20210404
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 470530679; Sun, 04 Apr 2021 00:58:36 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Apr 2021 00:48:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Apr 2021 15:48:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 4 Apr 2021 15:48:31 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7915: fix mt7915_mcu_add_beacon
Date: Sun, 4 Apr 2021 15:48:24 +0800
Message-ID: <c55cfe46b687902fccef4c5428b516614ca16645.1617522253.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <e4f7df8a29d59656cff1c24dce0c2b695436e9f9.1617522253.git.ryder.lee@mediatek.com>
References: <e4f7df8a29d59656cff1c24dce0c2b695436e9f9.1617522253.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5D5E0432BA407BD1CD2D454D980094F6B26B7C043BB9E18AF3E8580CFB86F1482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210404_085847_731374_E88C23D4 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

ieee80211_beacon_get_template() returns NULL when beacon state is disabled.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 2d2bae93133b..d2e5306b153c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2451,6 +2451,17 @@ int mt7915_mcu_add_beacon(struct ieee80211_hw *hw,
 	struct bss_info_bcn *bcn;
 	int len = MT7915_BEACON_UPDATE_SIZE + MAX_BEACON_SIZE;
 
+	rskb = mt7915_mcu_alloc_sta_req(dev, mvif, NULL, len);
+	if (IS_ERR(rskb))
+		return PTR_ERR(rskb);
+
+	tlv = mt7915_mcu_add_tlv(rskb, BSS_INFO_OFFLOAD, sizeof(*bcn));
+	bcn = (struct bss_info_bcn *)tlv;
+	bcn->enable = en;
+
+	if (!en)
+		goto out;
+
 	skb = ieee80211_beacon_get_template(hw, vif, &offs);
 	if (!skb)
 		return -EINVAL;
@@ -2461,16 +2472,6 @@ int mt7915_mcu_add_beacon(struct ieee80211_hw *hw,
 		return -EINVAL;
 	}
 
-	rskb = mt7915_mcu_alloc_sta_req(dev, mvif, NULL, len);
-	if (IS_ERR(rskb)) {
-		dev_kfree_skb(skb);
-		return PTR_ERR(rskb);
-	}
-
-	tlv = mt7915_mcu_add_tlv(rskb, BSS_INFO_OFFLOAD, sizeof(*bcn));
-	bcn = (struct bss_info_bcn *)tlv;
-	bcn->enable = en;
-
 	if (mvif->band_idx) {
 		info = IEEE80211_SKB_CB(skb);
 		info->hw_queue |= MT_TX_HW_QUEUE_EXT_PHY;
@@ -2481,6 +2482,7 @@ int mt7915_mcu_add_beacon(struct ieee80211_hw *hw,
 	mt7915_mcu_beacon_cont(dev, rskb, skb, bcn, &offs);
 	dev_kfree_skb(skb);
 
+out:
 	return mt76_mcu_skb_send_msg(&phy->dev->mt76, rskb,
 				     MCU_EXT_CMD(BSS_INFO_UPDATE), true);
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
