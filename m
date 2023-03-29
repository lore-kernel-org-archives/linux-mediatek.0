Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BBDC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaQQlVVIoxOU6TqfrFJ+lVhpnQLiZR5hTcBoQn1zAF4=; b=KtOtaxbXIDTzkrbDWJqKZfafG5
	amL1A7wX4+b2gkUSaFazLU+hz+dFdMuckBniMw4qYeBMxcJUDZbQTq10c2f/sEpcXD5J6DNUtTJoC
	3FOpDT7r2Cqi6o85jkgJ8WRw4uIGIcpdDYL26YcvKB4jS6s85K21mycSrOH+pOmWStmovo/9Fnqdg
	2DqDD7QqnOOKvtXfFO89dAnYoXt/RhaOX8mSlJMG3s0hw406XDrWfN9+GZjKLVQVnbcUyqg0DiCi4
	8nVTJ+VabVZSjh2qGsYZEP2QIb69SXLx1naOGXNzuuQM2M1c4y+VEdeQ5Ae2EcLayDLYmlpNV2Ulc
	vYiG3X/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phRbX-00HDBT-28;
	Wed, 29 Mar 2023 08:56:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRaH-00HCUu-1g
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id v1so14857679wrv.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaQQlVVIoxOU6TqfrFJ+lVhpnQLiZR5hTcBoQn1zAF4=;
        b=14LgrvXb93pcxdiKRp8jWxGjngm6XDWzpsH3lY9q0okYQZ/ORVz804xdiuYRRIrZ3W
         DEX9qbErrDi1ZNfzKACV71rrciT6x5OYEk7Ok6WZT9CpSWbll5TwhN9W/nfWIwJa938j
         +Lq0yVM9V0ABsSy/PqSugW4XrUpwhrvUZtJpyhRco4l3sU+o36pAEL3UXfdMyOSz3hIt
         3Rw155qO0oCTiozn8pWUXsBnIKrcQUWMgtq1NTU1GwjFl/ntrLlZtiQEf3yqmHNAKbP8
         7dQlVPmSaROvQU7WXc0PJT9lIYXLvROFkG5zowAFDtyRYA0aevWGKC34VOEjfnrlU6g3
         P3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaQQlVVIoxOU6TqfrFJ+lVhpnQLiZR5hTcBoQn1zAF4=;
        b=zWRJws/d2/cc0vCaJzOVMBHMbVFXWXXTg6tQxr+ozQy7M4oh6phxGfx6Jxgp4rmkXO
         3x1uDuDGacrZwLXGS3t0AFvxIexh/9mtpUYWjCdvAfYL7iBVr7PPF8KEZfYwZ6JDPYo2
         MeTYNDhJD8Y1Aopp5Od5om2TXdIZWasrCNZLPUngrqUs3nZjFzUCYGVB8zvyPzlW92BA
         2xZUd85s3A6qxDa/rxfJ+F31SLyyg/T3VxYBDRUyocoIV9ZhKEeAE6rP4Phb6uqJhCYp
         UJtkiA7+N3Wfqye0/9zl9ZWo+fuSGyvNcNf8xcEdRO44WTVp3AHvzQo/lIf/P7YtkWZz
         MAXA==
X-Gm-Message-State: AAQBX9cnLJxh8Gop+rdm4gB4kX97ZKYRTKGb5ZOvrI41BVSmNiO+0BSW
	ZlMJqrZu4gE3+7WcofasCVty7Q==
X-Google-Smtp-Source: AKy350ZZliyPaqooFuppqqg2/DsSnh9Bxa6DNxbgwJrsU6knkvhi1VU0jHFRf0cX6pfwLbWeAwukOw==
X-Received: by 2002:adf:f201:0:b0:2e4:34b:92ad with SMTP id p1-20020adff201000000b002e4034b92admr525518wro.64.1680080109030;
        Wed, 29 Mar 2023 01:55:09 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 10:54:35 +0200
