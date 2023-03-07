Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17609C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycdKN3sOPwnCSxM804I8obWYzgO8KiBJWKkURO/44Vk=; b=jC7u5O9CaewJf2aIrgxBY1FklT
	84M9iGAkO8E1HQey7BFPEs1G6henX7amzfdqseJNHtCtUHmL8TO+VkVxE+M9eWxc6L87a1ybg0Qi8
	rp/+e6al5tshPy9g+Alk8Sr9GVVFiwD/ggPMrxov0kS327nQD9SCV39It/O8wSYCdPItmVtuRAhJe
	3NOVSuHMn9wCSBPCTfeShVFVKPg5uUZcFlf1TnCTvOJtFw+65R57weGbS+8MQPm2t+SdQZbDnH8eN
	WbMe9uF9ODYzWCkRfwz2eNaRxen8T45w/LOAZSABWPvBkZVCNeoJ/0e1GcKsaF0eoMQoIsjduUYgy
	unvVZpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZgF-001L7z-CB; Tue, 07 Mar 2023 15:56:47 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZfK-001KSg-Ix; Tue, 07 Mar 2023 15:55:51 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pZZfI-0001s0-2A;
	Tue, 07 Mar 2023 16:55:48 +0100
Date: Tue, 7 Mar 2023 15:54:11 +0000
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
Subject: [PATCH net-next v12 09/18] net: ethernet: mtk_eth_soc: Fix link
 status for none-SGMII modes
Message-ID: <1590fb0e69f6243ac6a961b16bf7ae7534f46949.1678201958.git.daniel@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678201958.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_075550_658161_AAB58FBD 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: Alexander Couzens <lynxis@fe80.eu>, Jianhui Zhao <zhaojh329@gmail.com>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Link partner advertised link modes are not reported by the SerDes
hardware if not operating in SGMII mode. Hence we cannot use
phylink_mii_c22_pcs_decode_state() in this case.
Implement reporting link and an_complete only and use speed according to
the interface mode.

Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 26 ++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 58d8cb3aa7f4..98d80007d3bd 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -23,14 +23,30 @@ static void mtk_pcs_get_state(struct phylink_pcs *pcs,
 			      struct phylink_link_state *state)
 {
 	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
-	unsigned int bm, adv;
+	unsigned int bm, bmsr, adv;
 
-	/* Read the BMSR and LPA */
+	/* Read the BMSR */
 	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &bm);
-	regmap_read(mpcs->regmap, SGMSYS_PCS_ADVERTISE, &adv);
+	bmsr = FIELD_GET(SGMII_BMSR, bm);
 
-	phylink_mii_c22_pcs_decode_state(state, FIELD_GET(SGMII_BMSR, bm),
-					 FIELD_GET(SGMII_LPA, adv));
+	/* link partner advertised link modes are not reported by the
+	 * hardware when not operating in SGMII mode. Hence we cannot
+	 * use phylink_mii_c22_pcs_decode_state() in this case.
+	 */
+	if (state->interface != PHY_INTERFACE_MODE_SGMII) {
+		state->link = !!(bmsr & BMSR_LSTATUS);
+		state->an_complete = !!(bmsr & BMSR_ANEGCOMPLETE);
+		state->speed = (state->interface ==
+				PHY_INTERFACE_MODE_2500BASEX) ?
+			       SPEED_2500 : SPEED_1000;
+		state->duplex = DUPLEX_FULL;
+
+		return;
+	}
+
+	/* Read LPA and use standard decode function for SGMII mode */
+	regmap_read(mpcs->regmap, SGMSYS_PCS_ADVERTISE, &adv);
+	phylink_mii_c22_pcs_decode_state(state, bmsr, FIELD_GET(SGMII_LPA, adv));
 }
 
 static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
-- 
2.39.2


