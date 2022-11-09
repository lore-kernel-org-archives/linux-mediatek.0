Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE88C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2N+jSfSlY43TnrF1h50zfC2H3h4TDeeUUxvXDObycg=; b=Rz1UAY300Hir3mHMQraHB4tChW
	yG9twxtk9x3rSyKnjDdyn0pnBk3hofi6/TZUVwX1b2tTygoQq6O3SUs8eM53bp12DSF1YMFCw2f/Q
	cbR8qdFObcYJ5EA9Cp2GRBmadC21LgECRXSS2LNbzriqYR4ye3DN9qZa+l+rObOA9/6jQsbe4miAd
	lWAfnHtqJ5YQ+N2SD4tXboyRZkQzgU9W6UZYn67bZvSu5bAwoKVRabDea7gPiq6NWZiTQ8vxQRxXa
	hzPfXHjspgfhO0qYiajkgfLV0JmPJ1U9j9OfZINTgKSh5SFe4DrFVPwqE7kITfpWCOsWMx8JUW8YH
	A3aoUTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso2j-00F3av-WB; Wed, 09 Nov 2022 16:35:14 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso2J-00F3KG-Rt; Wed, 09 Nov 2022 16:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=R2N+jSfSlY43TnrF1h50zfC2H3h4TDeeUUxvXDObycg=; b=Oz7nOGqVGIhjqu9jeS3nT4Kbfs
	PSWnp8/YhdyRWGxpJST3iAZeB/CvGM4hlDI2z0s0hvgvW5P7oPIiYbcRtdPXScAQmKSNJ+uIasf1W
	4rhCHSWzYSJsPV90qpbpYaZlVFCo2WLJztJvriYCj5gvnHN063jICFpX9MQzSyb/GurU=;
Received: from p200300daa72ee100054f3c61b16ef6e7.dip0.t-ipconnect.de ([2003:da:a72e:e100:54f:3c61:b16e:f6e7] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oso24-000l4N-Ln; Wed, 09 Nov 2022 17:34:32 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 03/12] net: ethernet: mtk_eth_soc: avoid port_mg assignment on MT7622 and newer
Date: Wed,  9 Nov 2022 17:34:17 +0100
Message-Id: <20221109163426.76164-4-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109163426.76164-1-nbd@nbd.name>
References: <20221109163426.76164-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_083447_921154_1E07E76D 
X-CRM114-Status: GOOD (  13.25  )
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
index 02a57729db28..9f607c80f49c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4243,7 +4243,7 @@ static const struct mtk_soc_data mt7621_data = {
 	.hw_features = MTK_HW_FEATURES,
 	.required_clks = MT7621_CLKS_BITMAP,
 	.required_pctl = false,
-	.offload_version = 2,
+	.offload_version = 1,
 	.hash_offset = 2,
 	.foe_entry_size = sizeof(struct mtk_foe_entry) - 16,
 	.txrx = {
@@ -4282,7 +4282,7 @@ static const struct mtk_soc_data mt7623_data = {
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


