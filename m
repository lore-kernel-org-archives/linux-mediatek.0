Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC2CC43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 06:52:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F1B215EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 06:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C6vHeDVp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lcSBSZ8s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80F1B215EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nvie7l1oWgZxF4RbHZr235h9D4AKztNO6tg2NnjwsaI=; b=C6vHeDVp2qLlkV
	FnrqQwkxZl2xAhoVPKq2DTjnsgrekPzz2wj6fiP1xmmk+F1A5Mymx2o6afR6pvYeFZ3WXP+Ktgxa3
	rc0VaGIYClkUnPaBTBIqQk9V1RgbV1qw/WsotyYzpKrUX7ra4t79eS/f/Dl8zqRtmKOtvieEjxBmi
	lvI0YB64tRjX1lp+zxdaeNoUfjW4ezahP2pLUk0gVdNGHxY72ybYetYZVIneLt2wYDnMXefJI87qq
	T57fZtSTwyRp2TQT4fdA79krlX9UjbUkufT0nj1xXBH1tdLcNBf7hUp7+8ByafpcAO9d+XcSJpTUZ
	9XMr5OtBX6JKbrtmdz4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU3YS-0000Q2-2M; Mon, 11 Nov 2019 06:52:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU3Y3-0008Ov-RW; Mon, 11 Nov 2019 06:51:41 +0000
X-UUID: 849852297a0f43c49f3cd7a85105dbc2-20191110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qynSAl3x/VKKJ0ZHs5xhmevf9UQ9FCm09E5Yqh7E/2A=; 
 b=lcSBSZ8sDEl/en6EXHmRXDhqKN8UIdGXWWI9Nr/uvsuJF5awNFuqxiel/Uz0irD4KKZ1Cmp8SqcKtTQP50Hlm6PRZ+3QGJYECUz27DZkz/VgIe5RBPdnm5x1dy1oKDfbUQErhmRDX2Ew2o1CtpXrGv4mZMWvXtk+q9I5wR1rDn8=;
X-UUID: 849852297a0f43c49f3cd7a85105dbc2-20191110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-mc.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 23765847; Sun, 10 Nov 2019 22:51:41 -0800
Received: from mtkmbs05dr.mediatek.inc (172.21.101.97) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 10 Nov 2019 22:51:29 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05dr.mediatek.inc (172.21.101.97) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 11 Nov 2019 14:51:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 11 Nov 2019 14:51:28 +0800
From: MarkLee <Mark-MC.Lee@mediatek.com>
To: "David S. Miller" <davem@davemloft.net>, Sean Wang
 <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net,
 v2 1/3] net: ethernet: mediatek: Integrate GDM/PSE setup operations
Date: Mon, 11 Nov 2019 14:51:27 +0800
Message-ID: <20191111065129.30078-2-Mark-MC.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191111065129.30078-1-Mark-MC.Lee@mediatek.com>
References: <20191111065129.30078-1-Mark-MC.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_225139_900153_32653852 
X-CRM114-Status: GOOD (  11.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jakub
 Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rene van Dorst <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 MarkLee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Integrate GDM/PSE setup operations into single function "mtk_gdm_config"

Signed-off-by: MarkLee <Mark-MC.Lee@mediatek.com>
--
v1->v2:
* Use the macro "MTK_MAC_COUNT" instead of a magic constant

---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 37 +++++++++++++--------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  1 +
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 703adb96429e..6e7a7fea2f52 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2180,6 +2180,28 @@ static int mtk_start_dma(struct mtk_eth *eth)
 	return 0;
 }
 
+static void mtk_gdm_config(struct mtk_eth *eth, u32 config)
+{
+	int i;
+
+	for (i = 0; i < MTK_MAC_COUNT; i++) {
+		u32 val = mtk_r32(eth, MTK_GDMA_FWD_CFG(i));
+
+		/* default setup the forward port to send frame to PDMA */
+		val &= ~0xffff;
+
+		/* Enable RX checksum */
+		val |= MTK_GDMA_ICS_EN | MTK_GDMA_TCS_EN | MTK_GDMA_UCS_EN;
+
+		val |= config;
+
+		mtk_w32(eth, val, MTK_GDMA_FWD_CFG(i));
+	}
+	/*Reset and enable PSE*/
+	mtk_w32(eth, RST_GL_PSE, MTK_RST_GL);
+	mtk_w32(eth, 0, MTK_RST_GL);
+}
+
 static int mtk_open(struct net_device *dev)
 {
 	struct mtk_mac *mac = netdev_priv(dev);
@@ -2375,8 +2397,6 @@ static int mtk_hw_init(struct mtk_eth *eth)
 	mtk_w32(eth, 0, MTK_QDMA_DELAY_INT);
 	mtk_tx_irq_disable(eth, ~0);
 	mtk_rx_irq_disable(eth, ~0);
-	mtk_w32(eth, RST_GL_PSE, MTK_RST_GL);
-	mtk_w32(eth, 0, MTK_RST_GL);
 
 	/* FE int grouping */
 	mtk_w32(eth, MTK_TX_DONE_INT, MTK_PDMA_INT_GRP1);
@@ -2385,18 +2405,7 @@ static int mtk_hw_init(struct mtk_eth *eth)
 	mtk_w32(eth, MTK_RX_DONE_INT, MTK_QDMA_INT_GRP2);
 	mtk_w32(eth, 0x21021000, MTK_FE_INT_GRP);
 
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
-		u32 val = mtk_r32(eth, MTK_GDMA_FWD_CFG(i));
-
-		/* setup the forward port to send frame to PDMA */
-		val &= ~0xffff;
-
-		/* Enable RX checksum */
-		val |= MTK_GDMA_ICS_EN | MTK_GDMA_TCS_EN | MTK_GDMA_UCS_EN;
-
-		/* setup the mac dma */
-		mtk_w32(eth, val, MTK_GDMA_FWD_CFG(i));
-	}
+	mtk_gdm_config(eth, MTK_GDMA_TO_PDMA);
 
 	return 0;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 76bd12cb8150..b16d8d9b196a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -84,6 +84,7 @@
 #define MTK_GDMA_ICS_EN		BIT(22)
 #define MTK_GDMA_TCS_EN		BIT(21)
 #define MTK_GDMA_UCS_EN		BIT(20)
+#define MTK_GDMA_TO_PDMA	0x0
 
 /* Unicast Filter MAC Address Register - Low */
 #define MTK_GDMA_MAC_ADRL(x)	(0x508 + (x * 0x1000))
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
