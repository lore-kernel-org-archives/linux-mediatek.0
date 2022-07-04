Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2D6CCA483
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 05:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBFds6olkH7qZWoO3BcF5jnp49SAncP60CSiK32nvCU=; b=g/nNxytw7bKTZ8PFF11yyNfqgM
	Lv96d6JPu4pNS0U6Oeal8XloJ0Y+pPp6eadbBbAkjO1PFwKXrZQdPY008Yp5jYMY39AeN10iRDNDC
	Ofj0KIerqm+iDBDEta5fT8gJxh9Tce/sMrVyEfrlK73EYjjRlkTgoxYSqEOCWgROZaUHsK7hvYidH
	q7L0bZ1GhzmpEeOKZj3KgAK8qBY8d88aheJsUnGWBjGuijAdg0aG2wX72PBjr4xaSPHb98Da1Wx6k
	HeimDswrzUXZdZ7xhMKRbeTZunlZrXrLP8/1MA08UryWjB06iPsop5oE41AJcr05irjdL/0l97dOE
	Y5JVYOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Epk-0054uP-HG; Mon, 04 Jul 2022 05:41:20 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8EoL-0053l9-Qk; Mon, 04 Jul 2022 05:39:55 +0000
Received: by mail-pf1-x432.google.com with SMTP id y141so7994332pfb.7;
        Sun, 03 Jul 2022 22:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZBFds6olkH7qZWoO3BcF5jnp49SAncP60CSiK32nvCU=;
        b=ghNOEPKfW/M7m5HM4dYGeASvfcvcu8tR3I9lSRY/mX2exs/qAsP7+hQu8z0Jq2sH+g
         PevP2yOfgvyAoRpCblNCliFPwxd3Q9GNxuK7ZFQjUSFDA21mWoXzgrUntgBPAfN6rb9z
         tA4ST2OpyzlVrguhxGijOhgZbKrTfC7nTyb50T41oeU2ugCxKrNj73JnoWnssIDSLkL4
         5OH8BZILuCS5slgVW8rQNv2RGNazxPKs172ETLIOuXr4hPqFMz+JMBwe7LAao3IaNVo6
         6pOEVj+V4yHLVv5WWbwqjIURYYhfBJ6s4+vLOO96roMtrpuLOoVPCTAOt2ajZDwKIawC
         TvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZBFds6olkH7qZWoO3BcF5jnp49SAncP60CSiK32nvCU=;
        b=tzyagkBQ1hWjwnU0rXG3XT+v5VIrIjHypCZ5ERPK8GoxUAEIeWheNodMKP4MeFkHYh
         CyqbDhiK1TWYCoxE9Ny0jd3vcDManJdrAW7tq7bDljw3Lvu+XVwkXQ10kpjexa6aWidx
         SIetbor7U1BNiMou2DL3lBTcDU3jOxiTVDhKS9lJezbiFYliqxl1LmJQvg5JgozZH9n3
         0ur7o2HHqzc5JeUvdctUBpMLTQlxd9XnBqn8mbnuquv0rQJFt6BgFgxT/wxfzuaUkQhC
         R01EDB7s/mKh4XllqHETS0WdoB4oqePI02bCCG4r4UpD3dJLl8H2PHfJ+TzLkp05Ims3
         RFrQ==
X-Gm-Message-State: AJIora/ld49tkxj3zGo1SECyTYcx4p8CBnLZiw9RfKmkbd9JcaXUUisu
	Jijnl2xeLzJf+R8dOTrtGok=
X-Google-Smtp-Source: AGRyM1vZ/A+Vp7yMvTtkW1G5gpiZdY17tzZRcpC8TGWh/YaaI0JZwzDLX2rNEOcvJ6ZApE0NroUE6w==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id l10-20020a056a00140a00b004e054d50d01mr34348533pfu.20.1656913192917;
        Sun, 03 Jul 2022 22:39:52 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net. [42.72.4.255])
        by smtp.gmail.com with ESMTPSA id h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 22:39:52 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 04/13] dt-bindings: leds: Add Mediatek MT6370 flashlight
Date: Mon,  4 Jul 2022 13:38:52 +0800
Message-Id: <20220704053901.728-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_223953_928099_AA8A91AD 
X-CRM114-Status: GOOD (  11.37  )
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

From: Alice Chen <alice_chen@richtek.com>

Add Mediatek MT6370 flashlight binding documentation.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/leds/mediatek,mt6370-flashlight.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 0000000..e9d02ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-flashlight
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4


