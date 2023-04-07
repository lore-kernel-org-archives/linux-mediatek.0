Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6A1C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dv6Eb/XHCNKSdHW5zbcXguJe5+5nqrZlLcRsnMdnSlk=; b=35BMFYEuiLoYxI/ky89MqSMYeU
	tWpj4ShFAP1AGFD/ZqeGaVJOfdZ/N2Qsp5FFL6ii73aGApS29DMOgno7F5ILnUuoAKowoi/urxHse
	TGLvaMABTEd8DwLbgwgLApxCGe7nsp1kmxXoHmeRqKdL9xFU2uqu+gkyWXYgohJfH3AHYDWgQnpN5
	uhqsfqNVKzdqQpb11Wzf4IFy4XJF/T7nChAzd4CzCUHljF9K5tAkkTgY9nuXN6QhhxKR81eQgphiP
	g45fCqndhZshTjiLmuRFP/KBDelTBTMRxfkP51oyv8FPbfQIuRJh5NlH3A9uf1YW11hI9EjFsF7e4
	HZJlZ3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmgS-00ARXw-0W;
	Fri, 07 Apr 2023 14:03:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklh3-00AEN9-1k
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t4so37008407wra.7
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872393; x=1683464393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dv6Eb/XHCNKSdHW5zbcXguJe5+5nqrZlLcRsnMdnSlk=;
        b=MX3YVFdCMIoNhqN0MIUQA41/eP30CkgBvPO6afw/WAq/0OGxqXF2lB4TkgaWk1t7gl
         z/G7BuEoQjUCXIrE1Btk22lW/DGKIZ3flbw85+TndaFS+frGCKrOVldp9tsqyehTFSJ6
         azE8txkNN/Peh5O5goLvaT6vqojN1sQdvwyG02Q+WJWy8T5YkK/zb5wxlf/lGWfDasyb
         1k+mpfOCHCLnuvaFuWqWIrpMDFLirqnPObtLLI9J6/gqvgOOHWWa0Y1nOpvqEX3qXM2L
         3/BHSz+vYQYQaBEEuHhFZD8uqHqa7M/ghjFbn1IByLa+nyoN4EGlo8Ibi2fXQDmSH6BQ
         /ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872393; x=1683464393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dv6Eb/XHCNKSdHW5zbcXguJe5+5nqrZlLcRsnMdnSlk=;
        b=3o8uB0z3ysPj6mDzAeqPqZWvmYJ+oMz4h9NXSUSI2g5YrWVlNkfoPbmx/UUuwJxFaF
         H2hooThhjNfA5gZi8UinW4pYSQarvLyk9W+Ef7NeVrtt0lr2lAmo6eML/Cz6HJuZHY5+
         Q1abtznIrMacf++ru20QVZP+g96lMeoed7pSijZY4Trwn0qgZld52OcZP99zsxYEpgfH
         J1hC2NyBJG6mjEXap2+JW+Q9ICBwm5cmfBVxTKkemoWmXNLPbaBF72bWCchoD1QgNwgb
         q6cNoYRhODcfJC6rcsB608IFX5b02hANfinOULFBgRNKmpzJl3cUKQLWh3GfJiIyQASY
         TVzQ==
X-Gm-Message-State: AAQBX9f/WPG/nOR7PcBpTjJPaAkwCWzfFfDvB9RFJkRrzjc+REVSqsaX
	Ejo5DPhJnwITDjxv01RONu4qog==
X-Google-Smtp-Source: AKy350ay6LqBMC55Esdb5lT/PUmlszWizvzUCPIbmaeFVtTCNvqNsiPeMo3jTOfRc+9d7jxXxHczog==
X-Received: by 2002:adf:e0c1:0:b0:2ef:b4a9:202f with SMTP id m1-20020adfe0c1000000b002efb4a9202fmr586960wri.69.1680872392995;
        Fri, 07 Apr 2023 05:59:52 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:52 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 14:59:29 +0200
