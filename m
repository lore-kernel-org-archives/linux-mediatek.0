Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3944AC636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPVkzXD0y7FrrfPz3BYNkGmHlmh/mtfb/jlWaNflUlc=; b=fZyoW3X49yBNA9MzFRxpkiOedn
	fgGwbUSrW8svxjAFi3QLOXXs4G8Y6yAS/wp1RS4R+oYCWhnZ3Y9/wspkEk4fkC1JEcEzxRhhqj8eU
	p6I/JBU/EWL4TftgiKaHMk6WwKK9dc3lOZcWNUzVbNAehQigxucDlk9haolDCR5CHHcE6halQzpJn
	7Vu9cF5Y7NbfQT/Wqsu6vYIFHYdz4OPEfSi0RlMY26S4CjctqgjJRfXfH9qkJO8HFd6apTXJm1iHw
	wOzkHYaMUqH9UuwThR9vRZdjtA3IvR7qu42QhB2Qbef+c9KbOeb5boi6BCAaB8gsCyulTuYnCkxT4
	OsgMqMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPi3v-00FLZI-Tn; Wed, 08 Feb 2023 10:52:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxP-00FHwX-Ud; Wed, 08 Feb 2023 10:45:45 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3503D66020A1;
	Wed,  8 Feb 2023 10:45:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853142;
	bh=mhl1CTumhgyodipibc6iIlxxn58Kbt1J0bEZfVVQx2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gx6Z6j9Vfk/zIYcAIhInBZGNpZPDvNfKcky8BLgzdwjh4x2v9swakwpPrNLA1ojth
	 BKDp98gIkUWVNpg1u6yTXyrOZB+gr30ypXvEJe3GWyGQiwsRaFmAlpgcBpWllhbpVH
	 KkbAbzPVJmvIqrv1xlcj1bfvRbs6VQNMR2FBYqFmk+5AR4hFf4Rd+CIp2Y+qELGoKQ
	 tfo6AzaHL+v4L/pgw5PD5FAj0CoxH2QfP/CJ7Xe6JAnAWDrcpwFKTin2zDT3CwaxDB
	 JE8Ac505C52JsXxcfw9cj01yMxmTBYD/F2Y0/v0b4FQs+20XdkI2AuP+mG8IVYLXxR
	 lgchIfi7VohaQ==
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
Subject: [PATCH 10/16] arm64: dts: mediatek: mt8192-asurada: Assign sram supply to MFG1 pd
Date: Wed,  8 Feb 2023 11:45:21 +0100
Message-Id: <20230208104527.118929-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024544_174104_CC45465E 
X-CRM114-Status: GOOD (  11.85  )
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
index 686d5cc22d6a..e7669cd80040 100644
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
2.39.1


