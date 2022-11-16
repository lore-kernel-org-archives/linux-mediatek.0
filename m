Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C245CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcTlWUKVC2/cQIdxmlzW6LcCIg0FG9Do0dcgy2oaaog=; b=UXL0bZCUk3rEI8xtpZaZss383s
	zYfk3yWtAGwvRTvcLMd1iWMPOe0OsfWadTDo2j6rgR9gXnbDJioJy8v1gGO7ucaSTFSWrYMNXyoKw
	7018XPzXSiBBaAlghFNGoSu/aMQS2gCOgJenFbX9VR/wyIsWFVNMELxJFExHlm/Q+GWlInoki5ddA
	tiuomJf+kSL/3Kd6aouPjrHGqvjbP54FuRsZbXzU5rdvQhAVk2dwidxLvKiOixXVnFlMNbonDKIYB
	9Rb/JnRYp5ytpmtxEZBqxAYOhKYLwlgD0VDtdtoJkLd42NFuFPJz6v14YlFmQLUwvG7kXkfTwei7O
	opmE/7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDTr-00153Y-LK; Wed, 16 Nov 2022 08:09:11 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDSa-0014Ri-R4; Wed, 16 Nov 2022 08:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QcTlWUKVC2/cQIdxmlzW6LcCIg0FG9Do0dcgy2oaaog=; b=FJlGLNJvPDJXA0gr5HSzexYVcc
	g09gP2L2hebhW9VIKAAAAA3/6Ce6MVt1XHAZxUg+2XUONIFHodVoSKN/fK5vTvERzeMi1lYXi6Cfo
	gsLyQ1oyLSZHxVpVMv2BPt5JcoQtjzgeOFN+K61OIB4Ottq3Tu6Qv2sZCsgndLER6RJU=;
Received: from p200300daa72ee10015f07c5633889601.dip0.t-ipconnect.de ([2003:da:a72e:e100:15f0:7c56:3388:9601] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1ovDSK-002Xoe-Vh; Wed, 16 Nov 2022 09:07:37 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/6] net: ethernet: mtk_eth_soc: avoid port_mg assignment on MT7622 and newer
Date: Wed, 16 Nov 2022 09:07:31 +0100
Message-Id: <20221116080734.44013-4-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116080734.44013-1-nbd@nbd.name>
References: <20221116080734.44013-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_000752_943643_69F5A978 
X-CRM114-Status: GOOD (  12.89  )
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

On newer chips, this field is unused and contains some bits related to queue
assignment. Initialize it to 0 in those cases.
Fix offload_version on MT7621 and MT7623, which still need the previous value.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++--
 drivers/net/ethernet/mediatek/mtk_ppe.c     | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index fbfc23923bf5..9e5545242216 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4312,7 +4312,7 @@ static const struct mtk_soc_data mt7621_data = {
 	.hw_features = MTK_HW_FEATURES,
 	.required_clks = MT7621_CLKS_BITMAP,
 	.required_pctl = false,
-	.offload_version = 2,
+	.offload_version = 1,
 	.hash_offset = 2,
 	.foe_entry_size = sizeof(struct mtk_foe_entry) - 16,
 	.txrx = {
@@ -4351,7 +4351,7 @@ static const struct mtk_soc_data mt7623_data = {
 	.hw_features = MTK_HW_FEATURES,
 	.required_clks = MT7623_CLKS_BITMAP,
 	.required_pctl = true,
-	.offload_version = 2,
+	.offload_version = 1,
 	.hash_offset = 2,
 	.foe_entry_size = sizeof(struct mtk_foe_entry) - 16,
 	.txrx = {
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 2d8ca99f2467..3ee2bf53f9e5 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -175,6 +175,8 @@ int mtk_foe_entry_prepare(struct mtk_eth *eth, struct mtk_foe_entry *entry,
 		val = FIELD_PREP(MTK_FOE_IB2_DEST_PORT_V2, pse_port) |
 		      FIELD_PREP(MTK_FOE_IB2_PORT_AG_V2, 0xf);
 	} else {
+		int port_mg = eth->soc->offload_version > 1 ? 0 : 0x3f;
+
 		val = FIELD_PREP(MTK_FOE_IB1_STATE, MTK_FOE_STATE_BIND) |
 		      FIELD_PREP(MTK_FOE_IB1_PACKET_TYPE, type) |
 		      FIELD_PREP(MTK_FOE_IB1_UDP, l4proto == IPPROTO_UDP) |
@@ -182,7 +184,7 @@ int mtk_foe_entry_prepare(struct mtk_eth *eth, struct mtk_foe_entry *entry,
 		entry->ib1 = val;
 
 		val = FIELD_PREP(MTK_FOE_IB2_DEST_PORT, pse_port) |
-		      FIELD_PREP(MTK_FOE_IB2_PORT_MG, 0x3f) |
+		      FIELD_PREP(MTK_FOE_IB2_PORT_MG, port_mg) |
 		      FIELD_PREP(MTK_FOE_IB2_PORT_AG, 0x1f);
 	}
 
-- 
2.38.1


