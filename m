Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B029FC30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX94G3G6DNIVjmJouBvjfOrzcAghl2zsNWK4O0NrzTs=; b=t0shmOK8mu1XzXFCs1ZV+URvTn
	lVaWvuztS+rzzAHEJnr5SEGrK1FRcvlfOEx62BX49xf1N74kW1h4WMEwqnz/bGNt5dIRHmIndUG3X
	bYmDX+gsWQp1UFMQRRKjJOZQgIs2y91cr3nw15wVAxNtWaDmE1JAFbrmx+em6ErKo+OS6o+Csc4xV
	yD8tX98WLF78pOZebuCz9y5chhOYUu4twL3Sh96wDAfDkkTmDxz1OCaHmrFHa6tr/fYVJ0lHkM7fl
	iZzsr08l/+8kE+lK+RTImENGK4bZZMCKKc48yPtPxVlrZIkmQAy//pibgo7PJnpdyiXUqFSP2yQcg
	efCYCByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcp-0000000FWlx-12ur;
	Fri, 05 Jul 2024 09:53:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfbl-0000000FVxT-1uy6
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:04 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52ea2b6a9f5so1090631e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173120; x=1720777920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sX94G3G6DNIVjmJouBvjfOrzcAghl2zsNWK4O0NrzTs=;
        b=sdnqyHCh1zsIJkHGwJ0Ar0p00VXPpEvPUYYkrWJLsJxekEhgmrnOlaXKR/XBdDOc+p
         yQ4MsDe5Omni2+GBnwcwoF1TLImGYkz3SaV9wdRyP6nd6oKuRTkJNypd3mVUfcWbFQqE
         R+ReWBqZo7/kTcMIztBjgJNvrnDs6vHTdbXyfSNfcI84OsDRu2JPj1I5Q3KaMALyPzVK
         m6GAcU3YMNtyKXzC8aulIjV5fa+KwMb4/79zRawmGlnR5+x2ChdsSgz+zR+w+scazCWp
         6lsZOVKDK0UpbHMmtYA/nUwrXGL6hzbRnG7Sx6yKaT4UWowqOSUIZ8/ONphJijh01C0T
         5+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173120; x=1720777920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sX94G3G6DNIVjmJouBvjfOrzcAghl2zsNWK4O0NrzTs=;
        b=M6uBEYBUHnDg+QnCyr2KkAzvBOVCxjtgRLhVrKcI0gvqD8J5PwX1be3e9mqS0GV3GB
         yrUOFuetWxiLWy1pVL5fyH+3FDy2O0ED8hablmVxfamGtz+5VSJvDufysLz3I/Y3AyMV
         c/oZ7QAAP2YLyuBh/eZ945RXjcze3dyh9/GW5gt30qm2pSEqLJ++Jrrrz/T82yEBFllJ
         lAhDLePrMOGZMQEgymGHHf4UYsBTorBHFlf3RbnE6G3mTzkcdZZKLDb7I1nDMxyAUbc/
         acBHPjt6Q0+G5CxqjDuPjxluffSVc0Nszu0nJFPjippBo9jBu08tQozGQDTXmAebDO/1
         IYgg==
X-Forwarded-Encrypted: i=1; AJvYcCXg8/PsDrCbC/GL72qtJi3i61IU/NlXPtyWhhtsvaKNHfoMNT3di6FyN8nGliwcvgd5Kj8dg36tjFymZ5te5uAfaV7CzrWQDHr6DV9Ie5xGMRI6
X-Gm-Message-State: AOJu0Yzjtl0LyNvfhmZqXx6UTYlvwrnbUBk2Chk7gMXMjv1pP1mP0Hb5
	snIKBCK08m2cev9wOkcPaX2VxUJVsk7PGcm7R7HsOwkVJkGV3IRMhYRByHZk9uE=
X-Google-Smtp-Source: AGHT+IF+cdoYkQWC4AuXm4t1/MTS6fIyqRyTkQRHT2EwhR1xN1harUysDUC1D2zux95zBTvcXoiJEw==
X-Received: by 2002:a19:a412:0:b0:52c:d6d7:9dd0 with SMTP id 2adb3069b0e04-52ea06327a6mr2528352e87.20.1720173120019;
        Fri, 05 Jul 2024 02:52:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:51:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:22 +0200
Subject: [PATCH RESEND 03/22] dt-bindings: thermal:
 allwinner,sun8i-a83t-ths: reference thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-3-554061b52fbc@linaro.org>
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
 Vasily Khoruzhick <anarsoul@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=c0XiyTVpABMLT9+EMpR818Up3xsjTqaFTXr9Uw3kjSg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8ImyihnA5Unad+tgAIYwIL8zn4DXK/FwOQcP
 pn+9KtbW2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJgAKCRDBN2bmhouD
 14EDD/9R3GhWyejZrRKYg1VskD4rihePQWBSAL9MpEwdP8qSNWedYZoSCrTCGXDyr0I1UZn6dHg
 AgeF1KwhkQED5bKmFkL1afLfdppDN5zKG5O+6xzIVD0AeGk/1s6rTJY2g9Bx0nPJWT47/VJTNC+
 EK9SWoxfsHyZzyQgvWSrN1KNK6ZpSdiAXZ4qt8Hy2c/69v+0Ln5qsN/h9qk3AMmNk5p+Cx/begm
 zhnvKluexhqmwtfxuhuidO5gdpqNy75A6Kb3fhOvfhkhGScJGNGaWBKBz2zgA0Sa4ePQbnp5S4o
 AgBFMadaYYZa78grqVywbeV1niuDtPfcbWw/lMBFqGOThwzE1euxdDJaBhuj05wnuQSlU/FbwH4
 9SVWGF9srqBZlFmmd3khXFRFAa3ZCQjBvOx29bj4q+eMEEjiCBzsl4aNIwD16i8KhQbv1HOZt03
 gLUF2oN9bNl1+yk7c8HgruM88GLjaqpn0cBJmMf++N0OH5SWRADDU5beynVaZNp1VjD0Pgn5ieG
 TodWbk25QOMJHplaa3j5cb1lp4yDvPIUSZtdS6FenMOUhNTJ9OOrzp7hrz5+4qUjwYWemRPvb2v
 UypuFnk/8iRLrCcYdjPCZohp8CrIUuF63Dvr/44R1xef7oq8DTHeuavgg/wBWMSoHChyhnW9QbM
 OQOqu2vFEKib9Uw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025201_552365_13DE3B36 
X-CRM114-Status: UNSURE (   9.43  )
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

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 6b3aea6d73b0..dad8de900495 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -10,6 +10,8 @@ maintainers:
   - Vasily Khoruzhick <anarsoul@gmail.com>
   - Yangtao Li <tiny.windzz@gmail.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -55,7 +57,6 @@ properties:
     maxItems: 1
     description: phandle to device controlling temperate offset SYS_CFG register
 
-  # See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for details
   "#thermal-sensor-cells":
     enum:
       - 0
@@ -135,9 +136,8 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


