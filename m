Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570B2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy0CmzTQE73ei2a3CPbMsjO25cSAWzLtKhHWkwKDlac=; b=eFrmgyUAegdv/oJKY3fZ3ev28K
	HyYmRN9PhP7Ecul7wYaFkfZ7FigA/dbilW38cQYqYfjloa9Yj+YYcnmkcnbFTKpaWiyucXalGAcL2
	ndRS3uAlVuQEcweSd2oBSaSMf/r/HshIw6zQXSEY3NDy1Iwg/lRr0q0/BfCyx0gmx2/DmFcEcLf17
	64iiEy5yCZqlgecvrYvhPheVqUjlVQ5oVwSgReoyd1r4NL7QBtrpJES1UFnwpuwyxYpdOOIWhCTVz
	1yq9nO5HBanT5AgwYD1pXdVa75xtXNgcWwxSyTWiZUitXCyllBXJ9wVr6Cnz+UXzXnaqjBj8FubSy
	6MDLvzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fMK-006Rw1-LO; Fri, 23 Dec 2022 10:33:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8f74-006HWU-3u
	for linux-mediatek@lists.infradead.org; Fri, 23 Dec 2022 10:17:16 +0000
X-UUID: 951dc267599641b4b9ccb681a2bdebcf-20221223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hy0CmzTQE73ei2a3CPbMsjO25cSAWzLtKhHWkwKDlac=;
	b=KwrQlALDb68ZD4kA/fCLFSstg0Ym8MrL7S6/BaoCQjA8shtpUAEEH+723l0v4EJdhiT9cSoTj+nN1EoC4eXFB0zYYfHJULO+oAis+qjC/6+wv1Skq+jgz4rfdtdzSAN8S/DzyHOZR0GWdQOwSth+V9j1iiqklhhfSVt7YZCp1lM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:5c183ce5-0a42-42a8-8a11-bac24bf1578e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:a4f29d52-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 951dc267599641b4b9ccb681a2bdebcf-20221223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1753102485; Fri, 23 Dec 2022 03:17:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Dec 2022 18:16:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Dec 2022 18:16:30 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 2/4] wifi: mt76: mt7996: update register for CFEND_RATE
Date: Fri, 23 Dec 2022 18:13:46 +0800
Message-ID: <20221223101348.11504-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223101348.11504-1-shayne.chen@mediatek.com>
References: <20221223101348.11504-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_021714_263404_E0E7FC0F 
X-CRM114-Status: GOOD (  11.24  )
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

In newer chipsets, CFEND_RATE setting has been moved to different hw
module.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c |  1 +
 drivers/net/wireless/mediatek/mt76/mt7996/regs.h | 15 ++++++++-------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 0b3e28748e76..ce4242f90e9f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1690,7 +1690,7 @@ void mt7996_mac_set_timing(struct mt7996_phy *phy)
 	else
 		val = MT7996_CFEND_RATE_11B;
 
-	mt76_rmw_field(dev, MT_AGG_ACR0(band_idx), MT_AGG_ACR_CFEND_RATE, val);
+	mt76_rmw_field(dev, MT_RATE_HRCR0(band_idx), MT_RATE_HRCR0_CFEND_RATE, val);
 	mt76_clear(dev, MT_ARB_SCR(band_idx),
 		   MT_ARB_SCR_TX_DISABLE | MT_ARB_SCR_RX_DISABLE);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index 60781d046216..d8a2c1a744b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -21,6 +21,7 @@ static const struct __base mt7996_reg_base[] = {
 	[WF_ETBF_BASE]		= { { 0x820ea000, 0x820fa000, 0x830ea000 } },
 	[WF_LPON_BASE]		= { { 0x820eb000, 0x820fb000, 0x830eb000 } },
 	[WF_MIB_BASE]		= { { 0x820ed000, 0x820fd000, 0x830ed000 } },
+	[WF_RATE_BASE]		= { { 0x820ee000, 0x820fe000, 0x830ee000 } },
 };
 
 static const struct __map mt7996_reg_map[] = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index 42980b97b4d4..7a28cae34e34 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -33,6 +33,7 @@ enum base_rev {
 	WF_ETBF_BASE,
 	WF_LPON_BASE,
 	WF_MIB_BASE,
+	WF_RATE_BASE,
 	__MT_REG_BASE_MAX,
 };
 
@@ -235,13 +236,6 @@ enum base_rev {
 						 FIELD_PREP(MT_WTBL_LMAC_ID, _id) | \
 						 FIELD_PREP(MT_WTBL_LMAC_DW, _dw))
 
-/* AGG: band 0(0x820e2000), band 1(0x820f2000), band 2(0x830e2000) */
-#define MT_WF_AGG_BASE(_band)			__BASE(WF_AGG_BASE, (_band))
-#define MT_WF_AGG(_band, ofs)			(MT_WF_AGG_BASE(_band) + (ofs))
-
-#define MT_AGG_ACR0(_band)			MT_WF_AGG(_band, 0x054)
-#define MT_AGG_ACR_CFEND_RATE			GENMASK(13, 0)
-
 /* ARB: band 0(0x820e3000), band 1(0x820f3000), band 2(0x830e3000) */
 #define MT_WF_ARB_BASE(_band)			__BASE(WF_ARB_BASE, (_band))
 #define MT_WF_ARB(_band, ofs)			(MT_WF_ARB_BASE(_band) + (ofs))
@@ -300,6 +294,13 @@ enum base_rev {
 #define MT_WF_RMAC_RSVD0(_band)			MT_WF_RMAC(_band, 0x03e0)
 #define MT_WF_RMAC_RSVD0_EIFS_CLR		BIT(21)
 
+/* RATE: band 0(0x820ee000), band 1(0x820fe000), band 2(0x830ee000) */
+#define MT_WF_RATE_BASE(_band)			__BASE(WF_RATE_BASE, (_band))
+#define MT_WF_RATE(_band, ofs)			(MT_WF_RATE_BASE(_band) + (ofs))
+
+#define MT_RATE_HRCR0(_band)			MT_WF_RATE(_band, 0x050)
+#define MT_RATE_HRCR0_CFEND_RATE		GENMASK(14, 0)
+
 /* WFDMA0 */
 #define MT_WFDMA0_BASE				0xd4000
 #define MT_WFDMA0(ofs)				(MT_WFDMA0_BASE + (ofs))
-- 
2.25.1


