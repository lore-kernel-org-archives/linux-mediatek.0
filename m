Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC2BC4829A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Feb 2024 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXhoDwLT/QYD+UR1ERqNXhI5lFq76XtXf/m+zKMIMKk=; b=MJGVeofWe9GOtFQxm3ybtkU/0p
	kDGG6MBgKpFUtmDZBZgVhV/6mhuSm11sl+IeF0a/AIv2BzR3AfwFgoz3RCSYFKSNdYTe8xRbJveOv
	cE6ON1QQf0a7YwrPuP2c5se837Ulcx1u2JoW3Nk2pN2JAeBjROHBzVJZsxHhw4e03eE20uMQS/j50
	BcPlhh+JPxgNVPFHf8fhPdRjZMA56nrTWDtjHh3CfN44udYmht8hKhyeO89OXp2HrbBIRDP5+TZAB
	3mBl7MObGoXTjYSOVoEuRirjrws8rxrJCZaIlwSHx9uSraEReOA1pdGIIX6qGVSnq0Olh0QJTLVTe
	MJtgwSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYlwe-00000001azk-0eYN;
	Sat, 10 Feb 2024 11:54:56 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYlwZ-00000001axi-0JXm;
	Sat, 10 Feb 2024 11:54:52 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-51167e470f7so2218409e87.2;
        Sat, 10 Feb 2024 03:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707566088; x=1708170888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXhoDwLT/QYD+UR1ERqNXhI5lFq76XtXf/m+zKMIMKk=;
        b=h930VF0HIcPGI1C0fSzZpEkSMRrkxwFW+np6lSNl13CMY2sM2nkHa8x064g7e4JoFr
         0JQqcWaLEZEVnxluAZDO8SMjAZGxJEEh3D3qltHTVnGixEtmB1oG1TPIJFwxcASpUKsa
         I4qCaOyd5Xn8i3ih9XxPs56AChMzrZ7XwiNXA2P3faUWDS4eaoUSA6pH/4lo484GYHtX
         wrzdPF/+sQN3ktD8U4dOsR7s+rfT2tGX+jWFBM10YH3eg0ZVleAx4T80TKZ1WQmjxzIj
         HAjHGyTph+iLqVukzunLkD86Sq64CVm7VGqfBXqJ60zx/WFkwFXwok190N8OdzMQ6wq4
         TWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707566088; x=1708170888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXhoDwLT/QYD+UR1ERqNXhI5lFq76XtXf/m+zKMIMKk=;
        b=ZtaWGNrxjUVXraFlU7kL4tlJYR+HxKm6yq4QCU3aZXCc2lIbkQQt1p6crjAkvRK8HW
         xYqyHCCtd+p6qeD3U1mL64A5YdbgXShkJn/NkmMHH9L/hsOq909xfNv8TawIqEQaXCiH
         Jpuj3335PiuVRfna7tG3Kvnj+2sMxKIccxh+RlePXpd44ldMOzcDsmg6d4BakoVyg3dy
         mQjFi7k2Y79U7MScMQ4ZmCrP0gaRj3AvP3Zmo8JqDOA4TfXgV6VmVOp9Nd1Jg/efC4ka
         JQ8RwM2Yemp7/sp/0NdG67esfMEkoaYjf1v0PNKCJ4/oJKp8P00Xi6dibcliKF5SW/i3
         r18g==
X-Forwarded-Encrypted: i=1; AJvYcCXWrMj735cinPzeI1Yt8CyYXqphg5aYSzij6AyxwZsrggKMqG4qHhc/UCgvGTaFL9M0EZ5rv3Ol+57J1+RwgveDBtJQMAU8nO3uwm8wN/tzxd1d8xPjQS/panj3bIQPThR9UDAy9bQDipz1/4K46wMhc6tqvEqlDF8=
X-Gm-Message-State: AOJu0YyCSGModeScVkkVLVdUqe/tpaccOLJ8WX306tAxyUjDuw63bHh7
	7mdqe+PZ9vUNYnBHag2OBqKnbPJ6a09YRYBbLDKf13eAeXJu7/zz
