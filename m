Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140C7606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gSuA/95+;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=eU81EQGY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lm5/2N9BWFM5VQSPD7ar6wivD5L2gI/noX/Y7OQqZ9Q=; b=gSuA/95+mMbmma5ji/A6KAp44/
	Sf+pf3pQknJBC/NNdU6+8y4RW46ratanE6UqHcrtQpa7s5+XXu9kAT9FUpCuFASwz16gxeB+oApna
	ej80e8jSL90v/WQ4G6nUK4qXViqHeFcJlsTDRTLaBc3KgNQXEXdCYSvQzhEKDzc/dSo5zfHc6GSRc
	R9ytDIcPsfZs6G/pMtxsZz2x9C9BfrIykD7xSnqh0wvb9qmuAprQVjt+yY3vAmFg/5rU3GC56usNK
	WZek9ESOcOZNzc5802F/1QmQf0y9T4/4BQMkhoo4CiKOohTKmbeEBqH989WOqlFDSrde7/2Hg6u4G
	X6e4Wc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcXg-00000002ILu-2tiz;
	Tue, 10 Nov 2026 03:29:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcXb-00000002IH3-1ibK
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:29:01 +0000
X-UUID: b85ba77edcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lm5/2N9BWFM5VQSPD7ar6wivD5L2gI/noX/Y7OQqZ9Q=;
	b=eU81EQGYOSTcLSMNluKprG8D9raVduYnCbQtS9S5MtB47FRpBzLXA4nb7cRUwEePZO+SlpN9jEksTMtqLtZtCMiYrLCQ5V+SjrgVNfCFpSwNpH+aoBIP2tSL+Dj0LChYKRLPj62Dk44MkZdjPVtnMYVaMAtZzlddXviWRG06etk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:768bfb77-3193-47c8-85fd-cb5f603a8b47,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:0f941366-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b85ba77edcb411f1afed4741b24580c9-20261109
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1897820616; Mon, 09 Nov 2026 20:13:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:35 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 20/28] wifi: mt76: mt7925: add mt7925_mcu_add_bss_sec() helper
Date: Tue, 10 Nov 2026 11:12:36 +0800
Message-ID: <20261110031244.369014-21-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192859_474794_888607FC 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Add a helper that pushes only the SEC (cipher) TLV of an active BSS via
BSS_INFO_UPDATE instead of re-sending the whole BSS_INFO; the firmware
processes BSS_INFO TLVs independently. The MLO set_key path will use it.


Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 22 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 27410eb940ea..b502f93166e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3391,6 +3391,28 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 					   mlink->wcid.idx, enable);
 }
 
+/* Update only the SEC (cipher) tag of an active BSS, without re-pushing the
+ * whole BSS_INFO. The firmware processes BSS_INFO TLVs independently, so a
+ * SEC-only update leaves the rest untouched. Used by the set_key path.
+ */
+int mt7925_mcu_add_bss_sec(struct mt792x_phy *phy,
+			   struct ieee80211_bss_conf *link_conf)
+{
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	struct mt792x_dev *dev = phy->dev;
+	struct sk_buff *skb;
+
+	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
+					 MT7925_BSS_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7925_mcu_bss_sec_tlv(skb, link_conf);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
+}
+
 int mt7925_mcu_set_dbdc(struct mt76_phy *phy, bool enable)
 {
 	struct mt76_dev *mdev = phy->dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index dea93f4186ff..ae403c04e436 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -737,6 +737,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_bss_conf *link_conf,
 			    struct ieee80211_link_sta *link_sta,
 			    int enable);
+int mt7925_mcu_add_bss_sec(struct mt792x_phy *phy,
+			   struct ieee80211_bss_conf *link_conf);
 int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
 				struct ieee80211_chanctx_conf *ctx,
 				struct ieee80211_bss_conf *link_conf,
-- 
2.45.2


