Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054C5C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 16:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAdcrH0zeh+G4aAxPV3Iw6Nlwgz8zXVTK8qa/Wfo2D0=; b=oPQ0MBJT49fecxurBvSxjF5AP1
	zVe+yGyrlzdCwqPp6jbkSKm/NFaRji2A9wDmuGnUcYzCKQg2S6QIH676fP+eo3fgk8M4G4E4nfME9
	FNdDFsqwnjJGF/jGYUECLg+HHNXocln6zdVmhbCpjHErScD//8e56yw4ktwO4GxCvhyKRHSw4zMY3
	HDUDBP4bun5RQelKs2VcQq4JkbWTfEo0JfRwwipRubu4j+PZCed4e1lk/mlDXFY4LGuWJeGv9D/p9
	i5rQw95w+31Zy5TCCKuPMCnoY1w0wyoPdkuUdT9xJYXL2CgErrKnXWfMkXTMOfq/WXnIkQZWlXL0G
	H+HdAuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqd-009tws-1m;
	Mon, 20 Mar 2023 16:59:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqb-009tvs-1c
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Mar 2023 16:59:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C9631B80FA6;
	Mon, 20 Mar 2023 16:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1C2C433D2;
	Mon, 20 Mar 2023 16:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679331538;
	bh=XXr9JXnAjx/mfQBSeN4a1DymTIk6vQWBuniCnuc64RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uqFgvWbXvlzbXYq0MfOhuxQOxZGSmY1vKJhV4D497HHT/5LJBdnzum/O2mHuyzquW
	 AOYRp0RhxOjqC/+/usXxDibwRPA82a8hLVWpCzd26HVSPcsacnalGxUjZ4TdPM0ptx
	 QtBWfX8NCPqmeKPjEq+m9Way08yuMMKFYYkyHCIserKTsl38UQwvxG5VAuN2/lBVpX
	 bn/o/rSIgoiLP6XFMwB4KFRLP9h30ZItGDCNOW8oHQQOVaQ8Wetc0Cp1gjvMG1l5xs
	 Fsm+i+PVNX0p3gWC0uzSYYJJ6aRRW5HgsAAJY2Dok7cZtR8h8GkL4tcyNojxTYhf+s
	 Ha512zd9M1X/g==
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
Subject: [PATCH net-next 02/10] net: ethernet: mtk_wed: move cpuboot in a dedicated dts node
Date: Mon, 20 Mar 2023 17:57:56 +0100
Message-Id: <ac90258b763f76e7ae16a228895437057bab521e.1679330630.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679330630.git.lorenzo@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_095901_825238_3419FB0D 
X-CRM114-Status: GOOD (  15.34  )
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

Since the cpuboot memory region is not part of the RAM SoC, move cpuboot
in a deidicated syscon node.
This patch helps to keep backward-compatibility with older version of
uboot codebase where we have a limit of 8 reserved-memory dts child
nodes.
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


