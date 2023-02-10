Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2794BC636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 18:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=916XgVZ9fASoqPZFrOcZBdhhHsdFw2GVlGXOTRIHOcg=; b=uNny/xY9ucxIfh
	rv9Lbzmh6ef+TTSupmT0ZvhCVVcN0+yunV0CsN6EioWDv27yTE4bxaJRJIQxnRVBirTcAXLAoWdSw
	da5fW4ntuTF9hrBX3VcwljnegIeJmKx1PvIRv72X8iL49Gc8VIKIQnsUOjBUy4GFGne0GLT1Aynxb
	EHbPpqcgHvW3sJyoEv1hOdSrVa3UJSiH4Oq6Br/9oFaZpuKMgivKyIdPWXTSHQ8K9YNIBk806ggIB
	ZHZcd027z75hkZKVuqzZqq1f+Jvm7LBVRIc43EQls4u07P1FKWTooMLDLKIUNF9oqUeHWsuWoNzIP
	7KKjhApkwnentXDS8j0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY5h-006una-B8; Fri, 10 Feb 2023 18:25:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY5J-006ud8-H0; Fri, 10 Feb 2023 18:25:23 +0000
Received: by mail-ej1-x62d.google.com with SMTP id jg8so18181889ejc.6;
        Fri, 10 Feb 2023 10:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=916XgVZ9fASoqPZFrOcZBdhhHsdFw2GVlGXOTRIHOcg=;
        b=HPVGsf5AoDNAGcwvHWXoIKJGcZehK5culQMeKU7O+QqHKQXZnw0SKmRZWWVghdeHlD
         iPohuCwptOedN1FwGCKUrBDgsyzxyJ51x/+rRlKU9XwxSuguE+a4RSErtzi2H1gYPK8P
         YdlLlQkTonP9ChuNfXIvc1DE1YKXKP3Nlb5W/XZ5jFXzSoTw4Mm9uYGzduspkFcWHaMd
         I2JwhjfnJY3bWtUzrUN/mxpybEYvkzMYBzmrBoIB/2FBqfvMRtGGtySyicAQ256K/RL6
         tTD9YT8E+wq5HNADUtR8Lc6r1Bv/9mAkpn5yd+bmvoWGHIzYIok+iPih8DnqT/DdKO/7
         Q9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=916XgVZ9fASoqPZFrOcZBdhhHsdFw2GVlGXOTRIHOcg=;
        b=glG+ISXy+2gOkKQH8rp5VN0uIUEygD5/A6UuIl4Bf7nDdSD0OqEYmeW5SFattyjPPW
         muAe3tqWsmvPaM9/GFhAiVAMwo3pbq74lMJ+gTz1Uleg3ab/07pxmKkaQnZ4MU6JFA+f
         H6V6g0ptOBUij9pETSZRJvkAjNk75du9WFk3VlaK9Yv3CFRuNvt1wr6bTJxevQxGp2gH
         XOlcEOvbwO2aJszZ0AVIuT0KhWaO0FIfRSZTgdCjFL63qMS11p/LMjaFdsXOwDgblu/M
         KTcN6r6n5N+WFvjL65o2P7J9irorcEipvjVX07GVi7fqZFuaX1MRd0xgV7RknviOVQBi
         lhsA==
X-Gm-Message-State: AO0yUKW4/2S2fXhROQGNZ67CrqHO6tfawhjxZrnCAET3sjAJE09F09VA
	uAq6QfHhZaibMhzpjdHUdk0=
X-Google-Smtp-Source: AK7set/QOnGx6F5MPHmVFkQdlYm4poP8qmAhex/C7DuEuZcrrTjeoJoC8VePE7xv4RouyakS0boaGw==
X-Received: by 2002:a17:906:3892:b0:88a:f42f:579c with SMTP id q18-20020a170906389200b0088af42f579cmr14485145ejd.77.1676053519888;
        Fri, 10 Feb 2023 10:25:19 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906024400b008aef19f678asm2708966ejl.165.2023.02.10.10.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:25:19 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 2/5] arm: dts: mt7623: add mt7530 switch to mt7623a.dtsi
Date: Fri, 10 Feb 2023 21:25:02 +0300
Message-Id: <20230210182505.24597-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230210182505.24597-1-arinc.unal@arinc9.com>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_102521_595304_F15E5D55 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The MT7530 switch is included as a part of the multi-chip module on the
MT7623AI SoC. Add it to mt7623a.dtsi and adjust DTs that call mt7623a.dtsi.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts | 87 +++++++-------------------
 arch/arm/boot/dts/mt7623a-rfb-nand.dts | 87 +++++++-------------------
 arch/arm/boot/dts/mt7623a.dtsi         | 74 ++++++++++++++++++++++
 3 files changed, 118 insertions(+), 130 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
index a64d68b6e165..5654284bab01 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
@@ -112,74 +112,31 @@ &crypto {
 	status = "okay";
 };
 
