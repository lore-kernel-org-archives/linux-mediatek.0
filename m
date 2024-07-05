Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50739C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiKGCqGBEkNBKp19buJrLY0hlEyZbTBwZzmTA6yx1KQ=; b=mEPWLMwaS1+ovt6ok8phbumXz5
	gqroWnXhXVR5fD8ovC2fIjBbVJ5ZODepR7dg0fE+vQa8F7uiNadXy/XV/O1eVhkJ0pRzFWmD6KDf5
	AvGFHp5npfZWUgjGTvhyJNunY6vv0g+fF6GOr0Kwb5A6ivELt7oGJHcgsc8dW/mWCWGClgcXAjLhq
	BEprtg2cBLL4rnWCAtfeLfYs2LqnzRBTxdtZQdrdXTo/T+mcVEOgtRegqMsrO2s71LKxUYhFX7ydy
	qPHli8QKecYsbW3InTAVy9BOo7dxUW39hub2D3XGTJyPrbf+3THEF+KwoFEqc7tA3z4JinfgcVt/P
	Onc5JVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfhu-0000000FZli-3iC3;
	Fri, 05 Jul 2024 09:58:22 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcG-0000000FWRv-3yvw
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:40 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3678aa359b7so1608827f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173150; x=1720777950; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiKGCqGBEkNBKp19buJrLY0hlEyZbTBwZzmTA6yx1KQ=;
        b=a1F809p5aH1SLjn4jsbbgjArMwN7BN/3WEyZSzBL0tJ3jPrHqyIjIpXIrToSaGZQFG
         HpnxZJVUhTeBaeAM6Fd1U4F8qYqPMmTlAQSklRuZUQ/R+Gpo3wq6B2U9GrJrRjlfI8Le
         Wtuv0cRrqEZi0bl1LQyay9NZxka8ti5m0XIoV+DFIzl43M0lSXiCpi8lcTloq0+QyP5i
         tnyHZjNQ1PP26ge3Er3OSVvtpb1UjupA6TaTclSX5ioI6LOvRuM1To5hkwipraiDTlQ7
         96RKwtbwyPTPMTB8YFD4jsdhHakJI9Ltu0kq1VIqz0Mc7vHPJnljCFV0vqEh5ee6yosU
         UnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173150; x=1720777950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiKGCqGBEkNBKp19buJrLY0hlEyZbTBwZzmTA6yx1KQ=;
        b=oSvmHW98wUiwQ6U4yCpFWOY4uEUF35MJQUCeTwLjoQUKx/lpc5LvjDfR7w9vrQ11P6
         qPAnAAkd+P4dyT0OYDlQlc/rM86jgTVK7QBBw6nBZpQUzdl6SlQnA9JYWDUuguRKEVWP
         2S5z5WIUdfTU2B/Sd1+hMuLpogGT8HenaumExL8/8BxmwErmouyzgkluGpfktbjYknjm
         tpPy182jjP3FtlaOvpLxejZonnswcEupwpVL3x/ERko7UYCR9TBEITRU8IpAmh1E0l3j
         xQXpa/tI3YaUxXvq3+4qKkfCCfYQ0zk3xgitUoiC8yz1xf7Nis0br+vvd7nxHYKJ08mr
         nF1A==
X-Forwarded-Encrypted: i=1; AJvYcCWhwOpa+rWOGuOY2ONMo8XjycmGbpNT+kjiKMBO/02GW6bjrJ1s/ke2VN5ryG8qw7C8uiR+kntnvDgKEkPfba+BT06iszs7YSMRbeqpdu5k9RUT
X-Gm-Message-State: AOJu0YyQDbe/k4aiXykHl+tQTJzjQZaHOI0zaXxOVyCe2HTjrnUnNavm
	PC838SngY4t7MKX0r4WoWTvnov9iZ/ky0yE/juSevIk+NmbQ98vSoueiImjcRmk=
X-Google-Smtp-Source: AGHT+IHYmG0y89BYUT8vEw/rPou2Wxrzc7MA979LcnMLM0W/oRZ4IEsDq5fGw3QaLxwUE+6DoRA6Ww==
X-Received: by 2002:adf:e58f:0:b0:367:9048:e952 with SMTP id ffacd0b85a97d-3679f6facc0mr3592566f8f.18.1720173150478;
        Fri, 05 Jul 2024 02:52:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:39 +0200
Subject: [PATCH RESEND 20/22] dt-bindings: thermal: ti,j72xx: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-20-554061b52fbc@linaro.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=v96r53csGO3DPv4xrCAiMuQ7NW/XqKvoTR8Ezj66dsU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8I1/z6BRU3/RDJC8Xbgcy2VEpXbmcaRH/gDq
 mIkZ8QIRNmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCNQAKCRDBN2bmhouD
 1/uvD/wJadFN1GRpR1hWwHsbh4K+sDkAXduqOrxZRwcvlwLx17tZOnFby7jQRrbipfXERDlCFs/
 xZH7zWloJNAdi8CwbPcj+jYiSEeD9teFqhChIlLshTIvmfJ8tR4MJWizEr+koIoe2XXG4Io9WJ9
 6LwU443JAlf5eR+5jr3Q0LmzluMIglz70AhUYgLdZWm3lDmMdSAgCs3fnrCG8HqkHIuzePig2JL
 h+JIfqND6tjmDd6p7D6h7lOBgWErIE5a0gAzsCaxYK1aL4acUMhb4zefZ3N8Xe+I3SCR0D4jVLC
 JDINEcyIleVM9VRFQsPpqLvENvzTEsptt4dsfvcvwrvt2CqEgpmUaj1rhl7hXQ4ss7LNxOn1qIe
 NQxV1w67W++8F+D4TlFCwBrjbWLlz6JnrqP942DTNoNuZX59saIH+rNuCjHpt7vDMQ/v2e54SoQ
 UpuujUAMAwf6zCozSGEDTsNhTtFoE3M9aPhDQ8P+4iR1OQjwmMu4pYGDowh9CvP3YZOMjKW/MRO
 JpMxOWAKWnHbsfoWCVQjeInjQF+R5HhgEl57whHYOpjKIGypZxg0ECn3+gAMtanY2Q7S8uIkydY
 Gr950r9HZz/kfCG0CLZYzavj2qhZKkiJbOzLkA7TwfkRJ3cHx2wkHAEpDbilcOjGzdSj+EZflX8
 awhUAdm5Ubnrr8g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025233_546770_F04F3044 
X-CRM114-Status: UNSURE (   9.50  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
index 171b3622ed84..82b77b9795a3 100644
--- a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
@@ -22,6 +22,8 @@ description: |
   Temp(C) = (-9.2627e-12) * x^4 + (6.0373e-08) * x^3 + \
             (-1.7058e-04) * x^2 + (3.2512e-01) * x   + (-4.9003e+01)
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -64,9 +66,8 @@ required:
   - compatible
   - reg
   - power-domains
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


