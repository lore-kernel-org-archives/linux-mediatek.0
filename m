Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E46EC3271F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuHHBQ3x8j+r0vn0WL5Gv5Q+wv3ro9XtUSu/vLsatmI=; b=EQ4LBkHt4ZOJHTPUr66/nVpvI2
	WabtDhyaYzEvPaZcHu0hqd6JhQx1k80zBt5fp4Gm688i+M9ySKM9tisUBoOqRA7HeJwB7sVoVPhnD
	CGnYlakRo/qMHN2nnWzOOFdOnYk9Qtzyu5rYusbCZP9bL9LIMSI2/Iz1cYe/9Or6KvgI/fsrsDDpe
	97NxG1Z5UbfiK2O/48cHcvVdgxDINsbyK1860EYINEpokNlnJjdOWvdU56GICzTHXEiicrIrAzRvA
	Enn2eABI2jX9tfrvJVmTcoPxEJMOc2Uju8KPtxs0DPlGSylXqCjGreu597Cb4SMXbZ/Y5344NxBFz
	IZBHsN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfiJ-0000000Fa28-3OdX;
	Fri, 05 Jul 2024 09:58:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcq-0000000FWmK-15qx
	for linux-mediatek@bombadil.infradead.org;
	Fri, 05 Jul 2024 09:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AuHHBQ3x8j+r0vn0WL5Gv5Q+wv3ro9XtUSu/vLsatmI=; b=cvUnofmnEmruOEpB+7ofY57yLC
	BQPcH5pMqTCqbzv4L/T5C3LWsHKZWaZtHc8QQsT8KbfJmslfPI49MZR+zoxup3+aq9qeiNeT3aPma
	kZ/S/vmFe3un04sT56/fTdSXON60X9HfMid1gQ+sbYxmPUjJwA/EbUdFdFTpslnpZ727IrvdgtwUr
	ZqYCL+FeKHJpsw6x1GB1BavigxLusbM41QlHg4yKmFfOZ8V7HSCfR8VjMYKIpZjmD1WyUsrJonHlQ
	rv1MqMpLm6J2CKSJQu9tCKGdvh4N2a93J5gGEPMb8Oto4tHN1RUHuk/KInl7Lm3M+6i1BAd03kyfu
	C6EhB96A==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcD-0000000AJVa-293Q
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:53:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-424acfff613so12850205e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173147; x=1720777947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuHHBQ3x8j+r0vn0WL5Gv5Q+wv3ro9XtUSu/vLsatmI=;
        b=BcZUDp+ZzPS5PC6CACGcDGBITicXnmSUMwChgrWzzmqoXp9TtjOIqo8tIjW7wklx1C
         QCo0XgtfrrkfiFir8n30RKOS7NOiotdgYenEqMSHEUG4KVBdIpx1eVHVi7QliedkvnV2
         7a0UHN8a0jMuBQoIxaN3eoSObd0psU7DXiaK7pKqVWD+7+LL52NJdOdC0257HgsRy5kA
         CKX5YHIrqTQ59PWR7d5BJ/DAT82/v05xYIpW811CkWjtN7cYmtAsvCLLEYfPyfoSfwon
         xXGmgZeH0M3TA0fYHbqoCGpi97Aoq4zR7QlxOAsqkb1QciyCOq7MZrPP1y9NKZQPN7Lx
         Qtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173147; x=1720777947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuHHBQ3x8j+r0vn0WL5Gv5Q+wv3ro9XtUSu/vLsatmI=;
        b=s9GeGmiS10D52QquzbpdNNBdJphT2LEHrVqyWEDRjWvjdYyQfAbH7NFqt7dNtbQQa4
         u8qDrHY1rNwuk0MJtYyku1Y4crzMr7PAaIgSUPVRrJsglko8h/j1EHtckJFWSDrEGd76
         bXw9uQH/Asj9S+Z4/g7SReKwfv0x44eCyKcvV0H5ueFRCdV9YzV6Hk0hejqcqz3a0fhV
         ynTElxCHP+phXw4tQQLaaN7n2LhsRaiArbZCEmbgk9AL/TkB7hKvX5NB4896PKU+i4Ru
         7jaWisGxm4o+G6hN7pa4VUmQ3q3NMEudoNzvgMCAGHhAAYLh0mFdNpSt2Floq/7bZ0o9
         2eEw==