-&gmac0 {
-	status = "okay";
-	phy-mode = "trgmii";
+&switch0 {
+	ports {
+		port@0 {
+			status = "okay";
+			label = "lan0";
+		};
 
-	fixed-link {
-		speed = <1000>;
-		full-duplex;
-		pause;
-	};
-};
+		port@1 {
+			status = "okay";
+			label = "lan1";
+		};
 
-&eth {
-	status = "okay";
+		port@2 {
+			status = "okay";
+			label = "lan2";
+		};
+
+		port@3 {
+			status = "okay";
+			label = "lan3";
+		};
 
-	mdio-bus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		switch@0 {
-			compatible = "mediatek,mt7530";
-			reg = <0>;
-			mediatek,mcm;
-			resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
-			reset-names = "mcm";
-			core-supply = <&mt6323_vpa_reg>;
-			io-supply = <&mt6323_vemc3v3_reg>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					label = "lan0";
-				};
-
-				port@1 {
-					reg = <1>;
-					label = "lan1";
-				};
-
-				port@2 {
-					reg = <2>;
-					label = "lan2";
-				};
-
-				port@3 {
-					reg = <3>;
-					label = "lan3";
-				};
-
-				port@4 {
-					reg = <4>;
-					label = "wan";
-				};
-
-				port@6 {
-					reg = <6>;
-					label = "cpu";
-					ethernet = <&gmac0>;
-					phy-mode = "trgmii";
-
-					fixed-link {
-						speed = <1000>;
-						full-duplex;
-					};
-				};
-			};
+		port@4 {
+			status = "okay";
+			label = "wan";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/mt7623a-rfb-nand.dts b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
index fac3ca0322c8..afd177b3b516 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-nand.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
@@ -116,74 +116,31 @@ &crypto {
 	status = "okay";
 };
 
-&gmac0 {
-	status = "okay";
-	phy-mode = "trgmii";
+&switch0 {
+	ports {
+		port@0 {
+			status = "okay";
+			label = "lan0";
+		};
 
-	fixed-link {
-		speed = <1000>;
-		full-duplex;
-		pause;
-	};
-};
+		port@1 {
+			status = "okay";
+			label = "lan1";
+		};
 
-&eth {
-	status = "okay";
+		port@2 {
+			status = "okay";
+			label = "lan2";
+		};
 
-	mdio-bus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		switch@0 {
-			compatible = "mediatek,mt7530";
-			reg = <0>;
-			mediatek,mcm;
-			resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
-			reset-names = "mcm";
-			core-supply = <&mt6323_vpa_reg>;
-			io-supply = <&mt6323_vemc3v3_reg>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					label = "lan0";
-				};
-
-				port@1 {
-					reg = <1>;
-					label = "lan1";
-				};
-
-				port@2 {
-					reg = <2>;
-					label = "lan2";
-				};
-
-				port@3 {
-					reg = <3>;
-					label = "lan3";
-				};
-
-				port@4 {
-					reg = <4>;
-					label = "wan";
-				};
-
-				port@6 {
-					reg = <6>;
-					label = "cpu";
-					ethernet = <&gmac0>;
-					phy-mode = "trgmii";
-
-					fixed-link {
-						speed = <1000>;
-						full-duplex;
-					};
-				};
-			};
+		port@3 {
+			status = "okay";
+			label = "lan3";
+		};
+
+		port@4 {
+			status = "okay";
+			label = "wan";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index d304b62d24b5..fbb5731a3a53 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -17,8 +17,82 @@ &crypto {
 	power-domains = <&scpsys MT7623A_POWER_DOMAIN_ETH>;
 };
 
+&gmac0 {
+	status = "okay";
+	phy-mode = "trgmii";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
+	};
+};
+
 &eth {
+	status = "okay";
 	power-domains = <&scpsys MT7623A_POWER_DOMAIN_ETH>;
+
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		switch0: switch@0 {
+			compatible = "mediatek,mt7530";
+			reg = <0>;
+			mediatek,mcm;
+			resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
+			reset-names = "mcm";
+			core-supply = <&mt6323_vpa_reg>;
+			io-supply = <&mt6323_vemc3v3_reg>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					status = "disabled";
+					reg = <0>;
+					label = "swp0";
+				};
+
+				port@1 {
+					status = "disabled";
+					reg = <1>;
+					label = "swp1";
+				};
+
+				port@2 {
+					status = "disabled";
+					reg = <2>;
+					label = "swp2";
+				};
+
+				port@3 {
+					status = "disabled";
+					reg = <3>;
+					label = "swp3";
+				};
+
+				port@4 {
+					status = "disabled";
+					reg = <4>;
+					label = "swp4";
+				};
+
+				port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "trgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+					};
+				};
+			};
+		};
+	};
 };
 
 &nandc {
-- 
2.37.2


