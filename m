Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5588C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Dec 2023 04:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJrLG1zM8PTKraRTm33Q1ashFfc4kPfHJeFcFgICb/k=; b=0F8ezstammE7DRZCWm4eO4mOWZ
	YGf+grGTUaCG3CdQWC8ljcVIvnIHaxDoHqTiTevcCK1oSKQA7hf4f1MeEz/5a2DZ8avEnuyUNtczq
	6Hnwy+Pw+euD85L1UPUSfoHc1Qj80L45g3htiig2rBYj4X1AJyP3fa+HBlGCXt5bwm9zM/uRjpeRr
	18UHONqvh236vEqa37SdvjXyX0nhORFNUQq9MqFCcIkJ+rHTdaDTKfXW6QeD8w3TVNepcSU1Wuyxn
	IXffpcsFaG0dicMqITSTbPA9j2Q6ELjfHX4cd9v1w1fW4uvSMq2Fbp79/CVkdwYEiRXzTRwTcNvgU
	tq2yDwmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtBa-007JWq-1v;
	Sat, 23 Dec 2023 04:00:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtBX-007JWD-2g
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Dec 2023 04:00:25 +0000
X-UUID: c73c4edea14711ee958cff29c719f35b-20231222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HJrLG1zM8PTKraRTm33Q1ashFfc4kPfHJeFcFgICb/k=;
	b=MLFnyUx9NaIszp+9L6hTppeZMktz8MpKZLkm78SEAxvctH+XALfGFBjw3llsUtpDry7JRZ5i5SW+sXETHdhUkLME4HGHHhE6/AQ8SqQOp7GBhTueSPwEdwNX5y+i0rADaBo0mpcqMOkw3+v82ZGoUaufYwdJBmc3hlkMc0V5vJI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:9a23f6fa-7d62-4de0-9868-9059f104b7f8,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:5d391d7,CLOUDID:59eb947e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,D
	KR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c73c4edea14711ee958cff29c719f35b-20231222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 519269141; Fri, 22 Dec 2023 21:00:15 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 23 Dec 2023 12:00:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 23 Dec 2023 12:00:12 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: usb: create a dedicated queue for psd traffic
Date: Sat, 23 Dec 2023 11:43:06 +0800
Message-ID: <3eb3a860ccdf465b77ae63d6ddcf6a584d1729ce.1703301666.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.304200-8.000000
X-TMASE-MatchedRID: P7IsGr2NQXpxERu/GEvUx57tR0mnRAg19k2LdvNVos40QmmUihPzrOD+
	bNUbvCNRThbvLLI8RvOP8lyp0EjHaun2wHlv5vGudXu122+iJtrGYnoF/CTeZZ6fSoF3Lt+MQeG
	LuticaUPbU8hbAd0JD341niV9KymzHxPMjOKY7A9t1O49r1VEa8RB0bsfrpPIXzYxeQR1Dvvndz
	T1VUm+yW0uVYlAtwt47fEUfA3jpjWYSNo3e1rEeo7dlbKe85Mf
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.304200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 401E56649758C30EA66F75B96BA1EB57C31FCB9DB5BEBF1839A7ED984E5D1A1B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_200023_883163_D1626153 
X-CRM114-Status: GOOD (  10.71  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

Create a dedicate queue for psd/mgmt traffic and do not rely on voice
one. This is a preliminary patch to fix mt7921u/mt7925 usb dmasl
configuration.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 1584665fe3cb..9958399ff57e 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -767,7 +767,7 @@ static void mt76u_status_worker(struct mt76_worker *w)
 	if (!test_bit(MT76_STATE_RUNNING, &dev->phy.state))
 		return;
 
-	for (i = 0; i < IEEE80211_NUM_ACS; i++) {
+	for (i = 0; i <= MT_TXQ_PSD; i++) {
 		q = dev->phy.q_tx[i];
 		if (!q)
 			continue;
@@ -928,14 +928,11 @@ static u8 mt76u_ac_to_hwq(struct mt76_dev *dev, u8 ac)
 
 static int mt76u_alloc_tx(struct mt76_dev *dev)
 {
-	struct mt76_queue *q;
-	int i, j, err;
+	int i;
 
 	for (i = 0; i <= MT_TXQ_PSD; i++) {
-		if (i >= IEEE80211_NUM_ACS) {
-			dev->phy.q_tx[i] = dev->phy.q_tx[0];
-			continue;
-		}
+		struct mt76_queue *q;
+		int j, err;
 
 		q = devm_kzalloc(dev->dev, sizeof(*q), GFP_KERNEL);
 		if (!q)
@@ -969,7 +966,7 @@ static void mt76u_free_tx(struct mt76_dev *dev)
 
 	mt76_worker_teardown(&dev->usb.status_worker);
 
-	for (i = 0; i < IEEE80211_NUM_ACS; i++) {
+	for (i = 0; i <= MT_TXQ_PSD; i++) {
 		struct mt76_queue *q;
 		int j;
 
@@ -999,7 +996,7 @@ void mt76u_stop_tx(struct mt76_dev *dev)
 
 		dev_err(dev->dev, "timed out waiting for pending tx\n");
 
-		for (i = 0; i < IEEE80211_NUM_ACS; i++) {
+		for (i = 0; i <= MT_TXQ_PSD; i++) {
 			q = dev->phy.q_tx[i];
 			if (!q)
 				continue;
@@ -1013,7 +1010,7 @@ void mt76u_stop_tx(struct mt76_dev *dev)
 		/* On device removal we maight queue skb's, but mt76u_tx_kick()
 		 * will fail to submit urb, cleanup those skb's manually.
 		 */
-		for (i = 0; i < IEEE80211_NUM_ACS; i++) {
+		for (i = 0; i <= MT_TXQ_PSD; i++) {
 			q = dev->phy.q_tx[i];
 			if (!q)
 				continue;
-- 
2.18.0


