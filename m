Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B83C64ED8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faFMHtrnXNAjdyzSKI/3lVSwB2usiDjprwxUw7xfib4=; b=2O9Ht720b33WUpdrqUJYdjdD4X
	rUJh5dVXGsAQe7T7TH0zrlaKDX4HB5xsQbqx6s2lsXoihMY1AkgLK/2iy+yL6Jjj4smO9JnjWr7NN
	rz5cTLznINoKiB40Nzav9bYVBMVBDY0AZlQhtByqCPpIXXdalbyyHGXlTB5brvl4UrwCkylCwr78t
	3yTJzLVnKYmFvrHTRkDm04rJ5Js735NNPRDZWXuJV8xygwWYqSuA4GfOagM+fqYS/zZFk3k8l70Po
	wmDjkeUblRFFOlcGJbv1ynLVQ9m1RWVPYkVBl+qjMqIMqbIpEOg01Ls22BPvaP4u+bPTrt898k0Ya
	A1bFNUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVC4W-00Ger3-0X; Thu, 23 Feb 2023 13:55:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBtH-00GYRF-J3; Thu, 23 Feb 2023 13:44:09 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D451B660220B;
	Thu, 23 Feb 2023 13:44:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159846;
	bh=dy6p0VV97fJU2W+Kqgjonk70VW8h+mDMVbMYggMpSpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GuSHrUQy9erq5ZNAVsetpEIRGkydtz4GeZNTdwFsqf/mEm6sdXG7bXX/F4pbqqrRo
	 Ak/hOc3ehfvQsnR8Z5Z2Y8nhOfHVjJKzisuWTcaIk11oOGk/FnQ33Q05Rf0QDx5aea
	 ol9TyuYtlo+JYMIEN5oN9biMC7PDtIvfslaVXX3mJyzs8zpxGt6r8T144LT71RfS46
	 EqSbj3B/w5X5c5mFtlyGl8VHdjArAZ9hz8vxLyGzYXWc/MLr795/0g/lnoW7S+U8f1
	 qsWzjjOyAsTg0s/7q+l4tuyNu2FzDr/qtXz25t6uuDKT9hR5sBDilceqteh0ARwwVe
	 e6hYwbly7GakQ==
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
Subject: [PATCH v2 16/16] arm64: dts: mediatek: mt8186: Add GPU node
Date: Thu, 23 Feb 2023 14:43:45 +0100
Message-Id: <20230223134345.82625-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054407_821186_A4E834F0 
X-CRM114-Status: UNSURE (   8.29  )
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
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index a0d3e1f731bd..dc760e4dafdf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1075,6 +1075,23 @@ mfgsys: clock-controller@13000000 {
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
+			power-domains = <&spm MT8186_POWER_DOMAIN_MFG2>,
+					<&spm MT8186_POWER_DOMAIN_MFG3>;
+			power-domain-names = "core0", "core1";
+			#cooling-cells = <2>;
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8186-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.39.2


