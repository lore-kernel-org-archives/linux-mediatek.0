Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0E606A338
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=utU2B6eN;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=pIbJBTi+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Px5iYRExR1FUkSAwsUCyyip7Mo3PRTQrKEuMvrKDnRo=; b=utU2B6eNUGxN80/En9pHEf8M6B
	W+mTBOykxpWN3PrcyaR+tk8FtSq7o8jkIh6JRwnvB/Xc3oUxcU4WlmCixBas3opl6g1XRhOkn8MNh
	BB4vTNkJ8cqVc+pb1DI8cgPhzRrpNtqiOHEUygkkPpNWfZ2YVQS1u7yZXzOH5WDglOGJRsSYjkWhf
	9zVJuReDG0Mft7bzF0sOxQ87QtAbZXUNvpbS6hPczKv2FxSZHmxA+Jn+UZnacjw9PK3U5+xeEg8ws
	S5FB6ZOO4O8GayRMlhHGlO6+XrEYyzl68dVNlDIu+MRZ+uUbXC/zvudd7vydg7UOQLMFMKF2oAaN3
	uhm7SpJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXDu-00000004ruO-3vss;
	Wed, 04 Nov 2026 09:24:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXDs-00000004rrF-2hIs
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 09:24:01 +0000
X-UUID: 7483a402d83111f1acbe4559397dec65-20261104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Px5iYRExR1FUkSAwsUCyyip7Mo3PRTQrKEuMvrKDnRo=;
	b=pIbJBTi+AD7vk5U1tnuyvpxBDC39gIXu5CT+Dk0BrAT4nGWyFqF8P8A0br5r0Ej1AWXimdogJAm6ZFZh/zMEUfYMJMjVW2f2ZFuqwZpc4rCVya+v13yNLi0ZNdGB1D02GwQVHmzGEriBun/TIUJlvy+MG24Nj9cxe9NsOIpVJas=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:bc6d3498-babc-4d2f-92ac-89f4a185279a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:8b0925da-e88e-4ef1-b702-a0dba11ad564,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7483a402d83111f1acbe4559397dec65-20261104
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 212941981; Wed, 04 Nov 2026 02:23:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Nov 2026 17:23:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Nov 2026 17:23:52 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <James-LY.Huang@mediatek.com>,
	<jb.tsai@mediatek.com>, Jacobs Wu <jacobs.wu@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH 9/9] wifi: mt76: mt7925: send the common scan IEs and size the request
