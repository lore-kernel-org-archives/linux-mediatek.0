Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9ECCA5FAB
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 03:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZOSrY54zyFMjE5OAX94y4rbcPUweh8or5BXli91SGg=; b=bEH2/NTSZF5GPwVP4yAFsf8iv+
	semlkBs9eqeazwdYnoxtA2a0JsvdRIhyE9sbnu7RmkNrwvP+Ndb030lVxUNBmRxsnWvIduhyTAmno
	3kLD5wRNZfa1r0TcvMc8v1ti/YRWJRnPXPLNwhNj4Kd532EKrfoem+LzQWXdQQZMjoSzT0MnF3z10
	89sgTMMReAQfpEBdcOgFdv+srPCKNpbkyVG8QMFfvI3gFKkEGo9frhgA0Dj64PiHsZ8wLumAmDh1z
	fpsimCwJm54Y8BZq/4oI7ird5c6MEbOFh7RIX3o10EHjS1LNIdDV0uXWK1hsXv02fv8N2A5cR0hMx
	sQafmblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBl7a-00000004y0r-2PHV;
	Wed, 30 Sep 2026 03:36:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBl7Y-00000004y0K-2FxS
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 03:36:41 +0000
X-UUID: 21e59006bc8011f1afed4741b24580c9-20260929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TZOSrY54zyFMjE5OAX94y4rbcPUweh8or5BXli91SGg=;
	b=qCOi7Th+iZGhkUXN1nQopf9bTZzAwrT0oLdxiSiaBDkpv8gXKZu3y/HO1AYox966J9ltS7VGqifM1ZiEI7LwkImI7jtm0RXqdlyIXutk2jqne9jS5+LbL8U1ggf0d+UG9cMCJ5/Ngdw/4XSWhaf99f5HhQ3zKVeiHOzA/MD775o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:631cf4f5-cc55-4aad-9918-aa42e17d11f2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:291e20b,CLOUDID:80da548a-0755-4a33-8091-5ce128916135,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 21e59006bc8011f1afed4741b24580c9-20260929
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1699130195; Tue, 29 Sep 2026 20:36:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 30 Sep 2026 11:36:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 30 Sep 2026 11:36:31 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Leon.Yen@mediatek.com>, <litien.chang@mediatek.com>,
	<Yung-lun.Chien@mediatek.com>, <jb.tsai@mediatek.com>, Allen Chien
	<yung-lun.chien@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: enable thermal protection
Date: Wed, 30 Sep 2026 11:36:29 +0800
Message-ID: <20260930033630.1020235-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_203640_590246_20C79FBD 
X-CRM114-Status: GOOD (  10.96  )
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

From: Allen Chien <yung-lun.chien@mediatek.com>

Enable the firmware thermal protection for MT7920/MT7921/MT7922 by
sending the DowngradeTxStreamTemp chip config command at init time.

Signed-off-by: Allen Chien <yung-lun.chien@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  6 +++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 25 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 +
 3 files changed, 32 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 49be2fa4e3fa..4ebc7c414b95 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -161,6 +161,12 @@ static void mt7921_init_work(struct work_struct *work)
 		return;
 	}
 
+	ret = mt7921_mcu_set_thermal_protect(dev);
+	if (ret) {
+		dev_err(dev->mt76.dev, "thermal protection enable failed\n");
+		return;
+	}
+
 	/* we support chip reset now */
 	dev->hw_init_done = true;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index a118a301564c..8948985c65fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1474,6 +1474,31 @@ int mt7921_mcu_wf_rf_pin_ctrl(struct mt792x_phy *phy, u8 action)
 				 sizeof(req), action ? true : false);
 }
 
+#define MT7921_THERMAL_PROT_LOW_TEMP	105
+#define MT7921_THERMAL_PROT_HIGH_TEMP	115
+
+static int mt7921_mcu_chip_config(struct mt792x_dev *dev, const char *cmd)
+{
+	struct mt76_connac_config req = {
+		.resp_type = 0,
+	};
+
+	snprintf(req.data, sizeof(req.data), "%s", cmd);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_CE_CMD(CHIP_CONFIG),
+				 &req, sizeof(req), false);
+}
+
+int mt7921_mcu_set_thermal_protect(struct mt792x_dev *dev)
+{
+	char cmd[64];
+
+	snprintf(cmd, sizeof(cmd), "DowngradeTxStreamTemp %d %d",
+		 MT7921_THERMAL_PROT_LOW_TEMP, MT7921_THERMAL_PROT_HIGH_TEMP);
+
+	return mt7921_mcu_chip_config(dev, cmd);
+}
+
 int mt7921_mcu_set_rxfilter(struct mt792x_dev *dev, u32 fif,
 			    u8 bit_op, u32 bit_map)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index fb8654b7c5e7..e632a3dea521 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -324,6 +324,7 @@ int mt7921_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 int mt7921_mcu_config_sniffer(struct mt792x_vif *vif,
 			      struct ieee80211_chanctx_conf *ctx);
 int mt7921_mcu_get_temperature(struct mt792x_phy *phy);
+int mt7921_mcu_set_thermal_protect(struct mt792x_dev *dev);
 
 int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 				   enum mt76_txq_id qid, struct mt76_wcid *wcid,
-- 
2.45.2


