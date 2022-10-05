Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D70BC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=; b=WKbgOcwSbe52O9qudFMqLOZ3qV
	x+hKHDJqOWYki0ugX6yJaFL1xk1k3e0BBGxxpM5V4KhHYBJpqpoWJAIZEdtp63DEgEuM2mm46GRg3
	KSPUFmdT8+jPM1jVdhI40d/o9ZdzuSfFT5W/lBA1NKhz1C5kA7TTUVVd1k/br8l+Ky2P92VvvdPyT
	muJjs7u5YZzcqmhlv1JQ86K9rttsvqgxTSZ0Ba0gsw9YItwXiDKQmKx2Ci8KGLyFV+i8nwhKRpAhJ
	KBjfhEoJNQill3yTu3PbFjd8LUBG+4e6rai+owRrHwLttlMNKtiz44+/3lnuShv8TboGdZV21Pio/
	pTbv8Plw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2qC-00DtDu-3j; Wed, 05 Oct 2022 11:45:32 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2pk-00DszG-Ju; Wed, 05 Oct 2022 11:45:06 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 2so9483976pgl.7;
        Wed, 05 Oct 2022 04:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=CG94Zo2W31qd1uuT/LO/cTuqQ3x/Uc6a0fPRmlx72wBTAzOnQUU/b4l3CvIGBZkWJ1
         IxdQBWeov6BkXdonw+seOfJ1qLLJPygp8lKofjrj9eVlNOiMCa9J0+mt9LwtJBH6cpSg
         KytMrOK2OHPkYfpUABaHXOMXGswwRno6ClQ2POc0TOZqxYCVx3kaetNxt1qhxp0eRpug
         9cvahLuDjTZ5ahFePWoOV/0SBVEXSmzU237nWxMK520KutEQuIMWf+SIZSf4iDdRiLNy
         wRM0sSzrhj9EPbQIPZr0YT0nwG6m8CdK0uC3UofxNQust/dF1IpAdKobH+2PG5QpdHcD
         fHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=0lNgabpjSZz9GaEOEKCVcvS8Jc7Nf7eL0NmYPuUaRgStsS4+2BKaryXZJKgH9b9/B7
         HmDYg+6Zt432TM9GRnk9kBVx9bT23QDDr/0yRjAsBzBUAY2H4nour5OzbeWsCiqbbIh9
         VLredII7DahdhrHlsCTzKtPvq2SFKzDBZcDhySl5XoKlyMuRuGitcQCSRyLZrLqDzMoz
         roL4+JM4iMsd7LAV2aCVi/u1l/6T+FoFJqfC7SYWWjdyHH6fV+7/F9jcYU1S63/1r1zP
         AeuyjAKeOD9KXUAS2ywOntEnQieTQ911rTExC0S72WmRkWgVZkY5xaRnH5YlfEf0AzLg
         V6SA==
X-Gm-Message-State: ACrzQf2TrYIrEYHKVLDV7VXpIIkewcjdVzycrZeWdra1P4hdrzpXam90
	j9yK9JnPDUbSD/m1UUbPUao=
X-Google-Smtp-Source: AMsMyM4CWVTFfBMi+tu1SyhPlOdgJq5al1FRad3mezBpCzOjOXdMnj60RgHoDo3muf4wAym6ASIAMA==
X-Received: by 2002:a63:fa17:0:b0:43c:3f26:48e3 with SMTP id y23-20020a63fa17000000b0043c3f2648e3mr27437883pgh.66.1664970304121;
        Wed, 05 Oct 2022 04:45:04 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-126-108.emome-ip.hinet.net. [42.73.126.108])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090264d700b00176e2fa216csm10477447pli.52.2022.10.05.04.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 04:45:03 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	lars@metafoo.de,
	andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v13 2/5] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Wed,  5 Oct 2022 19:43:55 +0800
Message-Id: <9397c7dc2f598aaf715090905518c9d7d8a8ba40.1664991040.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664991040.git.chiaen_wu@richtek.com>
References: <cover.1664991040.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_044504_707596_0C4251C2 
X-CRM114-Status: GOOD (  11.45  )
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

Add MediaTek MT6370 flashlight binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alice Chen <alice_chen@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
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