X-Google-Smtp-Source: AGHT+IGVgXBWrJR8HBBYCiONz9iH2SciZ+IXkQzOT5GRVjrwv4vx1xk3l+nlNmheGw0J22mDFBP90w==
X-Received: by 2002:ac2:4ac9:0:b0:511:7b35:9563 with SMTP id m9-20020ac24ac9000000b005117b359563mr916952lfp.19.1707566088232;
        Sat, 10 Feb 2024 03:54:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZ4HxutTqL5srSrYVT8MnyaxBLcnWI3owl87NpddswlsfSM89KKKUDmP+V2WPikdUsWjIs/cyOBGeze50lQrDswbo8bz/abdCGUU/8W9nl5lzvfsMCzyUcOBfSifI3oBv9z87zBoBgpoCdxcf5TfsR612k42CogQ/Mwdf2uAbruKTWanK5FSrF/EnxDq924wEK4nKYeQVW9ef4FxBkfKeCJx6iloiJ5yYeTZjEqG3l5CAVKQ7Xk7WfAHTYI4eSYCKRlcyuE/vDI7tVWP3Re5sIsZ49rii2mMR2YmWcdi+vujT3Yhv1gBPvAh6qRB7Q+9HAaPIfQzzTieulwWIkdKPp/fAhDxvT4I3kO+NDKgzWuGOoXgt96IcVh9o/16ksMSomVp7TlQntzMh2j2GXG/OEbkmZQcGMPA0bVWTsVGA6gt4/hANOGG0D8yZCNJPwqTn+XOMRWVmXthqC+nNdcAvqxOCXdFn/aX3O7gxrn8j47umPqAgiX8gpupquGsDS8AOreJX+ijQWU4+Xlc4ESGCdxL0MAkNynl4nvUhjxGsc1Vx/2jliCrja
Received: from localhost.localdomain ([176.230.105.209])
        by smtp.gmail.com with ESMTPSA id bo9-20020a056000068900b0033affaade9csm1694164wrb.68.2024.02.10.03.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 03:54:47 -0800 (PST)
From: Elad Yifee <eladwf@gmail.com>
To: 
Cc: eladwf@gmail.com,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2] net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs
Date: Sat, 10 Feb 2024 13:53:28 +0200
Message-ID: <20240210115420.27003-1-eladwf@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130160854.5221-1-eladwf@gmail.com>
References: <20240130160854.5221-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_035451_167095_C6FC8989 
X-CRM114-Status: GOOD (  25.73  )
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

Add the missing pieces to allow multiple PPEs units, one for each GMAC.
mtk_gdm_config has been modified to work on targted mac ID,
the inner loop moved outside of the function to allow unrelated
operations like setting the MAC's PPE index.

Signed-off-by: Elad Yifee <eladwf@gmail.com>
---
v2: fixed CI warnings
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 86 +++++++++++--------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 15 +++-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |  6 +-
 3 files changed, 68 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index a6e91573f8da..5a50c22179af 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2175,9 +2175,11 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				skb_dst_set_noref(skb, &eth->dsa_meta[port]->dst);
 		}
 
-		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
-			mtk_ppe_check_skb(eth->ppe[0], skb, hash);
+		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED) {
+			unsigned int ppe_index = eth->mac[mac]->ppe_idx;
 
+			mtk_ppe_check_skb(eth->ppe[ppe_index], skb, hash);
+		}
 		skb_record_rx_queue(skb, 0);
 		napi_gro_receive(napi, skb);
 
@@ -3267,37 +3269,27 @@ static int mtk_start_dma(struct mtk_eth *eth)
 	return 0;
 }
 
