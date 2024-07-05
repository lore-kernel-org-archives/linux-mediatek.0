Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123F9C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1lgREowMpDgegSv36xdcxK3AnkFlFwaiDjciQiE+8Y=; b=fp7O0yPJoSiG9aWamKtmpTU+PB
	UOAt/bZtDPICQm1SqUzynFCg/RF22CwMRCow1I16AkI9HF9uMDBcL7Y+GtdiRW4kJEJWGsZsQvERn
	Vac7vzifbdbWWrF8SwaufXGjETJfkrYhLLMuYEadoNykdxBD8tEBoBvl9csJrQ6K+rS6QUhwXKyj1
	sz20dcLJSDrMe8NwIAE/yvh6adjXW2Vs+7Tufv6ID8sOipc2Rwy54iKCgMyRhPgrlJhbplyo++L9r
	c/6C4Ak0SciQHvnlTnn1xfJIVlpdQmAB0ybow7xcw7f+d+G0vA47ppT8VZ9b/8oXPOmvquleDsDZX
	zRYl/SLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfca-0000000FWel-38dQ;
	Fri, 05 Jul 2024 09:52:52 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfbi-0000000FVuc-1wKe
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:01 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so17090211fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173116; x=1720777916; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1lgREowMpDgegSv36xdcxK3AnkFlFwaiDjciQiE+8Y=;
        b=guRST0kiKfA1csayoXfoIsf072iVVQtAxVNp2PO3rC1Fys4lAogw2DOKwlD6ZlM4RY
         XQwgfhLdGvqMoB83ku3a3NpsMryuT+lxUEWIRrlnKZgJ32K2Yr5aPwWXoLUMuMSzJ6NF
         xl6MLB0wKEy8/PMEoTJlUz7A/BBrexlUXUkBEXDOIKyCZDOLy/I/H7dlKBGrEnsZxcCS
         0So2NdgPG4Pu5XftHa3AjiIkkDOHwYQenkwVARFN5hlb7WhwEyHRmurAJvl3wv5Fny73
         j8WX0d6/TTRXbPAEZw/C258Nmqlcuf8wHmrbj9agVnBmnMmJlZGPPxcy8EQGPV/ZwasB
         P7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173116; x=1720777916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1lgREowMpDgegSv36xdcxK3AnkFlFwaiDjciQiE+8Y=;
        b=f7M5exOVHaYDcmlsxWbeOdqwSKvka6pcm2daJZVIRd7pYlRiB+WLS18ckGXeIqbO6e
         74ljIid71AmziiDoTOxISZS4AeQmrW4+4ov0j/3s+3l4TkhFJ5jQ151V+vu7GZwILDxZ
         30lyBUKzF1vfHr5lnshsQp/20Mqz6k3fOuI9Q0tafzNwTbKQwUl6m5khnuGHewd4LDaX
         VFQr4A5lOyLL2sUgEZw2iTl7fQ7VLNXsaaa3NHYP45Y1ujWzSyyklXZv9UOY+FbBY3jW
         bo3gh4D52M6eWz369X4R5a793eD1/Q+DLMGG/TEotjHia/+WBCDE1qAgdccI5EmMqgve
         i8vg==
X-Forwarded-Encrypted: i=1; AJvYcCXM66Hnt0oRX1MVSmeYALtlGx5ZxLBNWblvg8OGgDENIpRTPltyCGrmrqLB+IiH15X4gzxq9vB0OxOI1t6/HxdZqC6RtULrDPk7N47NMLO0Xco+
X-Gm-Message-State: AOJu0Yx+IyRdry7ZXOtu4muAKe2ObKwZPK+4BcPmF2lHCNWgrcnvtgSE
	Lrbv0i/Id4YWn2uApyHXw6zyfYkcAVRhKOH8sPo/YYwiQhlLyalvahIku1rstFQ=
X-Google-Smtp-Source: AGHT+IEeSo1l6X3Fn7oREnziy7wGl86YV+iWvBeIrZ1RnzxH6wICinSt6W9cTAWxOTsN1SfeBkyhoQ==
X-Received: by 2002:ac2:47fb:0:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52ea061f4a5mr2746219e87.14.1720173116487;
        Fri, 05 Jul 2024 02:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:51:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:20 +0200
Subject: [PATCH RESEND 01/22] dt-bindings: thermal: samsung,exynos: specify
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-1-554061b52fbc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3EnSa82o7YAfbkSZeSakkuZ4xjdHqVx+EJ+E8oKBlvg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IkvFsEQjTwZFnbae9AS2ygRayZquLi0sRos
 UXLxi65fnCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJAAKCRDBN2bmhouD
 17PuD/9a49GewAbEVoD10yTzhnQEIJm7VmLlCWlVgVZiMpLg6K5LLHZn7lT1CAo/2so5Q3+XXF1
 Tjbp+LcH4moDaYOy3CUt0+YHeNd9BGdOqIwbRBykpRhvc9rKVkMxe3piyICn6h5RhtDePV7NnCt
 6Cr5rJCjnFcf2AbZZeOQxZLPwBDwqxET1/yWFebn0e/7AaDIo7JAW6+1okCZcjnqPQIyJa5cDBw
 vua10epXrG9CiX7NnWzzT3B8QxMahZgtWcUPiUdtO7hnqZmfWCChO4B1VozqWnEheSnRpvSZ3x0
 zpMYhpkXacNsNT78pm/OgCTK9ZtGQD40/GqQtWScwbJsnytA5Q2ubJH55ro+g8zuc1ZW89uYkDq
 /x4vhyjvRaYjLeC7C1MeZagVotfluZqWAAufbRbJubk4Xa9n4ZQ8jaak5OEhDd/l1gWJHWE172X
 aRN0zlVnImPidjB4ONSQ4oO7gog5Umsylxs6EQA9Zx0MlkLZ1ydbxhY0p31lsUnl17b7LYYlqGU
 TK3+xHPXDGHja8qrdgMTUzvvq82VgcN8s5mqc/EjGE3c49RP1fwFwzzkVleR+PPIxeH/OvTOyXu
 AXkWN4yvcmqD0ctz8QtvSWiyJSOTLPl3O0ILl7vQwO9ge36B3+c6ILtuQ61lYLyUZre0QUQIlot
 5awo2AdWu4Ir/Yg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025158_663592_1E72B2AD 
X-CRM114-Status: UNSURE (   8.91  )
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

All Samsung Exynos SoCs Thermal Management Units have only one sensor,
so make '#thermal-sensor-cells' fixed at 0.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 1344df708e2d..29a08b0729ee 100644
--- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -61,7 +61,8 @@ properties:
           TRIMINFO at 0x10068000 contains data for TMU channel 2
     minItems: 1
 
-  '#thermal-sensor-cells': true
+  '#thermal-sensor-cells':
+    const: 0
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.

-- 
2.43.0


