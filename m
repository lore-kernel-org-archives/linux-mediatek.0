Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B691BC27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVq/XPrdWmMMBpDrtjBL0lbuC27j39fwjqCGgq7/OIc=; b=W2/KieAoCjCWT1T2WTFNQjq6KR
	uEkXGuSSHxkPccbhlmhhjKAuvb4Vf9Ja6IcXsJU+FKrC0MTEzlk0bNCFwt5AIe49V1avz9Py/ZAKM
	iAPY8yOr+NT/gmOGdisqhtssvk28xEH3ZzcrOdPqAxY7CblF4OvJBwlq9sepJ3S4k5hbPiF3InSXu
	jAM5eNVgVTNUN5HtnU/B4noF0oPg77vOPxCQePBTsU+jIhVVtbJkg5VjDSt/Jahv7vHqPoY58t9tp
	kRGM7AD8hkU2j6cj/1jvWGMMIq36Pb6DHmZVPfxLsAL0522xfr64sS/yyAB+vL9ID0Y22wrhGszrL
	VZtyLaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKDa-0000000BxkU-10jl;
	Wed, 12 Jun 2024 09:24:34 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKDV-0000000Bxh2-1Ivd
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jun 2024 09:24:31 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52bc3130ae6so5081848e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718184268; x=1718789068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVq/XPrdWmMMBpDrtjBL0lbuC27j39fwjqCGgq7/OIc=;
        b=Ym+l2+XqIyK+mIrWR3N+tEnpq+rZsQ/AOheAGF6uthSIHSZ5RG+HcRtuBaud0VOlYW
         s73/TeZhxy8BD5jtBRoUfERkXt+N6byodM8l5CflidyhnNBZn33e6jiwjqkK7Sl3zp47
         xOBTqipmyOmZSxmF9/guxg8YjAOxMSIRXGuCotRKFaE7wonOv3AnSlt3hND9vsqI0GrG
         AGdVEnSur+bDsuhfDk+i4xpYUxYES0TjFckTdJwIeKB7c1PNtaITZjG26MMERG90BnYD
         zRcUyB/V34W7D2I5VMqyir/yLWSF+tI+WeqDb7WRN3oCwZw2iVuhEc1ksqI8xpnwOlTi
         czKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184268; x=1718789068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVq/XPrdWmMMBpDrtjBL0lbuC27j39fwjqCGgq7/OIc=;
        b=cyT2qbnl//m0poJQiu6nd5t5jRygNiMi6raozipC5kk6SAl8CbtOP4CuU+D2Yx+kus
         H+0GFdh1kXaqmKzJXSBBmfmFds0S+GX7L6ROwlrSj21vpY6IC95q+saVw6zHAA4lxDYe
         C5xfQaWAo0/vwT7zpkgNlOFPtx5KVak06SY06NBV9Z/dHttjPwwkWgiWsU7KE0SrF6+C
         POEV4QiSIIM7afOPH/zSwqwPA9dwAI6/7bZtWnFYOQ3UlADJGVqg9BpPGM0hPRjiF3mb
         PVH81jejOJdDOUg2RDkHNE3bhkRkwKNA4SclXGMO26JqL8IqX8TRvGJHz6U9pskaljQ/
         mDdg==
X-Forwarded-Encrypted: i=1; AJvYcCUzjZSdlFnpukoouAciURkfEuHEHtjqv5e84VBHu/M3duZTH1qslFTfZsnLumyQAIV6q4h04ZITe+Ssqv2g7ZHkKlo0kLAEuNVFAh8Uf3cM9btt
X-Gm-Message-State: AOJu0YwZvVOE+RIWax/S4uy4oSccmWz5Ahz7akoNIQ2HUQY/LKiVOm13
	0reCziAqYDset1qChFes0v7K59D4jvsf1a3oFyK4Wu72IV7IjJDWKqGHakNDybw=
X-Google-Smtp-Source: AGHT+IEfFP6e6pTW+1khTsjjkkVQ9dhYQOSP5hhhyY4gGwO6/jsKLIdG1CzNbeFE/N/FoWTmcrjwPw==
X-Received: by 2002:a05:6512:401c:b0:52c:910b:9c87 with SMTP id 2adb3069b0e04-52c9a3df0f2mr896236e87.36.1718184267973;
        Wed, 12 Jun 2024 02:24:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c82faf1b7sm1623806e87.130.2024.06.12.02.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:24:27 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
Date: Wed, 12 Jun 2024 11:24:20 +0200
Message-ID: <20240612092421.52917-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612092421.52917-1-krzysztof.kozlowski@linaro.org>
References: <20240612092421.52917-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_022429_370803_0938E68E 
X-CRM114-Status: GOOD (  11.50  )
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

SoCs should use dedicated compatibles for each of their syscon nodes to
precisely describe the block.  Using an incorrect compatible does not
allow to properly match/validate children of the syscon device.  Replace
SYSCFG compatible, which does not have children, with a new dedicated
one for SCPSYS block.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Tags
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 455c2ae3b30a..eb449bfa8803 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -300,7 +300,7 @@ syscfg_pctl: syscfg-pctl@10005000 {
 		};
 
 		scpsys: syscon@10006000 {
-			compatible = "mediatek,mt8365-syscfg", "syscon", "simple-mfd";
+			compatible = "mediatek,mt8365-scpsys", "syscon", "simple-mfd";
 			reg = <0 0x10006000 0 0x1000>;
 
 			/* System Power Manager */
-- 
2.43.0


