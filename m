Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF00C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooOO8Z9DK1cxxOsEEqsMLqLriOt2s3cIE9In6JWQTmE=; b=SilLSvVjXZNrYpMPaDzy7P782v
	wc8ZSgUreM10AUBvv7ZIKjVfe4vJVnomfA1KB2rn7+MPpo6QVk5ujC8AUzxnzIaT4i5WWH1C5dIa6
	NTHpDpa4pRX0X3/8pyNdMKIn2FKmhqfBmCPd35PF9LNGFu4ZNyfBrGSS4lib1hmdlKt24mtBjwZsH
	pOJjUmzvL7iEmqeZhsEedY3TeDZlPRi7lhgfpyeC4eYD/x9HSY0GTfHX1Gpy/Ernn+fSfkfkxFLYV
	7KVjUYInVI40Y9fWF7E0kJVJ4rXAVYCk+AggJ0srMTMbomckYu+FPzfJ7c06YRRCTGN9K9RZVDAiA
	fqZKlOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPi32-00FL34-Mb; Wed, 08 Feb 2023 10:51:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxO-00FHvV-Db; Wed, 08 Feb 2023 10:45:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AC95E660209F;
	Wed,  8 Feb 2023 10:45:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853141;
	bh=q3Ks3xCpv4XCuWtELbScLLMj0j/dhmkTbq/7OVCjIrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZT3rh5G0RfvzFBq9vd7yUtHUlSJcPrjYnTbkD9tETEFa98yYaCN963PCGEzRPisRd
	 qtFOy8Zyh3LHdlC98Fil1HNByz+xrMisDcR2eBYBa99gpcbD24g0lYaz8JKYHVmjV4
	 CJHaaBih2yN1aBUnLxnVIRSXIGw1nKraC0Y1vTBKHWarN9LNSVUeRr3jOixGGiTjlE
	 VClmgVIxAsCVVeIbmUI5Ey6Hl38aOn6CubwBmZDdD6uErwM1yKCW8GesYk2q781Q5J
	 Q1tA4X0AestvbWrdOyOVAxey9u1xX+sqa3pOuJtEJ6xna//2S0jRkeLn5iekomNZaR
	 o45wXr2tEXVqQ==
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
Subject: [PATCH 08/16] arm64: dts: mediatek: mt8192: Add mfg_ref_sel clock to MFG0 domain
Date: Wed,  8 Feb 2023 11:45:19 +0100
Message-Id: <20230208104527.118929-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024542_667232_A3DA35D3 
X-CRM114-Status: GOOD (  12.03  )
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

The mfg_ref_sel clock is a mux used to switch between different "safe"
(and slower) clock sources for the GPU: this is used during MFGPLL
reconfiguration and eventually during idling at very low frequencies.

This clock getting turned off means that the GPU will occasionally be
unclocked, producing obvious consequences such as system crash or
unpredictable behavior: assigning it to the top level MFG power domain
will make sure that this stays on at all times during any operation on
the MFG domain (only GPU-related transactions).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index a60120088d45..5b4bf2d1d584 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -499,8 +499,9 @@ power-domain@MT8192_POWER_DOMAIN_CONN {
 
 				power-domain@MT8192_POWER_DOMAIN_MFG0 {
 					reg = <MT8192_POWER_DOMAIN_MFG0>;
-					clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>;
-					clock-names = "mfg";
+					clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>,
+						 <&topckgen CLK_TOP_MFG_REF_SEL>;
+					clock-names = "mfg", "alt";
 					#address-cells = <1>;
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
-- 
2.39.1


