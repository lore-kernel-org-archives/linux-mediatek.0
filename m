Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CF3C001DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 21:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uXi/bUIORJV4eq4SZu3fNzXWeEh0eoJj1vjtzZU8Z0=; b=U/QVHs0RxK7v7tSgKPiebAHzdZ
	154mY5+WMjAerwWP4GFlqxGvzoo1lR9RmFn5apC6ppHKUyBt04a3Fo9ogwNeCRienogXtqcEANxgO
	EOaIN7IeB2JFqxY3AZjPf+CoDD2F7VxCw0SL84YbDy220qk+E99bstiMj67LEb9A1IjnqlToXS0pj
	IVkQzD8hJumanypC7Wx1BvpL9K3ydsUFbni2n4RV6boklIV6tgcA+CeMJvTykVghiAhJGPoErY1fE
	cu+ePl7MkFAuaXG9aFFmfTyuzhtLoNTKjfr1VOAvEh6oLGBfRmmbRwYjl+07K4xJCxP3dMDlrwYol
	s1/v3vDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMxmO-00FBdQ-0X;
	Fri, 21 Jul 2023 21:35:16 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMxmK-00FBbu-1z;
	Fri, 21 Jul 2023 21:35:14 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMxm6-0004dZ-09;
	Fri, 21 Jul 2023 21:34:58 +0000
Date: Fri, 21 Jul 2023 22:34:50 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Greg Ungerer <gerg@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 8/9] net: ethernet: mtk_eth_soc: convert clock bitmap to
 u64
Message-ID: <81a1f2b59001b42d9a81b4454043e689e97fa50b.1689974536.git.daniel@makrotopia.org>
References: <cover.1689974536.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689974536.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_143512_653206_D9E71899 
X-CRM114-Status: GOOD (  11.25  )
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

The to-be-added MT7988 SoC adds many new clocks which need to be
controlled by the Ethernet driver, which will result in their total
number exceeding 32.
Prepare by converting clock bitmaps into 64-bit types.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 96 +++++++++++----------
 1 file changed, 49 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 8d8601e553478..38c212b50f776 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -666,54 +666,56 @@ enum mtk_clks_map {
 	MTK_CLK_MAX
 };
 
-#define MT7623_CLKS_BITMAP	(BIT(MTK_CLK_ETHIF) | BIT(MTK_CLK_ESW) |  \
-				 BIT(MTK_CLK_GP1) | BIT(MTK_CLK_GP2) | \
-				 BIT(MTK_CLK_TRGPLL))
-#define MT7622_CLKS_BITMAP	(BIT(MTK_CLK_ETHIF) | BIT(MTK_CLK_ESW) |  \
-				 BIT(MTK_CLK_GP0) | BIT(MTK_CLK_GP1) | \
-				 BIT(MTK_CLK_GP2) | \
-				 BIT(MTK_CLK_SGMII_TX_250M) | \
-				 BIT(MTK_CLK_SGMII_RX_250M) | \
-				 BIT(MTK_CLK_SGMII_CDR_REF) | \
-				 BIT(MTK_CLK_SGMII_CDR_FB) | \
-				 BIT(MTK_CLK_SGMII_CK) | \
-				 BIT(MTK_CLK_ETH2PLL))
+#define MT7623_CLKS_BITMAP	(BIT_ULL(MTK_CLK_ETHIF) | BIT_ULL(MTK_CLK_ESW) |  \
+				 BIT_ULL(MTK_CLK_GP1) | BIT_ULL(MTK_CLK_GP2) | \
+				 BIT_ULL(MTK_CLK_TRGPLL))
+#define MT7622_CLKS_BITMAP	(BIT_ULL(MTK_CLK_ETHIF) | BIT_ULL(MTK_CLK_ESW) |  \
+				 BIT_ULL(MTK_CLK_GP0) | BIT_ULL(MTK_CLK_GP1) | \
+				 BIT_ULL(MTK_CLK_GP2) | \
+				 BIT_ULL(MTK_CLK_SGMII_TX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII_RX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII_CDR_REF) | \
+				 BIT_ULL(MTK_CLK_SGMII_CDR_FB) | \
+				 BIT_ULL(MTK_CLK_SGMII_CK) | \
+				 BIT_ULL(MTK_CLK_ETH2PLL))
 #define MT7621_CLKS_BITMAP	(0)
 #define MT7628_CLKS_BITMAP	(0)
