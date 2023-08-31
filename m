Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FA4C83F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 06:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfU4LEeC1RlS57fRfeRmoy2Ec+uKEXRjduS2hlBa8FA=; b=Iv1K+BV4pQ8P+v140ir0xA/LAl
	P6+WJ8pGFFfcvXpl/dEsSgqE8N/GjzmfxGKWS7BSfNHymBOeR21FNFSlYb1pEdGnWg8WS5pK3zDqM
	sl4unzgoAF//PQjVlVCSoSqrZ0PhWeLiXO3W8AKtnZZQ5S47pNL68ddK63VuPuHrWq5TrrWg8ymsY
	pB91Uf1KLqEUyq/4fPlFannsafsMVaYonNXWPbuuiykUQRYvK8fL8Mtbb8vFC4kuJlm3AEtP/j2UY
	wtfK/39P10kvGeS9NOp87p73DR3YahVNtRxDFcobW1ObzbFSgYqEBEMwl8E2CnbG431JD3VNrsT70
	HCsvJVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbb5r-00EkYX-2H;
	Thu, 31 Aug 2023 06:23:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbb5o-00EkXJ-3C
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 06:23:50 +0000
X-UUID: efa6257847c611ee83ed1395ce914268-20230830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KfU4LEeC1RlS57fRfeRmoy2Ec+uKEXRjduS2hlBa8FA=;
	b=kHYs+pawtUmlGVVZpZ2CS6DYh6z4HbQORdmvMuUr29kKcMIjJij0DztxyuWOxKEhmnilQaPExxDL39cjGJ+XGSFotShVSnYT9qAbOcINMzKko+su4tVF/fdwIuPib5v0jXLxPzu28H6Qp0AA0tXC0y6G1akSYROQMEJz6w0D4yo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:0fce3f85-d333-41c5-85f2-9f9745c9ed9e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:ffe3f31f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: efa6257847c611ee83ed1395ce914268-20230830
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 953414829; Wed, 30 Aug 2023 23:23:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 31 Aug 2023 14:23:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 31 Aug 2023 14:23:31 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 7/9] wifi: mt76: check vif type before reporting cca and csa
Date: Thu, 31 Aug 2023 14:22:19 +0800
Message-ID: <20230831062221.20027-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230831062221.20027-1-shayne.chen@mediatek.com>
References: <20230831062221.20027-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_232349_037246_FD120C76 
X-CRM114-Status: GOOD (  10.93  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Do not report cca and csa finish to upper layer on station type vif to
prevent warnings caused by setting beacon.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 8 +++++---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index a203f90367f4..79d0a0f3cc57 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -225,8 +225,10 @@ int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3)
 static void
 mt7915_mcu_csa_finish(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
-	if (vif->bss_conf.csa_active)
-		ieee80211_csa_finish(vif);
+	if (!vif->bss_conf.csa_active || vif->type == NL80211_IFTYPE_STATION)
+		return;
+
+	ieee80211_csa_finish(vif);
 }
 
 static void
@@ -326,7 +328,7 @@ mt7915_mcu_rx_log_message(struct mt7915_dev *dev, struct sk_buff *skb)
 static void
 mt7915_mcu_cca_finish(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
-	if (!vif->bss_conf.color_change_active)
+	if (!vif->bss_conf.color_change_active || vif->type == NL80211_IFTYPE_STATION)
 		return;
 
 	ieee80211_color_change_finish(vif);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 27250e7a077d..12bf4e5038b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -324,8 +324,10 @@ int mt7996_mcu_wa_cmd(struct mt7996_dev *dev, int cmd, u32 a1, u32 a2, u32 a3)
 static void
 mt7996_mcu_csa_finish(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
-	if (vif->bss_conf.csa_active)
-		ieee80211_csa_finish(vif);
+	if (!vif->bss_conf.csa_active || vif->type == NL80211_IFTYPE_STATION)
+		return;
+
+	ieee80211_csa_finish(vif);
 }
 
 static void
@@ -399,7 +401,7 @@ mt7996_mcu_rx_log_message(struct mt7996_dev *dev, struct sk_buff *skb)
 static void
 mt7996_mcu_cca_finish(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
-	if (!vif->bss_conf.color_change_active)
+	if (!vif->bss_conf.color_change_active || vif->type == NL80211_IFTYPE_STATION)
 		return;
 
 	ieee80211_color_change_finish(vif);
-- 
2.39.2


