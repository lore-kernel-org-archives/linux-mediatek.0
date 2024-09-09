Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF97ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebiwwBtqKdnptnl4wd8GBFDK3ZgfnRMWFyATVPqygk8=; b=PDcrfkqKg9/VeW17NRLwggKAS5
	GXwR0TLvhLI4D+07jikF9nSLZjueuZgDLamFA7JjYVs8NH1bWTCdI+ZJh8MDzEoanOWJhIff9r2rA
	qA3VFCGNEE3ILQQw4ADZ49VV+v8AbVzUuvodHzW4O6gHGAPqk3mGbxJ6Mk90aF4EiMbKMjHzBzP8Q
	1CP9FGq87sKbcRM8lp7vDfUXR+iOxIvItmLNwxLkw+ya7dWyb7c4a+gZnZpH1Bd9rHx22yfIO5KMV
	jizKFpvWLbCmdsW8KUjC1uDTzyq6l/JH6hkFkPhbzWaIOuqTLCX18/N7S7yg16b6Fc2s1OxgmAL2L
	nWM6c28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snetI-00000002AEw-3DKI;
	Mon, 09 Sep 2024 13:57:16 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneo0-000000028bL-1MHr
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:49 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a8d302b6b30so8521266b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889906; x=1726494706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebiwwBtqKdnptnl4wd8GBFDK3ZgfnRMWFyATVPqygk8=;
        b=srtHJoPlUTp37GGE8P44Gcl0ThgycR9uk2zrRSsvvNRzA+rjaritbULa2VsrToDoxq
         UW5YkctN9wvQiukmLUdWY8J7xwtbxJQTUqaX2kU+9lu6bzucFtBqU94VFmWtaVQFT3Oi
         gNJSvsqdLvKqHQ9VawvdoFpeBHMIA2lTD2fUxmv0INJ9KJDxZAhWV6fJzUuU3soZrJoR
         VcHfYx4zxW3sxx3xJSmrl7ABjzYzLzWafW5gYLGW7Cyp5fFoWWDpSYVYs3jEqNn2wwXj
         J6WtqW+58yL0YHBPc88tUu22HHzk70xR8PiHFAnzwLSzgedKKYr/PHz7tE7ejVTNsyda
         D5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889906; x=1726494706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebiwwBtqKdnptnl4wd8GBFDK3ZgfnRMWFyATVPqygk8=;
        b=S5VXwedtG5CgzjJ47ofiCUSp9jxBNrrpQX1zMRSIDHwZXtw/voMcr/TudwNKPZ+7lJ
         NGVSkid0JM2oDvRatQ3yzVfrWTB2agRZmSzworvwzokUDLAeNiwKox8VwfDIfRqjN8Hc
         dOFuxBWf0b9gF+0d8yqxx0INfErTEHEKBJtMDrfgY+1HIlWRW2W2d38qhD5YSkkc/N0e
         084616JRlm2BThO0gpSQ45yeBCOu3dq9iYMn7nW1TrItFoHUPC0xb2yBF5INYLgqwozS
         mCSNVDK5dLWoMT+dxT+XISNDRRU49gTHPdc7TjwN8O6ZVVxamfMKRgXkH+1Aa4xQjIy7
         TLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsWj+2Gmz/8VC09wv4Ie1+35BjIf0P7dchAMt90uu2qJtYH85NLS/T+YbEtqM0LjMOhPpcLjQNHPRE8oZ5Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBipN5guACFXDU+ZnBzlc0BdvFHW8DxvYgYZdjGpzJSicNrlYo
	xZGq9JiUd93+Ri+HW+lY4dtvOC10Nab49T/E1iivPtlcty607z9gihcSOLIfTaM=
X-Google-Smtp-Source: AGHT+IHitMS1cWRj6WUaeP05stoqvUkgN1+30cQ8Qjo2wMMatVr+SQ+ogFBaSLtp79Pcj8lputkU3w==
X-Received: by 2002:a17:907:3da7:b0:a8a:81ec:f731 with SMTP id a640c23a62f3a-a8a885c3265mr378363266b.2.1725889905496;
        Mon, 09 Sep 2024 06:51:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:16 +0200
Subject: [PATCH 05/17] regulator: da9211: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-5-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qvFB37UNy0FXUjxrG9GIJ3EDRLNkuyXGb5mp950Q39M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1cXH5mO890K3vAeJUuv0AtSmRWejCS85Vei
 fX3f8LzbhCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79XAAKCRDBN2bmhouD
 11ChD/4yh9ctCFV0lMqYOZv20i4KdgYa2NLHUN4pjlhvUeE7bNRx3gvPpT3oVHy6TYPDGYd5xo3
 qjMOhlaWM98n4j3kvYr2n4bj+STEKZbYNUGMiSvU/lGDNdaGlcMDA41KdZS2+dtZPIXiYXTXoy4
 /XrGKA5vm9X/3c1vlsz1D4SnBOFXPARuDCy0e0zAa21CsIe3ymWRvgkWPPJSDNewvsrYGT/+n8p
 luKgHx2DD/MLwnhTHKNCVJ4ZoGW/Ze2TO4/2MVkHu8KoXY0Oza+VL2cjhcDxfrQJiuegsVR7pjE
 pYOLDyEJ/13cTDHX4CEjygyGVrVPolQOJuG0LDOd75YSZMTpsNLxb7A5o+/pkKzT6+23qHWSOsF
 F9ELpIwY6vQyXC8KxYXtgaePWfY9pJIWkXfYEX7+OM9U2yu0Tf/DYoYCpd8RLqyI0YChNH73f/Y
 7GM5HG1jaUjTcqDnKB1AK14fBS9qyMZOSiAtykpZEWGBAuV5jhBKo7APsx0Qf3XkXQWgRx07qyy
 +xlJz1udRGESQ79PA8s7uWN6tyGr+pVk/qfIhnSQYt4c3K4hcFFBXoiHwbNVRvaVU65qpe8uL64
 nwtioO7ua6RiqxYui6Yc/8tCc9hGvBoC+DgR8RYhkAsvp5qYbsP0GYjBvYtKMeNqtXkGMc3hUe1
 MI4gi9DFb78nIkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065148_387925_FEFC211B 
X-CRM114-Status: GOOD (  11.39  )
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

Driver does not modify static data with regulator description (struct
regulator_desc), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/da9211-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
index d8b39ea3de0e..d4f14d7ea8cf 100644
--- a/drivers/regulator/da9211-regulator.c
+++ b/drivers/regulator/da9211-regulator.c
@@ -264,7 +264,7 @@ static const struct regulator_ops da9211_buck_ops = {
 	.of_map_mode = da9211_map_buck_mode,\
 }
 
-static struct regulator_desc da9211_regulators[] = {
+static const struct regulator_desc da9211_regulators[] = {
 	DA9211_BUCK(BUCKA),
 	DA9211_BUCK(BUCKB),
 };

-- 
2.43.0