-static void mtk_gdm_config(struct mtk_eth *eth, u32 config)
+static void mtk_gdm_config(struct mtk_eth *eth, u32 id, u32 config)
 {
-	int i;
+	u32 val;
 
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
 		return;
 
-	for (i = 0; i < MTK_MAX_DEVS; i++) {
-		u32 val;
-
-		if (!eth->netdev[i])
-			continue;
-
-		val = mtk_r32(eth, MTK_GDMA_FWD_CFG(i));
+	val = mtk_r32(eth, MTK_GDMA_FWD_CFG(id));
 
-		/* default setup the forward port to send frame to PDMA */
-		val &= ~0xffff;
+	/* default setup the forward port to send frame to PDMA */
+	val &= ~0xffff;
 
-		/* Enable RX checksum */
-		val |= MTK_GDMA_ICS_EN | MTK_GDMA_TCS_EN | MTK_GDMA_UCS_EN;
+	/* Enable RX checksum */
+	val |= MTK_GDMA_ICS_EN | MTK_GDMA_TCS_EN | MTK_GDMA_UCS_EN;
 
-		val |= config;
+	val |= config;
 
-		if (netdev_uses_dsa(eth->netdev[i]))
-			val |= MTK_GDMA_SPECIAL_TAG;
+	if (eth->netdev[id] && netdev_uses_dsa(eth->netdev[id]))
+		val |= MTK_GDMA_SPECIAL_TAG;
 
-		mtk_w32(eth, val, MTK_GDMA_FWD_CFG(i));
-	}
-	/* Reset and enable PSE */
-	mtk_w32(eth, RST_GL_PSE, MTK_RST_GL);
-	mtk_w32(eth, 0, MTK_RST_GL);
+	mtk_w32(eth, val, MTK_GDMA_FWD_CFG(id));
 }
 
 
@@ -3369,6 +3361,7 @@ static int mtk_open(struct net_device *dev)
 	/* we run 2 netdevs on the same dma ring so we only bring it up once */
 	if (!refcount_read(&eth->dma_refcnt)) {
 		const struct mtk_soc_data *soc = eth->soc;
+		const u32 ppe_num = mtk_get_ppe_num(eth);
 		u32 gdm_config;
 		int i;
 
@@ -3381,18 +3374,39 @@ static int mtk_open(struct net_device *dev)
 		for (i = 0; i < ARRAY_SIZE(eth->ppe); i++)
 			mtk_ppe_start(eth->ppe[i]);
 
-		gdm_config = soc->offload_version ? soc->reg_map->gdma_to_ppe
-						  : MTK_GDMA_TO_PDMA;
-		mtk_gdm_config(eth, gdm_config);
+		for (i = 0; i < MTK_MAX_DEVS; i++) {
+			if (!eth->netdev[i])
+				break;
+			struct mtk_mac *target_mac;
+
+			target_mac = netdev_priv(eth->netdev[i]);
+			if (!soc->offload_version) {
+				target_mac->ppe_idx = 0;
+				gdm_config = MTK_GDMA_TO_PDMA;
+			} else if (ppe_num >= 3 && target_mac->id == 2) {
+				target_mac->ppe_idx = 2;
+				gdm_config = MTK_GDMA_TO_PPE2;
+			} else if (ppe_num >= 2 && target_mac->id == 1) {
+				target_mac->ppe_idx = 1;
+				gdm_config = MTK_GDMA_TO_PPE1;
+			} else {
+				target_mac->ppe_idx = 0;
+				gdm_config = soc->reg_map->gdma_to_ppe;
+			}
+			mtk_gdm_config(eth, target_mac->id, gdm_config);
+		}
+		/* Reset and enable PSE */
+		mtk_w32(eth, RST_GL_PSE, MTK_RST_GL);
+		mtk_w32(eth, 0, MTK_RST_GL);
 
 		napi_enable(&eth->tx_napi);
 		napi_enable(&eth->rx_napi);
 		mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
 		mtk_rx_irq_enable(eth, soc->txrx.rx_irq_done_mask);
 		refcount_set(&eth->dma_refcnt, 1);
-	}
-	else
+	} else {
 		refcount_inc(&eth->dma_refcnt);
+	}
 
 	phylink_start(mac->phylink);
 	netif_tx_start_all_queues(dev);
@@ -3469,7 +3483,8 @@ static int mtk_stop(struct net_device *dev)
 	if (!refcount_dec_and_test(&eth->dma_refcnt))
 		return 0;
 
-	mtk_gdm_config(eth, MTK_GDMA_DROP_ALL);
+	for (i = 0; i < MTK_MAX_DEVS; i++)
+		mtk_gdm_config(eth, i, MTK_GDMA_DROP_ALL);
 
 	mtk_tx_irq_disable(eth, MTK_TX_DONE_INT);
 	mtk_rx_irq_disable(eth, eth->soc->txrx.rx_irq_done_mask);
