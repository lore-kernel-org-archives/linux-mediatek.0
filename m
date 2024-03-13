Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AD2C54791
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gghnJKFMKJWF43cxUkFVWRbuHireUXccNniPvQfKUM=; b=LiVeuPp+vlUL3CsEIA1B6PR821
	yPMcOM+zNYeugjfizy26pw5eiZA2gz1iIzHq7iIXnhbnK+BNYws9BnmcQgKeqGnG0B/R+W5Vt2JzP
	04fQEYe25IxMmBNpDILEPIV7TjBZe+ORplM8lq2m0/ebB/0Lpu0zKzb/zkwtxZWn040UED2a8BLx/
	7Dt7LJdaMdxkt31MtIwpDj7pb2twOybQMPDWoPpldDHaHAnBla1BrOnUXFirXtofgRKODZkYTSa2A
	LXPHfg75V7XsmjDEh2KAA0bzew0C9ezkgJ/OFoybvNEy67iasPL9NkhEheOko+0cYdHJL9alda+uB
	++f1I8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPOX-0000000AOh8-1D8p;
	Wed, 13 Mar 2024 14:15:49 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPOT-0000000AOfE-0nXj;
	Wed, 13 Mar 2024 14:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710339343;
	bh=n4FuiB7K0drjcCak0GaKJlMMx8Pa/GKxrLH1nXgS5pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MO03A6vlWbcEdyv72y5bh5Tyjc3t3GHSWzTDoeTYyPIa5PCt5BtERBCHa7oa6v3qR
	 T4TQzKhNvgZnTOcxzp47VOyHmaEvSgjSB7gT8swH7s8AjbL4Z4UPJRR/FBAO6BBGDw
	 lomFmnuRlsmCdBg5wZs7/X62RA6RLkClqcF3iihtYtunFQBJaYLVRtPPH0GGJmlxDA
	 XBgTqa7XxIMS2DwzNUOxtGLbfka70ZPrPOe8oL+A+Pjy4My0bWVfAeLQj9C5W1+GQ4
	 SZwB5UqBAV1JzKmPVmeoNu+5UQAFsFUqvt437HO8s/p9N2EVN0tOu0OGpxPUq5VMgp
	 ZFudSGpHbcEuw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2E65237810F1;
	Wed, 13 Mar 2024 14:15:43 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/2] arm64: dts: mediatek: Complete chassis-type for MT8183 Chromebooks
Date: Wed, 13 Mar 2024 15:15:37 +0100
Message-ID: <20240313141538.1438167-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313141538.1438167-1-angelogioacchino.delregno@collabora.com>
References: <20240313141538.1438167-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_071545_386108_26DE62F7 
X-CRM114-Status: UNSURE (   8.55  )
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

Define the chassis type on the remaining MT8183 Chromebooks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts      | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts | 1 +
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts     | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts   | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts      | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts      | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts       | 1 +
 11 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
index 072133fb0f01..f34964afe39b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
@@ -9,6 +9,7 @@
 
 / {
 	model = "Google cozmo board";
+	chassis-type = "laptop";
 	compatible = "google,cozmo", "mediatek,mt8183";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index b595622e7bee..72852b760038 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -9,6 +9,7 @@
 
 / {
 	model = "Google fennel sku1 board";
+	chassis-type = "convertible";
 	compatible = "google,fennel-sku1", "google,fennel", "mediatek,mt8183";
 
 	pwmleds {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index 5a1c39318a6c..757d0afd14fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -9,6 +9,7 @@
 
 / {
 	model = "Google fennel sku6 board";
+	chassis-type = "convertible";
 	compatible = "google,fennel-sku6", "google,fennel", "mediatek,mt8183";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
index 3ea4fdb40118..6641b087e7c5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -9,6 +9,7 @@
 
 / {
 	model = "Google fennel sku7 board";
+	chassis-type = "convertible";
 	compatible = "google,fennel-sku7", "google,fennel", "mediatek,mt8183";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
index 3fc5a6181d7e..877256eab262 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
@@ -9,6 +9,7 @@
 
 / {
 	model = "Google fennel14 sku2 board";
+	chassis-type = "laptop";
 	compatible = "google,fennel-sku2", "google,fennel", "mediatek,mt8183";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
index 23ad0b91e977..b981dd31a430 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
@@ -9,6 +9,7 @@
 
 / {
 	model = "Google fennel14 sku0 board";
+	chassis-type = "laptop";
 	compatible = "google,fennel-sku0", "google,fennel", "mediatek,mt8183";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
index e5bd9191e426..f3ac9c074226 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
@@ -9,6 +9,7 @@
 
 / {
 	model = "Google kappa board";
+	chassis-type = "laptop";
 	compatible = "google,kappa", "mediatek,mt8183";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
index 8fa89db03e63..e8241587949b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -9,5 +9,6 @@
 
 / {
 	model = "Google kenzo sku17 board";
+	chassis-type = "laptop";
 	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
index 89208b843b27..928b205a616a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
@@ -9,6 +9,7 @@
 
 / {
 	model = "Google willow board sku0";
+	chassis-type = "laptop";
 	compatible = "google,willow-sku0", "google,willow", "mediatek,mt8183";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
index c7b20441d053..71307a8052d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
@@ -9,5 +9,6 @@
 
 / {
 	model = "Google willow board sku1";
+	chassis-type = "laptop";
 	compatible = "google,willow-sku1", "google,willow", "mediatek,mt8183";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts
index 7739358008ee..5a416143b4a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts
@@ -12,6 +12,7 @@
 
 / {
 	model = "MediaTek kodama sku32 board";
+	chassis-type = "tablet";
 	compatible = "google,kodama-sku32", "google,kodama", "mediatek,mt8183";
 };
 
-- 
2.44.0


