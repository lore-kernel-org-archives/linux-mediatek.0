Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7E5C3271F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8COq06alpIOkksMoTKi/tXV/R1PC4Z5hewvoLdmduzg=; b=T/+5pIB+5QxWHKDJXr2Ygh+/+K
	bm+e+mtRe06a3zC4PH2xhs4G74PgM+temExkbA+E7cGx1SlRwOMvhFJdeEW1041AG0JAj2rfvvhIx
	gRq+tgGAvnKdbjyKIShUwJ1e0M6UJfee1NRdIzFp9sOVKbxaESHkNjZImukC/YbR1Wgca6LhuUxRB
	8FFdPTVdszAZPj5F5OtKhPY39k8C20ajKIDOM3QJgIOvML9gRrEHYo7SCjW2Bun6uXMtpgUKUNT7O
	G69gPCYijiobKv4vbqUz7R0G6kTfWr+6t5bVlk5Hn3s8F+ZRdEGLhnGislcV/FxSnbJJCYK2euXae
	rhDNWL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfco-0000000FWlW-3o1y;
	Fri, 05 Jul 2024 09:53:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfbj-0000000FVvt-3puK
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-426515dc59fso3098565e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173118; x=1720777918; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8COq06alpIOkksMoTKi/tXV/R1PC4Z5hewvoLdmduzg=;
        b=LxHPLa1Pz7U0OPa6X+93gGujwxRs6l2GIsgXNg8Z37fcxGJ13LcKbtFeTbiL1wx8TS
         H5Jy6zdu429C9X8QbfZqy0OOpyEREYv/43PHs/vVjZyaqzdncgnTin7PRptg3ewekVjM
         hW6r013W/ut3ec5a5a3Hsv/f2CIPfKL5C9a2r6m+E04QB9b0QEZVVaxMXIFZWJRrmSIL
         woV551coAxxtuQSvwZdLu6aTPbMlaiYnO8FK10ita/D8TgKANISgX20ivJ66poZjQPsE
         dyGg1F/pCqclNRL+sqhcLa8zn0/aIWxB/eJegxsxBK+MYJaPyKY/q+/ipFEogc/jXqNm
         7MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173118; x=1720777918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8COq06alpIOkksMoTKi/tXV/R1PC4Z5hewvoLdmduzg=;
        b=g2+Mju7qRubkmHKncLfwrhXu+7tssPfCoxqmZg1w6DLShP10zpykF+AEhtioOeaVAS
         0TIC2ULBA+7419x+8pzq1giLfzeH1ftYz4g4p5cs5IBCHLnGVWmfUNEG9Am1LlSlTKHo
         DER81cHyBBZuncgDM+UkFOmAD5e8PxfytsRiiiPJvbTDbJV6cUmUC7UiJDg9k2wF2TA+
         lR2JZvBQ1nwvPZYPH38OCH2PM+G4EvG17iuG5Sa0PyXTB/nxiZoxtlDMOk5iNoz2EgPw
         66aHC/z/m02IUEU4FyaifucWw2+QJvWyVwyiPWTYl8lHp/VkhBUs/WyMM+o3h6K27IlS
         Th2g==
X-Forwarded-Encrypted: i=1; AJvYcCVS9Zi8ZbhnPGGDKfjGVpiQ6RVCZyYvVFyqwZAhKfmOJwfD+Dpbn0OTEoB1Gkqrj9s8aEDs2o54ayebWeuAHrQSbHxKbIgXmIdzEBJUE4DJMd3A
X-Gm-Message-State: AOJu0YxMcQb0jeKq/kNK5USLaTwJlybeRiqG0YWxpRkS6cLxwfQ2wQnZ
	KzFxyEYJYSGBp35u0M/GgDOvL5hVPUV7dl5MsJsB4TT1xfhZFDa5L+udanOF9t8=
X-Google-Smtp-Source: AGHT+IG1gRQHdpu2sW5QFoF1LniSXRvboVCxaOleTK3xsQy/rvilU/vtH+YKOuVGHfgb67tw64B23Q==
X-Received: by 2002:a05:600c:4ca8:b0:426:51d1:63c3 with SMTP id 5b1f17b1804b1-42651d16511mr8916535e9.38.1720173118303;
        Fri, 05 Jul 2024 02:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:51:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:21 +0200
Subject: [PATCH RESEND 02/22] dt-bindings: thermal: amlogic: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-2-554061b52fbc@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LeSP685Kq7VRSSmr0/04GPkxgxhjYf+AaH4Aoa6qJmw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IlkQpQruYXCBJmeLjrsSCjy/A96oZulHmNT
 BgmKyLiQHmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJQAKCRDBN2bmhouD
 1ynkD/9TX/+loWJbQv5z+n7E0oNbl34ziXNPnnRwtmKBF+YXd72Utz+bdkjnSJutW6EqAh4i0BA
 MyGzrk7k8ABIGMvBwk8+5HQSlCAsjsRRNaMieuxVnqXzhgfaZlfvUsIyN57KSUpzGmm0xYZYW1O
 TwabUrxmDq49lNhaL1soSHAaKezV8cw8ZjHtnC+6NKewpbW39+ipivJIpNxvTdoMvccHUHadlIO
 IvgdAAL1dGmGkmkl6ARHXH3Agj619JOixf/ylFr965+UxEYWNp1RmeZIVfgAwCA/3LKf7sXSDmP
 PwKgo03lc3yyH74EdnS4hYtIBaZ6OG0jYx6A0W023nSkAmcDxYgAGRnNjKPbEvfEu8fQvOvjrBU
 YUO6B49ZU20YmCkr4fxDJdsEJIDr1aBRhTlf8ek6gwtXqxT35oFEXJVXFa4poX43FH6Oi2PO93m
 w0WE2laiwoSf7AvQtogVWJMfoHY0RNX0lE10j1CoYbz87yVdLjVg0BDNpby3/IUzXrpR9ZfkyqO
 WoFoOk2/daib50kAEnVw/D1FldDWwdUJ5PgCrnJVzAv9FXsKCYFIT9CKQkIu5tueI6e56YOLSrm
 d63rcP+UdVMKyrt1Fj9g67/8DyDGtZOMEn6oUAr+rgqb7HnNpqeGWljv/daZcqYKRwNqJ5cfDjw
 g5lf3f3ssrwlG0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025200_187820_B7EBA16D 
X-CRM114-Status: UNSURE (   8.97  )
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

Device is a thermal sensor and all in-tree DTS provide
'#thermal-sensor-cells', so reference the thermal-sensor.yaml to
simplify it, bring the common definition of '#thermal-sensor-cells'
property and require it.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Guillaume LA ROQUE <glaroque@baylibre.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 01fccdfc4178..e52fc40e215d 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
 
 description: Binding for Amlogic Thermal
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -44,7 +46,7 @@ required:
   - clocks
   - amlogic,ao-secure
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


