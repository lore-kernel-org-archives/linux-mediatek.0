Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22A6C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSkEeXERWLNSk941iK/O66Z7is4lgvPwTjaN4ljEkCs=; b=BjCTr+z6d6gio9nUvh2eEb8X9M
	i9vyTTo5nzOX6lcMs0mi5CV456X5CrXOyjXola/75nB745UmMBV3fIq6R+xaDhRtw0C5PgJIhks8q
	b7Bol0xE+vr1vMpjlIZLHEH+EkfjtFxDHoxDSeAA4464Slv89CaiwgM9M1R6jtAKoQj5zyMSk5oMc
	cw0V+Rs3zq6hS6TQzsRd0P27dHwNvhRdtBeaS5GqzcmwbPmdeXe+mDOw4o2c4OQCT0oP93B6fDnq4
	mpkrwIZUTiVHbnkFFOulZP/exkkj1ndwThijZLIwxG/kjvTKOZhxOOBGqOl/VinqWUgVKe0ORWpGS
	ZUI6P/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfew-0000000FY18-1PjY;
	Fri, 05 Jul 2024 09:55:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfbx-0000000FW95-3h4l
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4256eec963eso9700835e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173132; x=1720777932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSkEeXERWLNSk941iK/O66Z7is4lgvPwTjaN4ljEkCs=;
        b=r/ZPC19V3EYZxSDvHQlzDKN5n9YSUSpYssRK2XuoV6pAtAj4Dbk0crvCOnQbGBJkpk
         BTxnMs3J/tyXf4Nzt7w4XkTwxzpZ7SP/AtPn3G7iiU5zbF6hCojv7khmOEyqBcNF9DW0
         HolOIAZsKn+1fB2w3nQK8i8L8cniNWbwcudITf/OtZ7LYog82uQ/V6l21Wts5CFchIFP
         RhwMkzF2Q07EnKW4rPP64zSWERGNRktgm6xNuYFVw7HFqLupjFZeb7wjDF3GL/oMgvJ+
         k9X9qSaZHzefK+jLOCmg1mcCOE29xAzRp4Hb5ja1C76kQJP2Y2sGCt/gsqONhKTHN5w4
         icVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173132; x=1720777932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSkEeXERWLNSk941iK/O66Z7is4lgvPwTjaN4ljEkCs=;
        b=gHKk8Z/DY9X1YvYvtkBt2K2sgi027mSIEaIlL7SFTpg+w3H/+UHIn4UgO/mfCMP8y/
         3gsigVhHqwGWRPsB1/pGMHbTUQ9JRMbjZgp9/gQO7O3Y6eecuSCWKI97Dk1fXmlhO8Sz
         3NcO5tXxHnuowfrp9jSBntaRJqeYxlozDv7o9/zh+emKRIR5GRFnLo/Snj2SS/IFBKDf
         NoGkoseb+VgHjraVQF0Xvmftcyaqtfmy1GlM+OHepqUxIeVi/TSkk05kb8y1pN5ClbWJ
         ibjK2c4OXQqIvQJCPscY2KNcXZx+jM8VhUEhF1LkveKREY9GEMbDHA2c5vOsNKxWBxgU
         Uz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvX4EHZdE+hommzDyFsA0I7zqlFsMAdJrb76/n66pUxYp1GSeGpgDokxKGNHr/xV4jxyBsHmpj684Tr2gjmM3TnbMuALNM030TzhbxjEfiIhfp
X-Gm-Message-State: AOJu0YyVZSgnubiAZuVH6efHPth/nkvhRZa38lhBVkhbw3SyXQHARI+4
	fagE9ZZWM9id1qF27AUZLE9L1ovw6CP1rQbh5bxeIpn95qbOfJqN3WSXq1VMNdk=
X-Google-Smtp-Source: AGHT+IGkEaOGS3SEXQ2doYjoak+87kIZOp+NhiPnICsEeJe+OnkfTqVvU7x0phLNiFA/Cnmkm/jPpQ==
X-Received: by 2002:a7b:cd05:0:b0:425:7c29:7480 with SMTP id 5b1f17b1804b1-4264a48cb74mr33010955e9.38.1720173132598;
        Fri, 05 Jul 2024 02:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:29 +0200
Subject: [PATCH RESEND 10/22] dt-bindings: thermal: qcom-spmi-adc-tm5:
 reference thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-10-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nsdQLuN+SQydv/zvdmA4FzqEJl/eMf90B93Xt2y2vFI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Is5nr18957M3S5EaFoQLgXcr0SMWBi7Ve0P
 mBnPLk+fdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLAAKCRDBN2bmhouD
 153BD/9X2T5QDXnPLqN8Gj/7SoVTWByJdN1lmjyIS2Hn9aXBhpXIgaARl93vDJP44E1LktOdGEr
 uNrptTktREtD52QtzNPMfBICj4LoiDlGNnajUM0eaP5UQgVM6thw7ho3mUkJM0Lh5YJKbxlpxKQ
 AzQFA3TPII6BhbFTLMMs+shIkI3PGMD7SSs4koEk6SI3BjThUeHqiZwPfKfpTW+K9f+CjXQ5O8d
 grI3ChmVLvxJdL63sbWOIVqrSHaQysCArD8TYdznl/qsnPXcNE/4AGsnYb9y9Ku39ftH7O3+2yE
 Et3LxCpzwfsD9fNL5bJslIFnBZoT6t6YQUBYM+npfEtATLmtmFG9vl/QpojEyaGttF3LApp7ZWJ
 XXQatmPnIiq71nGTMFZkoXVmdcRUvJfnNfwXwG3XXwtQpWjQ2ivFAo9EXmB+DmX0YGioiMwJn1l
 2LrG2ricYNcfYIgjsbEYpAT6q1DKm07JO4LAWHm2vXHj7kz2dZZ5dJbYWjlpE+4yXCvkn7tOasf
 BKfNaHHwTEb/biqkgpXZ97JpdyT7GJ6mNAB3Yu49N9uF6DiSg4EhB5C8D0uW05lPHSpZoOyXDje
 cHcvcqnUcgcuZ0hFlyfT0RxWJ5r/bJ4VAbZBM+fM1fKktjUniAZQnjl5B+8JM3CxFabmecjYyT9
 QEtxnJkZLgEptOQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025214_238097_EAAAC4ED 
X-CRM114-Status: UNSURE (   9.32  )
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

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
index d9d2657287cb..4470a5942fb2 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
@@ -8,6 +8,8 @@ title: Qualcomm's SPMI PMIC ADC Thermal Monitoring
 maintainers:
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -23,9 +25,6 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
   "#address-cells":
     const: 1
@@ -159,9 +158,8 @@ required:
   - interrupts
   - "#address-cells"
   - "#size-cells"
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


