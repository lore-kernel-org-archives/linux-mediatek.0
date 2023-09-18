Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D0FC46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+wlVDnxOa8imn22QNmOJ6ySeEkUvZ0ihchK9uvjZVI=; b=SnX0YRYDjhnd/NEScpsbdVbQxn
	/PRPE9jHnkLThE4LW3Ip7CiEYGZnJKGyOEzKjFnhBJ8ZEDCWYB97Lol6bcTEhdvknRfYaSb3xNCH0
	k3if3779v5/e7GCXPWI7FS9I0p2QOeczRhWoWbsEtb6jRKqdC4YwGVTEUKBoAmDgef0+bqfu1Yemv
	41o8tHkBuckkw0RbDVLhGTlfNQGfDx7rsT7Ov5hACLeGzaGqaScsTgkkZcMirJ4u4cMC7XoHhHy1p
	HKFoMEOtS19xBzCime98ziQVC0UnvWKZbws8MawHNTUDh0tPC5BbBMR4/YlGDLXhsW52j31pyv8wS
	Zlis+TAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWP-00F89t-0b;
	Mon, 18 Sep 2023 10:30:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWM-00F86p-0s
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D34D1B80B9B;
	Mon, 18 Sep 2023 10:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015E3C433C7;
	Mon, 18 Sep 2023 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033024;
	bh=y6yDaYvJ/bA5abRx1KNylEBwaNNnEQUvQMq0/2yBjhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lM9Hwgqt4ldAT5PDQkEnKdoi3HAZP9uFDQXCRm3QuKBguFhqwULJ8e2XEDMmHWMnE
	 tUMubFaQ5NtWYxcwk3uHcNTyXLyuZqjlqwJta04W9gsMbo5Wi8bHoXMbVD2P8Zv62y
	 jSckyRX54AKlFKABz9jrP29PC5hnDWkOlHG4I0P+wCOpCQ+wuaLYT7t2B4LB5Oh0G2
	 jjQplZ2rcD0PJN3zz+6IhTfSrIrDjgyxZHPxd8izic0UMjbE1JlngXydP2XQfXDEbE
	 rHLfQS7dxs820QGYKFgdgwV4sJ/DIeU9eKb/lUFKa6qhyeRNDnqYyAG6LXxAQKiXp5
	 olLMBUtH+WJhA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 08/17] net: ethernet: mtk_wed: make memory region optional
Date: Mon, 18 Sep 2023 12:29:10 +0200
Message-ID: <bb6ee94f05a6e1afa952b213e419599a6cba8529.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033026_623941_8B2C4027 
X-CRM114-Status: GOOD (  13.18  )
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

Make mtk_wed_wo_memory_region optionals.
This is a preliminary patch to introduce Wireless Ethernet Dispatcher
support for MT7988 SoC since MT7988 WED fw image will have a different
layout.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 23 ++++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index cc54fbd7380a..e53531252bd9 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -234,19 +234,13 @@ int mtk_wed_mcu_msg_update(struct mtk_wed_device *dev, int id, void *data,
 }
 
 static int
-mtk_wed_get_memory_region(struct mtk_wed_wo *wo,
+mtk_wed_get_memory_region(struct mtk_wed_hw *hw, int index,
 			  struct mtk_wed_wo_memory_region *region)
 {
 	struct reserved_mem *rmem;
 	struct device_node *np;
-	int index;
 
-	index = of_property_match_string(wo->hw->node, "memory-region-names",
-					 region->name);
-	if (index < 0)
-		return index;
-
-	np = of_parse_phandle(wo->hw->node, "memory-region", index);
+	np = of_parse_phandle(hw->node, "memory-region", index);
 	if (!np)
 		return -ENODEV;
 
@@ -258,7 +252,7 @@ mtk_wed_get_memory_region(struct mtk_wed_wo *wo,
 
 	region->phy_addr = rmem->base;
 	region->size = rmem->size;
-	region->addr = devm_ioremap(wo->hw->dev, region->phy_addr, region->size);
+	region->addr = devm_ioremap(hw->dev, region->phy_addr, region->size);
 
 	return !region->addr ? -EINVAL : 0;
 }
@@ -271,6 +265,9 @@ mtk_wed_mcu_run_firmware(struct mtk_wed_wo *wo, const struct firmware *fw,
 	const struct mtk_wed_fw_trailer *trailer;
 	const struct mtk_wed_fw_region *fw_region;
 
+	if (!region->phy_addr || !region->size)
+		return 0;
+
 	trailer_ptr = fw->data + fw->size - sizeof(*trailer);
 	trailer = (const struct mtk_wed_fw_trailer *)trailer_ptr;
 	region_ptr = trailer_ptr - trailer->num_region * sizeof(*fw_region);
@@ -318,7 +315,13 @@ mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 
 	/* load firmware region metadata */
 	for (i = 0; i < ARRAY_SIZE(mem_region); i++) {
-		ret = mtk_wed_get_memory_region(wo, &mem_region[i]);
+		int index = of_property_match_string(wo->hw->node,
+						     "memory-region-names",
+						     mem_region[i].name);
+		if (index < 0)
+			continue;
+
+		ret = mtk_wed_get_memory_region(wo->hw, index, &mem_region[i]);
 		if (ret)
 			return ret;
 	}
-- 
2.41.0