@@ -4945,23 +4960,24 @@ static int mtk_probe(struct platform_device *pdev)
 	}
 
 	if (eth->soc->offload_version) {
-		u32 num_ppe = mtk_is_netsys_v2_or_greater(eth) ? 2 : 1;
+		u32 num_ppe = mtk_get_ppe_num(eth);
 
 		num_ppe = min_t(u32, ARRAY_SIZE(eth->ppe), num_ppe);
 		for (i = 0; i < num_ppe; i++) {
-			u32 ppe_addr = eth->soc->reg_map->ppe_base + i * 0x400;
+			u32 ppe_addr = eth->soc->reg_map->ppe_base;
 
+			ppe_addr += (i == 2 ? 0xC00 : i * 0x400);
 			eth->ppe[i] = mtk_ppe_init(eth, eth->base + ppe_addr, i);
 
 			if (!eth->ppe[i]) {
 				err = -ENOMEM;
 				goto err_deinit_ppe;
 			}
-		}
+			err = mtk_eth_offload_init(eth, i);
 
-		err = mtk_eth_offload_init(eth);
-		if (err)
-			goto err_deinit_ppe;
+			if (err)
+				goto err_deinit_ppe;
+		}
 	}
 
 	for (i = 0; i < MTK_MAX_DEVS; i++) {
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 9ae3b8a71d0e..7654fa74e7fc 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -124,6 +124,8 @@
 #define MTK_GDMA_UCS_EN		BIT(20)
 #define MTK_GDMA_STRP_CRC	BIT(16)
 #define MTK_GDMA_TO_PDMA	0x0
+#define MTK_GDMA_TO_PPE1	0x4444
+#define MTK_GDMA_TO_PPE2	0xcccc
 #define MTK_GDMA_DROP_ALL       0x7777
 
 /* GDM Egress Control Register */
@@ -1286,7 +1288,7 @@ struct mtk_eth {
 
 	struct metadata_dst		*dsa_meta[MTK_MAX_DSA_PORTS];
 
-	struct mtk_ppe			*ppe[2];
+	struct mtk_ppe			*ppe[3];
 	struct rhashtable		flow_table;
 
 	struct bpf_prog			__rcu *prog;
@@ -1311,6 +1313,7 @@ struct mtk_eth {
 struct mtk_mac {
 	int				id;
 	phy_interface_t			interface;
+	unsigned int			ppe_idx;
 	int				speed;
 	struct device_node		*of_node;
 	struct phylink			*phylink;
@@ -1421,6 +1424,14 @@ static inline u32 mtk_get_ib2_multicast_mask(struct mtk_eth *eth)
 	return MTK_FOE_IB2_MULTICAST;
 }
 
+static inline u32 mtk_get_ppe_num(struct mtk_eth *eth)
+{
+	if (!eth->soc->offload_version)
+		return 0;
+
+	return eth->soc->version;
+}
+
 /* read the hardware status register */
 void mtk_stats_update_mac(struct mtk_mac *mac);
 
@@ -1432,7 +1443,7 @@ int mtk_gmac_sgmii_path_setup(struct mtk_eth *eth, int mac_id);
 int mtk_gmac_gephy_path_setup(struct mtk_eth *eth, int mac_id);
 int mtk_gmac_rgmii_path_setup(struct mtk_eth *eth, int mac_id);
 
-int mtk_eth_offload_init(struct mtk_eth *eth);
+int mtk_eth_offload_init(struct mtk_eth *eth, int id);
 int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 		     void *type_data);
 int mtk_flow_offload_cmd(struct mtk_eth *eth, struct flow_cls_offload *cls,
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index fbb5e9d5af13..220685f6daaa 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -570,7 +570,7 @@ mtk_eth_setup_tc_block_cb(enum tc_setup_type type, void *type_data, void *cb_pri
 	if (type != TC_SETUP_CLSFLOWER)
 		return -EOPNOTSUPP;
 
-	return mtk_flow_offload_cmd(eth, cls, 0);
+	return mtk_flow_offload_cmd(eth, cls, mac->ppe_idx);
 }
 
 static int
@@ -633,7 +633,9 @@ int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 	}
 }
 
-int mtk_eth_offload_init(struct mtk_eth *eth)
+int mtk_eth_offload_init(struct mtk_eth *eth, int id)
 {
+	if (!eth->ppe[id] || !eth->ppe[id]->foe_table)
+		return 0;
 	return rhashtable_init(&eth->flow_table, &mtk_flow_ht_params);
 }
-- 
2.43.0


