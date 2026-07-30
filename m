Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D54C55162
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 09:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrsoYsz0qg+6uz6xEjzJdj4Ekq7u/fvkScXrMJ22IFw=; b=pBuezBvM9C4z6Pc9n9Vmw4/c/g
	3j2gu5DW1Y3NOudK+OK76KeE48zInq+ztwThYslXaTljALY8+lNx1AILZ0Ac7P4lU8dbgR9eUgE5w
	bR2XhG0K3BtlLUVQqQlToJTA63hUhlCkve0YHEPNSl9+J3tOgM+QXvzcEwj7ipZgHHwsSCnmq0Wla
	CdfHG+oBe1CASVqiufeIdECD8AzXXtVg5/P1YujgbXuWnDGqGZyOPAJ2NuIu4vW0MF/nBqjZUa7+P
	H+zivl4pHt4gu80sCyOot/RhjqJBsKQ3zh2Hwt7mPK2wuJ5Gw67KoLOkzocaBofhBhS4ki33/HTRM
	kHxVFGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNSo-0000000A6Ki-0WEA;
	Thu, 30 Jul 2026 09:54:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNPO-0000000A3mf-0A2H;
	Thu, 30 Jul 2026 09:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785405031;
	bh=OziOb+FsEmp5/9DGqnKkZWUGGpg9PAiZr6kaXN8cN5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gHWixjy0VGFdmf4AlcH5nxADZAxDYkpBWYrDlnXSwgZy0L8OyN8PRfJT1cHf4aLWz
	 2zdTwXihjyZgwYqoMccxIkDv0Dk291qZa7FHfOfjLf5+gCUe/z1WbtP1BCaFbvmV+I
	 Hn3Eix7//jedtOgAVjPCMjxzr7BE3HNuXCs0ul5SnoHfWtMXQc9IpdgY4UeLbaLTZ+
	 4kmsDUTplrHQpQ8i+HhI/GKu6rDtKcH9M8TxDLMjP8xb1iKVKMkP+QX12/wrUfKsGE
	 F3AFBZeA5sINygUiZRHecW3zcyRHbO/5mVrP7QZNorpvfmB/gtOmgi7BMIi9M8S5Vm
	 N1+jl3YNjasbg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9025017E0984;
	Thu, 30 Jul 2026 11:50:30 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jul 2026 11:49:20 +0200
Subject: [PATCH v10 24/26] arm64: dts: mediatek: mt8195: Align ufshci node
 to dt-bindings changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-mt8196-ufs-v10-24-bc5ecef202dc@collabora.com>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
In-Reply-To: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785404993; l=2310;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=OziOb+FsEmp5/9DGqnKkZWUGGpg9PAiZr6kaXN8cN5g=;
 b=WvQIc7rx7/cUucLoeSpzM/mTXZPNa2xB23FKnfB/OWX2CUe5WCaxrDNGO/a3vjhSJoAEy8CX0
 sM1DrQFr7tKDG+oSjdZ6qzC03261GP54OyrJ4CECHDrFh+FdyAXx4rH
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_025034_253528_2D547F12 
X-CRM114-Status: UNSURE (   9.94  )
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

The MT8195 UFS host controller dt bindings now describe several extra
required clocks that were previously missing from clock description
and deprecates the freq-table-hz property use in favour of
operating-points-v2 instead.

Currently, the ufshci node declares the freq-table-hz property but all
values contained in the array are zero, thus converting it to an OPP
table is not needed.

So, add in ufshci node the rx_symbol clocks in clock list and remove
freq-table-hz property.
Also reorder properties in node.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 9aaf8b6edcb5..5ff7b7e543b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1472,8 +1472,7 @@ mmc2: mmc@11250000 {
 		ufshci: ufshci@11270000 {
 			compatible = "mediatek,mt8195-ufshci";
 			reg = <0 0x11270000 0 0x2300>;
-			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&ufsphy>;
+
 			clocks = <&infracfg_ao CLK_INFRA_AO_AES_UFSFDE>,
 				 <&infracfg_ao CLK_INFRA_AO_AES>,
 				 <&infracfg_ao CLK_INFRA_AO_UFS_TICK>,
@@ -1481,15 +1480,15 @@ ufshci: ufshci@11270000 {
 				 <&infracfg_ao CLK_INFRA_AO_UNIPRO_TICK>,
 				 <&infracfg_ao CLK_INFRA_AO_UFS_MP_SAP_B>,
 				 <&infracfg_ao CLK_INFRA_AO_UFS_TX_SYMBOL>,
-				 <&infracfg_ao CLK_INFRA_AO_PERI_UFS_MEM_SUB>;
-			clock-names = "ufs", "ufs_aes", "ufs_tick",
-					"unipro_sysclk", "unipro_tick",
-					"unipro_mp_bclk", "ufs_tx_symbol",
-					"ufs_mem_sub";
-			freq-table-hz = <0 0>, <0 0>, <0 0>,
-					<0 0>, <0 0>, <0 0>,
-					<0 0>, <0 0>;
-
+				 <&infracfg_ao CLK_INFRA_AO_PERI_UFS_MEM_SUB>,
+				 <&topckgen CLK_TOP_UFS_RX_SYMBOL>,
+				 <&topckgen CLK_TOP_UFS_RX_SYMBOL1>;
+			clock-names = "main", "aes", "tick", "unipro_sysclk",
+				      "unipro_tick", "unipro_mp_bclk",
+				      "tx_symbol", "mem_sub", "rx_symbol0",
+				      "rx_symbol1";
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&ufsphy>;
 			mediatek,ufs-disable-mcq;
 			status = "disabled";
 		};

-- 
2.55.0