Subject: [PATCH v3 14/17] arm64: dts: mediatek: add OPP support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-14-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3612; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=c7vCtSe/WVuWGbMdmeJCSd1Y1OoLrA8MO/iUibZvpck=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcVAd04GxdvqrTsshWoMC0P7pVbCtaqpw6neH6
 gd1tDuqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURerWD/
 99fkruLqpde97Gh1UYS1jyEF41IRtXrAWgi4oLczd/OUaX66pUklUQQ+e5MkhREu9y+vfGJ8458iWL
 CI+nrtd/fB4QGtNu+9PU7+ACIama1KcADk9hCMbaJo0Khb3dnBuliCaXAz6wZkjvXX9pJOW7hHlErc
 03uBPoALBsJOaRSdi3II6RJnC+e8JKCriw0O7wp2uX5Jq4Vd6Ztx/JDFaFyJlZ/Vn0GcTCNY0m12fY
 k8Ilx7k4TY8Hp0shQif0js5jXgWwaKm/Isqyecd+eXrkUuDE+/40G4BssuJZX4oAyihPK+1e4QsyeK
 yGnZnNiIIMfJaWnAxNsxBDtAYK6txvUFIahe8G0HxLDKXsKKK0mEitI25ZQytdq934k+0uBIBvZFDg
 X0s3dL9s5umf0KxCSkpuibTuY2eK0Vjlo7GdWtKRCCdPjuT5H+EAHm6IgS+qzLwc41FYUKJKhmk8s8
 QTLgwR0+jPzUzTNaxx5+Egzy75Lb7Ce5TNu5nU5bwrrdVN2UiMbHfjFyFemMHeL6Le5z0/cI4boDA8
 9+/m3qig1NT651s4Iy0YCZ9+MxGLa4JNaD4de3qKYMVqLDG8QUDCYl3AArvLH3yOpJ2hs7lVn02Qr+
 zZcuOZPglZCXsF+7ngx6ZxfDJOZ8veiLBFbSVfndghxU/2QDirkMLK5A9aDw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_015509_559913_2B185EF9 
X-CRM114-Status: GOOD (  10.94  )
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 394a5a61be59..c3ea3cc97a47 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -20,6 +20,75 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <650000>;
+		};
+		opp-918000000 {
+			opp-hz = /bits/ 64 <918000000>;
+			opp-microvolt = <668750>;
+		};
+		opp-987000000 {
+			opp-hz = /bits/ 64 <987000000>;
+			opp-microvolt = <687500>;
+		};
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-microvolt = <706250>;
+		};
+		opp-1125000000 {
+			opp-hz = /bits/ 64 <1125000000>;
+			opp-microvolt = <725000>;
+		};
+		opp-1216000000 {
+			opp-hz = /bits/ 64 <1216000000>;
+			opp-microvolt = <750000>;
+		};
+		opp-1308000000 {
+			opp-hz = /bits/ 64 <1308000000>;
+			opp-microvolt = <775000>;
+		};
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <800000>;
+		};
+		opp-1466000000 {
+			opp-hz = /bits/ 64 <1466000000>;
+			opp-microvolt = <825000>;
+		};
+		opp-1533000000 {
+			opp-hz = /bits/ 64 <1533000000>;
+			opp-microvolt = <850000>;
+		};
+		opp-1633000000 {
+			opp-hz = /bits/ 64 <1633000000>;
+			opp-microvolt = <887500>;
+		};
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <912500>;
+		};
+		opp-1767000000 {
+			opp-hz = /bits/ 64 <1767000000>;
+			opp-microvolt = <937500>;
+		};
+		opp-1834000000 {
+			opp-hz = /bits/ 64 <1834000000>;
+			opp-microvolt = <962500>;
+		};
+		opp-1917000000 {
+			opp-hz = /bits/ 64 <1917000000>;
+			opp-microvolt = <993750>;
+		};
+		opp-2001000000 {
+			opp-hz = /bits/ 64 <2001000000>;
+			opp-microvolt = <1025000>;
+		};
+	};
+
 		cpu-map {
 			cluster0 {
 				core0 {
@@ -50,6 +119,10 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@1 {
@@ -65,6 +138,10 @@ cpu1: cpu@1 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@2 {
@@ -80,6 +157,10 @@ cpu2: cpu@2 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@3 {
@@ -95,6 +176,10 @@ cpu3: cpu@3 {
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


