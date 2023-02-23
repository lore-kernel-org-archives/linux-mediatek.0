Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393B6C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OLfWRt1qnMKHr69lUZuZA1lccVf6zW2NS/UVgQOAvQ=; b=3Bj5Wt1krs/nT+CVjZZIXiJSd1
	r2Lu3PrW5co6cvXzj9BamDAxKjaMbhg1jbrTYJFC0SLRNl30mRLt3VZRrnS6H4igQTnrhSPoB4pJB
	hzgRCISUm7gJQucS+ySqTcVxY3tNoVVNlD+9Dg6rlyiy1PrG+HkOKTYlD6h+0BDbmBDAM/y3IdgIK
	kZgTsgKlNAwafB3JVMNoQpuNoYPxtm+8UJcfiGFHfEQvIzCmrphJygfpdZOHCF/iw0fUD5ry0WJmc
	GUslLjpI2EoVKuEyNGCdp/eVIqGlUI9DFI2wOrdvJ4zUbnY8HB3uIYyhcOBkQGYCMWRKlisiEkH6G
	3TPpGTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVC3S-00GeCS-0V; Thu, 23 Feb 2023 13:54:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBtD-00GYO0-Nf; Thu, 23 Feb 2023 13:44:05 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0062F660220E;
	Thu, 23 Feb 2023 13:44:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159842;
	bh=h6g8JhUl3ByKknKJO0h/z+EUOf6qSWsVNOP7Ves+YLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FXXezOP7iroYHgJ5QMenpkLXPgbwhwSRXrI92ZKNC5kUhf9L42eJmE3UMGA/OqMnN
	 9xoLpSZjqinDokBsC1plasL3onf3Y/Qty6G+GX4Hd8ACLjp0pDokk8AKlWHfVHPkNl
	 eE0g6DmSE7nxs3nZPvLzAW1NM/Jian7xm1rt5olOCsuo/3+5oIoTn0PteZ3/ORxoTe
	 qLJ0d7K38s7jrag7Jn7EU4tAJACVLw33kfMT9KfEXQX/ZTkVsrabRUxElVRC/LSix1
	 DSb6qlAbxPrRFus5VAA6PGv6mr/yMqkB8jR3gEcc/cl8EZXEWJdGaLkkdeXjHBEBbC
	 04nJIgj9k1d6w==
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
Subject: [PATCH v2 10/16] arm64: dts: mediatek: mt8192-asurada: Assign sram supply to MFG1 pd
Date: Thu, 23 Feb 2023 14:43:39 +0100
Message-Id: <20230223134345.82625-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054403_969564_016496D9 
X-CRM114-Status: GOOD (  11.34  )
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

Add a phandle to the MT8192_POWER_DOMAIN_MFG1 power domain and
assign the GPU VSRAM supply to this in mt8192-asurada: this allows to
keep the sram powered up while the GPU is used.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi         | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index ec013d5ef157..df477eb89f21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -384,6 +384,10 @@ &mfg0 {
 	domain-supply = <&mt6315_7_vbuck1>;
 };
 
+&mfg1 {
+	domain-supply = <&mt6359_vsram_others_ldo_reg>;
+};
+
 &mipi_tx0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index d536fe5f33a0..91b63060ec7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -506,7 +506,7 @@ mfg0: power-domain@MT8192_POWER_DOMAIN_MFG0 {
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
 
-					power-domain@MT8192_POWER_DOMAIN_MFG1 {
+					mfg1: power-domain@MT8192_POWER_DOMAIN_MFG1 {
 						reg = <MT8192_POWER_DOMAIN_MFG1>;
 						mediatek,infracfg = <&infracfg>;
 						#address-cells = <1>;
-- 
2.39.2


