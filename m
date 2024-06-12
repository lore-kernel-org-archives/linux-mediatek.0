Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D458CC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfH51kBtOmvN/SbHgLsWaCNr0Bu/Fg6um6oRQlR7oHY=; b=rDPucpeR5SoErUhRz6Y3koJp4b
	NuKseS1XkynxNrJl2m8MMzfMYsgNFwO6QdCIpeaWnIJ8q86pF99z3OS6CKv7PFsjJ7jEZMH8QrcZw
	vbM81yDsuy4RLB1XTl9lXDvDP9+eC1G/CdBhn4PZHian1tm373820z3v0wxUfg0+md4qhA4Kwa1/D
	xZAqfT6t9Uc7Zs0lpXozjWHWuvfnmXyTInVpCTPACEKE2WKarYfapw8fYA0GPQ3hWA0IF38YgExA4
	ETv6uB6tU1Awhkpy6WftB75ZyEdKo8BlP3dg/3cydepJT+Sg0u3TUBX9dcZ6/roUtUxOYlxU8BbtI
	qh51ZAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKDf-0000000BxnP-1HeM;
	Wed, 12 Jun 2024 09:24:39 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKDY-0000000BxiU-0n9R
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jun 2024 09:24:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52c8ddc2b29so2529970e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 02:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718184270; x=1718789070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfH51kBtOmvN/SbHgLsWaCNr0Bu/Fg6um6oRQlR7oHY=;
        b=XC214CI2+kEz6ZjGLMUXxcvmPaxCXE88H3GAfx8l12BxKJRQnJGMOg4jtH3t2ao9XK
         MU1eqyv6S0zmHioSFmTmZQeo9sXsu+Csl2GLUStdcGaorpqALz2txKp/0wpNug9LlM/F
         8firgQBR5/iUoc9EnCQe51uUy/DlG5Q3fcU99wQEXBRmWwY9D4E+/0lV4nQRUVWlI/17
         0p148PiwhZC/u9gOzDie0/SSI9LAuV/pzYPsbxQkHuIcWmvIdCjbgCEDpRDDR4+0TEv8
         OBMkzkoXpZ5lU7pGhDwm/qRcnB6TkiCckAhwc7fonyjSkGXSnuiT3apo30ovT1nZoVKD
         vJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184270; x=1718789070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfH51kBtOmvN/SbHgLsWaCNr0Bu/Fg6um6oRQlR7oHY=;
        b=UgJxRJ0/wnTWEqI5DMlzXW37SjbbBO0KzDSHu8J4wm0wdOx2OMYpdHl10vRZ22fspD
         8msrVSG7SIBY04IIlzB8+JqMaM1VHQuIya9VTafKSThweYtnEXcK3c8ilKizchYBIi/+
         3jjPejM1sP+Ex5PTPJ515QgpvZLEt+wIWpM+kJeMvrmBuiTZ/XfcsS1coU/WoQpv6n0L
         lI9DIpWrPtliwZ7ZMedFzcHs2dPkjFD2aS74xaQa9+kIJIJAb12ydy6CQbZ99U7Ir+bA
         Eyk3+m1lIhVjI6cn4K4N10QuhV9VaAmugb4joXToQuTcCHBzC+3oJCduESLM9c53kHWi
         2Ibg==
X-Forwarded-Encrypted: i=1; AJvYcCU7k7/HQCFzFTWWcgeg+K8G+9BViNVAo26f+Yj62JU+uldjklxlzFxVRMmtEy3hkCeUSe1rFXNkMRXpbF061/EljyJiv7aD26L6NzqrGPnBoAay
X-Gm-Message-State: AOJu0Yy7Q+/Zbk4wpu4lkYoaRaBsdA61vFoZ15P6sBIsHDYJ7EMm/tZj
	bR0pprrBz/Gyydi9U2K4+Nhj1DmWAWbROznQs0Rnd6QZNA1BX/BDmwLFejSWx10=
X-Google-Smtp-Source: AGHT+IEF/QjW1JAYelI47//kT/YeUyUvmkw2ZBd8t575ZCaGqY/UKt62km1JBl3qUL4DuZNV4IphVA==
X-Received: by 2002:ac2:4341:0:b0:52c:8a15:3c01 with SMTP id 2adb3069b0e04-52c9a3dfab4mr923248e87.40.1718184269730;
        Wed, 12 Jun 2024 02:24:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c82faf1b7sm1623806e87.130.2024.06.12.02.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:24:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8173-elm: drop PMIC's syscon node
Date: Wed, 12 Jun 2024 11:24:21 +0200
Message-ID: <20240612092421.52917-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612092421.52917-1-krzysztof.kozlowski@linaro.org>
References: <20240612092421.52917-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_022432_412224_DE53CF5E 
X-CRM114-Status: GOOD (  10.25  )
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

According to AngeloGioacchino Del Regno, the syscon node in PMIC is
neither needed nor used.  It looks like a solution to expose some of the
registers of PMIC.

Drop it to solve also incorrect number of entries in the "reg" property
and fix dtbs_check warning:

  mt8173-elm.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long

Link: https://lore.kernel.org/all/671a4b1e-3d95-438c-beae-d967e0ad1c77@collabora.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Drop the node as suggested.
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 6d962d437e02..b4d85147b77b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1134,12 +1134,6 @@ mt6397_vibr_reg: ldo_vibr {
 		rtc: mt6397rtc {
 			compatible = "mediatek,mt6397-rtc";
 		};
-
-		syscfg_pctl_pmic: syscon@c000 {
-			compatible = "mediatek,mt6397-pctl-pmic-syscfg",
-				     "syscon";
-			reg = <0 0x0000c000 0 0x0108>;
-		};
 	};
 };
 
-- 
2.43.0


