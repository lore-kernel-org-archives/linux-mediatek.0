Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BC1C3F6B0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKbmdALHxt1+FXFavL4Rp2ffGYdbb33w0bDKrotVows=; b=cS+TAFIHxN+WKFMkfFA4YXOzz0
	WtwbkBBSk2nS9FVxU2DCPk5Ox4SMHpPktsgKsFMOxDBP8JNsx88KdCTE0Q0E8i1VdBhXkWenUQDGK
	hptww7xtADXbYNyoK2VOFxHCiaXUQdoa4IqQz1/uicWdYHPtEayC8vuojE+5xpb+3q6Z4JX4RYnn4
	WxZAzpn+2IkPF4YJ/Tb3DuV+zzHUP/2EiMomDPIZMM1ncDJu4wxGwSSnqkuMNnYHhWlPOvM23r4eB
	RziJcj1eSxFwknw1ZOvbFD7/xQe2RpYraq7mZmAy09anPtmccMaU7y8EndG93ggiRITMF+1XfHvmg
	uspC8gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNVP-004Aar-AR; Fri, 29 Jul 2022 10:46:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUG-0049wE-O8; Fri, 29 Jul 2022 10:44:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 74E196601B66;
	Fri, 29 Jul 2022 11:44:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659091495;
	bh=TA74QxJMdtjbhlYPI6ogd09Z8LzPo3IXxmpuJNWStt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NAe69YGjki0F5pOABZw7N7isdxhWy81tV+oAU2rC2q+u/l4xSJGwvnjCmz1vPHpIa
	 rA9bMPoiDIqNarvYBSJaH89J5/7EmB1GGp5PqlNLq50/TqwjV0xpb8BgfKuY6lnYX7
	 QdLPz6/pIeqlzMWxyTWaDtxuVu0MzsmP4nz/9vRi2myY3ZeZDiVbTuKvs3f5fMyK6H
	 KyU89Xze+3VjsSa8BIW9kg7xQuXUyKFThy59ej1f6+AlP1SROSzIr0zE2958XJ735E
	 3JaxbkDq67zPK7JOVTSV0OfLEoE1N2VoBDoiRQDT2xAQc7moQV5TLNSlXL7kxh25aF
	 eUcTq7GCvjw+w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	fparent@baylibre.com,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	long.cheng@mediatek.com,
	wenbin.mei@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 3/8] arm64: dts: mediatek: mt6795: Add topckgen, infra, peri clocks/resets
Date: Fri, 29 Jul 2022 12:44:35 +0200
Message-Id: <20220729104441.39177-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_034456_934847_4E7B9CAA 
X-CRM114-Status: UNSURE (   7.74  )
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

Add nodes for topckgen, infracfg and pericfg, providing various
clocks and resets and needed to support basic IPs of this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 46f0e54be766..9166d481a366 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -192,6 +192,26 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
+		topckgen: syscon@10000000 {
+			compatible = "mediatek,mt6795-topckgen", "syscon";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg: syscon@10001000 {
+			compatible = "mediatek,mt6795-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		pericfg: syscon@10003000 {
+			compatible = "mediatek,mt6795-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt6795-pinctrl";
 			reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
-- 
2.35.1


