Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D33C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 05:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMf6387TzLyGm9Upw3MxkT28i0dsxKm8/fENYW9fSbo=; b=LiQ1PIRXTay29TDW+s2H1+xGcv
	Jp5fRydvUQeRqPvdD7SuTVeZLqdTieyAJka5rwr45oy7Tet+6kaXvfEDSiFBJgZehq8u38KQLj6Kj
	gDGlozxu0MDFC7EBP3VorR3xnVlI+Fm3HREYuT5+YHwelL42oxs3DdhLb+7pC2S/jbwt2fylkcBfV
	vn/dIWMPwfmowsrDny+LWusP2v4u8rdJR6E7JqVF4CAZWTkcWG+i443yhz6yP4dmLRkJMLCySpu5l
	BFP+cwVJAlBpyJa0Sck8yYYWLPE6qdx4aM1oIP+IXPO1raBdxKRFbu+zbO7TJGhKfSORdukXw15UT
	jQCkPatQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8EoV-0053rn-4E; Mon, 04 Jul 2022 05:40:03 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Eo3-0053ag-BH; Mon, 04 Jul 2022 05:39:36 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so3964352pjf.2;
        Sun, 03 Jul 2022 22:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IMf6387TzLyGm9Upw3MxkT28i0dsxKm8/fENYW9fSbo=;
        b=adkv0LxmsMCQz497yrD/djwooNWwdvKUuQir3Cfxo39vfk5chMyirhlT5Ra2CnAT5c
         BjeUwdSUpHqOQn32XvsFlSVvlSQLF0tfoQi7jINKCJr7Kli0zbT9gC4Evt6X++aIdwGb
         Hr05itlCxPH/C2P9li1poC42ArKWGeegNNkletbnO/4gqpoRSku4oAL8LTH8sxGHF+7s
         EJgbAAiMakRblWilON5A1w5zm9iIiVwo4Q9ylv98pL1zLjuVVpQ7EwrfnD9UAyfg2Nva
         BzxKjJP6GZf90ZtA5QlPkynSEFUfqXzGIC2oYH5KhK0sUyehKdZOocJ+DRHs48OZebqx
         bFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IMf6387TzLyGm9Upw3MxkT28i0dsxKm8/fENYW9fSbo=;
        b=U//Oc3Y4kHVrxBWvKr/+9wpPLyNYEzVJbESAvkdcknOKBT1wYIOAVJp6y6j3/uOYIi
         3zU0B345kaEqhfb70eIugdonJ3DO1ylGZ7+IL8cmKt8VJwtdE/ERMXflHwMJO1Yfgg0/
         WxauErUh9ALLoTfJJ4Xb41lEPSHMC/jPg7jl8YEVsmw6C+a2HU23ej2DCApw7jlRAypz
         TBkEZBRa2N/1F0js4ihq3mrgDEz8X3x+E2dZcZH2mynSpMgL1No02qNdXgFNPOdhlBCF
         TNO5qY7xF7LOwFW0nLIwA9LhGZuQSFPst4b37BORtj4MCxzvBFaodFYU4ZaAjzyEMNT/
         o/Rg==
X-Gm-Message-State: AJIora9bdZxTIRQ3OB8sKJINmGKyNqU0I94+RRd3SbQ8pURlt0QDwjc/
	Rg1SlS931tit4LNKZNuubz8=
X-Google-Smtp-Source: AGRyM1vkpwmG4HnIy/K45K/pN2YgROkZdEN4R9it8eT+Bwn27bLRum8y8Du7d9QNxDwqQhDgf1+Wow==
X-Received: by 2002:a17:90b:4c48:b0:1ec:a20e:a9bf with SMTP id np8-20020a17090b4c4800b001eca20ea9bfmr33144872pjb.209.1656913174438;
        Sun, 03 Jul 2022 22:39:34 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net. [42.72.4.255])
        by smtp.gmail.com with ESMTPSA id h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 22:39:33 -0700 (PDT)
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
Subject: [PATCH v4 01/13] dt-bindings: usb: Add Mediatek MT6370 TCPC
Date: Mon,  4 Jul 2022 13:38:49 +0800
Message-Id: <20220704053901.728-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_223935_479259_77C3384E 
X-CRM114-Status: GOOD (  11.03  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek MT6370 TCPC binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml         | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 0000000..72f56cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediatTek MT6370 Type-C Port Switch and Power Delivery controller
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  MediaTek MT6370 is a multi-functional device.
+  It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and
+  Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-tcpc
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.7.4


