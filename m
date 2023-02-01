Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3D2C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=916XgVZ9fASoqPZFrOcZBdhhHsdFw2GVlGXOTRIHOcg=; b=Q9mQ11D6ZCUM69
	FpjxeI4nxN5A2qRfQ6OQwwsdBAjUH+I3jg3d/pvqTXsNdbl6Nk8nZbsjMP29Ng7kl/RjYOSfngriI
	qlqXrKF6LYIpPOgMfV31/YXtABuXKrQL1pP2FRWkcuD9t4nRdPPNYNg+BiID8c3i4REjt20iunSNa
	T9LdVEI+v/ndhyGznGu1cV3+LtuVhaNCXpSjNapVFiOCRdUuxvNDqVcUH5/wfwiMVutTPxAKvh6No
	ZeFU5ORU/ykq9zkzOTKQOG855RbwpM/U4hwMy8Nkw0mTQRJ3veqTBk9F48LyQfpcD9FQxHbpI42L8
	cs7OcwMPaostwUlKXygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIIn-00DHtz-VT; Wed, 01 Feb 2023 18:57:50 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIIA-00DHZd-Jq; Wed, 01 Feb 2023 18:57:12 +0000
Received: by mail-ed1-x530.google.com with SMTP id be12so7454276edb.4;
        Wed, 01 Feb 2023 10:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=916XgVZ9fASoqPZFrOcZBdhhHsdFw2GVlGXOTRIHOcg=;
        b=j4jCT3RNd4Fl3IhtsLOweL6JFnXgXuaJ/jZ7h5FNY5pcpO0mVtox0Bw4f9DvCnj+Gy
         TlaDzjmQcLkuQ5UfFWUPAEWCMVbM/Qii1P9+/lfII9nl99vUtkf9Os/1pizWpKOQjnoi
         lm/VQiytbkIqkefka60dSPUHl72SVAij0U/DbvLRldYFD5pyuGYvtZaqYPveBlWqk/NC
         HwoeqEjQK/c8BwCYzH4SZDRlqh3qMcu8bPUDYb08FqXAMGz6ap8C5r1ROOGK0pSuO1Jb
         5xnmaoxSdB6IxJ5byRjWV6mAMFnUVHJ4n93zietmRiYVRZXXUJn7Pfkcf0QR58k6nQl+
         iM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=916XgVZ9fASoqPZFrOcZBdhhHsdFw2GVlGXOTRIHOcg=;
        b=pFPFn1/JAZ99qqnWdomb5rV35eAUF1/OMb2vAHV0lxqcHtgV55Ae3XGsbm4jtzFfEQ
         htb2ghlhptjU3RO8Ha23VwEzkpUNh5/qQo63su0M5ahBzFAIvMWf4439BjQXVaA3mrVG
         c5i2QnhUXvdlqSfkc8lpVg/D6eeoV/TfelVFmCrcISJ4P2mdULFI6GYLZv9zHM41LL8V
         4wMObCIW0cso4n0efsBxZEk8EldRPoVk7eA9kXfH5x2qIGFJpDIkNyi2dwYpAZ8IDCip
         Jf6xLla4AKL8F5Dtpt1njuSrHLx32rWOttKuWvyuzsbm462hZ9aDvuBHYeb7UcJzf6hx
         +OnA==
X-Gm-Message-State: AO0yUKU7huLgACYebO3gVydzJ3VbD56xOLpcGfNH+kJSM0roUr1vCC6j
	g1ghnx/sqebVRBgflsnfOQg=
X-Google-Smtp-Source: AK7set+2KbiCTcddKLi6FlDnx9PjS8pp/NRXkaAMusiSZph4MTOlIO/4yg8XJu6FxV/4hlEXoGy56g==
X-Received: by 2002:a05:6402:1950:b0:4a2:260f:3bbe with SMTP id f16-20020a056402195000b004a2260f3bbemr3759756edz.23.1675277826917;
        Wed, 01 Feb 2023 10:57:06 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id dy25-20020a05640231f900b0049e210884dasm10100883edb.15.2023.02.01.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:57:06 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/5] arm: dts: mt7623: add mt7530 switch to mt7623a.dtsi
Date: Wed,  1 Feb 2023 21:56:53 +0300
Message-Id: <20230201185656.17164-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201185656.17164-1-arinc.unal@arinc9.com>
References: <20230201185656.17164-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_105710_678437_50C759A3 
X-CRM114-Status: GOOD (  11.88  )
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


