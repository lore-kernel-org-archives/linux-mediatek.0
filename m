Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25A4C04FFE
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 May 2024 12:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Br5ON5k/eBGe2xri5kvHWbHVRPWa+st4CjR9EmcjvI=; b=iPojWYpqE1Qboa8ToMXYKnVJah
	686aQpkFuw8X+TUBQrLdX4Py9Dn7o3VaxTOmuP6dtDPagpNCtFW7wk23KPn3YBV78l0YmHIkVRG01
	ynW+rkOpoRJDECelLPKowErvu68aKjAYHe0LgnH0hPWlz5Sfm7c0F6Yb6jtVgrE2pvPHrU+BSuN7J
	O3D2yC5b6zBQf+26HXfqjIKX5Y/qWCU9EmAakAGDkXl6AYQwkCEZ+APt+N2Wrl1u2AIhPeYOrD1wz
	HuHM4nNW39p2Lj6cFXDbKZ4dlUU+rEaOMtG5kaeEx7JMVb6kHiUunhGEY0gFZZ9Ziok3rbq4yLGlg
	6/GVO1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5lpi-00000007tUw-2aK8;
	Sat, 11 May 2024 12:28:10 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5lpe-00000007tU4-3TX0;
	Sat, 11 May 2024 12:28:08 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2e576057c56so4052751fa.3;
        Sat, 11 May 2024 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715430482; x=1716035282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Br5ON5k/eBGe2xri5kvHWbHVRPWa+st4CjR9EmcjvI=;
        b=Fzz052krguLZFIkBMKrC8GQAZEUaUpGL4wcJS4UCxLdwxjDK5LSdjC1BxtDRAg+k/H
         yazUsYAg0RBUmhUQBT4Ueggbtl4r8bpjbLsmCGcjVRDlGK7qThsDwGalO6Tri0A6cXZm
         reZcPtqz4rIpLLoaGFSlp6rQd4H7TBCo3+HyB3M4Wrl8ZFzMFQJBv0IidqURJ84jShHI
         uJ+UkvRItFEtkaRhOVac0ZOFbc2UVwRFrvPF1QRu/FAcV/E6/QY12ClnLkaSUIhZqquP
         /qy7PmN3ZEYe84NEsY5MiiypJXt+K2sLHlye+3qjh7o1o5kAPC/BmP6EYEuX34H4OGkc
         ScuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715430482; x=1716035282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Br5ON5k/eBGe2xri5kvHWbHVRPWa+st4CjR9EmcjvI=;
        b=rtsn0brvizcoxJGQFjJ1g/QL09E9SWog12XIvzKNtBrWJ1cqnYTeJHtMOYmtX78aig
         fTuRlFJbQsFSnBBUBnN2Nvx9ZsxcDGIdNRlov55EUS18ZCki0WxFpUGdmx32sxty0aMw
         PpwNzPqF9yYvgUg/wcWl/psPSWlInTuKlMnbVkxxIFHhfMbz99oNLuMjfBleTVY3CUqf
         oUMQQl3f5zuznyCf3GRZ9jC3Z7t/sVyAAMUMK2wzjpR6oVyXGCXFa1ZSja2R15u3CNtO
         Jd8/R8DL9fd4s+IkW8UE5Vs2x53uhwlnXXQ3iAqP/KBMUota/lzefCckw3TxnUSKlr+N
         18dQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4yNN8nOn3XdaP4PvRYFxkfnP59Y7MAVS8V2Qw2qnECMpWaOIcW3Sl9qjFbSxAenf786NXUR0qF4GQt7nmncNNLSdEVoa1gH9uCYotlNmWD0TIe97VAftHNrkBwQ9oQFPvjG3tkAP9O+DcyIaWVD4h16/uFZch6GI=
X-Gm-Message-State: AOJu0YzsxolDfmGQx57IKqqoGPyvjh/d/5jl49/AAceIoRRlIeZIKosn
	zgRlS7I3Ulcu7XLSx5U5yDZs9/AMnrX4hknYGm6+k+8popmqIY86
