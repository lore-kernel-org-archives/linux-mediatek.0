Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FE6C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56q05UsuazQ3l9IlZm8IljgHBiGaLsgNecYNIgR23ec=; b=ImQ9NKkS8PPCW4y0Se6oA0xcLf
	SwYQaSM3Tx6aDvGm0yVoPtaq8YrUSu5yzKFkCw8pF1ub1WVV/PFBbyDmYi2D8+laPF/L9upAuPSSK
	7yJ/9t16bdcod81RN3lUDXL7Msj364Mr83YK9QfkHaT4FYsyx/JJ8BaufVpBSC9zDymxff9+qu5G6
	ehZhGIZbtS5Yauyz9Ea4kgTKECJ94/VDoj6e//bVfI9kJLd7OE9WIxo+1xsXns7CnBT/7NLpe18Sy
	pMxmOb/rNlQxyK7t2awIYwu/HsucyA38AtOTRm+Pi026RhsnYLOw1B9m2snLBLv6EoBe75XN+qyN8
	skjlv2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p8P-005AGQ-35;
	Wed, 07 Jun 2023 09:07:17 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p8J-005AB4-1C
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 09:07:13 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-777a9d7efabso139316139f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686128828; x=1688720828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56q05UsuazQ3l9IlZm8IljgHBiGaLsgNecYNIgR23ec=;
        b=Pbg94OW6ek039a4YB9fBJOxqVm+c0gaM+NU3BtgP5wjdxHtmeqiTua5bs0no0CzVLD
         NTtR6cd3xEdCHngH4Od25Yaad1QfhRKp6dzXsWp8a8B27Yuznc7YnpifNu/2Jfh8CVT6
         LGfEPy0OjxPUv4lrbBwjjmBYevQSsE9bZIFvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128828; x=1688720828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56q05UsuazQ3l9IlZm8IljgHBiGaLsgNecYNIgR23ec=;
        b=lLX52vs/rmoigJG/83alrP/cPJ1NorFpi/PzzvcuOPAyV7TpqQk8RoHXv4bbM+gk/A
         HTjGTpj46mVx1QKqGtBx2FMUPU96QP6JwSYRdDtnmwX1qsRUY37eolLv4Vr5agJAjkAV
         UyOd2uTjLfALkcbFt0P1gVsBQkt1UV/FMCBWp7zbQxrTKOC+SIVepeLLzU/u3H18sbyl
         tHCLsJfKge0uDTeOMwWJah8uUUMyJZz0UhQ33B5J8B47cnWP+tlGYaL/BQbU45Tzx9rv
         kZcblZMUj596fhQg1MAOWGycB0c399as1zRCFYSMlkgAl/4dPCRzP/CJaIba5tN5E8jL
         wUMg==
X-Gm-Message-State: AC+VfDwXmJyw2am1pStg8e6hm95+XVRNAzgKelquHFlMxrXW8fj/YuBD
	zx1oI6+uUV1t559PqS11l2i0TE5DGCuSq8T01Yg=
X-Google-Smtp-Source: ACHHUZ4J+NGvRiWFsYnVvU8HZ+cJ1PTzOi6W8RcxMQCnO35ocFrm/rLAAwyedcTfixlvTCB6sxETLA==
X-Received: by 2002:a6b:e31a:0:b0:777:b409:fb67 with SMTP id u26-20020a6be31a000000b00777b409fb67mr5631749ioc.4.1686128828683;
        Wed, 07 Jun 2023 02:07:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:443b:29bb:b677:185d])
        by smtp.gmail.com with ESMTPSA id b38-20020a631b66000000b0051eff0a70d7sm8505732pgm.94.2023.06.07.02.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:07:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8186: Wire up GPU voltage/frequency scaling
Date: Wed,  7 Jun 2023 17:06:52 +0800
Message-ID: <20230607090653.2468317-5-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230607090653.2468317-1-wenst@chromium.org>
References: <20230607090653.2468317-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_020711_433106_7F0541A3 
X-CRM114-Status: GOOD (  12.65  )
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

