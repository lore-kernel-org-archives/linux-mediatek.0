Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB577C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hI90FZ1mPuYzzPOovhINGKv8AZ1A/m0FBqsqiEEvTY=; b=p0qEFEiXFpKE63yQNjQIYECdCn
	EBDmRZ7025l4IVqi8ZLNok5TmeBe7PCVv9tfGq+NkB025nJONICTDSRUiStzavk6N3E0oBuZ/7Or0
	FiWZihik+Uu0yiWBHfo7UnH+8a1M90DYxf81JQGq6Gc8piLpnMOqrvjqVqiIzsvZ0rMLLep/RWQJr
	IUo0NZPY+OBYcvLk5hKRKUKr1dJwrTUmrVVf3WiU5XqfDCGuYwAm48tSPMDt7Bdx2s98bN6oKp7fi
	QibSGKedbEavULMRwgsFhVZP9eImiat7Vbkld6AdookKkGKZzs2TSW0uiB7jBd+ZHc0jR080s69l4
	ibAkGifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZm-007UbP-1N;
	Fri, 31 Mar 2023 13:13:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZi-007UYq-1k
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 13:13:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D7F95B82F6A;
	Fri, 31 Mar 2023 13:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B04DC433D2;
	Fri, 31 Mar 2023 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268427;
	bh=iXJPhBHDQg2tjMUV/aUNW08i5wKVl3q2xMq8Iulzdpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jyqdu4ZqH8jKKsKkEKYXmG/tJLnw/KRGgCnUJasU02/vKuL7PojM739thQGSiuESC
	 RV88IsI4GaqK2nNDJNTw9vXJFlHfxn9jEfiK5f8qyR8H81P6iJkB7DmPlahRzJcur4
	 ZX6wh+55tulzpmBz4Va5XM11fuOoOu2NjfJJai2422ikyODBrDA2Wa5MDUA/B8gPBZ
	 n2t55cYQhxmcR0Sw1dVGueFApwOSJSIfRX7jXSFRplBsnIJfdPxvokVtXDhueXjTGG
	 q4iwBEISCAhheodfW7vP0zyyILtNd5OQP/qpsd+ETyn75+sP/4LadPEH4XnxOXZo5k
	 PTUFRRz1LDegw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kuba@kernel.org,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 05/10] net: ethernet: mtk_wed: move ilm a dedicated dts node
Date: Fri, 31 Mar 2023 15:12:41 +0200
Message-Id: <44c210cd9135e9574ae7c2c01070aa58d39d018f.1680268101.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_061350_941308_0B7A96A3 
X-CRM114-Status: GOOD (  14.06  )
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

Since the ilm memory region is not part of the MT7986 RAM SoC, move ilm
in a deidicated syscon node.
Keep backward-compatibility with older dts version where ilm was defined
as reserved-memory child node.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 55 ++++++++++++++++++---
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 797c3b412ab6..a19db914ebd2 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -299,6 +299,52 @@ mtk_wed_mcu_run_firmware(struct mtk_wed_wo *wo, const struct firmware *fw,
 	return -EINVAL;
 }
 
+static int
+mtk_wed_mcu_load_memory_regions(struct mtk_wed_wo *wo,
+				struct mtk_wed_wo_memory_region *region)
+{
+	struct device_node *np;
+	int ret;
+
+	/* firmware EMI memory region */
+	ret = mtk_wed_get_reserved_memory_region(wo,
+			&region[MTK_WED_WO_REGION_EMI]);
+	if (ret)
+		return ret;
+
+	/* firmware DATA memory region */
+	ret = mtk_wed_get_reserved_memory_region(wo,
+			&region[MTK_WED_WO_REGION_DATA]);
+	if (ret)
+		return ret;
+
+	np = of_parse_phandle(wo->hw->node, "mediatek,wo-ilm", 0);
+	if (np) {
+		struct mtk_wed_wo_memory_region *ilm_region;
+		struct resource res;
+
+		ret = of_address_to_resource(np, 0, &res);
+		of_node_put(np);
+
+		if (ret < 0)
+			return ret;
+
+		ilm_region = &region[MTK_WED_WO_REGION_ILM];
+		ilm_region->phy_addr = res.start;
+		ilm_region->size = resource_size(&res);
+		ilm_region->addr = devm_ioremap(wo->hw->dev, ilm_region->phy_addr,
+						ilm_region->size);
+
+		return ilm_region->addr ? 0 : -ENOMEM;
+	}
+
+	/* For backward compatibility, we need to check if ILM
+	 * node is defined through reserved memory property.
+	 */
+	return mtk_wed_get_reserved_memory_region(wo,
+			&region[MTK_WED_WO_REGION_ILM]);
+}
+
 static int
 mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 {
@@ -320,12 +366,9 @@ mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 	u32 val, boot_cr;
 	int ret, i;
 
-	/* load firmware region metadata */
-	for (i = 0; i < ARRAY_SIZE(mem_region); i++) {
-		ret = mtk_wed_get_reserved_memory_region(wo, &mem_region[i]);
-		if (ret)
-			return ret;
-	}
+	ret = mtk_wed_mcu_load_memory_regions(wo, mem_region);
+	if (ret)
+		return ret;
 
 	wo->boot_regmap = syscon_regmap_lookup_by_phandle(wo->hw->node,
 							  "mediatek,wo-cpuboot");
-- 
2.39.2


