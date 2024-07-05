Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9390CC30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKqtRkIKZziWtjCTznIKCd63AloZp1nyjQT6Dz4Kf10=; b=GpfkFEXjmouev81MUK2zLmmIlc
	o9au+Ee4WVYg/V5IopdAy8T0JI/c0+qsESxGRZPlQnsS5oOy1p5y8bLfPnpCUfwTMkIeySQTMr6ri
	nlp+Fw1uygfTPTpqdLEcj+sU3afbXDsQYE9HS0mlN7c1i5IZ03N2IAd0luLXKFY4rgNp1in6wWPBq
	V7RvLD5uxhp8Qt7fQVT3ohuaFsX+9d4/srO8tU6yiN1iSIsAOYLgAgeKan8jDmWuzfguz2IdVa6iy
	MSdGBxiEvcmBZ2+ONUKnlWiOKiLMjzgE0QOAo1g+++UFUfgKujgZYeubsI81IYNmU3N5SEWnHASJd
	ztAOVEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPffY-0000000FYR8-0xaX;
	Fri, 05 Jul 2024 09:55:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfc1-0000000FWCc-2adx
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-425809eef0eso9666905e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173136; x=1720777936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKqtRkIKZziWtjCTznIKCd63AloZp1nyjQT6Dz4Kf10=;
        b=qKPuDyHgMUKi9zY5F08vyLkCsd0UGCnqdqAWOU5DplMi4H+ZCDhEo4Fw/Z4AqbQUAq
         jmzjpqh523eziai5oLdI5wuQ6dBqRT0RDaync9S3IFDIHuq6z+Ycz/naj//efyzWurZV
         d4LNEUUEByt7RsH8n8AJsGLpzsmJnbvdqMvGrVomCTzQX1OB+eVAOQd7zvih4CNcDwda
         35HJkf7YsUBnvFD1t5iVUFh3NYlxrt3PCj03d6MSMEpaoQc60WTnu0gudu2RTipDUiU4
         jVgjwEiAuf4sTRu1P1OXSOIYvBlbGL+QtENkARDR+8J19OAIg5ItpYagT3BsyVdaW23R
         +5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173136; x=1720777936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKqtRkIKZziWtjCTznIKCd63AloZp1nyjQT6Dz4Kf10=;
        b=HJEDNiXu1yOTK58dc02sbZZwAVQk0/Mtq0OjeH1hcs3Vyt/SMLqGOOwG8mHgkuR+1R
         0jfYX++ZTTVnAxD6uAIi8EP/LaKGDKacH4w3D70xKR5JlX/fhOFdOEpGHVA97lzcfFzz
         Y9otCLrySHOxYN0Sx6/LOGrgTbOsefE0YY/dS1lDM7MJUvLsmBgbgfxuqPbO9cXE6Fv8
         8BqvKJ0K5ddYAN5vQ0WMx9fZelYJnljDTmJQWzW3suspYw7DntLLpo2JMk6Hk109SdUW
         wM3IARu59sTI/3RfqEvZ0R8Nm+i6d9eC9uR5Y141HKBThTaOz2lNhU5IXjRX52iEniMw
         9s0A==
X-Forwarded-Encrypted: i=1; AJvYcCWgHiHp+w69aXqNNP/KNB2R8+lQ3tRJh4/bebW1dmc94Ja9k3kj70fh2JNBo7qWMmR9AqRvAFS/WRXyfrwfON06xTbUXpRu2hVI7smHePCTdAA7
X-Gm-Message-State: AOJu0YyE5CbGHFXUZsGBILtBpGq1kxZ6CYbty6i5cjpY7SPKMr5RCbaZ
	gQQcor/n2ZOT+gk6l66SSgG6Sj3hAlgjnQgJe6IaE00o+wZ9XVeJRbxPMdyDp6Y=
X-Google-Smtp-Source: AGHT+IG2nfyfOFODsINFapnK4EjwRmiLFuS6mdyQ2tPZgE4KKTOjRXzWDUhHtaXzjuKiXh1Thk8Mag==
X-Received: by 2002:a7b:cb42:0:b0:425:8bc2:d01e with SMTP id 5b1f17b1804b1-4264a48cf6amr29090245e9.39.1720173136370;
        Fri, 05 Jul 2024 02:52:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:31 +0200
Subject: [PATCH RESEND 12/22] dt-bindings: thermal: qoriq: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-12-554061b52fbc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PhqeVWb5AhUZ+TVjiuEbVKHXnMtFrrz3lDWQEgW3GKk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IuHb0/nwwqjF9F3MLHILARJPYIbjhma9l0l
 qDg56q1paGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLgAKCRDBN2bmhouD
 15TJD/0aeAqus9TFN3iLADtrOOXAjfXurNxC8IOzekRzSUrjGIPfmsTBEN+H2ihJJ8nb5gIB2b/
 aoxTJtTjZGW4gzOnPRjnNXeLmAvN5KJpIX/SIFjbEmKWGtfvpe8X+iU+fh6GBgOU9wxBWJoTUEB
 njWiPmqXoXKEkLWgDQ0G6je56VfUdhZ6Q2ir/rtc1isLlmbK9z7S7pMZfqHc8MhXZpXP6b0nihF
 cuEvZZ8ij3zH9au1OAAyzfFLyXuEJqz2u1984v7ZEFBHNzRbVDazlcyJ0mHLhpZoBWbv2NB6tLv
 HG2DN8HbbZcF3sQm9rMbjBnhfrq0XbUtXCOKaNnhhdHy+RpCOGf0l3SgjMqr++Z3aeQScUaY+MO
 JPXotMYhRzvNIZHqajFeQdD/5wODGrtCOKdmh6jEJ7Xo0zn9nAZq4AEV2ylawLSB5C+MmizlPcI
 iGcEPpNONXWbXjamNLpB3WeXfUa3uUm7++dSr8su4E+CrdTfyu/4EWXVuIEv9fzSdgtr4XaoChp
 2xIiIjUWtPDi40cVNTNx4/mHKT5WzTvcMGgUaUwmFB7G8t39blPh9yP0EbPw5bFmE14HM2+cILi
 Kx0UQLsvY77pmwpZ8Jpn0+vkZlAprB7MgOoOunxeRs/Qu4WOmnouk0/PJr7FZ2NRByZt8pw5hwU
 p5UjlqLismlHSRw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025217_746614_19557AC7 
X-CRM114-Status: UNSURE (   9.38  )
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
 Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
index 66c4972d5072..aa756dae512a 100644
--- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
   - Sascha Hauer <s.hauer@pengutronix.de>
   - Fabio Estevam <festevam@gmail.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     description: |
@@ -70,9 +72,8 @@ required:
   - interrupts
   - fsl,tmu-range
   - fsl,tmu-calibration
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