Date: Wed, 4 Nov 2026 17:23:44 +0800
Message-ID: <20261104092344.1932406-9-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261104092344.1932406-1-jb.tsai@mediatek.com>
References: <20261104092344.1932406-1-jb.tsai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_012400_722750_3B372796 
X-CRM114-Status: GOOD (  20.83  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jacobs Wu <jacobs.wu@mediatek.com>

mt7925_mcu_build_scan_ie_tlv() sends the per-band sets of
struct ieee80211_scan_ies but not scan_ies->common_ies. mac80211 puts
only the band capabilities, and the custom IEs that must precede them,
into the per-band sets; every other custom IE of the request, the
vendor specific elements (P2P, WPS, MBO, ...) included, goes to
common_ies. Since commit 9f8f4a51f3c1 ("wifi: mt76: mt7925: fix
incorrect scan probe IE handling for hw_scan") these IEs are missing
from the probe requests.

Send common_ies in a UNI_SCAN_IE TLV without a band: the firmware
appends such a TLV to the probe requests of every band. It keeps up to
MT76_CONNAC_SCAN_IE_LEN bytes of it, which max_scan_ie_len already
guarantees for hw_scan; sched_scan shares the TLV, so give it the same
limit instead of the IEEE80211_MAX_DATA_LEN of the connac devices that
have a sched_scan command of their own. The per-band TLVs keep carrying
the per-band sets; the firmware stores their length in a byte, so a
longer set is left out instead of being truncated.

Size the request for the IEs it carries. hw_scan reserved a fixed
sizeof(struct scan_ie_tlv) + MT76_CONNAC_SCAN_IE_LEN, which the
per-band TLVs of a request can exceed, and sched_scan reserved nothing
beyond the TLV header since struct scan_ie_tlv lost its ies[] array, so
mt76_connac_mcu_add_tlv() put the TLVs past the end of the buffer,
which skb_put() turns into a panic, whenever the kmalloc slack did not
happen to cover them. The builder now checks the tailroom of the skb
instead of a budget of its own.

Fixes: 9f8f4a51f3c1 ("wifi: mt76: mt7925: fix incorrect scan probe IE handling for hw_scan")
Cc: stable@vger.kernel.org
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/init.c  |   5 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 107 ++++++++++++------
 2 files changed, 79 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 8c3049b66a85..05305f4e1db8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -301,6 +301,11 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	if (ret)
 		return ret;
 
+	/* hw_scan and sched_scan share the UNI_SCAN_IE TLV, and the firmware
+	 * keeps at most MT76_CONNAC_SCAN_IE_LEN bytes of IEs for either.
+	 */
+	hw->wiphy->max_sched_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
+
 	hw->wiphy->reg_notifier = mt7925_regd_notifier;
 	dev->mphy.sband_2g.sband.ht_cap.cap |=
 			IEEE80211_HT_CAP_LDPC_CODING |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 24de2ff3a15d..22a6338acaf1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3347,56 +3347,99 @@ int mt7925_mcu_set_dbdc(struct mt76_phy *phy, bool enable)
 }
 EXPORT_SYMBOL_GPL(mt7925_mcu_set_dbdc);
 
+/* Room for a UNI_SCAN_IE TLV carrying ies_len bytes of IEs */
+static u32
+mt7925_mcu_scan_ie_tlv_len(struct mt76_dev *mdev, u32 ies_len)
+{
+	u32 len = sizeof(struct scan_ie_tlv) + ies_len;
+
+	if (is_mt7928(mdev))
+		len = ALIGN(len, 4);
+
+	return len;
+}
+
+/* Room for the UNI_SCAN_IE TLVs of a scan request */
+static u32
+mt7925_mcu_scan_ies_len(struct mt76_dev *mdev,
+			struct ieee80211_scan_ies *scan_ies)
+{
+	enum nl80211_band i;
+	u32 len = 0;
+
+	if (scan_ies->common_ie_len)
+		len += mt7925_mcu_scan_ie_tlv_len(mdev, scan_ies->common_ie_len);
+
+	for (i = 0; i <= NL80211_BAND_6GHZ; i++) {
+		if (i == NL80211_BAND_60GHZ || !scan_ies->len[i])
+			continue;
+
+		len += mt7925_mcu_scan_ie_tlv_len(mdev, scan_ies->len[i]);
+	}
+
+	return len;
+}
+
+static void
+mt7925_mcu_add_scan_ie_tlv(struct mt76_dev *mdev, struct sk_buff *skb,
+			   u8 band, const u8 *ies, u32 ies_len)
+{
+	u32 alloc_len = mt7925_mcu_scan_ie_tlv_len(mdev, ies_len);
+	struct scan_ie_tlv *ie;
+	struct tlv *tlv;
+
+	if (alloc_len > skb_tailroom(skb))
+		return;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_IE, alloc_len);
+	ie = (struct scan_ie_tlv *)tlv;
+
+	memcpy(ie->ies, ies, ies_len);
+	ie->ies_len = cpu_to_le16(ies_len);
+	ie->band = band;
+}
+
 static void
 mt7925_mcu_build_scan_ie_tlv(struct mt76_dev *mdev,
 			     struct sk_buff *skb,
 			     struct ieee80211_scan_ies *scan_ies)
 {
-	u32 max_len = sizeof(struct scan_ie_tlv) + MT76_CONNAC_SCAN_IE_LEN;
-	u32 ies_len, alloc_len;
-	struct scan_ie_tlv *ie;
 	enum nl80211_band i;
-	struct tlv *tlv;
-	const u8 *ies;
+
+	/* The firmware appends a TLV without a band to the probe requests
+	 * of every band: that is where the common IEs of the request go.
+	 */
+	if (scan_ies->common_ie_len)
+		mt7925_mcu_add_scan_ie_tlv(mdev, skb, 0, scan_ies->common_ies,
+					   scan_ies->common_ie_len);
 
 	for (i = 0; i <= NL80211_BAND_6GHZ; i++) {
+		u8 band;
+
 		if (i == NL80211_BAND_60GHZ)
 			continue;
 
-		ies = scan_ies->ies[i];
-		ies_len = scan_ies->len[i];
-
-		if (!ies || !ies_len)
+		if (!scan_ies->ies[i] || !scan_ies->len[i])
 			continue;
 
-		if (is_mt7928(mdev))
-			alloc_len = ALIGN(sizeof(*ie) + ies_len, 4);
-		else
-			alloc_len = sizeof(*ie) + ies_len;
-
-		if (alloc_len > max_len)
-			return;
-
-		tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_IE,
-					      alloc_len);
-		ie = (struct scan_ie_tlv *)tlv;
-
-		memcpy(ie->ies, ies, ies_len);
-		ie->ies_len = cpu_to_le16(ies_len);
+		/* The firmware keeps the length of a per-band set in a byte */
+		if (scan_ies->len[i] > U8_MAX)
+			continue;
 
 		switch (i) {
 		case NL80211_BAND_2GHZ:
-			ie->band = 1;
+			band = 1;
 			break;
 		case NL80211_BAND_6GHZ:
-			ie->band = 3;
+			band = 3;
 			break;
 		default:
-			ie->band = 2;
+			band = 2;
 			break;
 		}
 
-		max_len -= alloc_len;
+		mt7925_mcu_add_scan_ie_tlv(mdev, skb, band, scan_ies->ies[i],
+					   scan_ies->len[i]);
 	}
 }
 
