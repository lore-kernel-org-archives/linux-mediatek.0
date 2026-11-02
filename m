Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5919606A329
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UM0iAYMe;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=CmLpgdxd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hy0oPK5x/QkI8yqeUndJIQC9ebEkYHogcz870Uc7RMg=; b=UM0iAYMeilUmVI
	b5OB9y6lM3iDt+b7OkQAEJds7vZKDwtOpwhIsBEUGVgtvelrPU/yW6s6amvDS67reRD2dmIuNYlch
	PEDNi+PYmg2zJwDjJNnFhYNm6FxaeP6VX2zs8hkdjF49C+hyWAK40uZ2cUu+8MUkigXih9yseUevN
	3viLjL80+HYEwzyUXM35EEiWvQgg7PI9/GvEV3d38y+jZQmj6botjgNqOtNFGQYd+qiLcuO0n2Klz
	vE3vaTkSIOim75lGy8lhuy9TYpVo1D8xq4pYUsAQevJJkGAdwU5g9iatSirHt3lGb6rVzu4QJc8e0
	K/oTE66dptqNycliSRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxOJ-000000003p8-2pUn;
	Mon, 02 Nov 2026 19:08:23 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxOG-000000003nE-3l2d
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 19:08:22 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QX/N0pi5EXSkCjh+fydbWA1avkaaXFymjQBf/Df4PlI=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793646496; v=1; x=1794251296;
 b=CmLpgdxdVfvDfgxKM+mCR0S61bi0YtF2di81In1Q4JViL42ak59/J1YS4FVMJaNNPQjbTCXS
 1GcN5oWgtL4BXQpgNhfq+EgwBnmzuhxJZaOGuEoTwqJRT2EjFsczy21uEw9SWmXsf7Y6v6WFL/G
 9AKQnqk3RY//9RAFMmRz/z9u7thqSCbuDZVf0SyJ0b159nflizlhBYo8RLB5xjEBfTdeu8VMIAx
 WTumwQNi/z9PzTJKuZq3InDrmhUYfXkXyl9wUo/ndaxkHDLzIzlMwWFuuD2mt7KmfsCAVkLE380
 uuZiLMBI1O/X0oAlQLfsI473Ttz6GulORMzwaTTDH/3qQ==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 37af8cb3d0c59ae7;
	Mon, 02 Nov 2026 19:08:16 +0000
X-Mizu-Trace-ID: 37af8cb3d0c59ae7
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Sven Besser <sven.besser@sql-ag.de>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: mt7925: add the common scan IEs back to probe requests
Date: Mon,  2 Nov 2026 12:08:11 -0700
Message-ID: <20261102190811.7498-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <FRVP281MB5672AE5BBD61EF0802D42370A0942@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM>
References: <FRVP281MB5672AE5BBD61EF0802D42370A0942@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_110821_281595_4EE5031C 
X-CRM114-Status: GOOD (  12.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wi-Fi Direct search can no longer find devices in Listen state, such as
Miracast sinks. The probe requests lack the P2P IE, which mac80211 puts
in the common IEs, and only the per-band IEs are sent to the firmware.

Add the common IEs to each band of a normal scan, as long as the band
still fits in one byte of length: the firmware ignores the high byte.
Leave scheduled scans alone, since the firmware can time out on them
when their IEs grow.

Fixes: 9f8f4a51f3c1 ("wifi: mt76: mt7925: fix incorrect scan probe IE handling for hw_scan")
Reported-by: Sven Besser <sven.besser@sql-ag.de>
Closes: https://lore.kernel.org/linux-wireless/FRVP281MB5672AE5BBD61EF0802D42370A0942@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM/
Suggested-by: Sven Besser <sven.besser@sql-ag.de>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Tested with wpa_supplicant: one radio searching, a peer listening on
channel 6, and a third radio capturing the search probes.

                                probes with    peer
                                the P2P IE     found
  MT7925U, wireless-next        0 of 162       no
    with this patch             98 of 98       yes
    9f8f4a51f3c1 reverted       19 of 19       yes
  MT7927, 7.3.1, out-of-tree    0 of 231       no
    with this patch             228 of 228     yes

A Miracast-style search, with a Wi-Fi Display subelement and the longest
allowed device name, stays under the limit and finds the peer on both.
Without the two limits, longer probes went out cut short and scheduled
scans sometimes reset the chip. Plain scans and joins are unchanged. Not
tested on mt7928.

Sven, thanks for tracking this down.

 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 50f5f57b740e..b614653debd1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3259,10 +3259,10 @@ EXPORT_SYMBOL_GPL(mt7925_mcu_set_dbdc);
 static void
 mt7925_mcu_build_scan_ie_tlv(struct mt76_dev *mdev,
 			     struct sk_buff *skb,
-			     struct ieee80211_scan_ies *scan_ies)
+			     struct ieee80211_scan_ies *scan_ies, bool common)
 {
 	u32 max_len = sizeof(struct scan_ie_tlv) + MT76_CONNAC_SCAN_IE_LEN;
-	u32 ies_len, alloc_len;
+	u32 ies_len, common_len, alloc_len;
 	struct scan_ie_tlv *ie;
 	enum nl80211_band i;
 	struct tlv *tlv;
@@ -3278,6 +3278,15 @@ mt7925_mcu_build_scan_ie_tlv(struct mt76_dev *mdev,
 		if (!ies || !ies_len)
 			continue;
 
+		/* The vendor IEs (P2P, WPS, WFD, ...) are in common_ies. The
+		 * firmware keeps only the low byte of a band's IE length, so
+		 * add them only where the band stays within 255 bytes.
+		 */
+		common_len = 0;
+		if (common && ies_len + scan_ies->common_ie_len <= U8_MAX)
+			common_len = scan_ies->common_ie_len;
+		ies_len += common_len;
+
 		if (is_mt7928(mdev))
 			alloc_len = ALIGN(sizeof(*ie) + ies_len, 4);
 		else
@@ -3290,7 +3299,9 @@ mt7925_mcu_build_scan_ie_tlv(struct mt76_dev *mdev,
 					      alloc_len);
 		ie = (struct scan_ie_tlv *)tlv;
 
-		memcpy(ie->ies, ies, ies_len);
+		memcpy(ie->ies, ies, ies_len - common_len);
+		memcpy(ie->ies + ies_len - common_len, scan_ies->common_ies,
+		       common_len);
 		ie->ies_len = cpu_to_le16(ies_len);
 
 		switch (i) {
@@ -3428,7 +3439,7 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	}
 
 	/* Append scan probe IEs as the last tlv */
-	mt7925_mcu_build_scan_ie_tlv(mdev, skb, &scan_req->ies);
+	mt7925_mcu_build_scan_ie_tlv(mdev, skb, &scan_req->ies, true);
 
 	err = mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(SCAN_REQ),
 				    true);
@@ -3530,8 +3541,10 @@ int mt7925_mcu_sched_scan_req(struct mt76_phy *phy,
 	}
 	chan_info->channel_type = sreq->n_channels ? 4 : 0;
 
-	/* Append scan probe IEs as the last tlv */
-	mt7925_mcu_build_scan_ie_tlv(mdev, skb, ies);
+	/* Append scan probe IEs as the last tlv. A scheduled scan keeps the
+	 * band IEs alone: the firmware stops answering it with more.
+	 */
+	mt7925_mcu_build_scan_ie_tlv(mdev, skb, ies, false);
 
 	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(SCAN_REQ),
 				     true);
-- 
2.56.0


