Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436D5CCA47C
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jun 2022 23:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kcfyo+Il335uQAK4TOb/qbQsBrSUKl+s/J4ZZH/62TQ=; b=hymK32n5hXCI7paQ1wSI7KAHdW
	VqkJk/KW9vi1VNIlKkd5gIRHvgZ2o8yyLiblWysfzmBFrZTpQFgojsx1zgdMl7QSwzqNJWaqR9nzf
	aHV7Jq49+pkFZfy+YfeiMgn/rBdp1jDkHmy3x4M7Cz0nwmKma2X1zE3IFqUxoOi9ZYieiMdpJWC9q
	3b11TlB+Vs/7v5vsv8USG29tWjUT2BM2fHvDyBzqXBTP+wRYpUzLPrtl9eLdyuA0pLy9tmianf/CO
	5ntX9ZOOFvD9Kk81MeK4Z3DnGsBHTlojev8WBT8cUuaIc5OH/DiYSjerxtoBKAAJKjflB+79qsek2
	Xs+k8hcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5bio-00E5oo-HX; Sun, 26 Jun 2022 23:31:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5bij-00E5mT-R2
	for linux-mediatek@lists.infradead.org; Sun, 26 Jun 2022 23:31:15 +0000
X-UUID: 6c04bc1d5cc74a90a1803f2fe3981cd3-20220626
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:291833d5-a141-4a12-b15a-5bb84edafecd,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:4bbb99d8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6c04bc1d5cc74a90a1803f2fe3981cd3-20220626
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 889219624; Sun, 26 Jun 2022 16:31:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Jun 2022 16:27:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 07:27:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 27 Jun 2022 07:27:08 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 2/2] mt76: mt7921: reduce the mutex lock scope during reset
Date: Mon, 27 Jun 2022 07:27:06 +0800
Message-ID: <77f2b8ccced3cfe659823fa86270a42423d4ba00.1656221826.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <0f3f0b2c6910f685a04bb13699c85f4a3e9f1996.1656221826.git.objelf@gmail.com>
References: <0f3f0b2c6910f685a04bb13699c85f4a3e9f1996.1656221826.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_163113_920153_4988DA7E 
X-CRM114-Status: GOOD (  12.99  )
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

From: Sean Wang <sean.wang@mediatek.com>

Reduce the mutex lock scope for reset to get rid of possible task hung
e.g wpa_supplicant and to allow the user-space process to keep running
during we need more retries to complete the reset.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Suggested-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>

---
v2: add Reviewed-by from AngeloGioacchino
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 3ea7d8f43118..81c528298913 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -738,7 +738,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
 					      reset_work);
 	struct ieee80211_hw *hw = mt76_hw(dev);
 	struct mt76_connac_pm *pm = &dev->pm;
-	int i;
+	int i, ret;
 
 	dev_dbg(dev->mt76.dev, "chip reset\n");
 	dev->hw_full_reset = true;
@@ -748,11 +748,14 @@ void mt7921_mac_reset_work(struct work_struct *work)
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
-	mutex_lock(&dev->mt76.mutex);
-	for (i = 0; i < 10; i++)
-		if (!mt7921_dev_reset(dev))
+	for (i = 0; i < 10; i++) {
+		mutex_lock(&dev->mt76.mutex);
+		ret = mt7921_dev_reset(dev);
+		mutex_unlock(&dev->mt76.mutex);
+
+		if (!ret)
 			break;
-	mutex_unlock(&dev->mt76.mutex);
+	}
 
 	if (i == 10)
 		dev_err(dev->mt76.dev, "chip reset failed\n");
-- 
2.25.1


