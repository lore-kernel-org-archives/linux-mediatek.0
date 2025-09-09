Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0580CAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOdIPt0J/GinFg0/VHHOiVRuZFi/ay1gOl1EwrOa4X4=; b=KtGXJ24dbmMi8Ezyz8dwx1u81S
	u6Ulz6uMR7OGz+1CSEcYQm3JdvnVeFSq/500bItZPH8NzCZgj4j3N9dC7mRUp3ieQU7q6P6iqSP4a
	lPnTim/e1fU/Z4b7Z+9oFSH1b6LtmVVyWnaFlkxmmp4tQ9VG5qTHQ8iWFcz62bdR5XEvjlZv6ztdS
	310TkeIflPT2S2Pe5MFQ/1ry0COZqlX10ypaReKFYmSbnxcdkXoZe/35hP/gqG2JtMiJ3N0Wifrql
	Bf7ntmhJ1Ft/K2NJ1ee94b9pCT5JbEMKATeijRNasNYIdyrcTprkqLBRzJSUtxSxLz083eEgH4GMm
	kX7WjgAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0S4-00000008AH1-09cu;
	Tue, 09 Sep 2025 15:40:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuv3-0000000665j-2il5;
	Tue, 09 Sep 2025 09:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 620F040923;
	Tue,  9 Sep 2025 09:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DE8C4CEF4;
	Tue,  9 Sep 2025 09:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411145;
	bh=+bYMMlIim5Z/oTtnD/xYw2d8f71yyRUWB+j4XgoMTrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nT6mlgAHcjo3vZLy51X6xLeqHrupPFhfNrqyI2V4lETMWcUHzFgA6O+cFSSNNx4UX
	 /KSjkTwuXVxT/A8OuQK2y1x0aozLYI+WYAZKik1p2ESkoKM7kNHPDX+5Vk4U2mK0YE
	 bFCtfPcHcVKQMZdsvAOffrwnsDVCgKM3TPz0ZfrrGlWYs6lO0oY49wlMTXEca+2zK4
	 LHU8Qvii8vSzTqRwLp9Vfcz2hil8vpHyMxFqzAY6NkfRVN2YEBexw84CS1KtzLi8Ee
	 dIWYfOogE7BdjI8N1Y7T+ns1AfzU1wa25WUNNl4rQPBGrB1pMTVCBETJGC6kh0V54Q
	 JqHwv8CfQn5nw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Sep 2025 11:45:16 +0200
Subject: [PATCH mt76 v5 08/16] wifi: mt76: mt7996: Fix tx-queues
 initialization for second phy on mt7996
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-mt7996-rro-rework-v5-8-7d66f6eb7795@kernel.org>
References: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
In-Reply-To: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024545_720568_1F5D71A2 
X-CRM114-Status: GOOD (  12.14  )
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

Fix the second phy tx queue initialization if hif device is not
available for MT7990 chipset.

Fixes: 83eafc9251d6d ("wifi: mt76: mt7996: add wed tx support")
Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Co-developed-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 73a55eea535872f94d2328ea5d832d82bf02abb2..a472c9bd4fd8ae88a5213bda8225c91716423f6d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -703,13 +703,20 @@ static int mt7996_register_phy(struct mt7996_dev *dev, enum mt76_band_id band)
 
 	/* init wiphy according to mphy and phy */
 	mt7996_init_wiphy_band(mphy->hw, phy);
-	ret = mt7996_init_tx_queues(mphy->priv,
-				    MT_TXQ_ID(band),
-				    MT7996_TX_RING_SIZE,
-				    MT_TXQ_RING_BASE(band) + hif1_ofs,
-				    wed);
-	if (ret)
-		goto error;
+
+	if (is_mt7996(&dev->mt76) && !dev->hif2 && band == MT_BAND1) {
+		int i;
+
+		for (i = 0; i <= MT_TXQ_PSD; i++)
+			mphy->q_tx[i] = dev->mt76.phys[MT_BAND0]->q_tx[0];
+	} else {
+		ret = mt7996_init_tx_queues(mphy->priv, MT_TXQ_ID(band),
+					    MT7996_TX_RING_SIZE,
+					    MT_TXQ_RING_BASE(band) + hif1_ofs,
+					    wed);
+		if (ret)
+			goto error;
+	}
 
 	ret = mt76_register_phy(mphy, true, mt76_rates,
 				ARRAY_SIZE(mt76_rates));

-- 
2.51.0