X-Forwarded-Encrypted: i=1; AJvYcCVT9YUH/T/YwoNaYcYDobVG59u6OGvmV2zsHw5nK7f58xTIJvZXsyh6rtA9Slgj+xfmqpb0qKnjj6pQaayTikPWnfXpNvgrJmWF2qbPcmrsM5RC
X-Gm-Message-State: AOJu0Ywv+ozA+mqzPG/iyOZHowe12WtLcLI/TsOtagv6CWWNuun21xLH
	fTubyVolwC1RRwI+bW0+5GoW29WBas9GRE2d2xQucEkqI8dKSmEY9VT+UJFI9oo=
X-Google-Smtp-Source: AGHT+IGtiZW5kmWQCddksFiLkJ7NLWn4GnHc+gFB6U9WJuOeTpAWLYG47t+3PEzP4kFD/CgwHcu+8w==
X-Received: by 2002:a05:600c:b43:b0:424:a659:c169 with SMTP id 5b1f17b1804b1-4264a3dedd4mr36118215e9.24.1720173147084;
        Fri, 05 Jul 2024 02:52:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:37 +0200
Subject: [PATCH RESEND 18/22] dt-bindings: thermal: st,stm32: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-18-554061b52fbc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=75N+YagfjHTq72mKsUwSWer5IrId1tl7O0sy7rhdM/8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Izbil3cUyAHoOJ1kZMbs3aE0dEw6Y2tk1gy
 NEb1tU462WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMwAKCRDBN2bmhouD
 1yD0EACVU5Ga0Qcjk2Fq3mjRRSojMjyY41V+YDOx3XK5fCBF0oNvA1rTr0v1CJoGvWERXxAK1h7
 WCGg8YdOhLZ9Y8E4RAII8mxttBUX5/vM0g8x3jMxcpSWcVg4ZzpxDSCjlmhOqF+UwJEvU7bakhl
 PU0VLj+oO5FdpQZY7aHKXdSvo5qSPHfK1lDe6Fb8APHkCTSwPyuN/9j5FKRNXVuRF4lPNFj2nr3
 c2vsX5GUfAb63ctTYD39a57yTpWr0niK+vi1O8h/FvlRrUm7zor1BvDQDKwiKMszV1+YSkENjDn
 BacnePry+tKPxV6aiIogHG1XJp4/u/Zum8aSwRfThEIGFqaPg1o/9WMNdj/GjxX+KHKITVHP4s7
 A/JSOsxdxkfsLAtUpma7Nc3xFnDuRSgjuVzes9KVBcnPptddMB+SXUCcAxIlCBY88FZvPrJEoQ+
 C861uT3h0T46CechOycWu7onZjHx4E7q5ZGL+mi6ZvNIVDX1kjOHoN12VjhWTVGnR58B5iiaHet
 Ry/HDQUbP9wAbIPi8MuBcvfWeeKxBlanFrWT5lT10E+b/0vZ+EYnPOzi7FL43Nv3jUsLZ9h9s2X
 wIbik/HSCMyp1mQ3AllokuQwhDFcyaYAFkoyyDkg664V+8lpx1vLSTfDUp0dRIJpZGv+2IJwFl0
 YGJHO4sx4OcOUsA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_105230_315600_15320A23 
X-CRM114-Status: UNSURE (   8.65  )
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
 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
index ab043084f667..1c01a80a0cdd 100644
--- a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
@@ -9,6 +9,8 @@ title: STMicroelectronics STM32 digital thermal sensor (DTS)
 maintainers:
   - Pascal Paillet <p.paillet@foss.st.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: st,stm32-thermal
@@ -30,14 +32,13 @@ properties:
     const: 0
 
 required:
-  - "#thermal-sensor-cells"
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


