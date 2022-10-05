Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B799C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVLrACcSKUPhaj5dkzpeft8dc3na+SzUoUyCH0CxQdc=; b=UPf+ZuDdLGjzv/XOt12/u17AVJ
	TyungkuLS+oePuZxi56qU1LN+pkiiDsaxpYCJhUWGIt4AhebJrNxGp4dHHe8UxdwqddNyVYsu8Jcl
	KnXEp2lS5PFsf/CVFCEbo59WyBFoqUw+Y1rJ26nAvhob7fbUfe/k8UPWCd2bgmjYltw3xGsQLCQje
	l1Ahnv+ji+IT8DWxb5/azDqHRhrwo6KCZKbq9XgzIAu9GuIuXvJZ5AJ9AsZkW/fR6qiYEvhkMLppM
	LXt39KvNpIN1uMR4ANtk1eegnjv1MUQxMQDwRJhYr6bk88miV+d79kuFrdnT1Gc71PmvhwfGxP1K9
	Jpy2FFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8TJ-00FTL8-Bv; Wed, 05 Oct 2022 17:46:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8RY-00FRuT-G8; Wed, 05 Oct 2022 17:44:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id o5so11259089wms.1;
        Wed, 05 Oct 2022 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PVLrACcSKUPhaj5dkzpeft8dc3na+SzUoUyCH0CxQdc=;
        b=Tk4NjlU+VOxHKIsEw2EUSin/HX3FoWKLmZDv+lcKUEwSnubc6aCGjIstUP7FTRKgVb
         e8NlpqANvLc9Ca9bOuoszGrTmUDZt+YBTNZvt0XmTMrTcdRfwisuQFqlXLU5q4oWOcuR
         G6tbtgu+mXDWEs/+SH1rY+WHzr1fUlYhEcNiMwzqpFipDjENrHwchoTkq8Ti0E7Oa3Pw
         6m4NsWxD/AP57pE4hFKmh2aqGTvLH9MoZUJ/itR8u0F1i06mlGX/huBDFhjIUtssD8a5
         R/5GCsiuYRtpZflMuyLafy9rBFuJoO7CRSyhw9Ttpz8v3g0W1TRhv4eGI2uCn+tn5G1F
         2UBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PVLrACcSKUPhaj5dkzpeft8dc3na+SzUoUyCH0CxQdc=;
        b=whfpTU62b0e9ST/3WlnhDUV4Ems29WTLM7Q3kusUEwJaCJGZpeI31dmsMZh+BkuYe7
         mOWMInKWhpoVNJF+8HeHDEIrp+9ve8+MTvPr4Lgl6hNsXeLSAlLccRa4FLaWWJYA5DrN
         npbLMRj8c1mzqJYJRUFLI2oggduKEgdIYB5LIISverO8rIlAHwDK8gGJsrXgAatlerfh
         +dNzAxK9SrZz+gzKpyayzWhBj786T3vnMTjb5Sihl7d+M8HQfKF/6lEpvu6gc9uDRBoW
         TVR80beX/mrTidF/8GSr5yntZmXp1cScdE8SgKcDeGB0KqIFEY59WIEmGvcrudURgPDT
         ZVhw==
X-Gm-Message-State: ACrzQf3t2JSKVVMM6Djf+P7aW0fxpJaju6+PL7Rk9gQ9Ivad8BfcixCs
	PoS5ZugdF+JEp1ayZGpYnJjexzIyqV9yCg==
X-Google-Smtp-Source: AMsMyM4gY77KwLcvBY22FBZ6f45NZC/vKIzozOpZ3dpyCHDyD7Xdmj00U0N53CsRSoou0ilOyTDH5g==
X-Received: by 2002:a05:600c:348e:b0:3b4:a9f1:c240 with SMTP id a14-20020a05600c348e00b003b4a9f1c240mr4126831wmq.192.1664991867935;
        Wed, 05 Oct 2022 10:44:27 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:27 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Date: Wed,  5 Oct 2022 20:43:40 +0300
Message-Id: <20221005174343.24240-8-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005174343.24240-1-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_104428_585549_0124F034 
X-CRM114-Status: GOOD (  11.04  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add -pins suffix to pin configuration nodes to follow DT bindings
and pass dtbs_check.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 15616231022a..0c2b477184ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -135,70 +135,70 @@ pio: pinctrl@10005000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		uart0_pins_a: uart0 {
+		uart0_pins_a: uart0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO234__FUNC_UTXD0>,
 					 <MT6797_GPIO235__FUNC_URXD0>;
 			};
 		};
 
-		uart1_pins_a: uart1 {
+		uart1_pins_a: uart1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO232__FUNC_URXD1>,
 					 <MT6797_GPIO233__FUNC_UTXD1>;
 			};
 		};
 
-		i2c0_pins_a: i2c0 {
+		i2c0_pins_a: i2c0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO37__FUNC_SCL0_0>,
 					 <MT6797_GPIO38__FUNC_SDA0_0>;
 			};
 		};
 
-		i2c1_pins_a: i2c1 {
+		i2c1_pins_a: i2c1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO55__FUNC_SCL1_0>,
 					 <MT6797_GPIO56__FUNC_SDA1_0>;
 			};
 		};
 
-		i2c2_pins_a: i2c2 {
+		i2c2_pins_a: i2c2-pins {
 			pins2 {
 				pinmux = <MT6797_GPIO96__FUNC_SCL2_0>,
 					 <MT6797_GPIO95__FUNC_SDA2_0>;
 			};
 		};
 
-		i2c3_pins_a: i2c3 {
+		i2c3_pins_a: i2c3-pins {
 			pins3 {
 				pinmux = <MT6797_GPIO75__FUNC_SDA3_0>,
 					 <MT6797_GPIO74__FUNC_SCL3_0>;
 			};
 		};
 
-		i2c4_pins_a: i2c4 {
+		i2c4_pins_a: i2c4-pins {
 			pins4 {
 				pinmux = <MT6797_GPIO238__FUNC_SDA4_0>,
 					 <MT6797_GPIO239__FUNC_SCL4_0>;
 			};
 		};
 
-		i2c5_pins_a: i2c5 {
+		i2c5_pins_a: i2c5-pins {
 			pins5 {
 				pinmux = <MT6797_GPIO240__FUNC_SDA5_0>,
 					 <MT6797_GPIO241__FUNC_SCL5_0>;
 			};
 		};
 
-		i2c6_pins_a: i2c6 {
+		i2c6_pins_a: i2c6-pins {
 			pins6 {
 				pinmux = <MT6797_GPIO152__FUNC_SDA6_0>,
 					 <MT6797_GPIO151__FUNC_SCL6_0>;
 			};
 		};
 
-		i2c7_pins_a: i2c7 {
+		i2c7_pins_a: i2c7-pins {
 			pins7 {
 				pinmux = <MT6797_GPIO154__FUNC_SDA7_0>,
 					 <MT6797_GPIO153__FUNC_SCL7_0>;
-- 
2.38.0


