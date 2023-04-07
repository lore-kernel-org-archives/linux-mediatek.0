Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF171C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 14:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH9QAwye48bejYcJsmUVDgnU+lbK1EZ9+5kkrqikkcY=; b=nI9vBW30mSmIuULDDqYFVLcTtP
	nqN9f6X7fPn7EzMJ1+/XLeSt21krv8CNT2ypUW1//xoPJaNbiR35enxPKoJ1pLjuWj7ZAng1IYtWX
	GscOOVQuHsBgsaYSKjBSL0YUrvNS7Pfg43u/HwRnBc6uXQvhTM/U8UUFV0Af7rgdvLdTKS94/Jb9B
	zXcBvk1BVHvuV5H6wDZGzJ6JXaOEABD1z+U2zbDBsdruTVq0LAGKukqY4VNDlPUUKwGx/MMJPP8dI
	XrEGEynQyT1KrdfLJXsUHT7lXWz1jg50NrdAQ6kV9mX1wH1w6NvOnXyFoDUKM5vNgJCksw38prm5h
	ZeDQrdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmgO-00ARVn-2i;
	Fri, 07 Apr 2023 14:03:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklgy-00AEPu-2h
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v1so42248804wrv.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872386; x=1683464386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH9QAwye48bejYcJsmUVDgnU+lbK1EZ9+5kkrqikkcY=;
        b=dJoEXYLUUXARddvkn4UfLqbOwHRdNGJHrM1fmI8IhuUHJypyLiHAYTq41XQVd9PBtO
         9s0tteHgDXMzDeZWtmU8sA55XqmB2LmjIfKJSsygy47Mve55843Mfijid7vtBtGi8SWl
         +43iiIXTBw8XjKt2dcYCK3Eo2jzFD8A06NYZiPZ794aYowkL07h79g2qlb5+QkcOSNr+
         Aa5otkaRr0ohaTPkwKk2F2gJDFj+aEx3LlS1moeXa2y9UAZoqX9r0Pw2/Fe19+19LaBQ
         dJBTn6YsCiXxRKs6hM9CTZePLKySJQKhvi4wQTxc5o6M+QPGBPO/JEvTp290edVTNt71
         VcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872386; x=1683464386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH9QAwye48bejYcJsmUVDgnU+lbK1EZ9+5kkrqikkcY=;
        b=mEEbkgcl+3aVKMeG0DOYymbpPTyRyPvT3uu+OY+FAs9qPG6q3nRXyh6tddV8lSt1y1
         WzRYBYUNmgVB5v/dS1VuFBtIiN9+HtTfwmoFZttR+4v7k5uApKP1ub0KH/0iXovs17AS
         qaVtedVaN2HWFXBT93ESRj8xYzv18H9Z2Tc6WyaNN4H5/A/yD0lyvORTGUBBa4K9vjku
         kHRGEYQYp5b8aI2qsnaGshvOGj312OJsLhD9xwtuAk/D4E4Ikm75A+xlSHY5uLNdt3RY
         TK4+EfBHbDLvQkbJ+Z0yqgwQnXkidPqySZ2QXWFn4Cd5LV22vJZ4WTGz0oFAkVTlQVEW
         IA0A==
X-Gm-Message-State: AAQBX9eTm6S7XmaDM13uqO0roVdrKoXixFH6I73VivO4xxsylzynrvle
	5CwYlIEBCCh7iZxsS+5oU5DyRQ==
X-Google-Smtp-Source: AKy350btLadsciP/gSaGWtPYLwPPb9Fq1p+JbXZoIAtbDFd3nxVyKLZJhwC5EPrOuQrdfqLvex6ySg==
X-Received: by 2002:a5d:50c1:0:b0:2ef:b5a0:35e8 with SMTP id f1-20020a5d50c1000000b002efb5a035e8mr196350wrt.20.1680872386639;
        Fri, 07 Apr 2023 05:59:46 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 14:59:24 +0200
Subject: [PATCH v5 05/12] arm64: dts: mediatek: add mt6357 PMIC support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-5-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=O8w7thwfT5MR8VFkiJw3MJIje+8Rl/nHai1vgZPIVV8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO6NUK3q6T+uECyCgPL65LBXrFxIh/qJ7KH4IgE
 RP3l742JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATugAKCRArRkmdfjHURd7rD/
 40k2d9gb/Y/bWntaEH/+BuC7xgqfUmd0aunIoMmg56TqxmZ/f/tOKhKqAxhMyQV5gYodCPb+7YX04Y
 XEx3CX2A3b383gpA6VTUjIk5hxr6jpWaEVbJ+vo197+UlAOTcak0WiCSzKHhk8bKUIr/363rDGpGbi
 IKaphgMh/GsxsEtdAZaGol9V7r1xH+vi6RZjGZnnRqKlhVebw/JbuGKRW3ARp8SoYnG068EYxUFNQg
 7JDX2KaQ0Qz6uYgNSGFTUm7EOWkfC5k3tzYJzYEG07PWORL6fvLHnaffo/VNRnMCwqRrONaAam9fLR
 GyjHRavUuinx4lCFJURCWo+HKGbuNB5QacT7QBOFc/g0Ncx9L4tfKjBHf0T09Jlzux8j7g0Uo6OIof
 glkd9ysMTBFAGL67XvjeEo8L0eNXy6oc5fPvcVxJnRYIMEb4ujxcZ/gfUVxHZB3WHDWm/Owps0IPNv
 ngHPLv9OMXdSv1BDw6PpvRwwvCuxxNcq6wdrFg2kBH4QO+p91Ka1yfRNXjS9jR4Xxr/USYs0Nj4Ai6
 xO7Cmvv6LAiU5hNPySOPUQl44wce6jt7wupJRhUyV30I5QKPzOmWYduHy1M+wZ+5+AsgRp9NFB4o+1
 XQ/QEF98IK6R6RFItrLo2Dfap5MS1E2il6WaeFew2OwN88SGZZXmVPNujvfQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055948_889210_FE3A085B 
X-CRM114-Status: UNSURE (   9.63  )
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

This power management system chip integration helps to manage regulators
and keys.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index dd7da86420cf..a238bd0092d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
 #include "mt8365.dtsi"
+#include "mt6357.dtsi"
 
 / {
 	model = "MediaTek MT8365 Open Platform EVK";
@@ -94,6 +95,12 @@ &i2c0 {
 	status = "okay";
 };
 
+&mt6357_pmic {
+	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1


