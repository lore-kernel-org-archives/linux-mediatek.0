Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2870C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQ2TcNqdLFOAVmLP5M0cy768AQ+LH1yHfkoCaBZyfHc=; b=t5YzlQsV//SL5d
	45bPp5QXysI1wADqFvfAzkCQHl3Brd+mA2/5WtO3vCT6MpZ+dTsB7tNR3Df46sU68Cf0P1SEgzp/J
	UmwQMkAHWRBPDpnUh9QD+MXIyqiS0JXP3xwz15JxbNV33ghyhUhYBqDl51wOucNxt8xBu354wXqtF
	5ZDz1U5LyH8Xqshu3E6Bs6mAPdSUgrmg/gXVr4YSXU+KGlbkta4j701GSmjYq+872bz5Ncg4n7WkT
	da+6It1A/5g17DKkRYVSQTwQVtvWVhd/qTp0l7iFw41GTgifYw0OpdtSzyNEDO+p3CBrw0wKC+mPz
	czQJ1vU4f2AS6F5bylWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY6Q-006v9S-OS; Fri, 10 Feb 2023 18:26:30 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY5N-006udY-PY; Fri, 10 Feb 2023 18:25:27 +0000
Received: by mail-ej1-x62e.google.com with SMTP id lu11so18214356ejb.3;
        Fri, 10 Feb 2023 10:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQ2TcNqdLFOAVmLP5M0cy768AQ+LH1yHfkoCaBZyfHc=;
        b=P4Cyqdnd70mhdxO3RK9uEwrJUnV0pnLT7dy056n4u+u/+L9yzEAAUgn3U9LGa31Z4m
         D6nzdWRQNvoCNfApP/7ozpYabM/ETKwH0qZbVwdGWtwfNyreTUHv1SCG+cGOazHic+ma
         iSDRVWwnY9fe4OEWZ+psBH4mT2PsvuU1+7My8yv2DG6tlJizuhvWwxRFVoq9CPqUfrWV
         D/WqtDAAEZXnrBvoJ4HXZEqBdnlVo5ABTW19fIqyN/vC/SGP6wmmIf1P6EDyPRTb9ZIM
         V6bcmgegiX97MXVWNL/tjGXtGLVAWZH8OW2BjWA2eyt+kqB8sU6e0u6wLtlN1Vvq2tW6
         bWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQ2TcNqdLFOAVmLP5M0cy768AQ+LH1yHfkoCaBZyfHc=;
        b=lzoAFbb9eKk0CSPHnpw2UxMee4YbDBQA/0rvj5BCCsp6XSMgjWBKUXOMhT2f6C9Wx1
         lsgdgVx9hOQdk+/z2/hxDTo7r/o0LGKK56PMkVDjdthIfibdhtcarDUWXZypSygxwjOc
         niJ8e6MT0jE89KE8nldvh9n4H58Zul+OdeWbIzeMwFGQyKJ2G11FxNpmOoA6cW2/wh5y
         jghYzDOAMVWe+MrMeZWFwA/LFM/1I0efCJa61uk3T9jZcqem+Qr93PRznhaynFiwXnJp
         yDGffRyfdCleVq0j6yhw1CoYmr4uXGBW8Uj0zn84J3Hg7j5uSBfpzW94m/gKpuj7wMAH
         iSsw==
X-Gm-Message-State: AO0yUKXPcnUjivoiSoyXxKjV5V78vRaBPQkogrWW1Ji3GRhFJc5SQvKc
	3IdQqu/kEdXHIZL763Wb9PI=
X-Google-Smtp-Source: AK7set/jOf8U2uDeIMXN7sLu64zG4Q6TvF/CNq5kPekt86MNECu2qEg+gRlcIb9Fap72KoCeg3+edw==
X-Received: by 2002:a17:906:29cb:b0:87f:5d0a:c610 with SMTP id y11-20020a17090629cb00b0087f5d0ac610mr16518249eje.32.1676053521286;
        Fri, 10 Feb 2023 10:25:21 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906024400b008aef19f678asm2708966ejl.165.2023.02.10.10.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:25:21 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 3/5] arm: dts: mt7623: change mt7530 switch address
Date: Fri, 10 Feb 2023 21:25:03 +0300
Message-Id: <20230210182505.24597-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230210182505.24597-1-arinc.unal@arinc9.com>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_102525_859768_D3AB25CE 
X-CRM114-Status: GOOD (  13.35  )
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

In the case of muxing phy0 of the MT7530 switch, the switch and the phy
will have the same address on the mdio bus, 0. This causes the ethernet
driver to fail since devices on the mdio bus cannot share an address.

Any address can be used for the switch, therefore, change the switch
address to 0x1f.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623a.dtsi                | 4 ++--
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 4 ++--
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index fbb5731a3a53..dd522e508eb3 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -36,9 +36,9 @@ mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		switch0: switch@0 {
+		switch0: switch@1f {
 			compatible = "mediatek,mt7530";
-			reg = <0>;
+			reg = <0x1f>;
 			mediatek,mcm;
 			resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
 			reset-names = "mcm";
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 1e03a3de654f..dc9b4f99eb8b 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -189,9 +189,9 @@ mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		switch@0 {
+		switch@1f {
 			compatible = "mediatek,mt7530";
-			reg = <0>;
+			reg = <0x1f>;
 			reset-gpios = <&pio 33 0>;
 			core-supply = <&mt6323_vpa_reg>;
 			io-supply = <&mt6323_vemc3v3_reg>;
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index 5e328c2a6a6e..6b0c3d1006ab 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -185,9 +185,9 @@ phy5: ethernet-phy@5 {
 			phy-mode = "rgmii-rxid";
 		};
 
-		switch@0 {
+		switch@1f {
 			compatible = "mediatek,mt7530";
-			reg = <0>;
+			reg = <0x1f>;
 			reset-gpios = <&pio 33 0>;
 			core-supply = <&mt6323_vpa_reg>;
 			io-supply = <&mt6323_vemc3v3_reg>;
-- 
2.37.2


