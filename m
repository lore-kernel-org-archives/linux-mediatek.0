Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E37C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HH6jHr2JVqMHxGoTt7vsZl9FwpJQ7+Cm1WeHQQ2hlRE=; b=pvJldCO6UXidOCFjs5B7V7GpSG
	MAay+gNiJfw3uFCTi8sR3pG7f/vhtX1T2B6Un+wFdUJ8glce7xgdZpPSF5GnSeEiMypDDZpC32E+D
	wb7GhmOSiSxPb9aZ1RbtJ8y19rGvHr5Vo9aWq0nWiuBeHtiVIoW8j7EUzfMXMJE+3N7E7RKgiJ++q
	/7YYVIKXGdYQdpIisDI8ZzvacSr4SR9F5mUHHQtAYPcJ7VCWDyBUsiHsMatytZ1snUw9yROf93vs3
	A7u1yNRJuCLFggJ7RdXg8/8off8GPT7uJLUPDUNFkKP3aQbSAFgtjKgm/lgojIrtMpeacS1BvKRCc
	lL0eFczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setdy-0000000CV9H-0y22;
	Fri, 16 Aug 2024 09:53:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setcH-0000000CUed-0LTh
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 09:51:30 +0000
X-UUID: 19579a525bb511efb3adad29d29602c1-20240816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HH6jHr2JVqMHxGoTt7vsZl9FwpJQ7+Cm1WeHQQ2hlRE=;
	b=noBzAuOfvKWkYt5cShUD8JULQlPUZA8fnipayemNEBbQDsLDAJN8oQEByIhobPPc9bUUeW7FgA27dwy8gqK/mU/2L36JpY3y8pM0lGcpUqnUKn/Wz5c/Q9I5l0QSjKAEzuOVYuxn+WTdKCD22rOFCnHyuwQQ+6UX2j/q54lh1cw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:65986536-d551-44dc-bdf5-9f60a9e07964,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:7964b1fe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 19579a525bb511efb3adad29d29602c1-20240816
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1679026777; Fri, 16 Aug 2024 02:51:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Aug 2024 17:50:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Aug 2024 17:50:50 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>,
	"Peter Chiu" <chui-hao.chiu@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>
Subject: [PATCH 04/12] wifi: mt76: connac: fix checksum offload fields of connac3 RXD
Date: Fri, 16 Aug 2024 17:50:40 +0800
Message-ID: <20240816095040.2574-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.936500-8.000000
X-TMASE-MatchedRID: O3Wzr5fP2PYVAKRaMHqjDpdc7I2df+msSoCG4sefl8QRkR4WWjIJ6Qqu
	sGnv+h2ZXuAgXl+qfJ3QcZJBnH5UfEfSQhRXazGFdrnuu4cCcfFKPIx+MJF9o99RlPzeVuQQhne
	qPICXFZPafWtC8SgpvKnj4t9QwMZkITpz0liE0noWny127IX6IKI0K26z6c86CqIJhrrDy29DT3
	UDhPI2mmHHaMKYeRA+OdqdlfcF699iC22Ch2XoOeEbUg4xvs+wy3fMd7pCml6piV7/wDZ6aKPFj
	JEFr+olwXCBO/GKkVr3FLeZXNZS4IzHo47z5Aa+dewKmL9gkKSU4XNMpM/dEgY/vFCtojgWXybD
	gzSJcVpTXVe0FRtsCZP6uq5XGycD/NKeQtSUk2S3y8aF9AYwm2rEhaFiyBlneZUpm6wun3ba/06
	NhYDa4wyzCDjlUx89p2y3mIB+it9WXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.936500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4CD056189CDCEC77DD067318BF1BCB932F3DC7FC097ED8804A88E913559DA2482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_025129_152083_000413DA 
X-CRM114-Status: GOOD (  11.29  )
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

