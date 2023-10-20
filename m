Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68012CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FC+Pe6jRUQuMv/IixlI11Q9iQ/GfWBLGmCmWfngyZ+E=; b=xvuPHbZtiGMwgjw1iDPJzRpgly
	cql/1Uh3JBDgkgrvIfoD2rKeOH3xIQTSpfQ9mv+HnTz1RdkmHR2Yck3Dc4rsITNhJ9rNgJGAfRiWw
	oxsEDH+o57cZrvERSMOavxVAMsewH3dQsSlIxejZovoicZjbsupmHY31faaoCQjm0YLFCpEoqiGK+
	4J1dV3fE4OQbO/79LjMG5gzCCGnQncxxZfIKW70GbvOTxbjGasWNZpvWV4KyJ7K081alGVIeQKVgT
	8+c612yVAwJXpvleeRXPpxcSWAz/I28cO7HSl/jIYYvpB5G5bv4DcQznHxS2fAmBnbdZVumygPjGL
	lD5x+InA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkMQ-001U44-2i;
	Fri, 20 Oct 2023 07:55:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkMM-001U2q-2J;
	Fri, 20 Oct 2023 07:55:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AABB2660734F;
	Fri, 20 Oct 2023 08:55:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697788550;
	bh=0c2z7sk1bqZ1kYpcBZ8rifCI5ElDpfSDLTU9DxlgN9A=;
	h=From:To:Cc:Subject:Date:From;
	b=DaE1iuAOfw41MEP9QbDlwfaur5zRugIhl6yLcjWN9IRb3VkOYDiI6NVilalU9E/zS
	 Nrp9t9+edMN+7piU+KVpE9FGe6FmTQWPJjWev5l0G/vnEJ7+PxUjOMLJycl0Sueqmb
	 GL2j3nRBsqUC9soCI2KT5vumxLlNkE6Bhz8inT9c7j7J+ijydVix0PtwLQHg653fxx
	 9gFd0V929+J30P+k4fbpC9PFw0J5LPAwp+nsPfYRVzXhqHGhLTUbdpDsEVeuL3q9Q3
	 ImFZvPHi3QwzFiNzjRWGNAO77lsm7kGJnjnJBnDHZuhZ9PBLK6L7IwBoB1ZJt6IVM+
	 mYkWHxdIJwLZw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	allen-kh.cheng@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: mt8186: Add I2C arbiter clocks to i2c 1/2/5
Date: Fri, 20 Oct 2023 09:55:40 +0200
Message-ID: <20231020075540.15191-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_005554_887269_D699898E 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

The I2C busses 1, 2 and 5 have got a separated arbiter clock: add it
to their respective nodes.

Fixes: 2e78620b1350 ("arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index f04ae70c470a..af6f6687de35 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1224,8 +1224,9 @@ i2c1: i2c@11008000 {
 			      <0 0x10200200 0 0x100>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&imp_iic_wrap CLK_IMP_IIC_WRAP_AP_CLOCK_I2C1>,
-				 <&infracfg_ao CLK_INFRA_AO_AP_DMA>;
-			clock-names = "main", "dma";
+				 <&infracfg_ao CLK_INFRA_AO_AP_DMA>,
+				 <&infracfg_ao CLK_INFRA_AO_I2C1_ARBITER>;
+			clock-names = "main", "dma", "arb";
 			clock-div = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1238,8 +1239,9 @@ i2c2: i2c@11009000 {
 			      <0 0x10200300 0 0x180>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&imp_iic_wrap CLK_IMP_IIC_WRAP_AP_CLOCK_I2C2>,
-				 <&infracfg_ao CLK_INFRA_AO_AP_DMA>;
-			clock-names = "main", "dma";
+				 <&infracfg_ao CLK_INFRA_AO_AP_DMA>,
+				 <&infracfg_ao CLK_INFRA_AO_I2C2_ARBITER>;
+			clock-names = "main", "dma", "arb";
 			clock-div = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1280,8 +1282,9 @@ i2c5: i2c@11016000 {
 			      <0 0x10200700 0 0x100>;
 			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&imp_iic_wrap CLK_IMP_IIC_WRAP_AP_CLOCK_I2C5>,
-				 <&infracfg_ao CLK_INFRA_AO_AP_DMA>;
-			clock-names = "main", "dma";
+				 <&infracfg_ao CLK_INFRA_AO_AP_DMA>,
+				 <&infracfg_ao CLK_INFRA_AO_I2C5_ARBITER>;
+			clock-names = "main", "dma", "arb";
 			clock-div = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.42.0


