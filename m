Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9F3C61DC6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o1iJVpXPxN5M1wi8b5iaikX8HD4mwaKe/+SrOg4ReAA=; b=gkSgnqiHvU/p/2IBJy0YJsxBN4
	O0HCscB1upiu3zJUudD7W0RAvE2LGhXKm27h1WjsMZcPSvCmyKDJujTl3K5IvBtUXRuWjsUPhULvq
	Vvv/DOf+LyJrfzFeSGAida+todlsOwx5I06g9HV8Kl423ElgKVV2SH2htBeiMKYLhMZ48NEkhGFJA
	aNU0b4ammKpHwM9uS+tsGKNarDRCEZHoR8W8ACXM0LWjS+IwyyPc+je/kahHzJNjywAFECX0awjUI
	Tntl7pX5z4T3e9dEJ5KXvRN2m12qs3LRZRAVcSZjz+8w4eN++fdQBAPOPsWCty8xnUAlDP7VBYG60
	gs6NVkSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzrqG-00000005Jp3-3GBe;
	Fri, 28 Aug 2026 08:21:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzrqE-00000005JoD-36DB
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 08:21:39 +0000
X-UUID: 78fec122a2b911f1acbe4559397dec65-20260828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=o1iJVpXPxN5M1wi8b5iaikX8HD4mwaKe/+SrOg4ReAA=;
	b=KNSDsCOq/9uB4Y/PFmycVLkWmauvt0UDYOxVxxttNvx+KnyYQqexlX/KAu7ihLKur5obqQXSeNs2SgHr89LeSJ4XqMubEB5/4C4x8IvTwVcSV6XeyMQ0AN94WLS37bRSRvAv2+0eHKxAsmWK+gCDfv8um4LOhO8U2FVj53refl8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d55ba47e-6f2f-4cb5-ad5c-48fe887ab839,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:7af43723-5869-48e3-bf78-b0f483615649,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 78fec122a2b911f1acbe4559397dec65-20260828
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1999568125; Fri, 28 Aug 2026 01:21:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Aug 2026 16:21:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 28 Aug 2026 16:21:28 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: connac2: fill TXD spe_idx for connac2 fixed-rate frames
Date: Fri, 28 Aug 2026 16:21:27 +0800
Message-ID: <20260828082127.2226819-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_012138_800129_8501FDCC 
X-CRM114-Status: GOOD (  14.69  )
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

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

On connac2 chipsets - MT7920, MT7921 and MT7922 - the spe_idx of
fixed-rate frames was never programmed, so every management frame -
auth and assoc req included - went out 1SS 1T on WF0 instead of 1SS 2T
duplicate, giving up ~3dB of array gain during connection setup, which
is exactly when the link budget is worst.

mt76_connac2_mac_write_txwi() takes the MT_TXD2_FIX_RATE path for any
non-data frame, but the block filling MT_TXD7_SPE_IDX was guarded by
!is_connac2(), leaving the field at 0. As spe_idx 0 also encodes "WF0"
the hardware happily transmitted on a single path. Drop the guard so
connac2 fills the index like the other generations do.

Do not set MT_TXD6_SPE_ID_IDX along with it: on connac2 that bit points
the hardware at the WTBL instead of the TXD, and the WTBL spe_idx is
still 0 while connecting, so setting it puts the frames back on WF0.
This matches connac3, where SPE_IXD_SELECT_TXD is 0 and
SPE_IXD_SELECT_BMC_WTBL is 1, and is the opposite of what the falcon
firmware macro name HAL_MAC_TX_DESC_SET_FR_SPE_IDX_SPE_BY_TXD suggests.

Guard the duplicate fallback with hweight8() as well: ant_to_spe[] maps
a single-antenna mask to 0 too, so without the check a user asking for
one antenna would still get spe_idx 24 and duplicate onto both paths.

Verified on MT7922: TXD DW7 spe_idx now reads 0x18 and the in-chip
sniffer reports spe_idx 0x18 in the TXV of auth and assoc req, where it
previously reported 0x0. MT7920 and MT7921 share the same connac2 TXD
path and are fixed by the same change.

Fixes: 00dd59264dcb ("wifi: mt76: connac: use is_connac2() to replace is_mt7921() checks")

CR-Id: BORA00085543
Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mac.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index de38ba9a4a26..9b40bac2b036 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -600,6 +600,7 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 							vif ? &vif->bss_conf : NULL,
 							beacon, multicast);
 		u32 val = MT_TXD6_FIXED_BW;
+		u8 spe_idx = mt76_connac_spe_idx(mphy->antenna_mask);
 
 		/* hardware won't add HTC for mgmt/ctrl frame */
 		txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
@@ -608,13 +609,18 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		txwi[6] |= cpu_to_le32(val);
 		txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
 
-		if (!is_connac2(dev)) {
-			u8 spe_idx = mt76_connac_spe_idx(mphy->antenna_mask);
-
-			if (!spe_idx)
-				spe_idx = 24 + phy_idx;
-			txwi[7] |= cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX, spe_idx));
-		}
+		/* Fixed-rate frames (all mgmt, so auth/assoc req too) otherwise
+		 * carry spe_idx 0 and TX 1SS 1T on WF0. Fill spe_idx like the
+		 * other connac generations do, but do NOT touch
+		 * MT_TXD6_SPE_ID_IDX: on connac2 setting it points HW at the
+		 * WTBL and the index below is ignored.
+		 *
+		 * spe_idx 0 is also a valid single-path index (WF0), so only
+		 * take the duplicate fallback when a second path exists.
+		 */
+		if (!spe_idx && hweight8(mphy->antenna_mask) > 1)
+			spe_idx = 24 + phy_idx;
+		txwi[7] |= cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX, spe_idx));
 
 		txwi[7] &= ~cpu_to_le32(MT_TXD7_HW_AMSDU);
 	}
-- 
2.18.0


