Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474A9C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3560sIYwPYF1qUJ/9bHKIhK5P6LKddpvgy+hKRw1pU0=; b=hUv1VRJTaiIF3XgH6w5HRYnME2
	Iyhaao+d4T/2O9BecZhlKhiS0Wjv08oJHhR0q6at2HDKTW/vjPi5KBGX5cgreOjd3/BcfansVRSDB
	Ggu2DXvmG12KKuJF0npR3P94JtJX8aDwRKY8w40MOxg7jUNSgiSv8NPC+wOsjZfm7seXmkA5tQhDO
	NheZd0sfSQMNmbc6DZ7kEZ5tz9wP1cYNbN6IkuN9RxSoiNNf0vniPyUv49Z9ZQ/uwWvQOT3EVHifG
	fyEtN+kiaLby5us+Bf25YgwemhDaRBDSk8GJuY9pD1Fc7xqq4hgL4DLDEJLF502hK5O3Txyqf890e
	MZHFXo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfg9-0000000FYmU-1QBb;
	Fri, 05 Jul 2024 09:56:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfc7-0000000FWHy-0QNW
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so9048045e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173142; x=1720777942; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3560sIYwPYF1qUJ/9bHKIhK5P6LKddpvgy+hKRw1pU0=;
        b=BwUIAkyM5IZ+/7v1rWam3hJsg+0E/m/FwrbxWGvnRSt4mxk286fty0fzyk9R2pSx7Q
         bbJNTDvAxoIj26qtHGs1bTAY5k7ar+2Z1ndDqcG2earJL21b4WcmOzRWa6mKcsKiJIuq
         RWey3ikJFCuLApbMgchU3XYSTBU8D2iMM1ugoUScRXQR6hfHwi1RvxxPpViLrrY9s0YR
         Inguo5+9kI6ZsZHTQqozn0/4ticeOeTwZtQm8csEzwzrX9IuVHLwHZtA8kKw65qY4TpO
         G5XE1vm3QquM/l1DajXNJtiC7lV84PS+PL1ld4rNPdB7u5Wl7DT6hCi6a96j1+bwHQIQ
         cSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173142; x=1720777942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3560sIYwPYF1qUJ/9bHKIhK5P6LKddpvgy+hKRw1pU0=;
        b=XkKXD6/cJYAV74ZQrvjXxfErHmQKoWXOZv42/0rRCTWhwY1dtCrJmy9HMqhOSKpVO4
         FmxiJvDxWlQhWfxy3RVDdMPTX6+4t5Ic2s0t2ZLvs8MzuaqT2m6SQNeacUYzyt1zPzcK
         l08BUv7knvUpoj47OmWggcB0iIEPF0hw+x3qUs3RwtEx743BMXkFtIqJrdsQ8D8A23WV
         p2BXQbnah94M5fwfFAc75lVbOFnywk2HNDKXdbx6JXtUn6+pR40G37i38bA4+ZtCxvDZ
         LcEjbo/LFYNu0t9GaEsgNmhb0/ZC/JqeP3hjrr9mvZspO/gZPygDKoqaHM3COGWzW/Kr
         4jVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8h9Qwogg0xi23U0jlobyEvyTJWL5L8Xory8/V6i7G0yzOgwjWxEPscm4GcLbrm7OQAUKEImkt7ZCGS5bQza8KNseOKeBpTMjSDWsGvLxCafMq
X-Gm-Message-State: AOJu0YzMgtVIp6BnCbgcs/sTo/FPGpc4Q8Sg+TEjQYdkgg8JHqZtl0Vf
	RbH//6Yg0lqX9wXnnBXHskFSaWL6CZwSKbNppnAQr5yGKrpv/ddvBCGWuc/GTLU=
X-Google-Smtp-Source: AGHT+IGbvLI+7zmqv75BKx3/cT4DQdFw2sCQV0t1yMf1acL+CHxXQXdR9gk09jrAs/6TLJ/GpCm/Gw==
X-Received: by 2002:a05:600c:1f85:b0:424:7871:2e9e with SMTP id 5b1f17b1804b1-4264fc7d970mr15129865e9.6.1720173141847;
        Fri, 05 Jul 2024 02:52:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:34 +0200
Subject: [PATCH RESEND 15/22] dt-bindings: thermal: rzg2l: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-15-554061b52fbc@linaro.org>
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
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/v3DnhzMdOF5SQ9SQNOV6PRSe2c2250eLo+YE94Idow=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IxKgZOJfR0ZXnugjqEGRImqQD3RqxQZVGYU
 QKEwKmPSoiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMQAKCRDBN2bmhouD
 19iiD/wIEJLzOoplNOyUE8vTIb8jypPs3ZtbRPE3IMr1kWyNV4kkUeioMt3Ymjfg6Yz6a6YL9ZD
 UC7vyu7i23X1HGATIOwuRq68m4T8kLZ00e1WhtExcwWdsJ4x1zwLsJSkusJ97W0rRG6DB8cjogD
 RH97NBKW2ofqZwZSxXAn49w0v9M/LpK1PF0OtBGj6ksr0PnHycXJdKzZeIJSrAtTXUzdhgoOphj
 JGawUElpAsy4+1kwbUxHwsfPW/Q0tjJGF8yYMTyDFlz2DBcqnJsD8XB3MExsIYuZctjCKB6DMdO
 K2C25ZMFWos2IaJ71O6XRLLPfNRW9LLdhmVrU5ckOSXGdVrnAKnN51n7wg09rIWwgUsbQw3uguz
 LROpWUsUjWKfjDB8bNWBzqxhW9XSXkh6dSFHJPngXpzOnZpDroqp9hTT5TbSNsfUpsksKeYH/Jr
 t7UXtuKximIUbkSApKE9jtUNPUjNcDOPMpy+hVxGIdvFN4bblQ4J5aRTBV6i/FTZmIvRSxezrom
 IUC1hX6/nhbptXejc7ePmLvnuCvf2CSdP7urMV3EYncRAsGEK+QT7SZT3S4O0z3fdL/1zj2rOPu
 F9Y+eY0sQqQwkm9q+Qv1JsrcTR2VLfjXslTIam3QHLpSHyI8p8NLaFNremlstKYULsDiRdPT49q
 OXOymlqijKt+JdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025223_398071_5FF59DF8 
X-CRM114-Status: UNSURE (   9.03  )
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

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
index 03f4b926e53c..2f96c0fe0f75 100644
--- a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
@@ -13,6 +13,8 @@ description:
 maintainers:
   - Biju Das <biju.das.jz@bp.renesas.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     items:
@@ -43,9 +45,8 @@ required:
   - clocks
   - power-domains
   - resets
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


