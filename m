Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F84606A336
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HBZzGOrF;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MnT4/Myk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qusr3lCq74aTv9fkHSvA33QF2eEA6P4XZk0qY+alf1s=; b=HBZzGOrFJc+/Ss
	Vo6wZ4Vma30AURicpyr4py0Rb09NLUN7FgAc3Id1v4TV1qDFQv8tB8OeLgrn5tS0eOoC319pX0uHg
	FmFLhM0GpGi7e6CLc9xmt+yWzDyiu4is/CpdUow58ez2De6gXqiXyrgVz3EL+rk+SuucWPkSPialQ
	MFb+xppyVCFWcShUQ8EV1srLfi6OYsuzYjP4/noi0vrRDkclAWpLfev3ouwG3IVWEDCSTYUVsCOYh
	kVaZfMCLw0xE4LVbwtU2Yo7C4b5GnxXr34islcdwyqsXh8TNVjIGfd9GxO0y4TKU13lpDiwTntC3J
	VNJcNU9Rj0q2lFnTVfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkfS-00000003lNM-21KB;
	Tue, 10 Nov 2026 12:09:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkf0-00000003krB-3mqB;
	Tue, 10 Nov 2026 12:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794312548;
	bh=Wgr934lTDZL3+btac3ix2+Vp/TQVH/Zcp0CLN2iCsl0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MnT4/Myke0bKMfzkVUBm6ZRxJhjaQ1q6ZuKZrPBLYFGjd6NUmlsmYFmMHxkSRrLYo
	 nx/f3t78Ruk64+BkJyy1xsGzkvrhz1kNrMOdMuqaWXkyIUh+wVgM/ZLaWosTPNfI2F
	 w6qVczdrroXhUt3lNyoYP6+YKk5gedBzClhPL5OIKGogkiXKpS1QF6jWiqe8Xu6x3a
	 DQwA8NAUfdW9suFzeRx3mvvZ6fnlnlPyoEOZy+2qzv8v9bUm/sYaL35CghJLcf2Eu0
	 7BWayed10xaFyoDiuBLSSq34kcVIRPJDyctxsypxlJv7rPbzM1tQA4lTFgqVa0i/nI
	 8bUq1vbpYT9OA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9971A17E0971;
	Tue, 10 Nov 2026 13:09:07 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 10 Nov 2026 13:08:56 +0100
Subject: [PATCH net-next v5 09/10] net: stmmac: mediatek: add support for
 TX clock output enable feature
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dwmac-mediatek-mt8189-v5-9-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794312537; l=1678;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Wgr934lTDZL3+btac3ix2+Vp/TQVH/Zcp0CLN2iCsl0=;
 b=ajU6M3jMlhfUZtAkb+NKjwdPepxB2Qx11KQkD4w9nys4CZSqKDjj/5Ox1O2VIfMfjzT6ekftg
 P8lFewc5fmSBSxuddUChh3UFi4wZjKfOvMJy0Gf7ybgJqqHL0FSTf9g
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040912_441272_9A77FECF 
X-CRM114-Status: GOOD (  12.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT8189 SoC has in the Ethernet control 0 register from the
peripheral configuration (pericfg) an additional bit to enable the TX
clock signal output.

In preparation of MT8189 SoC support, add its definition, use in the
mt8195_set_interface callback, and a support flag in the platform
data.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 3f024d455cbd..1a0ab95dfbf0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -41,6 +41,9 @@
 #define MT2712_RGMII_DLY_STAGE_DIV	170 /* 170ps per stage */
 #define MT2712_RGMII_DELAY_MAX		5440 /* 32 x 170ps */
 
+/* Peri Configuration register for mt8189 */
+#define MT8189_CTRL0_TXC_OUT_OP_EN	BIT(20)
+
 /* Peri Configuration register for mt8195 */
 #define MT8195_PERI_ETH_CTRL_OFFSET	0xFD0
 
@@ -113,6 +116,7 @@ struct mediatek_dwmac_variant {
 	u16 rgmii_delay_stage_div;
 	u32 peri_eth_ctrl_offset;
 	u8 dma_bit_mask;
+	bool mac_txclk_out_en;
 };
 
 /* list of clocks required for mac */
@@ -307,6 +311,9 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 	/* MT8195 only support external PHY */
 	intf_val |= MT8195_EXT_PHY_MODE;
 
+	if (plat->variant->mac_txclk_out_en)
+		intf_val |= MT8189_CTRL0_TXC_OUT_OP_EN;
+
 	regmap_write(plat->peri_regmap,
 		     reg_offset + MT8195_PERI_ETH_CTRL0,
 		     intf_val);

-- 
2.56.0


