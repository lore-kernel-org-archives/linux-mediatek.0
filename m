Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13688C87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6QNjyRecp3DvGgfxenrROB8gOL013ZM4COXNtJ51lo=; b=y2vuhPGMnZMSr0ZaR7KjHKBtiO
	BiKHPD21dquIezO2tiJU4MHconyt2KcPW3SzTRm/oTX+AGUFjbkTdyHtHIKrDDk95XNqxTj9CsrUo
	nFGgEHE576ibQqSd4FHF7w/QAYQWlKI+I+AA1H5fA6y+IBTr+zwVcPCmqkWeGvaozP5nFE8PNrWVV
	1nOD87brK8ltKodMoow0opvOhZsTrt1CQk9lnfPjRSa23B05GtCf4xDfmoU+hmZMOGACM5ew+5bMn
	Pi2KMWiAjGAh4tyw9Dd6kcg0x8e0EVpYvJUPMFvoXQL691QvSiATak9wXTSy+0HUgCwlp0Qxu+5DM
	5xx5yjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjk-0000000BK2N-2jEb;
	Tue, 12 Aug 2025 16:20:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmzv-0000000AaiV-1wwT
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 11:16:56 +0000
X-UUID: d58d8734776d11f09f706fa2197c6ceb-20250812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=x6QNjyRecp3DvGgfxenrROB8gOL013ZM4COXNtJ51lo=;
	b=fakagthIp6/URmEYHj0WNGADElVRbsXojjwiRl8LFeZ8EeRDJkmPWPYHMs83ptXVSUYI71Genbi7NF9XHnnerb5zlIc/Ct/1v3Imbs+Cl9xjlYn07IvownUnbx9ds+RRuTQuG7COOr8Urz4JpYJb1c8DTuWvSYDZ+COrVrm+/pE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:8a42918b-2873-4f56-a36d-5dc3bd1eceb6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:423059a1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d58d8734776d11f09f706fa2197c6ceb-20250812
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1583443630; Tue, 12 Aug 2025 04:16:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 12 Aug 2025 19:16:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 12 Aug 2025 19:16:43 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: add MBSSID support
Date: Tue, 12 Aug 2025 19:16:42 +0800
Message-ID: <20250812111642.3620845-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_041655_511476_28348F4C 
X-CRM114-Status: GOOD (  11.78  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Enable MBSSID support for MT7921 by setting the
appropriate capability to the firmware.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 25 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  5 ++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index b5897bc38d2c..9e03185ce6e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1662,6 +1662,31 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 			return err;
 	}
 
+	if (enable && vif->bss_conf.bssid_indicator) {
+		struct {
+			struct {
+				u8 bss_idx;
+				u8 pad[3];
+			} __packed hdr;
+			struct bss_info_uni_mbssid mbssid;
+		} mbssid_req = {
+			.hdr = {
+				.bss_idx = mvif->idx,
+			},
+			.mbssid = {
+				.tag = cpu_to_le16(UNI_BSS_INFO_11V_MBSSID),
+				.len = cpu_to_le16(sizeof(struct bss_info_uni_mbssid)),
+				.max_indicator = vif->bss_conf.bssid_indicator,
+				.mbss_idx =  vif->bss_conf.bssid_index,
+			},
+		};
+
+		err = mt76_mcu_send_msg(mdev, MCU_UNI_CMD(BSS_INFO_UPDATE),
+					&mbssid_req, sizeof(mbssid_req), true);
+		if (err < 0)
+			return err;
+	}
+
 	return mt76_connac_mcu_uni_set_chctx(phy, mvif, ctx);
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_uni_add_bss);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index eb4099021fcb..1be6f6dcce8d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -697,12 +697,11 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
 	ieee80211_hw_set(hw, CONNECTION_MONITOR);
 	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
+	ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
+	ieee80211_hw_set(hw, SUPPORTS_ONLY_HE_MULTI_BSSID);
 
 	if (is_mt7921(&dev->mt76)) {
 		ieee80211_hw_set(hw, CHANCTX_STA_CSA);
-	} else {
-		ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
-		ieee80211_hw_set(hw, SUPPORTS_ONLY_HE_MULTI_BSSID);
 	}
 
 	if (dev->pm.enable)
-- 
2.34.1


