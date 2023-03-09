Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7F5C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 11:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCmjiPxcsC3L5K5dxUe4f7XacBmHm9izSBuMHT4nnOs=; b=wtIJDtcZQ1zq0iBa/noL65RfnZ
	7RUyxxtRCMHyg3LRpnfDvQMZ/FL7KU+0i5ZevZsiCE4jQHZFIvCNhgaHxxIso6nt9+7m4i0dmnpGB
	nMC/8tMke7hODzW7roPVPZIyjUXA/dAihG7xMMy5XzOE1STFEEwc6hUi1y4JJ7kn2XG/3ndVHfnse
	5YJGxStA49OyD47X7+WV5dYgZ5tFnx/ppwFwbrUopDyquJTij4/MIYowylPqbKaYAR6N7dq+SuoxP
	UMXQXH7paW3lW5qOHMjm/00udjWN3qL9PD+1Ow3FnOGW7/trsvIK9sBpIJYIxZsy2ceJ4yUtz9vcd
	/jePCjfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEKq-009RQu-0V; Thu, 09 Mar 2023 11:21:24 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paE0j-009HkI-0s; Thu, 09 Mar 2023 11:00:38 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1paE0h-0003gY-25;
	Thu, 09 Mar 2023 12:00:35 +0100
Date: Thu, 9 Mar 2023 10:58:58 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH net-next v13 16/16] net: ethernet: mtk_eth_soc: convert caps
 in mtk_soc_data struct to u64
Message-ID: <2d10d7a2de2a94f475c5134868580ddef4852c11.1678357225.git.daniel@makrotopia.org>
References: <cover.1678357225.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678357225.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_030037_099925_69922263 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Alexander Couzens <lynxis@fe80.eu>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

This is a preliminary patch to introduce support for MT7988 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_path.c | 22 ++++++++++----------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h  |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_path.c b/drivers/net/ethernet/mediatek/mtk_eth_path.c
index 317e447f4991..34ac492e047c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_path.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_path.c
@@ -15,10 +15,10 @@
 struct mtk_eth_muxc {
 	const char	*name;
 	int		cap_bit;
-	int		(*set_path)(struct mtk_eth *eth, int path);
+	int		(*set_path)(struct mtk_eth *eth, u64 path);
 };
 
-static const char *mtk_eth_path_name(int path)
+static const char *mtk_eth_path_name(u64 path)
 {
 	switch (path) {
 	case MTK_ETH_PATH_GMAC1_RGMII:
@@ -40,7 +40,7 @@ static const char *mtk_eth_path_name(int path)
 	}
 }
 
-static int set_mux_gdm1_to_gmac1_esw(struct mtk_eth *eth, int path)
+static int set_mux_gdm1_to_gmac1_esw(struct mtk_eth *eth, u64 path)
 {
 	bool updated = true;
 	u32 val, mask, set;
@@ -71,7 +71,7 @@ static int set_mux_gdm1_to_gmac1_esw(struct mtk_eth *eth, int path)
 	return 0;
 }
 
-static int set_mux_gmac2_gmac0_to_gephy(struct mtk_eth *eth, int path)
+static int set_mux_gmac2_gmac0_to_gephy(struct mtk_eth *eth, u64 path)
 {
 	unsigned int val = 0;
 	bool updated = true;
@@ -94,7 +94,7 @@ static int set_mux_gmac2_gmac0_to_gephy(struct mtk_eth *eth, int path)
 	return 0;
 }
 
-static int set_mux_u3_gmac2_to_qphy(struct mtk_eth *eth, int path)
+static int set_mux_u3_gmac2_to_qphy(struct mtk_eth *eth, u64 path)
 {
 	unsigned int val = 0, mask = 0, reg = 0;
 	bool updated = true;
@@ -125,7 +125,7 @@ static int set_mux_u3_gmac2_to_qphy(struct mtk_eth *eth, int path)
 	return 0;
 }
 
-static int set_mux_gmac1_gmac2_to_sgmii_rgmii(struct mtk_eth *eth, int path)
+static int set_mux_gmac1_gmac2_to_sgmii_rgmii(struct mtk_eth *eth, u64 path)
 {
 	unsigned int val = 0;
 	bool updated = true;
@@ -163,7 +163,7 @@ static int set_mux_gmac1_gmac2_to_sgmii_rgmii(struct mtk_eth *eth, int path)
 	return 0;
 }
 
-static int set_mux_gmac12_to_gephy_sgmii(struct mtk_eth *eth, int path)
+static int set_mux_gmac12_to_gephy_sgmii(struct mtk_eth *eth, u64 path)
 {
 	unsigned int val = 0;
 	bool updated = true;
@@ -218,7 +218,7 @@ static const struct mtk_eth_muxc mtk_eth_muxc[] = {
 	},
 };
 
-static int mtk_eth_mux_setup(struct mtk_eth *eth, int path)
+static int mtk_eth_mux_setup(struct mtk_eth *eth, u64 path)
 {
 	int i, err = 0;
 
@@ -249,7 +249,7 @@ static int mtk_eth_mux_setup(struct mtk_eth *eth, int path)
 
 int mtk_gmac_sgmii_path_setup(struct mtk_eth *eth, int mac_id)
 {
-	int path;
+	u64 path;
 
 	path = (mac_id == 0) ?  MTK_ETH_PATH_GMAC1_SGMII :
 				MTK_ETH_PATH_GMAC2_SGMII;
@@ -260,7 +260,7 @@ int mtk_gmac_sgmii_path_setup(struct mtk_eth *eth, int mac_id)
 
 int mtk_gmac_gephy_path_setup(struct mtk_eth *eth, int mac_id)
 {
-	int path = 0;
+	u64 path = 0;
 
 	if (mac_id == 1)
 		path = MTK_ETH_PATH_GMAC2_GEPHY;
@@ -274,7 +274,7 @@ int mtk_gmac_gephy_path_setup(struct mtk_eth *eth, int mac_id)
 
 int mtk_gmac_rgmii_path_setup(struct mtk_eth *eth, int mac_id)
 {
-	int path;
+	u64 path;
 
 	path = (mac_id == 0) ?  MTK_ETH_PATH_GMAC1_RGMII :
 				MTK_ETH_PATH_GMAC2_RGMII;
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index e4f6cca8a3a8..e5bfc2d891ad 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1069,7 +1069,7 @@ struct mtk_reg_map {
 struct mtk_soc_data {
 	const struct mtk_reg_map *reg_map;
 	u32             ana_rgc3;
-	u32		caps;
+	u64		caps;
 	u32		required_clks;
 	bool		required_pctl;
 	u8		offload_version;
-- 
2.39.2


