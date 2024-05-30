Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090A6C25B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WKb59GdaZ16vWTFxCjE3qZ2BMCsjK481LH3SrRs+fk=; b=f9Fp53I6UYkWPxVRiAXBAXo3XH
	UN9q5rpZMNMLtDlDTxND7qaqIkj3Uf12ftm9oMNLnkfqZE0r8Zds+0yEz8KojqsQKQq4IvatC25a+
	aZJviVg3iz71hAeGutpeh+ECgfWFCQM1NyEX3/M+m2du2U172yhbB+Mq4tzXIPPuBslfnb1SfZpkl
	G857sgYRaBbRhqTXkRrUvEEH+chS3s+nW3vXBcXC5iIDTou2FnmfC3rRUfntJYgB4Q+vCPI3te7+o
	aVDNGQaQTJPvKLjJ+mYzETp06XK7JUgcjz8eG/hYCJXj9yEb09xqDn/0I97HBEFphx8rZKn45+TTb
	4sJ38Vgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcBi-00000006qUH-1s2L;
	Thu, 30 May 2024 09:35:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcB5-00000006qDV-0Wbx;
	Thu, 30 May 2024 09:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717061669;
	bh=4isRwFg+lFtocx2ttK9dTVWtREPPc/h5BSwfHPf+To0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=4FIwHtX73FL2IKfENyklA3RqOGZFhuTT6kI+0WxRLTSvzAfyk7NzNYAlGVABpGv0z
	 irfD92ROMgRL8WQs8oMBuni/z+PCJ7rH6CvKmm0KT7LxigjhlhOoD6x/gw3WfllBbW
	 rCI9Qm4D7ranhlRqORJXie+W6O8/tJhapF3hxNNT7qg6IyhEll1acVaFnYS2M0Sz9D
	 sdWKSfwRruPFt7oc92VDqEDNPt04vqCitu/j/JwTaFVKn+4ySf6JzaV2r1c7T2gROP
	 JMHfsvUojG30Nq04IyUTFsnPikh5dveXQikcykjvrMHWsZc3R0PbQ3vRImus4mRtyN
	 gO7Cn1xHL98nA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 832F237821AE;
	Thu, 30 May 2024 09:34:28 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	bigunclemax@gmail.com,
	dlechner@baylibre.com,
	marius.cristea@microchip.com,
	marcelo.schmitt@analog.com,
	fr0st61te@gmail.com,
	mitrutzceclan@gmail.com,
	mike.looijmans@topic.nl,
	marcus.folkesson@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 4/4] arm64: dts: mediatek: Add ADC node on MT6357, MT6358, MT6359 PMICs
Date: Thu, 30 May 2024 11:34:10 +0200
Message-ID: <20240530093410.112716-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_023431_385883_CCA33264 
X-CRM114-Status: GOOD (  10.13  )
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

Add support for the ADC on MT6357/8/9 and keep it default enabled
as this IP is always present on those PMICs.
Users may use different IIO channels depending on board-specific
routing.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 3330a03c2f74..5fafa842d312 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -10,6 +10,11 @@ &pwrap {
 	mt6357_pmic: pmic {
 		compatible = "mediatek,mt6357";
 
+		pmic_adc: adc {
+			compatible = "mediatek,mt6357-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		regulators {
 			mt6357_vproc_reg: buck-vproc {
 				regulator-name = "vproc";
diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index a1b96013f814..641d452fbc08 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -10,6 +10,11 @@ pmic: pmic {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		pmic_adc: adc {
+			compatible = "mediatek,mt6358-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6358codec: mt6358codec {
 			compatible = "mediatek,mt6358-sound";
 			mediatek,dmic-mode = <0>; /* two-wires */
diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index df3e822232d3..8e1b8c85c6ed 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -9,6 +9,11 @@ pmic: pmic {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		pmic_adc: adc {
+			compatible = "mediatek,mt6359-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6359codec: mt6359codec {
 		};
 
-- 
2.45.1


