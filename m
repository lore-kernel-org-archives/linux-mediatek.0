Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA23C77B62
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtuUSBCL6oK0wCo9g5IU1bv/6d1t1iIG4a9k1pYuPAw=; b=KCUEOaOgUUe9yE/dKy6LaSD5el
	DM7PrXTaIioPZHKVE4bb988RESgw3RxYfYCdYWLcnHWoeTdHuu1LHtwoWQ+Lom2eo7uBoui7hXOQo
	xG7mNeVIjGKtgiMxrviplue1TWCqqdjx2j3VSthfZGYxbRHtmgXnlzlwcqzHz32/0NMWiOzkcYf1A
	q39FXBDSnBIwXtWmTQQ+SG4zoYk0Zp/Wo62pBIziU1mjW7Yru1kJlwkJXcxUijVs+ObVt0OjrI4T3
	Ko+s9wSjwcUgEQi/EnsMX4C8w/LDsAkq/GWgX/5B5kG1hr3YiIAMLswh+0V1ZU0+AwcvB6i3TmeF2
	2ss7RiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZY-007UUF-1x;
	Fri, 31 Mar 2023 13:13:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZV-007USf-0E
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 13:13:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A854E62709;
	Fri, 31 Mar 2023 13:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846DEC433EF;
	Fri, 31 Mar 2023 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268415;
	bh=hLAVugf0wJMRhEaxQsvqqH7c9szSLlu5vrY4HfSo9tU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EIbzxKeiYwg4H5W5KbXKGlMazIyivy0rCuyVuSKwL6EuM9HG2PbqrCHGOgpdq6AUj
	 Zx/DsteS5DrWzVcrx0dKvjlwx3Z4f2HLUvT5IXxvgZ3H9jEpax0Qoc89VqONaU77+Q
	 7zUzavyXeHuqR2kYJ2tHBIHXYXtQmgH4FnoQ/V1p8RurjADnS0MIoC36MrHkJGfzlP
	 aWZAroYpC23dNVzCrW09maHjIylqy5BpOkETQkw68ED994GniBBc9qPEJDLSXY/vXg
	 fI70Mp+tWHu9kx1lwikE0O6haXvo1Zks7pYEhuaLjUNuu+SEWD1CuZU7BsZKwvpNsb
	 glkwmp/b1s0PA==
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
Subject: [PATCH v2 net-next 02/10] net: ethernet: mtk_wed: move cpuboot in a dedicated dts node
Date: Fri, 31 Mar 2023 15:12:38 +0200
Message-Id: <56ed497762b1c031c553210a0e5c7717c6069642.1680268101.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_061337_227624_73023CC3 
X-CRM114-Status: GOOD (  14.67  )
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

Since the cpuboot memory region is not part of the RAM MT7986 SoC,
move cpuboot in a deidicated syscon node.
Keep backward-compatibility with older dts version where cpuboot was
defined as reserved-memory child node.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 34 +++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_wed_wo.h  |  3 +-
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 6624f6d6abdd..797c3b412ab6 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -18,12 +18,23 @@
 
 static u32 wo_r32(struct mtk_wed_wo *wo, u32 reg)
 {
-	return readl(wo->boot.addr + reg);
+	u32 val;
+
+	if (!wo->boot_regmap)
+		return readl(wo->boot.addr + reg);
+
+	if (regmap_read(wo->boot_regmap, reg, &val))
+		val = ~0;
+
+	return val;
 }
 
 static void wo_w32(struct mtk_wed_wo *wo, u32 reg, u32 val)
 {
-	writel(val, wo->boot.addr + reg);
+	if (wo->boot_regmap)
+		regmap_write(wo->boot_regmap, reg, val);
+	else
+		writel(val, wo->boot.addr + reg);
 }
 
 static struct sk_buff *
@@ -316,10 +327,21 @@ mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 			return ret;
 	}
 
-	wo->boot.name = "wo-boot";
-	ret = mtk_wed_get_reserved_memory_region(wo, &wo->boot);
-	if (ret)
-		return ret;
+	wo->boot_regmap = syscon_regmap_lookup_by_phandle(wo->hw->node,
+							  "mediatek,wo-cpuboot");
+	if (IS_ERR(wo->boot_regmap)) {
+		if (wo->boot_regmap != ERR_PTR(-ENODEV))
+			return PTR_ERR(wo->boot_regmap);
+
+		/* For backward compatibility, we need to check if cpu_boot
+		 * is defined through reserved memory property.
+		 */
+		wo->boot_regmap = NULL;
+		wo->boot.name = "wo-boot";
+		ret = mtk_wed_get_reserved_memory_region(wo, &wo->boot);
+		if (ret)
+			return ret;
+	}
 
 	/* set dummy cr */
 	wed_w32(wo->hw->wed_dev, MTK_WED_SCR0 + 4 * MTK_WED_DUMMY_CR_FWDL,
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.h b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
index dbcf42ce9173..c03071203cc0 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
@@ -227,7 +227,8 @@ struct mtk_wed_wo_queue {
 
 struct mtk_wed_wo {
 	struct mtk_wed_hw *hw;
-	struct mtk_wed_wo_memory_region boot;
+	struct mtk_wed_wo_memory_region boot; /* backward compatibility */
+	struct regmap *boot_regmap;
 
 	struct mtk_wed_wo_queue q_tx;
 	struct mtk_wed_wo_queue q_rx;
-- 
2.39.2