@@ -3415,7 +3458,6 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	struct scan_ssid_tlv *ssid;
 	struct scan_bssid_tlv *bssid;
 	struct scan_chan_info_tlv *chan_info;
-	struct scan_ie_tlv *ie;
 	struct scan_misc_tlv *misc;
 	struct tlv *tlv;
 	int max_len;
@@ -3425,8 +3467,8 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 
 	max_len = sizeof(*hdr) + sizeof(*req) + sizeof(*ssid) +
 		  sizeof(*bssid) * MT7925_RNR_SCAN_MAX_BSSIDS +
-		  sizeof(*chan_info) + sizeof(*misc) + sizeof(*ie) +
-		  MT76_CONNAC_SCAN_IE_LEN;
+		  sizeof(*chan_info) + sizeof(*misc) +
+		  mt7925_mcu_scan_ies_len(mdev, &scan_req->ies);
 
 	skb = mt76_mcu_msg_alloc(mdev, NULL, max_len);
 	if (!skb)
@@ -3546,15 +3588,14 @@ int mt7925_mcu_sched_scan_req(struct mt76_phy *phy,
 	struct scan_sched_req *req;
 	struct scan_ssid_tlv *ssid;
 	struct scan_chan_info_tlv *chan_info;
-	struct scan_ie_tlv *ie;
 	struct scan_sched_ssid_match_sets *match;
 	struct sk_buff *skb;
 	struct tlv *tlv;
 	int i, max_len;
 
 	max_len = sizeof(*hdr) + sizeof(*req) + sizeof(*ssid) +
-		  sizeof(*chan_info) + sizeof(*ie) +
-		  sizeof(*match);
+		  sizeof(*chan_info) + sizeof(*match) +
+		  mt7925_mcu_scan_ies_len(mdev, ies);
 
 	skb = mt76_mcu_msg_alloc(mdev, NULL, max_len);
 	if (!skb)
-- 
2.45.2