-#define MT7629_CLKS_BITMAP	(BIT(MTK_CLK_ETHIF) | BIT(MTK_CLK_ESW) |  \
-				 BIT(MTK_CLK_GP0) | BIT(MTK_CLK_GP1) | \
-				 BIT(MTK_CLK_GP2) | BIT(MTK_CLK_FE) | \
-				 BIT(MTK_CLK_SGMII_TX_250M) | \
-				 BIT(MTK_CLK_SGMII_RX_250M) | \
-				 BIT(MTK_CLK_SGMII_CDR_REF) | \
-				 BIT(MTK_CLK_SGMII_CDR_FB) | \
-				 BIT(MTK_CLK_SGMII2_TX_250M) | \
-				 BIT(MTK_CLK_SGMII2_RX_250M) | \
-				 BIT(MTK_CLK_SGMII2_CDR_REF) | \
-				 BIT(MTK_CLK_SGMII2_CDR_FB) | \
-				 BIT(MTK_CLK_SGMII_CK) | \
-				 BIT(MTK_CLK_ETH2PLL) | BIT(MTK_CLK_SGMIITOP))
-#define MT7981_CLKS_BITMAP	(BIT(MTK_CLK_FE) | BIT(MTK_CLK_GP2) | BIT(MTK_CLK_GP1) | \
-				 BIT(MTK_CLK_WOCPU0) | \
-				 BIT(MTK_CLK_SGMII_TX_250M) | \
-				 BIT(MTK_CLK_SGMII_RX_250M) | \
-				 BIT(MTK_CLK_SGMII_CDR_REF) | \
-				 BIT(MTK_CLK_SGMII_CDR_FB) | \
-				 BIT(MTK_CLK_SGMII2_TX_250M) | \
-				 BIT(MTK_CLK_SGMII2_RX_250M) | \
-				 BIT(MTK_CLK_SGMII2_CDR_REF) | \
-				 BIT(MTK_CLK_SGMII2_CDR_FB) | \
-				 BIT(MTK_CLK_SGMII_CK))
-#define MT7986_CLKS_BITMAP	(BIT(MTK_CLK_FE) | BIT(MTK_CLK_GP2) | BIT(MTK_CLK_GP1) | \
-				 BIT(MTK_CLK_WOCPU1) | BIT(MTK_CLK_WOCPU0) | \
-				 BIT(MTK_CLK_SGMII_TX_250M) | \
-				 BIT(MTK_CLK_SGMII_RX_250M) | \
-				 BIT(MTK_CLK_SGMII_CDR_REF) | \
-				 BIT(MTK_CLK_SGMII_CDR_FB) | \
-				 BIT(MTK_CLK_SGMII2_TX_250M) | \
-				 BIT(MTK_CLK_SGMII2_RX_250M) | \
-				 BIT(MTK_CLK_SGMII2_CDR_REF) | \
-				 BIT(MTK_CLK_SGMII2_CDR_FB))
+#define MT7629_CLKS_BITMAP	(BIT_ULL(MTK_CLK_ETHIF) | BIT_ULL(MTK_CLK_ESW) |  \
+				 BIT_ULL(MTK_CLK_GP0) | BIT_ULL(MTK_CLK_GP1) | \
+				 BIT_ULL(MTK_CLK_GP2) | BIT_ULL(MTK_CLK_FE) | \
+				 BIT_ULL(MTK_CLK_SGMII_TX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII_RX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII_CDR_REF) | \
+				 BIT_ULL(MTK_CLK_SGMII_CDR_FB) | \
+				 BIT_ULL(MTK_CLK_SGMII2_TX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII2_RX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII2_CDR_REF) | \
+				 BIT_ULL(MTK_CLK_SGMII2_CDR_FB) | \
+				 BIT_ULL(MTK_CLK_SGMII_CK) | \
+				 BIT_ULL(MTK_CLK_ETH2PLL) | BIT_ULL(MTK_CLK_SGMIITOP))
+#define MT7981_CLKS_BITMAP	(BIT_ULL(MTK_CLK_FE) | BIT_ULL(MTK_CLK_GP2) | \
+				 BIT_ULL(MTK_CLK_GP1) | \
+				 BIT_ULL(MTK_CLK_WOCPU0) | \
+				 BIT_ULL(MTK_CLK_SGMII_TX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII_RX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII_CDR_REF) | \
+				 BIT_ULL(MTK_CLK_SGMII_CDR_FB) | \
+				 BIT_ULL(MTK_CLK_SGMII2_TX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII2_RX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII2_CDR_REF) | \
+				 BIT_ULL(MTK_CLK_SGMII2_CDR_FB) | \
+				 BIT_ULL(MTK_CLK_SGMII_CK))
+#define MT7986_CLKS_BITMAP	(BIT_ULL(MTK_CLK_FE) | BIT_ULL(MTK_CLK_GP2) | \
+				 BIT_ULL(MTK_CLK_GP1) | \
+				 BIT_ULL(MTK_CLK_WOCPU1) | BIT_ULL(MTK_CLK_WOCPU0) | \
+				 BIT_ULL(MTK_CLK_SGMII_TX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII_RX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII_CDR_REF) | \
+				 BIT_ULL(MTK_CLK_SGMII_CDR_FB) | \
+				 BIT_ULL(MTK_CLK_SGMII2_TX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII2_RX_250M) | \
+				 BIT_ULL(MTK_CLK_SGMII2_CDR_REF) | \
+				 BIT_ULL(MTK_CLK_SGMII2_CDR_FB))
 
 enum mtk_dev_state {
 	MTK_HW_INIT,
@@ -1046,7 +1048,7 @@ struct mtk_soc_data {
 	const struct mtk_reg_map *reg_map;
 	u32             ana_rgc3;
 	u64		caps;
-	u32		required_clks;
+	u64		required_clks;
 	bool		required_pctl;
 	u8		offload_version;
 	u8		hash_offset;
-- 
2.41.0

