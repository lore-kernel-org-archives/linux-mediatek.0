Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3354CC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/wPwAoTW2tJxjxrOBuLt4E1zX0C96+nBR9WhSVdzZQ=; b=RR5ZRW0Ya1rWt8/p9nkRZdj3Tg
	l4VGP+vcZ/s+3+VuhaQvnSWZChDyM2RMUU5fq85W2YylK/Lkuj2P1YyNLedN66rTqL3iJ8nFvmTS9
	Otw2D7yOxo4cC96A7bmn/aYLm2+c5guf7Iq078Fup04Slj2gvDEtbumAEVe4kuut40nawrVSA7lIK
	qcPd5zU6VPdY5qiIpd+EM35tl2kunqtM21inXmdBvZ9DCRHwuc5WWKaJRGCAeS6RTi5hgirSbqph1
	cwM8he38Ma9fFQ5oBjNrGXf55dCXt7sB0N9JCusKvbrY6pG4Bu7utjIFivA60T2Jnmk/Brh7lihMq
	D/iDmScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXKn-000NOv-8t; Tue, 07 Mar 2023 13:26:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCr-000JkL-5u
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so7183060wmq.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/wPwAoTW2tJxjxrOBuLt4E1zX0C96+nBR9WhSVdzZQ=;
        b=RzoJWeWo6nK1W7vlqqw+ptOWc89TyWU0EZJTFsIzQuUUOvqfVTghQ38SMf4qd2DJAp
         xK7baD8hWLNxN8tV+8SmwC8o07QJM3aHSdvA5/od+l8R9TMEIndjjY0JBYP5HsIhIf0n
         AcWGlCtgNUTO78fCxk4emdKm0PY1O5jsY6dgWsJmvypalLp1KNJf4ks/pvlNUysuq1Tv
         i7Q3LmW9HfR/Y77FUZbaJIopjOpb/xnevhGmT6/dCIOYbyvYq19pqxZL+WTtVhuRd2ft
         isoO+MXawPDK7tV9sqbOQd1oD7rr8KCEw5MYV2IaXE3XcJ7KDOW+Qz/bRY91zxAkJMXG
         y8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/wPwAoTW2tJxjxrOBuLt4E1zX0C96+nBR9WhSVdzZQ=;
        b=s/52G7vQh/vCdF8k061IAvQOQRYeDJE39VV9cq0oJOC0fqSqv40xUUpsLsAeTXyZ62
         t9ViE7pkOskEu6Ra9qmcLn5+qYYDGEW/yOHSgqBY9JD6oXZnD8JSYzYsd2QOIsIGeC3d
         AzjJXSHFlpXVLLLLPHNdoPAxq/a7CyvzJjr3AICxWJMyRSnVQoRkUMJJKS8cEsBKcvI/
         jsai/edou8OALrLul7aurneguvC7xKy+eRu/nb2k9JbvQzFChdK0MpsxS0FcxuNMT99r
         qdzXPdEpRlTtKNsuorAOd1FYxIzy42kIC2Bt6O+7MNVpQbdCRvKGUZs9/eb+sQFh6t3f
         Agng==
X-Gm-Message-State: AO0yUKX+SVmkp9hMoaaF4UR840PlPZlRscr4tSFy/R5u3eLpwB0PoJsK
	BheB7aAbWDcDdywiIvnOifop3g==
X-Google-Smtp-Source: AK7set9uR6+JH5jgbkcIyWePFQMVehEzpaQXaRWbN0EzEmEf4RzcWjBq9nfzisOtzrUY62Kc0CmxDQ==
X-Received: by 2002:a05:600c:3111:b0:3eb:399d:ab24 with SMTP id g17-20020a05600c311100b003eb399dab24mr11536587wmo.28.1678195096755;
        Tue, 07 Mar 2023 05:18:16 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:16 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:44 +0100
Subject: [PATCH v2 15/18] arm64: dts: mediatek: add OPP support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-15-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3615; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=BhQXiQ633r+6NqkoWGU/9bsfqhfFOwBpR91KfUVfpZo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmFmj2mkxx2UxTnp7+ve76NwYFekOygdsAZnDQk
 4gYXd8eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHURaAVD/
 0XpiQLgcuatB5m1+jRCZVeCMnDtRhvILJdeTm5UxqDESFfEMJIqIprwCh8o26gQinxHWqRQMbYfqmX
 W2z/V8vVIaZhVbVB2obBYGRjMc00FxeOLcnAfhSmLFvfAnN0/KNW0iVSyVEgF3N1YhTaFvqMh0HbJf
 c4+zgCMkSd2mcHwu+73nt1Igj3Ohy5c4PswcyvIUnxoLMyc8qjl6E87PGI7UU0xvz6f9AfwbohnarO
 PGAe+V5CABel7v71RnEeFYpkZXF98mY4juzh9LMKpVTkCtBn+OGb+myQYYJ9N1oiRk84t4rVVpEnSW
 JtUGm2EnnjRNsORHbbld728WwaK6ni9HgFwoMjI3VprN5UR7LCAMia+6XxIkSHzZb/8OW40/AF+0/n
 qfrMN9dLtykZh1YyPmKJlDvV4BQqyOi6PfVHhZj+uCPHLWdx8zF5qphLPzYZjDJ3fOl54TcZXqqfZn
 20pMTV3l8LgLsXIGIH45q4nqENbuUc4T5m+lo1qZVLyTvQDRIwG9APEwSVWGPrDqNy6J+oWAUtD/SY
 oz/GRQaAnQlsSxl5Fw91thbqkn19ofXRHmxxyVE6XLtxhE7wTXdBTSQfBES1XxAZeHck5EipU+Hecw
 c9xflXX4rtz0pHW5vBrY3ovrwXel/cY6Bu0cgum6Z1OFBiOpJXFntbsInFXA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051817_276491_BAE7EC75 
X-CRM114-Status: GOOD (  10.15  )
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
b4 0.10.1

