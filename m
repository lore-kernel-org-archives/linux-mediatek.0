Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9D6C7EE33
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=; b=u/wJIvQNuNK9YuVLdSmnRk1yG6
	Zt9KHobLuTEyztkhXjeOVnnSG3+9Hu/ze/lP0wlrmpqQK083iZLKzItDj5kwoKQz31UdJCOxuL6+3
	k5L/ASfuGbFpdcHMT9ftFsn+0O0Aj+NcaCUgjB7pmWBf5sAGO7IYv2IXXUWcBVgN7sTQnGQvDSAw9
	G/yhvrQ1ObeRbq2puolNRaVON8EC6bn/BDMWVK7w6g+AW+u5ZcU1To53C+qrbDFEqkBC4ohhju7gd
	VHmrW3cuGP+1xFbxq2Jo8PlGT1fRNVbqBe8yT2VtY7Wl716Yf1tVmSbN9U6d5N5gLPzaZdz7Wzq7T
	o9I8RJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27Nb-00G9p0-0g;
	Thu, 25 May 2023 09:35:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26QA-00G0SN-0F
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 08:34:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f6cbdf16d2so2205375e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 01:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003643; x=1687595643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=;
        b=Nr+YXCF7gu5WMZQLSJZUKtPly5voQB+ObgNwMi9S8SZ4EJkXC6A1M0u/DkbPZnBWCA
         g0NR/SJ6AfAPGooSaT5CWoPsZbh7dclweppZh+QwTZ30qk7gup3rKUG4FMLJiylplSXJ
         xVzDRPjl2lmImokoMX335ywHmMVvI8TBHohnLoKx8yS1AfArPWWgYuMjtRoKaVeds4YE
         +56oDophciUsFNqMDnQbIAVKKF1ogFCuj56pqOCQp1X/fJbdSUx58iRrsN/1P9Spm4lC
         dI8J+MWpx0y3h+Ia+EUwEXCAaYBkiGymyQjKfqe8GY1HZHtfH++d+aMxsvaA5N6wPw3m
         YxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003643; x=1687595643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=;
        b=QAW8b29/OUtT+dO6aVQvnjJ8CZuUt06i/h9eBJuHj2YW0PNMP75gkv+olbZ5r00wIA
         6duT3AWA4E+6nDeh0Cw+3mkpnl/vVUWBnMxXilRNJ1dkLT2C3fQVTxa/3pFCYIdCzejQ
         OHjJXZ+xLqfaFnuiOaoPlx0IX0XIDDJkFrYnHSLNH6Pfu5tU0uQLADAKFu6mSRWNgii1
         DjnF5EHoPWDjRCUZCTrJuvJr3lF8tRYjFXdqvm3z8+qAMOrE/IYRvRuWNCwfNYOpFkgb
         yjFeFCwDDZk83Q6ERqFcFzllP1zZa7R6Im2aSSuTRKHqbBeHXGaYeNSW6K0//+mNS8eP
         alnQ==
X-Gm-Message-State: AC+VfDwYAG+RxQJvc5Qa4ObEpNMugKgvmi16JMtE1yM8JKZL/CQCf9hF
	Ch6KYryL9ojuh2jR3gZKSjmfKg==
X-Google-Smtp-Source: ACHHUZ62g7dNi0kd8H9zW9Mq7w2ssLpoOL7/MTyGfyUrFwN+8H1uGHBGDCi7HQeybb4skFAP4IkzmA==
X-Received: by 2002:adf:f68e:0:b0:307:8fa5:6e36 with SMTP id v14-20020adff68e000000b003078fa56e36mr1666829wrp.54.1685003642890;
        Thu, 25 May 2023 01:34:02 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:34:02 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 25 May 2023 10:33:17 +0200
Subject: [PATCH v8 08/10] arm64: dts: mediatek: add OPP support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-8-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3792; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=iQCxmnK+eQfy1aBNVxZAL4gcwl2Oh2buOTNBmT3l0E0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1v2Yzq2DRngEYVG4rSFQTE2FWufu/fkoiCUkWJ
 krZYeTaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHURdZ/EA
 CQPVys/VGqd7jIPh9AInyGVijaFiERtOfBmuvuqA8Bt20lYHwME4a53+FyYWyITy933qJlFMhhXA3J
 ce+yaRpo5/+JZdzXepXvleBH8sL7bxzJsHaEzPGp32LAdanMl02n78+VeR5w7qG6Hp1d/uDS7syquc
 EMyT833oMq1IHuWjMm6UldcieFk3DA3lpmd+PXlq7vsvzZ0EIfWPwdVGuvnQnA9z+UBIdP9+Fg8pOA
 UMJ8UimvEKyGOGuwL6mMl9P+FO1NP4yiOLq82EpoEF1B+0qNYuEF6bDXAJg50UyetuNJIt8D6qVNnq
 mnxXUs+hz8UPWxy472I4q8TDcA6EIpy+MtbFY+fAUOOzLJ3svEzTnk/IO6ypfcEGI1yqD5GWoIRc9b
 jwA8aSplVDx5xKjQy/nWrIt7PBKoxQT+9PW9sBnapr6nJXFQJdv+WcRMNUZNIEc2SX/rDBB5antRWO
 rk613AApeQk5lf7SRlxP8X5LM7b5q5x6+GcfwJCjuL+aY9KS2iMjzzThYbyhbV3C7H3c+hkosyuL8+
 v9HPQy2Z1B9UzbYqgFciBYDg3W202OnV5DpZpgXOh6M0wxEUHWOnZGsHTGkVjurxVRX2WEhXdeTKiH
 MtJgcvvM4KVXTlH/OquXvLTnXi1cphlxXHtYK6Hj0YqQnHmRVAVKTjD6K1Tg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013406_121745_F90F4C02 
X-CRM114-Status: UNSURE (   9.96  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
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


