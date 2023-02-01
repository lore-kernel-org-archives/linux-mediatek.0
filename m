Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398BBC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQ2TcNqdLFOAVmLP5M0cy768AQ+LH1yHfkoCaBZyfHc=; b=peEv08xJbGCuAq
	5ruf0wR1plQrwy7q6JHhvXVno/t69xD+ncMkvOE4GbGV1MUQ0X/ZuO1SJLaq//UMbI9TwY7omXqDN
	Rzjrta/ZiP5Zjhdlt2k5spnYUvhrjzCEEnSD1aIOXDJG7o9KM+rV8vhXNHONz0DCs8h375QXpVs/1
	hKVdYR/F4KiLwmfT3jc90QMvhjvefSD2mKtih85oPU3RSLrJ1FP5I/UsQzxIolJcVeFlaqCUKOX5e
	kAY2cGu8qdA5WHzhCENhB6lkOwZat8REarJPVeSrisLvSTa1Nnq7lpM151cuqtPstLysrxPkRJHvv
	x27U6ryyU85wlaETQ/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIIb-00DHmX-8S; Wed, 01 Feb 2023 18:57:37 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNII9-00DHaH-MW; Wed, 01 Feb 2023 18:57:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id v10so18700054edi.8;
        Wed, 01 Feb 2023 10:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQ2TcNqdLFOAVmLP5M0cy768AQ+LH1yHfkoCaBZyfHc=;
        b=RdzQM9UxdzXFHlTygjnB05HaKkfeckDFaoC0sQILZA8OjUcHc46SFz7RLBKN/jXBE6
         sBSjrAxxSLEPVES5uw9VQVE7SsY8rcvVATXQ/kOT+o6zRsoNLYMG9G9SEAd8qICEofgP
         138j1q+gS5EwFUGWHaMPifgTEMUvZVPZZ+1qrZyStRMn8odP7pPH1oVDIxpNEtJkUA+1
         SowWyQkWJ9cyG9mr+K6BQ0EvAjLWTbg4cYrNbCgHOfOhtocVQmQ+hmweRqQgbm1p3vdc
         6Ioru6D1UEh4F7Vwk9mc/+pE/P2P44cnRJs3gVIGl0W9j+7jHF0M1g99hL+mdYFPUFW3
         NJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQ2TcNqdLFOAVmLP5M0cy768AQ+LH1yHfkoCaBZyfHc=;
        b=hUn1Fq/zp+/h4MErCfsyGcAwz+EV4orgiV9rgcP/d+TmUFckpu2JLtbKdSMdtuTUTx
         E3e/bLsGddKAd7IE1fFxP/ED3KA52rq9rU5KjjzYcuKnI/pA1L75RGZwSAeO8smoQfIN
         Pxm1PSxJGRv7T8jCJxpgmoCBhlhd+/SYx0A1WNPNv2jCFhVJpt1LahD1Qa1bcnWoofjW
         En/932e+uRfZQwCU09RfL5MqJZ7eqDhuD3VfKTAnB4uipvOLCVsrxhDQ1a+o1pIg4r6Z
         d/sRQO6G1kEdVvzqo82KUImCHrNbpsrkcsn17mlZCJJRr+I3ljARuL9E+Im9gNAiiWTL
         0+Qw==
X-Gm-Message-State: AO0yUKUJ7usba9zaO8nfSbZUdj1APwbTC0xYC1aGibVeM57s3y/HkLCd
	ndj6JY4Q7puu17sUys9bJsU=
X-Google-Smtp-Source: AK7set9skUgnmhi1dYpijfocB0rlZ+p6Q6V2+UCwzZI/enK59SfnsKbNtQF2gvImI2edWtLPb7F3Cg==
X-Received: by 2002:a05:6402:35c7:b0:499:cc32:6a52 with SMTP id z7-20020a05640235c700b00499cc326a52mr8873964edc.16.1675277828527;
        Wed, 01 Feb 2023 10:57:08 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id dy25-20020a05640231f900b0049e210884dasm10100883edb.15.2023.02.01.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:57:08 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 3/5] arm: dts: mt7623: change mt7530 switch address
Date: Wed,  1 Feb 2023 21:56:54 +0300
Message-Id: <20230201185656.17164-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201185656.17164-1-arinc.unal@arinc9.com>
References: <20230201185656.17164-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_105709_760876_30B09593 
X-CRM114-Status: GOOD (  13.51  )
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


