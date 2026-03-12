Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F505FED2FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qplD8CGYzuO6b35VEHxpGDhWihWOwoDLawx+46tbPcQ=; b=S2Ojn3TCOScOzkRp52rNasRrht
	7mpXqGdQMGJR3JaQ/be7Qqw3ZVZ7u89spzSjdN8/nd6wtPeG7NaIZzUxi8dbIlibOHj6xnKvaOHfK
	FFfa3bNa7swyUJ3Whs0raXxERKW3Wp5WR8gy7UqTDTRxEcH34S4URN/VR9S5Hiynx6EqCkUaB1XSk
	teBvHtBgMVBR/cmL4LQOghHDVD5Q2lDGOxy/4wv2HdF8WDt+1SGUA5dJBLEubGBKfr4ofRVUH68L4
	L/5KnjbIIbAd6F+//7etLY1s6R61j5p1QFRgCA08Rqilm8/+sTkBdEaZ1o8qcXW/KvVfPu+jOyLve
	GeckXm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cod-0000000Dobd-1X4v;
	Thu, 12 Mar 2026 09:58:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0coY-0000000DoYX-01tO
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 09:58:47 +0000
X-UUID: 0a6583161dfa11f1a6de359d7043e138-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qplD8CGYzuO6b35VEHxpGDhWihWOwoDLawx+46tbPcQ=;
	b=bVMT1ilHTAXmLhRl+z/hCEDAPFLCe8JqxYRklwfhmKGhg1QETYMiFEdSkFgRl9YGtZgxqw9vh+gBst8NJQKvLIl9TcTyRsjD3+VavCy6SPU8T2Sadsj9PTFHsUkqGLCxYb03kAojdTULnoEkYwCd+VaO7fTf2OlQ3z5ffoLgbsc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2ff9e46c-a843-4dea-910b-c8cda2126609,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:689784eb-3b42-43ec-801b-62c7b12ba70e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0a6583161dfa11f1a6de359d7043e138-20260312
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 185682189; Thu, 12 Mar 2026 02:58:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Mar 2026 17:58:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Mar 2026 17:58:35 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 1/6] wifi: mt76: mt7996: fix RRO EMU configuration
Date: Thu, 12 Mar 2026 17:57:19 +0800
Message-ID: <20260312095724.2117448-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_025846_055736_A9DC3153 
X-CRM114-Status: GOOD (  10.82  )
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

Use the correct helper to update specific bitfields instead of
overwriting the entire register.

Fixes: eedb427eb260 ("wifi: mt76: mt7996: Enable HW RRO for MT7992 chipset")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 3 +--
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 5aaa93767109..f3239f530aea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -873,8 +873,7 @@ void mt7996_rro_hw_init(struct mt7996_dev *dev)
 			}
 		} else {
 			/* set emul 3.0 function */
-			mt76_wr(dev, MT_RRO_3_0_EMU_CONF,
-				MT_RRO_3_0_EMU_CONF_EN_MASK);
+			mt76_set(dev, MT_RRO_3_0_EMU_CONF, MT_RRO_3_0_EMU_CONF_EN_MASK);
 
 			mt76_wr(dev, MT_RRO_ADDR_ARRAY_BASE0,
 				dev->wed_rro.addr_elem[0].phy_addr);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index a415cc610eee..86aaf0f29e28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2559,7 +2559,7 @@ void mt7996_mac_reset_work(struct work_struct *work)
 	mt7996_dma_start(dev, false, false);
 
 	if (!is_mt7996(&dev->mt76) && dev->mt76.hwrro_mode == MT76_HWRRO_V3)
-		mt76_wr(dev, MT_RRO_3_0_EMU_CONF, MT_RRO_3_0_EMU_CONF_EN_MASK);
+		mt76_set(dev, MT_RRO_3_0_EMU_CONF, MT_RRO_3_0_EMU_CONF_EN_MASK);
 
 	if (mtk_wed_device_active(&dev->mt76.mmio.wed)) {
 		u32 wed_irq_mask = MT_INT_TX_DONE_BAND2 |
-- 
2.51.0


