Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DDBECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5hdKCMrXjDt6ZA2ndwEUQquAl5ne5bCVuc8YArZ/7c=; b=f7w+FvjGLpGe2bnsSnFQHdJYEG
	uylmFNUEJaY72VFY2agMhOMsJKIyadN4aOHsXO4T60dGcnBrC5IBgcf+26JBAqfYCT4NaZnkdhmxv
	km0NHBB7Pw9u53A6hKpgvc8y7zZ+cxCo5cdvF8I8tVWfC1U3nTUvui0IFsoa6pjjqdp4IoqHqng9B
	TvLECwImDqAI7gg9WFEe53pZKstsQDdOgebsbIniKG95UJWPSBgpbMiGtHVwyDgRuKeRrE/t2sves
	LRhnyujtnL/FWIRnjq3iEsoC5C7kr5ppUL7CWX2NTbO0OWLOGzkeqYPVGpYUEBvu/XnEH3X89SlyS
	F55eK91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaKCV-00D7oE-O4; Mon, 19 Sep 2022 17:04:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaKBT-00D73M-UE; Mon, 19 Sep 2022 17:03:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id az6so21345997wmb.4;
        Mon, 19 Sep 2022 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=m5hdKCMrXjDt6ZA2ndwEUQquAl5ne5bCVuc8YArZ/7c=;
        b=m+MfKc90fGD4L/oI2AaaFE9RlOk6vl1s7sMOECgcWLiDQnumbnNtTgXlTyp+5UpKhA
         vtzOMMIKiMbsThE7sLxsl0IE3uGrvY8gwkt7fMNamS3uZRAjgaPu4Pazt8wx6Bmq9V4U
         glu5jvmGoUfMYmL2PNGp2izMTnUvNqG5KlXqk5pMzNeGYlWQ6wA/czfJH3/EmUc+COMU
         V1HZDYz9Q8ZbieHB6qiUaeWx0TPUEyYvtv3kHvnTMhMSW6FpPCSu2Ekaf5LSR69NKSBa
         DGa8JRh3icazAaID4FMH2hnzOwljeX2nYZM8+t6U4IWT5G5HGOyJfHVHyt+6Z+IknEPZ
         TpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=m5hdKCMrXjDt6ZA2ndwEUQquAl5ne5bCVuc8YArZ/7c=;
        b=ObhgP6hwCn9ujDjtfgdD1csZF50u61uZ1kOBxMD8+w4DYdkvQUUxyhWU+l7ex5BsJr
         8RimU8mrnjyKdKe58UExzUaKartkcID4QJ8apIYrYB7K+2H1+Iapna39y3w9toNhY5cM
         +dWCpSc2hTzp+Fc2x8p8OitvmNxaqJnZIEFYEuSd00lGkUU9V/FzqMcaOdt+p015cj2E
         ZGtnA5gjszpXJ5LSHjIQT1O0h4TSwzKakuSNCxDhOuEhnelm4Xreu+J3HAnDMqoQhj84
         z97iFyTQM3KqyJ/QpvoEIvVNZ8ePkY0ay83a8kFpUeqm0/BBtSduPUZWN0QBlakVxpdP
         QOqA==
X-Gm-Message-State: ACrzQf1ZPcm0oEgqUz5kUDxIcErBLM0SOLb1xmEJZqL/qwDcjg61q9gc
	7RIPUIXW5wdur2o9fo5IsKY=
X-Google-Smtp-Source: AMsMyM6Eyf/xv2UKj5yaHzqoan8SSawWq4SBia09Cw+BlUx4cWw5euSoYAXYtcVY+EnOtqmEG20M9Q==
X-Received: by 2002:a1c:440b:0:b0:3b3:330d:88d8 with SMTP id r11-20020a1c440b000000b003b3330d88d8mr13286916wma.31.1663607030190;
        Mon, 19 Sep 2022 10:03:50 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ci10-20020a5d5d8a000000b0021e6c52c921sm17562487wrb.54.2022.09.19.10.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:03:49 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Date: Mon, 19 Sep 2022 20:01:13 +0300
Message-Id: <20220919170115.94873-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919170115.94873-1-y.oudjana@protonmail.com>
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_100352_043266_9DC1FD63 
X-CRM114-Status: GOOD (  11.86  )
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
2.37.3


