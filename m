Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C939C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVLrACcSKUPhaj5dkzpeft8dc3na+SzUoUyCH0CxQdc=; b=NLNre1XZUtSc6QoWjQVaGUJ3PO
	TJWcKbIlHhFMeMkkueBIgihkT+9aP2aO+x6eZXrs2frWbo3nbzbwHya1kV3nkN+F3xzDgHFo5SHIV
	GRilVtENJqxgsNkd4MKM+LL3u57QZ6mG8kS9qM9ibsDmfPc5EfvOn1AXHHJExHUrB0rxxuT54p0ga
	0Od+G71TnyaET8T3+CDKxw9XBexve1moRIZsHG60TCcDb9Yvf4n1RPEe0C6xAyVObeXVy/L1qeS9t
	Qf7gs9LOiwBbEP32QzPpCMOGHhRgKfpyrO35MwOwh0yzE+m+YhNr2pfcmLFJtM4cUTAhV1MadAe5H
	7AwDwibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmyz-00917T-D7; Fri, 07 Oct 2022 13:01:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmx9-00907e-UE; Fri, 07 Oct 2022 12:59:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j16so7193165wrh.5;
        Fri, 07 Oct 2022 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVLrACcSKUPhaj5dkzpeft8dc3na+SzUoUyCH0CxQdc=;
        b=DyWFQsu7X3KCZe7cMwk7WfNuPX+E6P4ASu1VzPNNmhee/7D0jcse1/z8KqM/eThL32
         x7YhJ3rWXGy/Zz4Y7Gb4ZsDLTyK+8JUVL28uDjBzqS+axCNJmKnD8PTId3Ydbc4rNmjl
         uuwmT2tQ2woLJtAQpACaMr+cMgcLNBCZ3SwARjA2HsXWGOThUfV34kai+F4PljJ3XxLd
         0BnfegdCnrVBJVUmdU6KzNa3MjKZXtsJhOifMoAFhFv52dukVxu/hwu1tYsXxRVi/Ail
         NpB44KgwNCxHPc4dS7ob4IFkLB/Tnznoob/hSDQImfoQG7OxizdKhfciFumeBLkmUUrW
         pWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVLrACcSKUPhaj5dkzpeft8dc3na+SzUoUyCH0CxQdc=;
        b=MpcBJYEuLPIi6P3h3owIQrSpgU4j3DBWScHBgytEcdq6iWNOwx6b6/6aKBNjQ0jzfv
         CSy1lwYFw2SSM0TuVYH52z3VeQVG8fTGqRtJkt9sWpMiutd+9FmX6qEhHOY7OWRaDmFI
         +2ugopWcasO2So17Ilnaiq8TVMlKZ1EDw2l9KMAewpnidekHCF8bC6DsuyXRTObIJe9a
         LjyjwjzS/xb4v1Z43iTrrIciv0KYhXPm71P7MNCxUjMAEWLjtaGSetk6bicHyFUOPlNV
         lP19YV5bnG3aZ9ZzBAcZUy1/DS1W8Z1fhwj+77nwf+1O8gapFQEHYXnHmhhkA7pgIx6N
         e9vA==
X-Gm-Message-State: ACrzQf29VtWYiphZGCbNScgwGoC3n5gdsGLgP1GlKfRANR8FM4dI0+mu
	wg6XiEjyJttVIMowHwfFOXM=
X-Google-Smtp-Source: AMsMyM4UqKaqiRWCIrUoQV9U1D8DCBnEWwXVW8JC5m1oy3ts9Y/S2543eendEL5h/L/kDtbdhy4EJw==
X-Received: by 2002:adf:ec03:0:b0:22e:4d3:bb37 with SMTP id x3-20020adfec03000000b0022e04d3bb37mr3123892wrn.665.1665147587543;
        Fri, 07 Oct 2022 05:59:47 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00223b8168b15sm2008243wrs.66.2022.10.07.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:59:47 -0700 (PDT)
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
Subject: [PATCH v3 07/10] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Date: Fri,  7 Oct 2022 15:59:01 +0300
Message-Id: <20221007125904.55371-8-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221007125904.55371-1-y.oudjana@protonmail.com>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_055948_032209_2193D2C4 
X-CRM114-Status: GOOD (  10.86  )
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


