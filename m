Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB05ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 02:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=; b=xRYmGzb4JF1eBTV2j+RvxUe3PK
	+PU+gGU+9G/t6u7LHowdr9r2yd/GU+am1Ifp/B8mS48Gx/TDdgmWDGX90XgP7sleMCtdFwsQFVgS+
	h+M8BmQM22/DchVwj9vFzSJtw1T0lJXmUdlAFY/I57V/r8tZTEXckA+SiKoUzltHcrtovwiC6zuNS
	8kAKwvUBDtG282KeAeWHjPMPO9HQe30aAohQ2JT3bhHAdpn5Hhc1VqNJO7vqSTNQhwB3XZekMYLmZ
	BGtVN0vPkpFjMRUgX+hhaicEzcyhytPeCvqwsaO38yLQMHzhmODQ9mJvwtbfQsN/Rs70L9ePuGpww
	o+pI2z2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obYny-001cok-GB; Fri, 23 Sep 2022 02:52:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obYnX-001cYx-9K; Fri, 23 Sep 2022 02:52:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso4053995pjd.4;
        Thu, 22 Sep 2022 19:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=PRy5R4lxKDMClfo9ClMeZwHLHwg+CMUfGmWsvA5PLdSlc2fYm7cHntlIvJROamCed/
         pmP4MntMC43VonjlZSqXjqd32LnbNUOom3wijGLB5UVqzdAomQagq0yql2svfwLU5xOo
         bZH401vrBvTyvZp9t75mV2ZrIpdDEw7EkLOgBmfgtDgCPMfqV8LZU60+oNY66iJz5sBX
         OBJTVK1wpZr93zZGGDas2EVf9sYlli414l2k1LlLjuXwqmr2I33Ks/gs9YKQqMebMjR9
         qBjFEPUj+GxudAlTE6upcjoIB55Q378C4amjSiqRFrK2oD7OH0Lh4oxKBsocR4TfzkoR
         uHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=Zd68v+vA7doJZjFvZjRihRuYkvYpeYnXiV/5pz3QaLlGNYrBHzn58Qz0dOp3zeyBOK
         lYl3acUaY0J/TWinXtUaBNAve8qgov9JqY7JE2zFxl+7U4SUQ3LqHPPbUKfII1TuOS92
         ozqWlLrJMjZHTGz7RDWeZVSV1f3xNO42VuMKYkn7jjfKBnNhma56ZPm2eEcU26pmCnxo
         vnQJOMcng2cGPt6z0yk20Qwwx66/MfgM/Q25idPrRJkUMoir99NUcHOC5JsZsROdmQLG
         9W5a9xT6QyK8ZvfBHGr4S5mSEJTX3IY2Jo51+rbtj4gN8ADj1FiUVtw/tizyiEdFhQl/
         y1qg==
X-Gm-Message-State: ACrzQf1qNjPaR4wo4scc1ChTVnIC63TTYO6FCtBfU+RUqMEAMi+MV7QT
	yEe1gMpzMMCVy9dqF3T9q8g=
X-Google-Smtp-Source: AMsMyM4jHr2MN2G8b50aY1XwhZ/0Wz2PFQmHztqebe7MVZwgW0tBDk2ggQzkliJno4m5mMvMkcJ+sg==
X-Received: by 2002:a17:902:9006:b0:178:b494:c15a with SMTP id a6-20020a170902900600b00178b494c15amr6558358plp.37.1663901533427;
        Thu, 22 Sep 2022 19:52:13 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-76-89-227.emome-ip.hinet.net. [42.76.89.227])
        by smtp.gmail.com with ESMTPSA id f21-20020a623815000000b0053e85a4a2c9sm5167058pfa.5.2022.09.22.19.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 19:52:13 -0700 (PDT)
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
Subject: [PATCH v12 2/5] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Fri, 23 Sep 2022 10:51:23 +0800
Message-Id: <5632ef04d7807f78259e4e9f3d952849a839a50c.1663926551.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663926551.git.chiaen_wu@richtek.com>
References: <cover.1663926551.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_195215_353647_CD9A3436 
X-CRM114-Status: GOOD (  11.29  )
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


