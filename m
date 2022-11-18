Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E38C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHS4xwDjkiA0w7wmXV8oTrtUiAVe60d4UjcHzqznohk=; b=BsUDCNfakZ2yzBSbRoaSH+BKpY
	fDziT8VR4zH/8wsJIE/ttotGWr0FGE2sKjBPPL4dr9TooL45bShLX4S6vKAErxTw2YqpRNETvM5NR
	xUek+dj6NlyIOYluiFvwjA0wS7FUqpjoDNZcbr/lWORV1dxMP6F7NAJ9hlhYe7Lgh5tzJ9ludildi
	TM5N3mKzogCtcaZ4kkK9fSxzpExudZ8YZtVet9qsR5g5pMRAVaAXYYv6938ghdGVRJsXMunWiCHde
	WqITIHYU4w1hH7xYIkYBcPqG3tOMZohkYPd/ll61jVMCyMttvd1fvzqHGVdXj9KKDNX7amPMIDB2d
	nqfY2dRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzcM-003gWm-5V; Fri, 18 Nov 2022 11:33:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzbO-003fyK-2n; Fri, 18 Nov 2022 11:32:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id r126-20020a1c4484000000b003cffd336e24so2616947wma.4;
        Fri, 18 Nov 2022 03:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHS4xwDjkiA0w7wmXV8oTrtUiAVe60d4UjcHzqznohk=;
        b=KxmieWi6LcnoMSufsx2H60XoPHytWoiY2g2xEWOpLds//yqefgYkioPdZRq/dmI6C/
         bMUTa4mMMGso7LEpJUe9ymqDlkI+LH99ur3f3bbel5mul55QAGUPhcWgl/ONRekL+PwV
         3BvmxJixyKduMKdD/fdvKNqo38Hb/WeQpDG3UJozSzcJ7Qf7KBmLL9R5ljuTC3eKmceK
         fyJONdak3EMU23TMiBslV4uIyJbExCa0oJIxfKOKlmx7e99btj8vTPuOQ5/lenR8OgDc
         HU1eKC0zO0IC8y/MD3RueO6KGr0mXr+3rTANpOigJLf1XjLcOmFH7Po2r+gtSsuMWbDH
         p6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHS4xwDjkiA0w7wmXV8oTrtUiAVe60d4UjcHzqznohk=;
        b=6eBpPyI3BloRs2Lgktb0xlQSn6ImeM+9b4S+0tjvGAV5lUMzPHKGjMLrgcJqveIME4
         SrDWFKIUiWsqgLe5HeNNHrqKuoCuOvvS+LF3XdrL2Xgu+szQtr/lJZ1n+zwMJvD3okq+
         3mjmwPPWhGnUw+CEaVKy3MbXUzTRb3UZgMZWF35zYOwQesi+RqlIymoghf3nMki1kgTj
         YhcV7tJ/mGj/ef8LZZG3Ckw7xXvHmcxXMqHgU9NFkaKD1PjVEa3pyiGmPqeaNLftfQmt
         Xwb9x3E7TbcTL5CLKNs0BmJfmqYkJDHSKMqOgtH3svK3T45iwybtOGsiy9CDt080bIVz
         vF/w==
X-Gm-Message-State: ANoB5pkF0kqF/4kKO/Pf+rQHVhbWXgSAeG1YKG5FKf1QauaEcTFe8EQ8
	gsNl1xYSdiGYXBk4i71nn7M=
X-Google-Smtp-Source: AA0mqf5b/Gnn4QxNOi6Wr/UKJy8KJUlCLqezaSAdhbXTNpi90xJbNjOwAXkPHMqD4QiKWZIuaEgejQ==
X-Received: by 2002:a05:600c:1d14:b0:3cf:925e:198c with SMTP id l20-20020a05600c1d1400b003cf925e198cmr4537645wms.144.1668771126415;
        Fri, 18 Nov 2022 03:32:06 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003cf878c4468sm9894817wms.5.2022.11.18.03.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:32:06 -0800 (PST)
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
Subject: [PATCH v5 4/7] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Date: Fri, 18 Nov 2022 14:30:25 +0300
Message-Id: <20221118113028.145348-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118113028.145348-1-y.oudjana@protonmail.com>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_033210_177851_C35BE916 
X-CRM114-Status: GOOD (  10.76  )
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
2.38.1


