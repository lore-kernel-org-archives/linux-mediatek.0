Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07DCC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIix9NUB58GA1Phc1E7xLm0DlxKPAOTzIyIH1hpXNUs=; b=BdbjR8XPNJTsItMHnzC9Gg7ZY8
	P9RpWdLYAFmvtqL+d1r7T0lWgGeCAvpNFmbNcdvKLBLMbgF73n2o4vIKCGX5ut9zgBKHSyHw27mXH
	8CeknVEnLSaWx+cse5cx8NwcTPgCThXPzEqk2SDG9PAdFfwgGuKN1XACIiHRkC2GFSxbUjByazoIn
	AbFYJBYJVxEd+0Q8TKPIYrBibjR5gbRbT8IEhetP67ySbwoG1mFqYHGosaGe9J/wwwoKW4GdsaRjE
	ILjHODwVLhtx/PlJAlLLKYQdHTFy8YKIS1qfo6nSLAZwZcob9v+qKq9k9cQlKDOj6l7MWlC0KMnFv
	UjT2BqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPi6d-00FN1d-4v; Wed, 08 Feb 2023 10:55:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxU-00FHzO-Fx; Wed, 08 Feb 2023 10:45:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9F4F666020A7;
	Wed,  8 Feb 2023 10:45:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853147;
	bh=FI2us/UkIVoCg8nkyQH1lEg3BYTtgiInz0G8Rg/jppM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DwE2tl5bEhuYJKAWWPEtwFalmIDORfepgLB6vFQw60cM5JBtVOl+INfpFQrhy+Oos
	 It6T7jC0N1TQqG2yr6gDOoDCUrFWRCp/ycVXcNjeWlNPQHIOznhuWKKd5XcmN9TOKe
	 DYTavQPV6Yn4pzEKZV0A8/NseCaRYjLbePGHKPOjjcbQOZgXqx8RHrZUKagX4H0gqk
	 fCu5fd7YRq8KyHmQOzQM0wSrfbg1Y6nAify0aOMpXsHy8i35MezakEj6FSnaDQQ+x0
	 mDbN2wxH5AtlLLUyH2YmF7DrLGHj/IXCjf+gjnPyOVo5NN/fK1ScGhRYoZczpCw6ly
	 Y4USfjC2smH8g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 16/16] arm64: dts: mediatek: mt8186: Add GPU node
Date: Wed,  8 Feb 2023 11:45:27 +0100
Message-Id: <20230208104527.118929-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024548_703874_DB552AC4 
X-CRM114-Status: UNSURE (   8.73  )
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

Add a GPU node for MT8186 SoC but keep it disabled.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index a0d3e1f731bd..f095e5b77937 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1075,6 +1075,24 @@ mfgsys: clock-controller@13000000 {
 			#clock-cells = <1>;
 		};
 
+		gpu: gpu@13040000 {
+			compatible = "mediatek,mt8186-mali", "mediatek,mt8183b-mali",
+				     "arm,mali-bifrost";
+			reg = <0 0x13040000 0 0x4000>;
+
+			clocks = <&mfgsys CLK_MFG_BG3D>;
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "job", "mmu", "gpu";
+			power-domains = <&spm MT8186_POWER_DOMAIN_MFG1>,
+					<&spm MT8186_POWER_DOMAIN_MFG2>,
+					<&spm MT8186_POWER_DOMAIN_MFG3>;
+			power-domain-names = "core0", "core1", "core2";
+			#cooling-cells = <2>;
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8186-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.39.1