Add the GPU's OPP table. This is from the downstream ChromeOS kernel,
adapted to the new upstream opp-supported-hw binning format. Also add
dynamic-power-coefficient for the GPU.

Also add label for mfg1 power domain. This is to be used at the board
level to add a regulator supply for the power domain.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 140 ++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index c58d7eb87b1d..a34489e27cd4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -695,6 +695,142 @@ clk32k: oscillator-32k {
 		clock-output-names = "clk32k";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-299000000 {
+			opp-hz = /bits/ 64 <299000000>;
+			opp-microvolt = <612500>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-332000000 {
+			opp-hz = /bits/ 64 <332000000>;
+			opp-microvolt = <625000>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000>;
+			opp-microvolt = <637500>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <643750>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-434000000 {
+			opp-hz = /bits/ 64 <434000000>;
+			opp-microvolt = <656250>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-484000000 {
+			opp-hz = /bits/ 64 <484000000>;
+			opp-microvolt = <668750>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-535000000 {
+			opp-hz = /bits/ 64 <535000000>;
+			opp-microvolt = <687500>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-586000000 {
+			opp-hz = /bits/ 64 <586000000>;
+			opp-microvolt = <700000>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-637000000 {
+			opp-hz = /bits/ 64 <637000000>;
+			opp-microvolt = <712500>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-690000000 {
+			opp-hz = /bits/ 64 <690000000>;
+			opp-microvolt = <737500>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-743000000 {
+			opp-hz = /bits/ 64 <743000000>;
+			opp-microvolt = <756250>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-796000000 {
+			opp-hz = /bits/ 64 <796000000>;
+			opp-microvolt = <781250>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <800000>;
+			opp-supported-hw = <0x38>;
+		};
+
+		opp-900000000-3 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <850000>;
+			opp-supported-hw = <0x8>;
+		};
+
+		opp-900000000-4 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <837500>;
+			opp-supported-hw = <0x10>;
+		};
+
+		opp-900000000-5 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <825000>;
+			opp-supported-hw = <0x30>;
+		};
+
+		opp-950000000-3 {
+			opp-hz = /bits/ 64 <950000000>;
+			opp-microvolt = <900000>;
+			opp-supported-hw = <0x8>;
+		};
+
+		opp-950000000-4 {
+			opp-hz = /bits/ 64 <950000000>;
+			opp-microvolt = <875000>;
+			opp-supported-hw = <0x10>;
+		};
+
+		opp-950000000-5 {
+			opp-hz = /bits/ 64 <950000000>;
+			opp-microvolt = <850000>;
+			opp-supported-hw = <0x30>;
+		};
+
+		opp-1000000000-3 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <950000>;
+			opp-supported-hw = <0x8>;
+		};
+
+		opp-1000000000-4 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <912500>;
+			opp-supported-hw = <0x10>;
+		};
+
+		opp-1000000000-5 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <875000>;
+			opp-supported-hw = <0x30>;
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupt-parent = <&gic>;
@@ -813,7 +949,7 @@ mfg0: power-domain@MT8186_POWER_DOMAIN_MFG0 {
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
 
-					power-domain@MT8186_POWER_DOMAIN_MFG1 {
+					mfg1: power-domain@MT8186_POWER_DOMAIN_MFG1 {
 						reg = <MT8186_POWER_DOMAIN_MFG1>;
 						mediatek,infracfg = <&infracfg_ao>;
 						#address-cells = <1>;
@@ -1606,6 +1742,8 @@ gpu: gpu@13040000 {
 			#cooling-cells = <2>;
 			nvmem-cells = <&gpu_speedbin>;
 			nvmem-cell-names = "speed-bin";
+			operating-points-v2 = <&gpu_opp_table>;
+			dynamic-power-coefficient = <4687>;
 			status = "disabled";
 		};
 
-- 
2.41.0.rc0.172.g3f132b7071-goog


