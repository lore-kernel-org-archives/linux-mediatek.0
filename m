Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F99EC761A6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 04:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=krANJBPD9SWB31iXypJXnaZ61IjsVbj+ywmC1tt7N14=; b=CHFD/1esbSQsz4eWDCprpBqYut
	6ZePIkzJgeZ8WFb+753Guoh/8c3YJgCMNLGjxAMKuNU8u19shnmZE0EUcpUOCP1MTS4Eo6kDjcsJa
	a9AywHEETHZhkJuxZGWdxIMKQW2AzKI5d6uGTltjzs5vI7rL2gzIFzZ/DsXT8a94Hr1J9fx90+RJn
	KFT9isnGk+vfSSUhmKodavet7+/fFx2UlmZuh9y9Salc5MkataX87p4kuKfBMIIBGGN+sDF6gjmfs
	VBFK2hR1X6kMP8Vu5FyPa1N/21E88dF/FG4UZeUFWbmL7NDzGObRxQmS9pl7c8loaW62D6E9x+QJz
	7Siz1RsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjYAU-0000bj-12;
	Tue, 04 Apr 2023 04:21:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjYAQ-0000aw-29
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 04:21:13 +0000
X-UUID: 19fc6e14d2a011ed8687db9d93187ff1-20230403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=krANJBPD9SWB31iXypJXnaZ61IjsVbj+ywmC1tt7N14=;
	b=U7yFkoVNxqR65/sp1pI4sXU3Z3ikbOHJOwKqgu4xuWqVJOOpXQxCqM6tSX7gaKBEyfBVVpxsKIiKLX4o5feN+XKjZfVNyu75pS71DYO95nFoOV0o++/CgWUafQ1+WEhP6eqD9PGWlH5M9VmIxaE4oyDNF2eIK8epnoSHHkwgqDE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:85f61588-8704-4d4a-9a4f-cad10c468836,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:85f61588-8704-4d4a-9a4f-cad10c468836,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:b8c932b5-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:230404122102OM7HCOIG,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 19fc6e14d2a011ed8687db9d93187ff1-20230403
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2097976871; Mon, 03 Apr 2023 21:20:59 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 4 Apr 2023 12:20:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 4 Apr 2023 12:20:56 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt7921e: improve reliability of dma reset
Date: Tue, 4 Apr 2023 12:20:46 +0800
Message-ID: <d2ca8717d03241ddbd613a6731e5b84aefda8999.1680581282.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_212110_867418_4D6BF44B 
X-CRM114-Status: GOOD (  12.52  )
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

From: Quan Zhou <quan.zhou@mediatek.com>

We should put dma into idle status before reset the component. Otherwise,
there would be a potential risk to make the dma hang. Let's reorder the
sequence to make sure the HW working properly.

Tested pass with 50000 times cold reboot on x86 platform.

Fixes: 0a1059d0f060 ("mt76: mt7921: move mt7921_dma_reset in dma.c")
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 36 ++++++++++---------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index d1f10f6d9adc..cf844224d618 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -66,22 +66,6 @@ static void mt7921_dma_prefetch(struct mt7921_dev *dev)
 
 static int mt7921_dma_disable(struct mt7921_dev *dev, bool force)
 {
-	if (force) {
-		/* reset */
-		mt76_clear(dev, MT_WFDMA0_RST,
-			   MT_WFDMA0_RST_DMASHDL_ALL_RST |
-			   MT_WFDMA0_RST_LOGIC_RST);
-
-		mt76_set(dev, MT_WFDMA0_RST,
-			 MT_WFDMA0_RST_DMASHDL_ALL_RST |
-			 MT_WFDMA0_RST_LOGIC_RST);
-	}
-
-	/* disable dmashdl */
-	mt76_clear(dev, MT_WFDMA0_GLO_CFG_EXT0,
-		   MT_WFDMA0_CSR_TX_DMASHDL_ENABLE);
-	mt76_set(dev, MT_DMASHDL_SW_CONTROL, MT_DMASHDL_DMASHDL_BYPASS);
-
 	/* disable WFDMA0 */
 	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
 		   MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN |
@@ -95,6 +79,22 @@ static int mt7921_dma_disable(struct mt7921_dev *dev, bool force)
 		       MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 1000))
 		return -ETIMEDOUT;
 
+	/* disable dmashdl */
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG_EXT0,
+		   MT_WFDMA0_CSR_TX_DMASHDL_ENABLE);
+	mt76_set(dev, MT_DMASHDL_SW_CONTROL, MT_DMASHDL_DMASHDL_BYPASS);
+
+	if (force) {
+		/* reset */
+		mt76_clear(dev, MT_WFDMA0_RST,
+			   MT_WFDMA0_RST_DMASHDL_ALL_RST |
+			   MT_WFDMA0_RST_LOGIC_RST);
+
+		mt76_set(dev, MT_WFDMA0_RST,
+			 MT_WFDMA0_RST_DMASHDL_ALL_RST |
+			 MT_WFDMA0_RST_LOGIC_RST);
+	}
+
 	return 0;
 }
 
@@ -301,6 +301,10 @@ void mt7921_dma_cleanup(struct mt7921_dev *dev)
 		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
 		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
 
+	mt76_poll_msec_tick(dev, MT_WFDMA0_GLO_CFG,
+			    MT_WFDMA0_GLO_CFG_TX_DMA_BUSY |
+			    MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 100, 1);
+
 	/* reset */
 	mt76_clear(dev, MT_WFDMA0_RST,
 		   MT_WFDMA0_RST_DMASHDL_ALL_RST |
-- 
2.18.0


