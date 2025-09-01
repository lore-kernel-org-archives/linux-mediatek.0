Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C59CA1007
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Sep 2025 23:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku1RWelcYa32c9Go7yNNmbB2f6KuSI2yh0M2bafQJ+U=; b=f7CKuEVJl3JTi2bME2wK5du8s0
	BRYcVPyt0yE8TAKZ/Y5Xr8RlUBDa7EMVAhZc5m+wgZBztpijtqRmM8aZ5YlYhMDjWkebXlQlORHo4
	dxp8wKC4PVsGNN5gwrHHTo5rwIMrbpR3VgGRMuKI57q3rk9yv2Mh0clpch09bsCRSMC4SHdfxSt8o
	wsK4e/zFc4bY1Ivh21M/55U4+rBxpeZ+AapURZ5EmIeu3e9MbYJiGuiN8AU0tnComFB5qKUTSZM7K
	OokUSj3v9m07EAts85BTl3mnZ3Jhk/bQsrwQyhrVfqBu/hWXmwcZY2+sZvPpm4NYv5F30zpu5PUBK
	eblE3iVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDoD-0000000EJnh-2KdA;
	Mon, 01 Sep 2025 23:19:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBbt-0000000DtKG-11mb;
	Mon, 01 Sep 2025 20:58:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03C9F4404D;
	Mon,  1 Sep 2025 20:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F75C4CEF0;
	Mon,  1 Sep 2025 20:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760320;
	bh=0l7ANV3oc32SME44FBPiXCTBRDuZfxoqru6H1toeifk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=saGs03zzGG95Q1Nd47TrYK0ZAh3G5ow9hAyGAKRiDHUHMbnAFlohd3ovRZVKZ36Fr
	 ekml9EGgCprsILI1Z0Ft6scqUTU41sytFUY4/3LaFG8c5zDYeBki8cuy/Xuxg+cmpK
	 FT/+IgoohNBac3ny+KspHOav+MPQN8d/7d/U+VwA9jtgI15Au+IlMa2OdkThF/Myxb
	 HPeGutJj8sqtLVbr7otK57E9tmNHx7ENGjW+sw8/QA9g8F8oJbMDXxGxeSFJNfLyeQ
	 cXQRQk/CP9kV1v1K+cKbZxl+JmPlnC2rrKBOUucBL+oNges5bnh9a/8Rs8x6wn+lhm
	 deBwayXeZifkA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 01 Sep 2025 22:58:03 +0200
Subject: [PATCH mt76 v2 07/14] wifi: mt76: mt7996: Fix tx-queues
 initialization for second phy on mt7996
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-mt7996-rro-rework-v2-7-1f95086b51d1@kernel.org>
References: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
In-Reply-To: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_135841_304656_D7C00A88 
X-CRM114-Status: GOOD (  12.15  )
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
index b66ba38df570503839e1a9ba1819b4e29303532f..023f788ac5f8ce6f01e5556a6000765ed42cc646 100644
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
2.50.1


