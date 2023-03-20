Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29175C7618D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 16:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WC7ioW4jMIOPo39Wjt+8ppUz+aWZQc6QhdzoLorBQII=; b=ym28V6lD70IgSFv+A8KV9hI7tA
	eW8JJ7ALxaRoaU/pwhmyVG4hpNSJH6Ol1ocJhuohlsXCFrQjfkm7mbfaTUT3uIYOXZGu9w+RWeEH5
	X72rSgaUEBQUoa+lSmoZtRdbQeArx7dCvwcOlPaomFALTmLudab0SzSe/7YKR1MRTHAzzcAiVzJE8
	fMpz5rrpvM5bAJLpvGXouAdvnJ5NY+dFYyGTmgU9wtckasxPWnhuAJiEQRYooFqlKPTzPGdCRsMpq
	1xHMT/BgsPLWl6SibyWl3GagV02qhGl4vW1+puPJCcKXp7jMXei5XLYg5NKuXgWmZ9zjnWCRvDCT9
	I+5meunw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqn-009u0C-04;
	Mon, 20 Mar 2023 16:59:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIql-009tz2-07
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Mar 2023 16:59:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98C93616DD;
	Mon, 20 Mar 2023 16:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD177C433EF;
	Mon, 20 Mar 2023 16:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679331550;
	bh=zBR/CZyJ28kqYG49+d/k9o/82Jp0pG3tobqqcDf2lo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rUr/2Xbs9M66djwtqMYR+hNW+hPSW8Y+pWI8x5o51unJK6ZGPSiXxgpeddswGs3FY
	 tOxQq/jR+qXdTrfxHjH645JPz3H69hU14TdSX/9AQhqJ7ZsC4ZiYtBlFk6ECzUcgw7
	 jQj/p9c+wDqa4fmBCINe8uRS51Q6VO0oNZgUUe6qVbFTW56IDb+8nPNqGWCKwn2/fW
	 BWjVtDLOmoqmVocpEjmVVLHZsHpQu/q/d4K/Qj7aOAGcfCkZlJwsrD1QVmKOHSTnvN
	 +t6K512qbV7P45bRmBgJqmZpcRlEUXImaMNj33vmHvkIljqVlRAQ4d1KDC5Nyoie6J
	 cutm8Dmq5leoA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
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
Subject: [PATCH net-next 05/10] net: ethernet: mtk_wed: move ilm a dedicated dts node
Date: Mon, 20 Mar 2023 17:57:59 +0100
Message-Id: <93f309bafc6f3f9ddeeba81eea04b3769e70febf.1679330630.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679330630.git.lorenzo@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_095911_150611_AD51B5C7 
X-CRM114-Status: GOOD (  14.63  )
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

Since the ilm memory region is not part of the RAM SoC, move ilm in a
deidicated syscon node.
This patch helps to keep backward-compatibility with older version of
uboot codebase where we have a limit of 8 reserved-memory dts child
nodes.
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


