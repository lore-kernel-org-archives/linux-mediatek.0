Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41565EEAA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvYrcXKSEU3Sfc3Oy2p7MEpfqBW50wPQnHpP5pCI1h8=; b=Nbp+MGvPvHmReTP6/vH4D5iCon
	Rd2OnB8YHtUH7VImkTAJYYrH1cD/vEeQh4VamrN7OnZHDl/0IywDclkMUa/fl5XYZ+Xq1YUveWHXk
	Ok8yLWA5P+Bb5mI1lwgRpgpRKVZdXM1ZYRCq5gAMj37uMhpJYRN9/ZgEmBdT87d7PIt6jielEQIc+
	eUHQqJBkGoaDIzlwg27HY+K3G1++f/o41v4lpIARXVeHG81rPIHQJfmsVr8pPjLMSJLxKUU052TWG
	ADvD3/RDY+Y3a5k48IdtmUv+UjOsiqVJQPaH+/gZ22AAe00dibQoORkh4xGwKBRG1sTUCbd+Ool5i
	k4zDN6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnVB-008egU-1F;
	Thu, 14 Sep 2023 14:39:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnV8-008eeO-04
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 14:39:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 63258CE2638;
	Thu, 14 Sep 2023 14:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EDEC433D9;
	Thu, 14 Sep 2023 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694702362;
	bh=3r82y1pgCz3z5rfJXgtl4TIaNeByv4XWt/0bOvFdPxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eZp4wlOv5KSHGEkkqKweIy/eEoPd/Eyd8ZFlyY/6PZPA3nLEfAjcHYum3GMFXt42P
	 lDrncaOxqoxXfq8efsMosdPCEyhK/w6bfPtb6UkhlRZ1CEOpyz7DT7TNU5ivVuyv6B
	 dMH2+gdt7pL90zfHmvrS63FK0cEyutxIc+azokCEc9pTQYUu0j14D494ecjbl78K/o
	 LFclDexGdY2c2PMGN5RYjJPAHh+Wdt6ZR+gSkzrXsTZC5Lq8izi9ZGAqQDpXzmiZNi
	 wdMJdQ5mQkY0xZSUbyYLsCSaJfEBi/VRVyYijHEAVTM9wu5s/mUv+u8vv3Pvm3RGLA
	 35s4wrUE4JqVA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 04/15] net: ethernet: mtk_wed: introduce mtk_wed_wdma_get_desc_size utility routine
Date: Thu, 14 Sep 2023 16:38:09 +0200
Message-ID: <d3197d9a411d7df511b8262c129da6f5d561c35e.1694701767.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694701767.git.lorenzo@kernel.org>
References: <cover.1694701767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_073926_240354_FAE36F41 
X-CRM114-Status: GOOD (  11.02  )
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

This is a preliminary patch to introduce Wireless Ethernet Dispatcher
support for MT7988 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index ce1ca98ea1d6..ac284b1e599f 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1245,11 +1245,20 @@ mtk_wed_ring_alloc(struct mtk_wed_device *dev, struct mtk_wed_ring *ring,
 	return 0;
 }
 
+static u32
+mtk_wed_wdma_get_desc_size(struct mtk_wed_hw *hw)
+{
+	if (mtk_wed_is_v1(hw))
+		return sizeof(struct mtk_wdma_desc);
+
+	return 2 * sizeof(struct mtk_wdma_desc);
+}
+
 static int
 mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 			   bool reset)
 {
-	u32 desc_size = sizeof(struct mtk_wdma_desc) * dev->hw->version;
+	u32 desc_size = mtk_wed_wdma_get_desc_size(dev->hw);
 	struct mtk_wed_ring *wdma;
 
 	if (idx >= ARRAY_SIZE(dev->rx_wdma))
@@ -1278,7 +1287,7 @@ static int
 mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 			   bool reset)
 {
-	u32 desc_size = sizeof(struct mtk_wdma_desc) * dev->hw->version;
+	u32 desc_size = mtk_wed_wdma_get_desc_size(dev->hw);
 	struct mtk_wed_ring *wdma;
 
 	if (idx >= ARRAY_SIZE(dev->tx_wdma))
-- 
2.41.0


