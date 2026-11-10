Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5260A2610
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=psvuNrJp;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=iLT/JwKn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/gRcLg520dGXayeFXMNBI71v5TIL1pzeehdMXikKsuQ=; b=psvuNrJpXps2q3Sg9ykAmkG73Q
	xbdOCoaGHKPkq2AyUBGl8VJFqESXJZv8a/Mt4flgc4XbPW6+pjTnLeKF4x/1WDOcEo3HEUIMhR4FC
	CXEHDZfd9P4HoJ/TATusFosBKn4aOredr2lqXMNeCZQWfsYatqNiqaIaa0mNmZs3brEDeDJJcG3Jy
	fl7Dr4KDnNFZRXu6furQTa17AA6Zf0x1l8iRxw3wW9x81p/l/4iB0vjC6j3tWb/Vi40BG1mmxh/XI
	hk1wqx0Dskryk1flG+IJBVhrR/1u4BDWuzIYY6hBhYaErLpYTBYDw1hFnPjhgQykOLNIZVNRA/7rR
	DvBmyvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIy-00000002FQx-3uQZ;
	Tue, 10 Nov 2026 03:13:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIg-00000002EvL-3MzD
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:36 +0000
X-UUID: b5988cdcdcb411f1acbe4559397dec65-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/gRcLg520dGXayeFXMNBI71v5TIL1pzeehdMXikKsuQ=;
	b=iLT/JwKn44+SNSp3Fv+GY/oTthkjDSkPHsH3YayrkdLvcFAjv72tSQe/GsmC3ckvprV04MRHsbqixsxnMI/2PD7ibufHTLyNhDEg8e3YDj+4FHBI/UQF5IrdP5E5wzoJqHLmMxqhraB3AYLnS4Mkq247hxchIYNP0bpyV7/iwb0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1227a1e7-37f7-49fc-8416-c4fb4b44eb83,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:96af878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b5988cdcdcb411f1acbe4559397dec65-20261109
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1859921364; Mon, 09 Nov 2026 20:13:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:30 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 07/28] wifi: mt76: mt792x: add a gated mt792x_mcu_set_dev_active() helper
Date: Tue, 10 Nov 2026 11:12:23 +0800
Message-ID: <20261110031244.369014-8-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191334_884805_D8934D59 
X-CRM114-Status: GOOD (  12.69  )
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

Add a per-vif dev_active flag and a wrapper around
mt76_connac_mcu_uni_add_dev() that skips a redundant DEV (de)activation
command and keeps the flag in sync with the firmware DEV state.

This is a preparation patch before the MT7925 MLO DEV (de)activation work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  5 +++++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 20 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 8a366356e560..b9bcc5e1197c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -181,6 +181,7 @@ struct mt792x_bss_conf {
 	struct ewma_rssi rssi;
 	struct ieee80211_tx_queue_params queue_params[IEEE80211_NUM_ACS];
 	unsigned int link_id;
+	bool dev_active;
 
 	bool absent;
 
@@ -586,6 +587,10 @@ int mt792x_mcu_fw_pmctrl(struct mt792x_dev *dev);
 void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 				struct mt792x_bss_conf *mconf,
 				struct mt792x_link_sta *mlink);
+int mt792x_mcu_set_dev_active(struct mt792x_dev *dev,
+			      struct ieee80211_bss_conf *link_conf,
+			      struct mt792x_bss_conf *mconf,
+			      struct mt76_wcid *wcid, bool enable);
 void mt792x_config_mac_addr_list(struct mt792x_dev *dev);
 
 static inline char *mt792x_ram_name(struct mt792x_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 1965e9de7099..420aba8519e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -302,6 +302,26 @@ void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 }
 EXPORT_SYMBOL_GPL(mt792x_mac_link_bss_remove);
 
+int mt792x_mcu_set_dev_active(struct mt792x_dev *dev,
+			      struct ieee80211_bss_conf *link_conf,
+			      struct mt792x_bss_conf *mconf,
+			      struct mt76_wcid *wcid, bool enable)
+{
+	int ret;
+
+	/* skip a redundant command when already in the requested state */
+	if (mconf->dev_active == enable)
+		return 0;
+
+	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf,
+					  &mconf->mt76, wcid, enable);
+	if (!ret)
+		mconf->dev_active = enable;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mt792x_mcu_set_dev_active);
+
 void mt792x_remove_interface(struct ieee80211_hw *hw,
 			     struct ieee80211_vif *vif)
 {
-- 
2.45.2


