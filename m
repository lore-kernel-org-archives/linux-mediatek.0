Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CBDC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukJ/KcMexPjgk3Ng3v3ZPDqX+00rSaI/JIbhSYrMsGY=; b=4i0tXnfyo7E4rYj7I/zZQ0E4E0
	jGgnI25ch5fu5lck4PIoypGZgMJsZekRZ2Kw/6ZNDEOdP8rFgF8XorQPhSwGGHHiXxhcIUXT9Gq1Z
	w71hV4IQyy90GExowjFGyyQ7LOez/PqIDMPEY2P2zecnoIBlebhM8uST/c7C7LR/piY58BHdE59oj
	9hRV4sLYh9FvWtJI5KN7bPAXRblQAwfI/hY4Boqz/yJ74I8EBNCbWfIVFrIXKmFvNK3Y4NnmHBoR/
	72flDsNcmBLAxBRJRPkYx7XvZNxPBaxFLdVmYp3Xvj9qHh/bhGGjXWHiSxsLnYiALhTxSUaCviOda
	goVWuxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSGx-003Ok7-0j;
	Mon, 30 Oct 2023 13:25:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSGs-003OhE-3D;
	Mon, 30 Oct 2023 13:25:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 692936607385;
	Mon, 30 Oct 2023 13:25:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698672330;
	bh=igvycGvXnIubgLktMRrTkJSESlnPoKAakpRSWANTs88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DkG7Kijv85Vq/fYlqdDuAa9BlltysX2NepDDr0PqsTnKChqKZd5xmcl9O2wRHMqbj
	 eFloZOLxCUgF4rU7Oh8dMQ5g0LoDS8ewJEuCP8D15UHT/vei/BpPUpf9z7lEcxdFsV
	 odYpItm+64SWNp1bhDeMZ6+8VLecnLxnRtoPKVcCVCLfl7WgPd84fPQ07oBVqgC0pc
	 ZG1TUMTU9GW0UCmVAgp7dlhIrP5EJYY1T3u3tR/59TuUlIcqVnbeVzQS6WWAOmUBGf
	 UPe9f6HdzCWiBVsUCqmlCZnL6G4kwkld7Cu+lum01f+0YL0SzBzGpP+RNXW2oJnFC+
	 7eoHpo2zkmxvg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	wenst@chromium.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8195-cherry: Assign sram supply to MFG1 pd
Date: Mon, 30 Oct 2023 14:25:23 +0100
Message-ID: <20231030132523.86123-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030132523.86123-1-angelogioacchino.delregno@collabora.com>
References: <20231030132523.86123-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_062535_163368_A0402E9B 
X-CRM114-Status: GOOD (  13.30  )
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

Add a phandle to the MT8195_POWER_DOMAIN_MFG1 power domain and
assign the GPU SRAM (vsram_others) supply to that in mt8195-cherry:
this allows to keep the sram powered up while the GPU is used.

This means that it's now possible to remove the regulator-always-on
property from the mt6359_vsram_others_ldo_reg vreg, so that it will
be switched on and off during suspend.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 5 ++++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi        | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 26213100419a..9d0f3d25cb07 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -482,6 +482,10 @@ &mfg0 {
 	domain-supply = <&mt6315_7_vbuck1>;
 };
 
+&mfg1 {
+	domain-supply = <&mt6359_vsram_others_ldo_reg>;
+};
+
 &mmc0 {
 	status = "okay";
 
@@ -552,7 +556,6 @@ &mt6359_vrf12_ldo_reg {
 
 /* for GPU SRAM */
 &mt6359_vsram_others_ldo_reg {
-	regulator-always-on;
 	regulator-min-microvolt = <750000>;
 	regulator-max-microvolt = <750000>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 79934cf051b9..8136d7631166 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -538,7 +538,7 @@ mfg0: power-domain@MT8195_POWER_DOMAIN_MFG0 {
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
 
-					power-domain@MT8195_POWER_DOMAIN_MFG1 {
+					mfg1: power-domain@MT8195_POWER_DOMAIN_MFG1 {
 						reg = <MT8195_POWER_DOMAIN_MFG1>;
 						clocks = <&apmixedsys CLK_APMIXED_MFGPLL>,
 							 <&topckgen CLK_TOP_MFG_CORE_TMP>;
-- 
2.42.0