X-Google-Smtp-Source: AGHT+IHfg47ULkF/LEewjDpD8qjG6HLlf9y7YNx5o1FNimdDJv0pwm9hBHZbOdLMAX+Zmus6zlqWsg==
X-Received: by 2002:a2e:b0db:0:b0:2de:7cc5:7a27 with SMTP id 38308e7fff4ca-2e51fc369a0mr34047921fa.5.1715430481376;
        Sat, 11 May 2024 05:28:01 -0700 (PDT)
Received: from localhost.localdomain (IGLD-84-229-253-184.inter.net.il. [84.229.253.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87b26610sm133333335e9.8.2024.05.11.05.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 05:28:01 -0700 (PDT)
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
Subject: [PATCH net-next v4] net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs
Date: Sat, 11 May 2024 15:26:53 +0300
Message-ID: <20240511122659.13838-1-eladwf@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_052806_904785_67E8F3C5 
X-CRM114-Status: GOOD (  26.63  )
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
v4: 
	- applied changes suggested by Jakub Kicinski
	- modified flow_offload_replace to get the correct PPE index from flow
	- add gdma_to_ppe[x] registers to mtk_reg_map instead of using defines
v3: applied changes suggested by Daniel Golle
v2: fixed CI warnings
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 106 +++++++++++-------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  15 ++-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |  16 ++-
 3 files changed, 91 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 179c0230655a..67e19bd25f7a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -80,7 +80,9 @@ static const struct mtk_reg_map mtk_reg_map = {
 		.fq_blen	= 0x1b2c,
 	},
 	.gdm1_cnt		= 0x2400,
-	.gdma_to_ppe		= 0x4444,
+	.gdma_to_ppe	= {
+		[0]		= 0x4444,
+	},
 	.ppe_base		= 0x0c00,
 	.wdma_base = {
 		[0]		= 0x2800,
@@ -144,7 +146,10 @@ static const struct mtk_reg_map mt7986_reg_map = {
 		.tx_sch_rate	= 0x4798,
 	},
 	.gdm1_cnt		= 0x1c00,
-	.gdma_to_ppe		= 0x3333,
+	.gdma_to_ppe	= {
+		[0]		= 0x3333,
+		[1]		= 0x4444,
+	},
 	.ppe_base		= 0x2000,
 	.wdma_base = {
 		[0]		= 0x4800,
@@ -192,7 +197,11 @@ static const struct mtk_reg_map mt7988_reg_map = {
 		.tx_sch_rate	= 0x4798,
 	},
 	.gdm1_cnt		= 0x1c00,
-	.gdma_to_ppe		= 0x3333,
+	.gdma_to_ppe	= {
+		[0]		= 0x3333,
+		[1]		= 0x4444,
+		[2]		= 0xcccc,
+	},
 	.ppe_base		= 0x2000,
 	.wdma_base = {
 		[0]		= 0x4800,
@@ -2009,6 +2018,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 	struct mtk_rx_dma_v2 *rxd, trxd;
 	int done = 0, bytes = 0;
 	dma_addr_t dma_addr = DMA_MAPPING_ERROR;
+	int ppe_idx = 0;
 
 	while (done < budget) {
 		unsigned int pktlen, *rxdcsum;
@@ -2052,6 +2062,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			goto release_desc;
 
 		netdev = eth->netdev[mac];
+		ppe_idx = eth->mac[mac]->ppe_idx;
 
 		if (unlikely(test_bit(MTK_RESETTING, &eth->state)))
 			goto release_desc;
@@ -2175,7 +2186,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		}
 
 		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
-			mtk_ppe_check_skb(eth->ppe[0], skb, hash);
+			mtk_ppe_check_skb(eth->ppe[ppe_idx], skb, hash);
 
 		skb_record_rx_queue(skb, 0);
 		napi_gro_receive(napi, skb);
@@ -3266,37 +3277,27 @@ static int mtk_start_dma(struct mtk_eth *eth)
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
+	val = mtk_r32(eth, MTK_GDMA_FWD_CFG(id));
 
-		val = mtk_r32(eth, MTK_GDMA_FWD_CFG(i));
+	/* default setup the forward port to send frame to PDMA */
+	val &= ~0xffff;
 
-		/* default setup the forward port to send frame to PDMA */
-		val &= ~0xffff;
+	/* Enable RX checksum */
+	val |= MTK_GDMA_ICS_EN | MTK_GDMA_TCS_EN | MTK_GDMA_UCS_EN;
 
-		/* Enable RX checksum */
-		val |= MTK_GDMA_ICS_EN | MTK_GDMA_TCS_EN | MTK_GDMA_UCS_EN;
+	val |= config;
 
-		val |= config;
+	if (eth->netdev[id] && netdev_uses_dsa(eth->netdev[id]))
+		val |= MTK_GDMA_SPECIAL_TAG;
 
-		if (netdev_uses_dsa(eth->netdev[i]))
-			val |= MTK_GDMA_SPECIAL_TAG;
-
-		mtk_w32(eth, val, MTK_GDMA_FWD_CFG(i));
-	}
-	/* Reset and enable PSE */
-	mtk_w32(eth, RST_GL_PSE, MTK_RST_GL);
-	mtk_w32(eth, 0, MTK_RST_GL);
+	mtk_w32(eth, val, MTK_GDMA_FWD_CFG(id));
 }
 
 
@@ -3356,7 +3357,10 @@ static int mtk_open(struct net_device *dev)
 {
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_eth *eth = mac->hw;
-	int i, err;
+	struct mtk_mac *target_mac;
+	int i, err, ppe_num;
+
+	ppe_num = mtk_get_ppe_num(eth);
 
 	err = phylink_of_phy_connect(mac->phylink, mac->of_node, 0);
 	if (err) {
@@ -3380,18 +3384,38 @@ static int mtk_open(struct net_device *dev)
 		for (i = 0; i < ARRAY_SIZE(eth->ppe); i++)
 			mtk_ppe_start(eth->ppe[i]);
 
-		gdm_config = soc->offload_version ? soc->reg_map->gdma_to_ppe
-						  : MTK_GDMA_TO_PDMA;
-		mtk_gdm_config(eth, gdm_config);
+		for (i = 0; i < MTK_MAX_DEVS; i++) {
+			if (!eth->netdev[i])
+				break;
+
+			target_mac = netdev_priv(eth->netdev[i]);
+			if (!soc->offload_version) {
+				target_mac->ppe_idx = 0;
+				gdm_config = MTK_GDMA_TO_PDMA;
+			} else if (ppe_num >= 3 && target_mac->id == 2) {
+				target_mac->ppe_idx = 2;
+				gdm_config = soc->reg_map->gdma_to_ppe[2];
+			} else if (ppe_num >= 2 && target_mac->id == 1) {
+				target_mac->ppe_idx = 1;
+				gdm_config = soc->reg_map->gdma_to_ppe[1];
+			} else {
+				target_mac->ppe_idx = 0;
+				gdm_config = soc->reg_map->gdma_to_ppe[0];
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
@@ -3468,7 +3492,8 @@ static int mtk_stop(struct net_device *dev)
 	if (!refcount_dec_and_test(&eth->dma_refcnt))
 		return 0;
 
-	mtk_gdm_config(eth, MTK_GDMA_DROP_ALL);
+	for (i = 0; i < MTK_MAX_DEVS; i++)
+		mtk_gdm_config(eth, i, MTK_GDMA_DROP_ALL);
 
 	mtk_tx_irq_disable(eth, MTK_TX_DONE_INT);
 	mtk_rx_irq_disable(eth, eth->soc->txrx.rx_irq_done_mask);
@@ -4949,23 +4974,24 @@ static int mtk_probe(struct platform_device *pdev)
 	}
 
 	if (eth->soc->offload_version) {
-		u32 num_ppe = mtk_is_netsys_v2_or_greater(eth) ? 2 : 1;
+		u8 ppe_num = mtk_get_ppe_num(eth);
 
-		num_ppe = min_t(u32, ARRAY_SIZE(eth->ppe), num_ppe);
-		for (i = 0; i < num_ppe; i++) {
-			u32 ppe_addr = eth->soc->reg_map->ppe_base + i * 0x400;
+		ppe_num = min_t(u8, ARRAY_SIZE(eth->ppe), ppe_num);
+		for (i = 0; i < ppe_num; i++) {
+			u32 ppe_addr = eth->soc->reg_map->ppe_base;
 
+			ppe_addr += (i == 2 ? 0xc00 : i * 0x400);
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
index 723fc637027c..e4c8c8bc7e7b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1130,7 +1130,7 @@ struct mtk_reg_map {
 		u32	tx_sch_rate;	/* tx scheduler rate control registers */
 	} qdma;
 	u32	gdm1_cnt;
-	u32	gdma_to_ppe;
+	u32	gdma_to_ppe[3];
 	u32	ppe_base;
 	u32	wdma_base[3];
 	u32	pse_iq_sta;
@@ -1286,7 +1286,7 @@ struct mtk_eth {
 
 	struct metadata_dst		*dsa_meta[MTK_MAX_DSA_PORTS];
 
-	struct mtk_ppe			*ppe[2];
+	struct mtk_ppe			*ppe[3];
 	struct rhashtable		flow_table;
 
 	struct bpf_prog			__rcu *prog;
@@ -1311,6 +1311,7 @@ struct mtk_eth {
 struct mtk_mac {
 	int				id;
 	phy_interface_t			interface;
+	u8						ppe_idx;
 	int				speed;
 	struct device_node		*of_node;
 	struct phylink			*phylink;
@@ -1421,6 +1422,14 @@ static inline u32 mtk_get_ib2_multicast_mask(struct mtk_eth *eth)
 	return MTK_FOE_IB2_MULTICAST;
 }
 
+static inline u8 mtk_get_ppe_num(struct mtk_eth *eth)
+{
+	if (!eth->soc->offload_version)
+		return 0;
+
+	return eth->soc->version;
+}
+
 /* read the hardware status register */
 void mtk_stats_update_mac(struct mtk_mac *mac);
 
@@ -1432,7 +1441,7 @@ int mtk_gmac_sgmii_path_setup(struct mtk_eth *eth, int mac_id);
 int mtk_gmac_gephy_path_setup(struct mtk_eth *eth, int mac_id);
 int mtk_gmac_rgmii_path_setup(struct mtk_eth *eth, int mac_id);
 
-int mtk_eth_offload_init(struct mtk_eth *eth);
+int mtk_eth_offload_init(struct mtk_eth *eth, u8 id);
 int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 		     void *type_data);
 int mtk_flow_offload_cmd(struct mtk_eth *eth, struct flow_cls_offload *cls,
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index aa262e6f4b85..fdad16c16193 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -245,10 +245,10 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 			 int ppe_index)
 {
 	struct flow_rule *rule = flow_cls_offload_flow_rule(f);
+	struct net_device *idev = NULL, *odev = NULL;
 	struct flow_action_entry *act;
 	struct mtk_flow_data data = {};
 	struct mtk_foe_entry foe;
-	struct net_device *odev = NULL;
 	struct mtk_flow_entry *entry;
 	int offload_type = 0;
 	int wed_index = -1;
@@ -264,6 +264,14 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		struct flow_match_meta match;
 
 		flow_rule_match_meta(rule, &match);
+		if (mtk_is_netsys_v2_or_greater(eth)) {
+			idev = __dev_get_by_index(&init_net, match.key->ingress_ifindex);
+			if (idev) {
+				struct mtk_mac *mac = netdev_priv(idev);
+
+				ppe_index = mac->ppe_idx;
+			}
+		}
 	} else {
 		return -EOPNOTSUPP;
 	}
@@ -574,7 +582,7 @@ mtk_eth_setup_tc_block_cb(enum tc_setup_type type, void *type_data, void *cb_pri
 	if (type != TC_SETUP_CLSFLOWER)
 		return -EOPNOTSUPP;
 
-	return mtk_flow_offload_cmd(eth, cls, 0);
+	return mtk_flow_offload_cmd(eth, cls, mac->ppe_idx);
 }
 
 static int
@@ -637,7 +645,9 @@ int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 	}
 }
 
-int mtk_eth_offload_init(struct mtk_eth *eth)
+int mtk_eth_offload_init(struct mtk_eth *eth, u8 id)
 {
+	if (!eth->ppe[id] || !eth->ppe[id]->foe_table)
+		return 0;
 	return rhashtable_init(&eth->flow_table, &mtk_flow_ht_params);
 }
-- 
2.44.0


