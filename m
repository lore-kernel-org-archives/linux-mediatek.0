Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C313C54ED0
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 May 2025 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKLaKat4eKcNZjCTNJxH1M1K9KYv239pmfyRmJpkuU4=; b=G0Y0ONtAA+UWpPrLiEYZWMrgYR
	QjpBuliybNixH731kFo1WjkgdBvmFpmn+4X6t3kLBSJKYC+QHFJThhhzJSLevCW/25m5YXy03JIgu
	/p2561ZXap3AVVxEBNLw+NByvvy7fab/SGz3Bbc5W8XTFPOuyWW+2IzKiwRdWjrbAfUujP7zNg2DW
	ncRUvMIDaYWX/R6TK3wERrr4Sms6bBohLvB6jOwl4W2rV0AK46ByZHu8JaP3RPGjdm+w+NzxeNTjk
	zHjbG/weovoBZIRkmlcNaDNo4Do9eoBfluf0CrVbZppUnXIWXY8+qzKnOAHSaT0ECRRa5344tho60
	VG6SrrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ4aW-00000006cPL-0de1;
	Sun, 25 May 2025 06:12:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ4aT-00000006cOg-1gjv
	for linux-mediatek@lists.infradead.org;
	Sun, 25 May 2025 06:11:58 +0000
X-UUID: 25b22512392f11f0bed96b30c12bc3d6-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BKLaKat4eKcNZjCTNJxH1M1K9KYv239pmfyRmJpkuU4=;
	b=DewrPBEa70suHIYAWvFLlt6Sbxq7mVHewc2VaqKUSXSEUzpL9lKmHbnIfCuZClOf/ThHMVCWLIETM/HHTppMVGK/6t0ftUc2NTZqWaWkgkSPPz0iDRPCdVL31RCTzHDBxY5a+BHNhx3+19gnoK81Ytxs0JoazvyD5uGUYWHofrY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:61529927-ec16-4a84-a180-a21c0dbc4536,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:d1a63ff1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 25b22512392f11f0bed96b30c12bc3d6-20250524
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1401209569; Sat, 24 May 2025 23:11:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 25 May 2025 14:11:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 25 May 2025 14:11:46 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Allan Wang <allan.wang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH 2/2] wifi: mt76: mt7921: prevent decap offload config before STA initialization
Date: Sun, 25 May 2025 14:11:22 +0800
Message-ID: <f23a72ba7a3c1ad38ba9e13bb54ef21d6ef44ffb.1748149855.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <35aedbffa050e98939264300407a52ba4e236d52.1748149855.git.deren.wu@mediatek.com>
References: <35aedbffa050e98939264300407a52ba4e236d52.1748149855.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_231157_448357_EB996B97 
X-CRM114-Status: GOOD (  10.25  )
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

From: Deren Wu <deren.wu@mediatek.com>

The decap offload configuration should only be applied after the STA has
been successfully initialized. Attempting to configure it earlier can lead
to corruption of the MAC configuration in the chip's hardware state.

Add an early check for `msta->deflink.wcid.sta` to ensure the station peer
is properly initialized before proceeding with decapsulation offload
configuration.

Cc: stable@vger.kernel.org
Fixes: 24299fc869f7 ("mt76: mt7921: enable rx header traslation offload")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 1fffa43379b2..77f73ae1d7ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1180,6 +1180,9 @@ static void mt7921_sta_set_decap_offload(struct ieee80211_hw *hw,
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
+	if (!msta->deflink.wcid.sta)
+		return;
+
 	mt792x_mutex_acquire(dev);
 
 	if (enabled)
-- 
2.18.0