Subject: [PATCH v5 10/12] arm64: dts: mediatek: add OPP support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-10-1883c1b405ad@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3661; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vbee9YlPZnb6kFNtpMf6YbhiqwJ/puB0VHW9S9J3p/Y=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO6UfjnHjdAutiMzXQui00FKmzx9EVmCv1qzP7h
 zHI1K+GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATugAKCRArRkmdfjHURQD0EA
 CFQuzdpxHY+fOQZ7iTR3ZEkwWgt1EFV+6uc+MSilkJshwL/eP71Ke3HSYd1+jLoAHtqPkpJ6StRlaU
 2kU9RjoZQkn9n0ThrESMksto0/pdCwybg399z+tAUZC6uylXe2obZ3qmt/zYOa7PU94LNYd8XU0Tmx
 BYK2J/Zwl+7gslF/5/Z7WSu7oGZ5U8Bcd4H10UQnGD5Ukpy5Av0YV1o44WwpfE14LhTwGJ6ufkZxqb
 1/acDZpZXLUGQhu9rXy86gvLijvW8QHpyMymO/yrw5CCLHIoQy/8KpmVJed8jSIuCM8B0rUV461aQA
 7gmO7JIaR84pUU2ppUFiVTXQscsEKxweS0ZKNq5HDDVIezzo1AJAcALi8KiH8IwDTgdcsa64d6bJJJ
 yTbZNfod042lb1JW10MEm88GZtuEGorXKiEG4qGZM5AKa35lz7MumMoHRM6QyHMsuTeSv4K5L4DIqs
 Pjkr9fux3vjEQSUgVSYI7oecV8tN5+otkrI/moPZSvhr/qkEIvHhvAK7JvE/R7fAUv+KPRdpBdzUyf
 2OEfLpLv3f10OTpH57G1XL5ticsVqw5McBvK24zT4MAlT3OmHEbYwkHPNpLGrPheWro/VYuLVy43jB
 rD2hHVyF0vjA7ioQkh0Dl2F0VBn95y7S2GxzfAAvVl0RR/G9Lk/qe+epabSQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055953_583568_7E1A0ED8 
X-CRM114-Status: UNSURE (   9.97  )
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

In order to have cpufreq support, this patch adds generic Operating
Performance Points support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 101 +++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index bb45aab2e6a9..cfe0c67ad61f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -20,6 +20,91 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <650000>;
+		};
+
+		opp-918000000 {
+			opp-hz = /bits/ 64 <918000000>;
+			opp-microvolt = <668750>;
+		};
+
+		opp-987000000 {
+			opp-hz = /bits/ 64 <987000000>;
+			opp-microvolt = <687500>;
+		};
+
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-microvolt = <706250>;
+		};
+
+		opp-1125000000 {
+			opp-hz = /bits/ 64 <1125000000>;
+			opp-microvolt = <725000>;
+		};
+
+		opp-1216000000 {
+			opp-hz = /bits/ 64 <1216000000>;
+			opp-microvolt = <750000>;
+		};
+
+		opp-1308000000 {
+			opp-hz = /bits/ 64 <1308000000>;
+			opp-microvolt = <775000>;
+		};
+
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-1466000000 {
+			opp-hz = /bits/ 64 <1466000000>;
+			opp-microvolt = <825000>;
+		};
+
+		opp-1533000000 {
+			opp-hz = /bits/ 64 <1533000000>;
+			opp-microvolt = <850000>;
+		};
+
+		opp-1633000000 {
+			opp-hz = /bits/ 64 <1633000000>;
+			opp-microvolt = <887500>;
+		};
+
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <912500>;
+		};
+
+		opp-1767000000 {
+			opp-hz = /bits/ 64 <1767000000>;
+			opp-microvolt = <937500>;
+		};
+
+		opp-1834000000 {
+			opp-hz = /bits/ 64 <1834000000>;
+			opp-microvolt = <962500>;
+		};
+
+		opp-1917000000 {
+			opp-hz = /bits/ 64 <1917000000>;
+			opp-microvolt = <993750>;
+		};
+
+		opp-2001000000 {
+			opp-hz = /bits/ 64 <2001000000>;
+			opp-microvolt = <1025000>;
+		};
+	};
+
 		cpu-map {
 			cluster0 {
 				core0 {
@@ -50,6 +135,10 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@1 {
@@ -65,6 +154,10 @@ cpu1: cpu@1 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@2 {
@@ -80,6 +173,10 @@ cpu2: cpu@2 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@3 {
@@ -95,6 +192,10 @@ cpu3: cpu@3 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		l2: l2-cache {

-- 
2.25.1


