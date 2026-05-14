Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57237CD4F25
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yo+sSnnnw2cgQ7ZHbjxHFE6KPW/XWkxC49iilF+VEa4=; b=Opvqy7+7eqRbpRYEDY+JBV8xlE
	xTzvcEF+Bn3x3LLiJEJZHenyNA8jQRlXKRmdBFprCwZhSPTsMppnBkoG4+tz2esMcLBmRNiOm2ba8
	ViVz3Mh+WmwGjhcxMTVF77ihnuIc6gEqGh9EBh0f7Nd5ehOYLj76dRtMVb0Qf4hFBN5M8Uq0qkeVm
	00H0gK/fQelcSi+zHKGg97pkHbvkcgU6DbIyNWXl0u0C+0OqB8+RwZKgGlP00QEnWTFd+BlZnkVSo
	SowfJKd1dPcS/VY6uu+8sl+jEKgKsfZJWc1MnAcYrEkgE9dVLzsxby331/BfNPBYqFmRSnJDXKsCc
	xa4v8x4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT4C-000000059wH-1o5U;
	Thu, 14 May 2026 10:13:20 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT42-000000059mo-3dJy
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 10:13:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-83d31ac4017so3205807b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753590; x=1779358390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo+sSnnnw2cgQ7ZHbjxHFE6KPW/XWkxC49iilF+VEa4=;
        b=FPhjvyJAL3AcrtbYMU1zyuZOlPWSpU79w7XQqBExmwuVwuMmqcinhgq3kA5VV/pf4h
         FS/fl5cR9UiSrql4G9b//HxGsOJHXMU46vSqzHrlGRcIvsIlxLrSjct/vZgAOsEb68d5
         cNmQa4o/CltwSwRnoSLMT9jtLdA/XiYr/KBPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753590; x=1779358390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yo+sSnnnw2cgQ7ZHbjxHFE6KPW/XWkxC49iilF+VEa4=;
        b=ZD9dgCb6yC4HHYrm6YIhPPDwBCX0WxidH1Y3/0WsN+5nZKynwmPMtgO9b4yiK/3Xde
         74FwlVpn1SMMEuMirL+CVnHTVL/9zW3G1E41i78EAt3tM2uR3EzDJk0sINxofg7PpwGP
         pyrp60VNEHT9NenOYjoIRvVm+jOewvucKhANR2iqP6q5NOzyZoJ4QYO8MaQvAiFrlRfp
         f+7mQrs07b8AVBsgh/+QpQEPQULpOqG2guCAlXcrwbeAwF/rqLs8TfWz+F5a7JjK6GbW
         dWm4/0YtNNZX1YNniJ08J8hwr51P54NiSAT1gawW9csuVSzT8BTt7c97cf+jA6Q2F3dT
         zurA==
X-Forwarded-Encrypted: i=1; AFNElJ8KUWQWDDbNFm7tDwX+AeEcFWu20IXYr3r/lojOkEMIAUJBT4TpvuQGM3C82KoAgZveT2coQ6Y4m+mXF/w+iw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnh8kqXvoVCpJy6qV63fVjapxWXfSeuQ61IVF0HkmfbjuYArT3
	vD/534dE4vKXaKMzZcrb+Ui0R0tVzGIO3Dyu4HaPETh3C0ayGFamrgbtG++P60N77A==
X-Gm-Gg: Acq92OF9IguEiUOFX0513TuPRrg/41pT49H5O6wY6RorxP3XEdHqPKmdnhowGkNyxHx
	K9AIxSg4owcuBvnJ8y0law7hv4IygW5Ey4JudrxsJlj+zIVLV4ERySvYehI+X1qIXJuKB7McEIc
	kMksZEp9NSYJEfwH7IA7QFTipV5PNubWQEF3WoBEiYmXn8Z3pnrEKw1pAqSCy3TOhtMU6CSh0tZ
	hIR/CT37F6rLxeh6/OT51ig6GeGCKKLOQXYJMEPqL/IkGyCIaChCy45vMzhRQyslmP+W2AtIXFW
	IOccikkS5JNq3onwQ/6r28MMPsgfnKOVPPG1uv48KzUL3Acg7o25U1BllN2tIVpRxD6IYH+AeFp
	wofBLsOx63JONF182ILwvO/l3gkzJXrRHAWfdWbSeXoBu3FzcKJPwyzfhTUtJpjT0wJ+U+L/KGM
	ymQwTqS4wzQibS7pgUcHnp8bBAoLQkivFbALGouHv/mA7vUr2Oa+z58nDjfGf7D1K6S/C3ecPxz
	TXgw29Q
X-Received: by 2002:a05:6a00:3990:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-83f05bec752mr7365461b3a.45.1778753589741;
        Thu, 14 May 2026 03:13:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8195-cherry: Fix names for EC controlled regulators
Date: Thu, 14 May 2026 18:12:51 +0800
Message-ID: <20260514101254.2749300-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031310_912740_BD1669F0 
X-CRM114-Status: GOOD (  11.57  )
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

The names currently given to the EC controlled regulators do not match
what is used in the hardware design.

Fix the names and the labels.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ca2bb367ee68..538c46ada32b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -717,8 +717,8 @@ &mmc1 {
 	pinctrl-1 = <&mmc1_pins_default>;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
-	vmmc-supply = <&mt_pmic_vmch_ldo_reg>;
-	vqmmc-supply = <&mt_pmic_vmc_ldo_reg>;
+	vmmc-supply = <&pp3000_sd>;
+	vqmmc-supply = <&pp3000_vmc_pmu>;
 };
 
 &mt6359codec {
@@ -1436,19 +1436,19 @@ i2c_tunnel: i2c-tunnel {
 			#size-cells = <0>;
 		};
 
-		mt_pmic_vmc_ldo_reg: regulator@0 {
+		pp3000_vmc_pmu: regulator@0 {
 			compatible = "google,cros-ec-regulator";
 			reg = <0>;
-			regulator-name = "mt_pmic_vmc_ldo";
+			regulator-name = "pp3000_vmc_pmu";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <3600000>;
 			vin-supply = <&pp4200_z2>;
 		};
 
-		mt_pmic_vmch_ldo_reg: regulator@1 {
+		pp3000_sd: regulator@1 {
 			compatible = "google,cros-ec-regulator";
 			reg = <1>;
-			regulator-name = "mt_pmic_vmch_ldo";
+			regulator-name = "pp3000_sd";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <3600000>;
 			vin-supply = <&pp4200_z2>;
-- 
2.54.0.563.g4f69b47b94-goog


