Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D757CD54AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1tYjsJDu+C5E5OW4y5pouEu7mxQQfBFwdkXqrO1cX8=; b=n0+0dFE/Dbd0DKPFYtwaDJ+FOO
	49icbgM48RPEUd02fvogkEG4/2jWfKV30w/OrtelyvcLlCb4d9zvtp0IajCdsQWYzkQub36laE4RA
	atXhG3u4gsoxO8PyJS14IImQZfLlaLuoawe+Q8lSr3+NQGZB4Diaebck/a7egso3OVQQmKaTD0cTe
	z7FN/4rrHxCfxb/F1Y8rvVSheYW+e+NPkFB9WbxEnfTQPKnkqqJkFzhg9V1Jt5dVpjPbz1yTD0xlk
	BKWIcQGhDky3O7mMRQYjVM4Oq5yIl0EQ1bDnZRNJBpI+HngZ0A8IW8vvR56/l7yT6dmFs09+HzAL+
	bf9ZemAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYHi-0005rN-0C;
	Tue, 19 Sep 2023 10:48:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGq-0004uk-16
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 10:47:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c43b4b02c1so26017165ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 03:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695120475; x=1695725275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1tYjsJDu+C5E5OW4y5pouEu7mxQQfBFwdkXqrO1cX8=;
        b=Q1acrSrfnVYc4V5RF5E1ahQY8///2QcZ0P8TZlAFJ7hWtGJIMMZb6RTG2uDZVn5yjW
         UNUBRKCeT+yIQUGkk7HHvv97ZvRdYAePY7QnZN0huMfqKjmb4utgCtEjBjtBxk5s/jBa
         DKW2GpbzB+GA6EJxkryQs+A0QBPJGS3EDhSbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695120475; x=1695725275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1tYjsJDu+C5E5OW4y5pouEu7mxQQfBFwdkXqrO1cX8=;
        b=M1W63825GvSUm4apQ5Fn/P6xcn+bAP1j4hcELvsNWj4CqecqnJd5d8QVUU5llY+FxY
         LPXQe94/2FrjWDOTFyJR1t0VdWDKtsDSy5hZ67vEgKIYqZ6VyfFGCxs7LX46JWFuwLT2
         U+LVLjkd3vWBQBIKYOjLU67zCY7DquCAgJI+HjFv7gf5bicgnahUIFUZpJj0VDiOA6Qk
         MYXx5nV/MNultxsHArm6Sv08bE8GQmRHL7fx3GFpu4GVG7gocROP8/wDgwagaNNKZpLs
         MCME8B3YhUPaoeqA67kTZOd0Kb8j5Yk3G/idc4FeFUQS7Me1ZTiUUEkP7vsBc4e/Y8Mc
         iNcA==
X-Gm-Message-State: AOJu0YzHwz+xySq7B9rT62AFHgHHBl8B8M+GAOvg0RMY6XioCfAd+7NP
	LPfKNy5JUCQ8zdeKTrtGA2Wk2g==
X-Google-Smtp-Source: AGHT+IGZT6DHePGJ2LzE5ACt2NgdwVrmRkKsA94M19qoGqomPTgoPM6UD2bRVWKhTrAZB1cRaQ44nQ==
X-Received: by 2002:a17:902:ecc5:b0:1bf:13a7:d3ef with SMTP id a5-20020a170902ecc500b001bf13a7d3efmr11054107plh.66.1695120475653;
        Tue, 19 Sep 2023 03:47:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902d48a00b001bc445e249asm6719578plg.124.2023.09.19.03.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 03:47:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 12/12] arm64: dts: mediatek: mt8183-kukui: Add PMIC regulator supplies
Date: Tue, 19 Sep 2023 18:43:55 +0800
Message-ID: <20230919104357.3971512-13-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
In-Reply-To: <20230919104357.3971512-1-wenst@chromium.org>
References: <20230919104357.3971512-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_034756_443080_B02170DD 
X-CRM114-Status: GOOD (  11.52  )
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
index 6ce16a265e05..d48c66cc8c18 100644
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
2.42.0.459.ge4e396fd5e-goog