Fix incorrect RXD offset and bitfield related to RX checksum offload.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Fixes: 4e9011fcdfc4 ("wifi: mt76: connac: move connac3 definitions in mt76_connac3_mac.h")
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c       | 5 ++---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c       | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
index 353e66069840..ef003d1620a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
@@ -28,8 +28,6 @@ enum {
 #define MT_RXD0_MESH			BIT(18)
 #define MT_RXD0_MHCP			BIT(19)
 #define MT_RXD0_NORMAL_ETH_TYPE_OFS	GENMASK(22, 16)
-#define MT_RXD0_NORMAL_IP_SUM		BIT(23)
-#define MT_RXD0_NORMAL_UDP_TCP_SUM	BIT(24)
 
 #define MT_RXD0_SW_PKT_TYPE_MASK	GENMASK(31, 16)
 #define MT_RXD0_SW_PKT_TYPE_MAP		0x380F
@@ -80,6 +78,8 @@ enum {
 #define MT_RXD3_NORMAL_BEACON_UC	BIT(21)
 #define MT_RXD3_NORMAL_CO_ANT		BIT(22)
 #define MT_RXD3_NORMAL_FCS_ERR		BIT(24)
+#define MT_RXD3_NORMAL_IP_SUM		BIT(26)
+#define MT_RXD3_NORMAL_UDP_TCP_SUM	BIT(27)
 #define MT_RXD3_NORMAL_VLAN2ETH		BIT(31)
 
 /* RXD DW4 */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index cf36750cf709..634c42bbf23f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -352,7 +352,7 @@ mt7925_mac_fill_rx_rate(struct mt792x_dev *dev,
 static int
 mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 {
-	u32 csum_mask = MT_RXD0_NORMAL_IP_SUM | MT_RXD0_NORMAL_UDP_TCP_SUM;
+	u32 csum_mask = MT_RXD3_NORMAL_IP_SUM | MT_RXD3_NORMAL_UDP_TCP_SUM;
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	bool hdr_trans, unicast, insert_ccmp_hdr = false;
 	u8 chfreq, qos_ctl = 0, remove_pad, amsdu_info;
@@ -362,7 +362,6 @@ mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 	struct mt792x_phy *phy = &dev->phy;
 	struct ieee80211_supported_band *sband;
 	u32 csum_status = *(u32 *)skb->cb;
-	u32 rxd0 = le32_to_cpu(rxd[0]);
 	u32 rxd1 = le32_to_cpu(rxd[1]);
 	u32 rxd2 = le32_to_cpu(rxd[2]);
 	u32 rxd3 = le32_to_cpu(rxd[3]);
@@ -420,7 +419,7 @@ mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 	if (!sband->channels)
 		return -EINVAL;
 
-	if (mt76_is_mmio(&dev->mt76) && (rxd0 & csum_mask) == csum_mask &&
+	if (mt76_is_mmio(&dev->mt76) && (rxd3 & csum_mask) == csum_mask &&
 	    !(csum_status & (BIT(0) | BIT(2) | BIT(3))))
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index bc7111a71f98..fd5fe96c32e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -435,7 +435,7 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum mt76_rxq_id q,
 	u32 rxd2 = le32_to_cpu(rxd[2]);
 	u32 rxd3 = le32_to_cpu(rxd[3]);
 	u32 rxd4 = le32_to_cpu(rxd[4]);
-	u32 csum_mask = MT_RXD0_NORMAL_IP_SUM | MT_RXD0_NORMAL_UDP_TCP_SUM;
+	u32 csum_mask = MT_RXD3_NORMAL_IP_SUM | MT_RXD3_NORMAL_UDP_TCP_SUM;
 	u32 csum_status = *(u32 *)skb->cb;
 	u32 mesh_mask = MT_RXD0_MESH | MT_RXD0_MHCP;
 	bool is_mesh = (rxd0 & mesh_mask) == mesh_mask;
@@ -497,7 +497,7 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum mt76_rxq_id q,
 	if (!sband->channels)
 		return -EINVAL;
 
-	if ((rxd0 & csum_mask) == csum_mask &&
+	if ((rxd3 & csum_mask) == csum_mask &&
 	    !(csum_status & (BIT(0) | BIT(2) | BIT(3))))
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 
-- 
2.39.2


