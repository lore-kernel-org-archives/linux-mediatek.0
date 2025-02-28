Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30574C19776
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2025 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsnpX7ZG8E+xuFUY2LX35Pw705pmLN+GGBMsbonMzF8=; b=JAbqu+fD1Trei7ygDSRbS1m1gC
	x6pOfGulpPMya3cAl0gzLBbf5kKMhBV+aAVXsaWD6pLSSAb3EmMCu9CLSj7RHSakJl+Yp/lnuGw1i
	D4KrHw+9CVfUC4U6dLinkylK6sSz/KEirgEr0sA0s/lmvVZ96TNIjQqhJtNurd/T6r+zHgwPFl0sv
	DZCbZL8D3tHOQpLHpdcfouQz0I/XTx/9cnfE62UTAZ8824Jpwh+EI57OsHJ7TueeBovfiUQcX+PnC
	26ym9QAvEGqDLxpyRTQj0drn/11GEhh7yDpeAjB8f4F6ieswoV8+d0Lorw9YkL3ZyvlNoJOd1tHXA
	Ntl/JYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnybv-0000000AlGf-1IIl;
	Fri, 28 Feb 2025 11:32:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tny10-0000000Af9T-28yQ;
	Fri, 28 Feb 2025 10:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58A2661F5E;
	Fri, 28 Feb 2025 10:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A5DC4CED6;
	Fri, 28 Feb 2025 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740740085;
	bh=Syook/k3osDoz8HpkUWZ96mxKRz3XOL/uBmVWEWdJH4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FfsVwlbb8rvfj7r4rO4Xer76kqqExjFpcIDtJBFuxjY3GR06Jay5n4Wg05DLtsLaA
	 uewgnHn9DIM7Shs8FOqCCXqJOcipEF0Sg7SpD3KJuoljTDRNJJ30F36HBh0sN86xMI
	 jlYxa9FaQqVLm3uPDjR+oSjHzRzouBj5qX0UhOxR26ZV+BrubaEJTFVAagQUSpjFyE
	 xufC74aRbVqibzDp04hJHgr79WzcHm6FeuBlxw1WiAYMwUmm6Dq0AzrsSCniCQQuuv
	 9eDtEITH30HsAfqBu4+kFwpS0z7t5HCxMre3gy/j6xSJJg2/uRue7glRxhMsO6N0RP
	 DA5PaL5SHNzCQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 28 Feb 2025 11:54:14 +0100
Subject: [PATCH net-next v8 06/15] net: dsa: mt7530: Enable Rx sptag for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-airoha-en7581-flowtable-offload-v8-6-01dc1653f46e@kernel.org>
References: <20250228-airoha-en7581-flowtable-offload-v8-0-01dc1653f46e@kernel.org>
In-Reply-To: <20250228-airoha-en7581-flowtable-offload-v8-0-01dc1653f46e@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
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

Packet Processor Engine (PPE) module used for hw acceleration on EN7581
mac block, in order to properly parse packets, requires DSA untagged
packets on TX side and read DSA tag from DMA descriptor on RX side.
For this reason, enable RX Special Tag (SPTAG) for EN7581 SoC.
This is a preliminary patch to enable netfilter flowtable hw offloading
on EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/dsa/mt7530.c | 5 +++++
 drivers/net/dsa/mt7530.h | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8422262febaf73821887e660c4db77047a91cffb..aaa36c27b0f9f6543db810a135b371bf1d326fa8 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2586,6 +2586,11 @@ mt7531_setup_common(struct dsa_switch *ds)
 	/* Allow mirroring frames received on the local port (monitor port). */
 	mt7530_set(priv, MT753X_AGC, LOCAL_EN);
 
+	/* Enable Special Tag for rx frames */
+	if (priv->id == ID_EN7581)
+		mt7530_write(priv, MT753X_CPORT_SPTAG_CFG,
+			     CPORT_SW2FE_STAG_EN | CPORT_FE2SW_STAG_EN);
+
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 448200689f492dcb73ef056d7284090c1c662e67..349d72a35771f35d478244ab29be1801b3466a5f 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -627,6 +627,10 @@ enum mt7531_xtal_fsel {
 #define  MT7531_GPIO12_RG_RXD3_MASK	GENMASK(19, 16)
 #define  MT7531_EXT_P_MDIO_12		(2 << 16)
 
+#define MT753X_CPORT_SPTAG_CFG		0x7c10
+#define  CPORT_SW2FE_STAG_EN		BIT(1)
+#define  CPORT_FE2SW_STAG_EN		BIT(0)
+
 /* Registers for LED GPIO control (MT7530 only)
  * All registers follow this pattern:
  * [ 2: 0]  port 0

-- 
2.48.1


