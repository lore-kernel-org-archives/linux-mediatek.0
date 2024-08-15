Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905D5C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Aug 2024 18:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N2Qk6+fU6towvw0U+ECeBdrR9Vdrp60oSs3v3lchhlo=; b=lVWr4v4DYLK+49e7nYHZGcbf7D
	Ahh7zQc9Q6En68CSWiBsAwTKWtJf8TnrO+EjZBz28+6GrmtRsaqEVWWdhfM/BP1LOe6Z68welm09M
	28Kzq/1ChYv50MtfA5wTGoyg+k5R76+ndyhXrmneJOtF/zJ5KqWf0bU+31HlsbgAaKdcRdvlrjD8N
	sCgmI5cmmQCyniWLtheS7ink9fg9JJ3OA3lwJlssCzDkbJBvqpwVfu/t+SWFz3FhRHq55N3WqLtFM
	I0+NzwzvS5Lx9NILcK6p4jiUFULWGzIXqNM03opjspGEaOFxRsG1O0JpfX2LjMyzwH//o4Jo4cyvU
	PG2o/GCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sefLc-0000000AnLM-1vGF;
	Thu, 15 Aug 2024 18:37:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sefKy-0000000AnH2-0NuC;
	Thu, 15 Aug 2024 18:36:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10E8DCE1DAB;
	Thu, 15 Aug 2024 18:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3ABC32786;
	Thu, 15 Aug 2024 18:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723746997;
	bh=+jqHWnrAC2O9xkqoGcAs5UI8rRiAGafwD+uBErFpfQc=;
	h=Date:From:To:Cc:Subject:From;
	b=n79Jc737FXakegcozT8/VHwb/i3TUEX58hqd7ItVtzRsD2mnRK4HaUZEKTK4VQ3pS
	 /EYAAvNx9pUUG+pA8/O0HvYj8tDySrit+h16/ODNTRDLZqBgLY9scaEf0u3NET7o9F
	 lIEnsgwC/D4f3ZVIl/eHqzW8+bvrYcXvfwvPea/wbm1qyiqKCTb/tFEN0HBLohjM4Y
	 U8T7PAoXAIycnEFYyA1ws+pc4xEZosU2G7bOpMvArlObtZzbIMnXPynZ6cnYxTCZFj
	 MKrxy/78xynyXAMY94MyPa9wwgrFFiruuHA9fd9lzeYTJz53917DP9FQH2LAoQKvJI
	 hLlzeMQ04+RwA==
Date: Thu, 15 Aug 2024 12:36:33 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: Avoid multiple
 -Wflex-array-member-not-at-end warnings
Message-ID: <Zr5KsZugaEXrApQJ@elsanto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_113640_507277_4E48CD34 
X-CRM114-Status: GOOD (  14.13  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

So, in order to avoid ending up with a flexible-array member in the
middle of multiple other structs, we use the `struct_group_tagged()`
helper to create a new tagged `struct mt76_connac2_mcu_rxd_hdr`.
This structure groups together all the members of the flexible
`struct mt76_connac2_mcu_rxd` except the flexible array.

As a result, the array is effectively separated from the rest of the
members without modifying the memory layout of the flexible structure.
We then change the type of the middle struct members currently causing
trouble from `struct mt76_connac2_mcu_rxd` to `struct
mt76_connac2_mcu_rxd_hdr`.

We also want to ensure that when new members need to be added to the
flexible structure, they are always included within the newly created
tagged struct. For this, we use `static_assert()`. This ensures that the
memory layout for both the flexible structure and the new tagged struct
is the same after any changes.

This approach avoids having to implement `struct mt76_connac2_mcu_rxd_hdr`
as a completely separate structure, thus preventing having to maintain
two independent but basically identical structures, closing the door
to potential bugs in the future.

So, with these changes, fix the following warnings:

drivers/net/wireless/mediatek/mt76/mt7915/mcu.h:32:37: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/net/wireless/mediatek/mt76/mt7915/mcu.h:40:37: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/net/wireless/mediatek/mt76/mt7915/mcu.h:49:37: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/net/wireless/mediatek/mt76/mt7915/mcu.h:58:37: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 25 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  8 +++---
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 4242d436de26..16689aefa227 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -115,21 +115,26 @@ struct mt76_connac2_mcu_uni_txd {
 } __packed __aligned(4);
 
 struct mt76_connac2_mcu_rxd {
-	__le32 rxd[6];
+	/* New members MUST be added within the struct_group() macro below. */
+	struct_group_tagged(mt76_connac2_mcu_rxd_hdr, hdr,
+		__le32 rxd[6];
 
-	__le16 len;
-	__le16 pkt_type_id;
+		__le16 len;
+		__le16 pkt_type_id;
 
-	u8 eid;
-	u8 seq;
-	u8 option;
-	u8 rsv;
-	u8 ext_eid;
-	u8 rsv1[2];
-	u8 s2d_index;
+		u8 eid;
+		u8 seq;
+		u8 option;
+		u8 rsv;
+		u8 ext_eid;
+		u8 rsv1[2];
+		u8 s2d_index;
+	);
 
 	u8 tlv[];
 };
+static_assert(offsetof(struct mt76_connac2_mcu_rxd, tlv) == sizeof(struct mt76_connac2_mcu_rxd_hdr),
+	      "struct member likely outside of struct_group_tagged()");
 
 struct mt76_connac2_patch_hdr {
 	char build_date[16];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index b41ac4aaced7..49476a4182fd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -29,7 +29,7 @@ struct mt7915_mcu_thermal_ctrl {
 } __packed;
 
 struct mt7915_mcu_thermal_notify {
-	struct mt76_connac2_mcu_rxd rxd;
+	struct mt76_connac2_mcu_rxd_hdr rxd;
 
 	struct mt7915_mcu_thermal_ctrl ctrl;
 	__le32 temperature;
@@ -37,7 +37,7 @@ struct mt7915_mcu_thermal_notify {
 } __packed;
 
 struct mt7915_mcu_csa_notify {
-	struct mt76_connac2_mcu_rxd rxd;
+	struct mt76_connac2_mcu_rxd_hdr rxd;
 
 	u8 omac_idx;
 	u8 csa_count;
@@ -46,7 +46,7 @@ struct mt7915_mcu_csa_notify {
 } __packed;
 
 struct mt7915_mcu_bcc_notify {
-	struct mt76_connac2_mcu_rxd rxd;
+	struct mt76_connac2_mcu_rxd_hdr rxd;
 
 	u8 band_idx;
 	u8 omac_idx;
@@ -55,7 +55,7 @@ struct mt7915_mcu_bcc_notify {
 } __packed;
 
 struct mt7915_mcu_rdd_report {
-	struct mt76_connac2_mcu_rxd rxd;
+	struct mt76_connac2_mcu_rxd_hdr rxd;
 
 	u8 band_idx;
 	u8 long_detected;
-- 
2.34.1


