Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7D3C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MU2D03rBymimeEThachF3vpMLpUyintAFPPxBkkYiN8=; b=heVM8y3lBiT38R3urtkFgP61Z6
	1qQGniCaebgVNIRDn86YB4ZU8hU9qZz5Sb7zbxtz74JIWxokIUqWlN+3JNuXhjm+9YH4tmmip+W/8
	9gNB5+D7UNfH+De0UW+UQYW8PhZkiGNLutVbzW6ISF9jnRQruBQuatt7KbSmGOXv9Ayj8SXHtDK+8
	x5T4pEjy+lu5GTvExvmCF91nGKHSU+YZlFQn/6UcHT415kE3VjBZ++EEXEDBTXNuaIBByIQYt6SEU
	CO4u7UWuHEYWBO9R6eHkqN+TFsO39lqkrCt4Tc9xPWDnNiDfbg5CdwgCbz9l/GSfV98uGW4Kmcitz
	HNPHQe4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfdN-0000000FX5r-2CF5;
	Fri, 05 Jul 2024 09:53:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfbo-0000000FVzC-1g5c
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4264a3847b6so9767935e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173122; x=1720777922; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MU2D03rBymimeEThachF3vpMLpUyintAFPPxBkkYiN8=;
        b=ht+zgTXr/ObiIAtaB0gLLQP6Jqy9SNOK9YhjZX5IsLwdH/BGJIJW6IG4RIvMc52ovA
         aauV1gvLhLLM5cSdt/zNH8ltJbxBHMS6b9KM9Ld0rHtbXkh2EEfNqvMntnEyfQAbk/53
         PjsuIEA1J5lH/jh4i3ktMNFWn1EmMehDVd/FnRZyLmPX5R+XgwWsVYkoWyT5eimKXIqd
         2P+lW3nPY57mIeNC9IJqvH7LR9JCX5H6AJOBz64tUZ6gXJQQfDdNAmQxK3Uj8/lyRXAw
         e276/q+AInykBgvEtUuji2G+RN5EeHUkiO03ITw/VE5jVO1ZWoC/U88Ab+emrzE6UnBZ
         GUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173122; x=1720777922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU2D03rBymimeEThachF3vpMLpUyintAFPPxBkkYiN8=;
        b=MhkB6Sq/1NP9rDc7Q3JS44OmVaaaeoEnvxz60j5MuGviRV2rkHVDCHDbXRFK90yFAW
         nFX0yD1JFIhRnR8660hZ0wDW3h2VhXBye66VMBjQbBTPRRfpOcYFjXuAEiPUix2Tar0n
         RSTrs8Nrt2ojMweljwj8P6jHFhy26+0LA3+bwNRsq6mRoznH9GhvCyzGzqE6fZGFZNnv
         IiVKSqD7c1Uymx+ZplJeH3k9U3Qh5B0YBFt50TwF73tDZF5m0jg2ktvxp5FPRBhXcCGy
         3WP4k1x/wkQLUO15G+kw+xBcgCq+Mo5tpKIL47r5Zx1XjIr1yzQdOyQoXLBRzRB0h7GD
         b88g==
X-Forwarded-Encrypted: i=1; AJvYcCX5c/aWgcVCVAIiyVXAt8918cfWDc26evEjlFTkrCY3/+COrdqczK4EdicCa4JN99rQuksAIYlVak6KE9oBsFB4yyunChxgjFXuglNN3AC/WqAo
X-Gm-Message-State: AOJu0Yw1tGcFhPn0YD/b7ukfm4ENh4XaR3BHPQQKj+82AbGV0C7DOSNJ
	76y84I4lJyUMkw26JempqDCc8qpnkQxDGiw0lZj1j2zXNPROOKA+7FAR4JVZacI=
X-Google-Smtp-Source: AGHT+IEcpp60tR4PKcwDGPP14DeUI+AoL2ftunbhF9352ciJ0gccYmGm6xSSUx+JTouCAodSiLlByg==
X-Received: by 2002:a05:600c:358f:b0:426:4765:16f7 with SMTP id 5b1f17b1804b1-4264fc79f5dmr12586365e9.21.1720173121834;
        Fri, 05 Jul 2024 02:52:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:23 +0200
Subject: [PATCH RESEND 04/22] dt-bindings: thermal: brcm,avs-ro: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-4-554061b52fbc@linaro.org>
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
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=77dfRMvnVxm1OF5oitgwjLhiiD1KP8HFaw6H5YipzNI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8InA3pcGxOIaNi/3wwA1jD22EnC+9r/hUFT5
 oPaKfM6oyOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJwAKCRDBN2bmhouD
 15/ZD/9s57cCbSiSE5irX/Uur4kDRE/StNK9tbyUxFiaMjpwhSzBdaX4L7325iJWZtbhhpo7bDO
 Olnbs21yUzxNsQKW4iv88RhSDqHQikiZq7o5QSiW+fKeWh8ku21wgSZs2fl/JJF5pRtsswwm7rn
 /+XMjbE+UIp2qbtHeYCPE67y6pp58dKe21sjcb0dHUC7GORWROwV06u4cDth3tmYkfeZoK0ffJN
 HB0JWweA//qKV0IJX7mIpAhwfCh3Ttlh7RMzIYXM7xnLmAYeitzpOdYTJv/DbhvCtIakG5Tz1Za
 VCfME6nIO3DSJ9ETrkzVC59rj1OG4PS7eYAZ11PmQAXLZQharcnAk5bfSIoe5SAgqdsXY0iN8wo
 lF235kN83UGvPQ8Rh2+CCKscddW9fKr8igS7x0VVO57VhYGmscjUOsWPHaUqlwxyZKTtTb8yZr7
 A0ek8L5L4q8gp7XERg4FdEC122X7tjUQM8Itq4FytD/EqAYhQP9GoKpz6OJ5srrcTFHJXe2Za/i
 t9I7SfHCcX7VbZHck/tb5Y3+FEJzpLzVX7y8cxRMLr9bhLicB9XyRKb1SFbfFeugE9NfDcnjuWq
 2AYBQhZNcXR2N/xCjpthq4NDkp7nDdOXdTVqluE6epqCbmZb3MTT7/nGMdlOe7xuLwGyvEbH8CZ
 bl1TOEbO83/Qz4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025204_490904_896CFB94 
X-CRM114-Status: UNSURE (   9.05  )
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

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
index 89a2c32c0ab2..0271a0bc1843 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
@@ -19,19 +19,19 @@ description: |+
   Refer to the bindings described in
   Documentation/devicetree/bindings/mfd/syscon.yaml
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: brcm,bcm2711-thermal
 
-  # See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for details
   "#thermal-sensor-cells":
     const: 0
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


