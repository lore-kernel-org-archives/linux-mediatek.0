Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530D3C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuwRMKnXVYShc3P97jDcb26qSE0+haHJPdzfJ4jdlqw=; b=m6zJpBc19g2jaV
	48wclaBE9tV6+i1pWwdq+ue0jRCGDEQSroK5Inzyii0D69/GaRUhO/jmvAUhQWRXKhSEe5ZDk+Teu
	ZFo+aFzr5jHiwOPkVNfAjt8jXndbiMj6gskeVSt717HU8rwY/iyK5VvarFac4sRoTLPbBO0tbaeML
	iWqUTA1qNqDsoQiiMmtpZIZAbI1xvvaKaI/SusRtFBFkMrr05+nrJJ1WQFVEShkbEgHXidpPByZmr
	KpzHu8DHZE52DmvynIWUYWBHjbfONPTI4iZrq2rcH4uAf1yTjNb44rQjVMNcBRir3XvOYfq7gdxzt
	UzmQZPHIoNPOo8F1b72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIIS-00DHiC-7t; Wed, 01 Feb 2023 18:57:28 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNII8-00DHZM-Bw; Wed, 01 Feb 2023 18:57:09 +0000
Received: by mail-ed1-x52c.google.com with SMTP id be12so7454194edb.4;
        Wed, 01 Feb 2023 10:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuwRMKnXVYShc3P97jDcb26qSE0+haHJPdzfJ4jdlqw=;
        b=qmcO0TsXrFJNMB1blLN1OeISeDhx5W/vxRLQQfdyvpO7OLnUH8thmpVDbHr/FlRMJl
         ABTEEI2YgQuyaKsB+ruF4q8sEkGGlJg0313P52N2Eo0QIIDXh7PGesqm/PBViVMWJOIK
         nHPx6wtL7dTikU/IBhclK797ushAwPJ40cHnvE0Xk8hgcvG0fDOCpzz01Ic6Y+BunKM1
         +58w+IsUC7Lg8/4xjj2/bJhJdL47W+rd1LALXI5l2alh0qSck5hdAWTRPczsSJzjR9o5
         uMQzu3kaX2KYqupTPTiJrEG8sZyN2B9H43+U+CZYXxm0nKZ4xJVpeW/yszQVj1Si6Xsb
         ObqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuwRMKnXVYShc3P97jDcb26qSE0+haHJPdzfJ4jdlqw=;
        b=wq4D+K8qx0Go3y6CpOoWI2m1OU8r2ylw+dExroixIbSkcSSzLHBVbKC71qA/e4nqzQ
         qjFjdxC85F1X0F24VsGOTH0TRdwP7GhCiMQP+HD2ZanWkEcSNxQJyYWqHXXTuIruuquF
         abEOfHPYwvjhsUaOuKHd6CGsTQwhGYTFze37QckVHNmazJKChLynwbpfFVz+/LnjI1sC
         UWn8r5GKXO3klqw6pNDdytC0QzPqfVFMVwPQiioqkjCBKeIN2KdO8iDf8Dh7DbHVO4/G
         uupzskU6B+pMN/hOaQ4rFl13PnE4UoKqUZlZrNR5TDWQ2nqN24w8WUE8AmS5iodZez6e
         2jZA==
X-Gm-Message-State: AO0yUKWOCaz/7zWmaTnXJa+FQEkEhCz2lP42MA/OMdgcWA7zQBQ1tY67
	wD4Ru0kXe+gJhVgbNQY9eQQ=
X-Google-Smtp-Source: AK7set91GJkEZxaPNp8C1RCo1CWg9qYFPezo1BrwwNKJSy/zr2IdMXM+suS5sMEjj9ygXka+SU820Q==
X-Received: by 2002:a50:fb81:0:b0:498:b9ea:1894 with SMTP id e1-20020a50fb81000000b00498b9ea1894mr3819082edq.15.1675277825071;
        Wed, 01 Feb 2023 10:57:05 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id dy25-20020a05640231f900b0049e210884dasm10100883edb.15.2023.02.01.10.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:57:04 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/5] arm: dts: mt7623: add gmacs to mt7623.dtsi
Date: Wed,  1 Feb 2023 21:56:52 +0300
Message-Id: <20230201185656.17164-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201185656.17164-1-arinc.unal@arinc9.com>
References: <20230201185656.17164-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_105708_433363_8D51ED51 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There are two gigabit MACs on the MT7623AI and MT7623NI SoCs. Add them to
mt7623.dtsi and adjust the DTs that call mt7623.dtsi.

Now that there are labels for the MACs, remove them from under &eth on the
DTs that call mt7623.dtsi. Remove the unnecessary mdio label from Bananapi
BPI-R2.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623.dtsi                 | 12 +++++++
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 21 ++++++------
 arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 21 ++++++------
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 23 +++++++------
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 32 +++++++++----------
 5 files changed, 58 insertions(+), 51 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 25d31e40a553..2bc3c49dc3df 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -981,6 +981,18 @@ eth: ethernet@1b100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		status = "disabled";
+
+		gmac0: mac@0 {
+			compatible = "mediatek,eth-mac";
+			reg = <0>;
+			status = "disabled";
+		};
+
+		gmac1: mac@1 {
+			compatible = "mediatek,eth-mac";
+			reg = <1>;
+			status = "disabled";
+		};
 	};
 
 	crypto: crypto@1b240000 {
diff --git a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
index e8b4b6d30d19..a64d68b6e165 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
@@ -112,20 +112,19 @@ &crypto {
 	status = "okay";
 };
 
-&eth {
+&gmac0 {
 	status = "okay";
+	phy-mode = "trgmii";
 
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
 	};
+};
+
+&eth {
+	status = "okay";
 
 	mdio-bus {
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/mt7623a-rfb-nand.dts b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
index 61f5da68d4b0..fac3ca0322c8 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-nand.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
@@ -116,20 +116,19 @@ &crypto {
 	status = "okay";
 };
 
-&eth {
+&gmac0 {
 	status = "okay";
+	phy-mode = "trgmii";
 
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
 	};
+};
+
+&eth {
+	status = "okay";
 
 	mdio-bus {
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 5008115d2494..1e03a3de654f 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -171,22 +171,21 @@ dpi0_out: endpoint {
 	};
 };
 
-&eth {
+&gmac0 {
 	status = "okay";
+	phy-mode = "trgmii";
 
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
 	};
+};
+
+&eth {
+	status = "okay";
 
-	mdio: mdio-bus {
+	mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index bf67a8e9be59..5e328c2a6a6e 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -156,27 +156,25 @@ dpi0_out: endpoint {
 	};
 };
 
-&eth {
+&gmac0 {
 	status = "okay";
+	phy-mode = "trgmii";
 
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
 	};
+};
 
-	mac@1 {
-		compatible = "mediatek,eth-mac";
-		reg = <1>;
-		phy-mode = "rgmii";
-		phy-handle = <&phy5>;
-	};
+&gmac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&phy5>;
+};
+
+&eth {
+	status = "okay";
 
 	mdio-bus {
 		#address-cells = <1>;
-- 
2.37.2


