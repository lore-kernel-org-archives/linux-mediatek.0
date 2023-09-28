Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5C3CE7B0E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgeyQ9XqFkXYBeBValgSP4KCftxD8NcYA2elGZ0g2+A=; b=m3/SOZzUl43qch+hWhMqkcrhxN
	+k53mMG2RPNJhjkJdJMZ3t/bDM8h19Q9YPyWJbbCC7q9dB9241rTvhbiQBbRx5NBBiiTDEYLYrysi
	75hK8XxylV1sc9ClHiJ9LCvnZDXR3Y38bLlCMvDTitKkvDRK3kksBo3IDDy8C3/oDPsXpVFv/9UxE
	3bCkOi5TdbKcBiBbDBBu3mgEI4iLyaTANvWiCC8KS+1J/9dlBHVgGkmLcJhCT9gCOhWM0saD15LgF
	JFMO/JvGOvITRyKZbpYqabpnni9pU8HmxJhjdksiTxIoekcTzXP4ynM14bi+mKH7okG2fwj4WpPfW
	dEXLTT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmpv-002gEW-0V;
	Thu, 28 Sep 2023 08:57:31 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmot-002ffM-15
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 08:56:29 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-77428e40f71so597785285a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695891385; x=1696496185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgeyQ9XqFkXYBeBValgSP4KCftxD8NcYA2elGZ0g2+A=;
        b=cU7iNHLvHwgq31Ur7C5hv2nFptZono0HCwNc1roPAvHdTKa+Z1XKz2OWvOU8G+GcQk
         y4oJhfqc0bAhxDraSPjJgqpd7l4DRxyBy4evaWrEBPqFmB/KHHPHns3MZY3qI5vGR4xZ
         j9bQ8e4dLwHgbVFWFn6nAG80pzLm7KFwQw2a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695891385; x=1696496185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgeyQ9XqFkXYBeBValgSP4KCftxD8NcYA2elGZ0g2+A=;
        b=KNFc6khhkhILVp4jdpbnfOLPxcmznQElbZ3xfpRg+SiiJfhRSm1Pb/8H2mtsJhEDGa
         bko0ZBcXSXH7WBh+Udb/1Mj1mAaC4g3nGbQwmMQsKj6TxN1zawHtZPLNFmLDDXEX3nbm
         enbsEBnPIj2zAfJZ/0vcoAg1HXnJJb6BzzR/Iq5nEGnOiKAUzx/SC7KegGodZLEZXt5T
         yFAy8yWhGIIPaG+5ZqJzASDkNFsiShtJ7TWargL3YrbwyUCjTf74IIvUWshk2K3iGKvK
         mKX2g98LoJDm8d7kwIfVgppRtK/ZTw9GvhJHuZUfFBrLCXFxWiC0tyGWkuDZXuc6Gdk6
         sgvg==
X-Gm-Message-State: AOJu0YwyZ9qJYMo9CwtK30+t+Wy5E4zk5tVOna/IMNDrA9qrUy0sfi+b
	azkWEdZr7jVR8OQcJZYraagduQ==
X-Google-Smtp-Source: AGHT+IFqaLEZNfjA5pU7uen9wRPCrpJO5khkqsKxmyJDY4pM7Sk8LJdyfVsz0G2Qn3psaxuRQUKg3Q==
X-Received: by 2002:a05:620a:2191:b0:76e:ec77:10a4 with SMTP id g17-20020a05620a219100b0076eec7710a4mr561459qka.77.1695891385357;
        Thu, 28 Sep 2023 01:56:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6747:c12a:dbfd:2cc7])
        by smtp.gmail.com with ESMTPSA id y7-20020aa78047000000b006879493aca0sm1754016pfm.26.2023.09.28.01.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 01:56:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 12/12] arm64: dts: mediatek: mt8183-kukui: Add PMIC regulator supplies
Date: Thu, 28 Sep 2023 16:55:35 +0800
Message-ID: <20230928085537.3246669-13-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20230928085537.3246669-1-wenst@chromium.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_015627_510289_89E7DFD3 
X-CRM114-Status: GOOD (  10.99  )
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

The PMIC regulator node is missing regulator supplies. Now that the
binding supports them, add all the power rail supplies. Most of them
are fed from a system-wide semi-regulated power rail. A couple LDOs
are fed from the PMIC's own buck regulator outputs.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ab2eb4500643..bf7de35ffcbc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -103,6 +103,14 @@ pp3300_alw: regulator6 {
 		regulator-max-microvolt = <3300000>;
 	};
 
+	/* system wide semi-regulated power rail from charger */
+	reg_vsys: regulator-vsys {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -404,6 +412,26 @@ &mt6358codec {
 	Avdd-supply = <&mt6358_vaud28_reg>;
 };
 
+&mt6358regulator {
+	vsys-ldo1-supply = <&reg_vsys>;
+	vsys-ldo2-supply = <&reg_vsys>;
+	vsys-ldo3-supply = <&reg_vsys>;
+	vsys-vcore-supply = <&reg_vsys>;
+	vsys-vdram1-supply = <&reg_vsys>;
+	vsys-vgpu-supply = <&reg_vsys>;
+	vsys-vmodem-supply = <&reg_vsys>;
+	vsys-vpa-supply = <&reg_vsys>;
+	vsys-vproc11-supply = <&reg_vsys>;
+	vsys-vproc12-supply = <&reg_vsys>;
+	vsys-vs1-supply = <&reg_vsys>;
+	vsys-vs2-supply = <&reg_vsys>;
+	vs1-ldo1-supply = <&mt6358_vs1_reg>;
+	vs2-ldo1-supply = <&mt6358_vdram1_reg>;
+	vs2-ldo2-supply = <&mt6358_vs2_reg>;
+	vs2-ldo3-supply = <&mt6358_vs2_reg>;
+	vs2-ldo4-supply = <&mt6358_vs2_reg>;
+};
+
 &mt6358_vgpu_reg {
 	regulator-min-microvolt = <625000>;
 	regulator-max-microvolt = <900000>;
-- 
2.42.0.582.g8ccd20d70d-goog


