Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BFDC87FD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQmPMbE5lQCUPKYKA5PElMT+TJsdZNkrK70yn/W++bM=; b=NTVvJlJ/2tJfyU
	FSdTBMdvUhR+cXzjBYKeDdZt0z7WHSPfUBcwdNHNc8weXxMHrBRZoyOxiImslsUKdTmsila6dKa1f
	sLxqEtzyEux01gyrSkgaVwc6eF6aMOYwPF7xYu/3rQMEFQ7SPs8N8eCtPjnHzw+38M2QTcAlNUSNI
	9oy0YFPPhdB6BizcAY7iLdQgFJYWQ+3U5OrQA3es1kbFBDRC71U4cxzIWr8PDXd8J1DqImbbZqskI
	pn7pfq1ExIPhumFcLsI50+LcHcZL43jdGC0l9ZY64ZzeMyfWIGogvlHboOCzIF9oe35nhbL9c+9BK
	1ZyN/lNYLIhEYlQT6ZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesbq-000000077ac-03sw;
	Thu, 24 Jul 2025 09:51:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerVg-00000006uD6-3vka;
	Thu, 24 Jul 2025 08:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346463;
	bh=Pel7h38bcUMPfE/D3HqIepQWXGSnvjnAoZZOpkysy0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HymlcTuK7c/Bm3rlM5A2/bpPos7MG5VigxisyMResbZzyrX3Si6gHiNxYTjgPpZH2
	 WSsj912RwYurKIeVl7ernFmlDS4bVobJfvv3TSVkhpBRl4hoYASx2QQDjQnFSP+Lov
	 4gIiPuSAY1ImG6gM71MLaBwTtd1RvyLoxPcmym3IJ6QkGIvgC4OCv3LIN/HwE3Vn6b
	 MXwb0oZZ5TzIXiRt6ZJNks9zCI+cHiQL74HyaUGaow2LIylkClfuUqkCasuRsSOMZ6
	 dfVQVYFDRrqNkNfUqQdkbcgi/BsAM7hQ+IZRbhs6PIfK0VYscP1JZldAPp3lNuJ8v3
	 MtLqDTdE3eu0Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECB2117E1062;
	Thu, 24 Jul 2025 10:41:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 37/38] arm64: dts: mediatek: mt8395-kontron-i1200: Fix MT6360 regulator nodes
Date: Thu, 24 Jul 2025 10:39:13 +0200
Message-ID: <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014105_159546_688818DE 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

All of the MT6360 regulator nodes were wrong and would not probe
because the regulator names are supposed to be lower case, but
they are upper case in this devicetree.

Change all nodes to be lower case to get working regulators.

Fixes: 94aaf79a6af5 ("arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
index 4985b65925a9..d16f545cbbb2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
@@ -352,7 +352,7 @@ regulator {
 			LDO_VIN2-supply = <&vsys>;
 			LDO_VIN3-supply = <&vsys>;
 
-			mt6360_buck1: BUCK1 {
+			mt6360_buck1: buck1 {
 				regulator-name = "emi_vdd2";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1800000>;
@@ -362,7 +362,7 @@ MT6360_OPMODE_LP
 				regulator-always-on;
 			};
 
-			mt6360_buck2: BUCK2 {
+			mt6360_buck2: buck2 {
 				regulator-name = "emi_vddq";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1300000>;
@@ -372,7 +372,7 @@ MT6360_OPMODE_LP
 				regulator-always-on;
 			};
 
-			mt6360_ldo1: LDO1 {
+			mt6360_ldo1: ldo1 {
 				regulator-name = "mt6360_ldo1"; /* Test point */
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3600000>;
@@ -380,7 +380,7 @@ mt6360_ldo1: LDO1 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo2: LDO2 {
+			mt6360_ldo2: ldo2 {
 				regulator-name = "panel1_p1v8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -388,7 +388,7 @@ mt6360_ldo2: LDO2 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo3: LDO3 {
+			mt6360_ldo3: ldo3 {
 				regulator-name = "vmc_pmu";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
@@ -396,7 +396,7 @@ mt6360_ldo3: LDO3 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo5: LDO5 {
+			mt6360_ldo5: ldo5 {
 				regulator-name = "vmch_pmu";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -404,7 +404,7 @@ mt6360_ldo5: LDO5 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo6: LDO6 {
+			mt6360_ldo6: ldo6 {
 				regulator-name = "mt6360_ldo6"; /* Test point */
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <2100000>;
@@ -412,7 +412,7 @@ mt6360_ldo6: LDO6 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo7: LDO7 {
+			mt6360_ldo7: ldo7 {
 				regulator-name = "emi_vmddr_en";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-- 
2.50.1


