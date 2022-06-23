Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F170EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7HWR+XrxeM7/sjAiAZKDHqat2vkGa8jaXAxlWVZnC0=; b=dCZvhe24URLHrgpsEmCb6eJP4y
	DFdhJkUhSQO8qMFcU3eBCHffa+FcpCgI3zIzJRsxF6b67lsSneAC/itQegmE+154QNuKlzcsEzWK/
	SRTBvnRsAtMlKSNgQGjkVM67EIl5cgKjo6PajsdhrAL6XwNp3Qono12YQbq2MCr3dJWLpiIOE4N21
	qegRlKe2RzAzSFgnzjF39sYR7wLwL9PrFt+GdjwB17KcGYWWveQ7r+uZe5QNm2n7xMM7SmDTHnG8I
	k6DqtXFqsSHA5lJuaWmAHnq7ttIu1wn4gak/y8/9pSggDaSKhWCt+bD1zenkbOksoLmHC2Bdxa0v5
	bmfNgieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LUb-00Ep05-9D; Thu, 23 Jun 2022 11:59:25 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LSn-00Enru-CJ; Thu, 23 Jun 2022 11:57:34 +0000
Received: by mail-pj1-x102e.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso2334808pjh.4;
        Thu, 23 Jun 2022 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I7HWR+XrxeM7/sjAiAZKDHqat2vkGa8jaXAxlWVZnC0=;
        b=V+78teS62SASXdOfx7TZewVrd1ivQP7w33yLDNP9CtG8d7wYoepRejnElm/F1Aotlx
         FWfyPFiSR6EIRJzroGdrNhSCHlZ+bwiIM8Qi2dA2Hl/cDVUQ3smD7bghNfZht3mFKpN/
         PacdhwHAvzWrg9uFXN/BjJks6N0Ry3wWXbEiPvnOxQUZ3mzg+OIxHy6mBsvNkCpAEfNd
         83nmGJSbFzkNXraC7YiDrSpfdhENH+XWFqtuYf3eqxmi4V4sALj2HI9qjv79m0wlYqEG
         KINu1F9SLWcflzZSj5Ctw0vewxGzAEgP37r56U/SVQ93rPsO+Hy6yMIDDeHwWw2gnhuV
         cOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I7HWR+XrxeM7/sjAiAZKDHqat2vkGa8jaXAxlWVZnC0=;
        b=N+H9f7Y5VSPEB+Jzo1Sejq9h3T8x7CO92TbBJkTMYwvbS2aIsd1co94aWL7qDmvU6w
         BdLH4z3CtWynJfVY94infALj6qFGo53NoJP4Q6LkEMaL0Kf79Rr6t2E71SR1Xw6BdpIe
         XCA5FR2ayqbSLdq6vHbBfrgOou5r5b+3tAWj5q4uCR0arF8ouDJsAv5hKnXAyoIPt08A
         G3j8ACUYf6n0mYTMC9aPDWPBXKI7Gv7KxOepIJUOjW321WAIHUGO8SjZ7MdI/47HC2fo
         H8zfMdVtJSnwROUeBh/CzfGmX+xOdgtjXCO+amPnHgJISu0QsqSST64vwR6z7Q2eXV3n
         OXsQ==
X-Gm-Message-State: AJIora94wOl1wTJ3cS6fIbzudcrApdL9W/8uzeVgFM7UE7Fhw5EvpIi8
	p1ayk4+SM1vWncTri0dBhc4=
X-Google-Smtp-Source: AGRyM1uxQ7dI2z4dyCllfu8yMXjcF4cxOxSDFWef/L9zfYb81WNkJaw0YO3RFllbFfTRoD4s7yXzBQ==
X-Received: by 2002:a17:90a:66c1:b0:1e8:43ae:f7c0 with SMTP id z1-20020a17090a66c100b001e843aef7c0mr3621574pjl.245.1655985449724;
        Thu, 23 Jun 2022 04:57:29 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net. [111.71.94.93])
        by smtp.gmail.com with ESMTPSA id t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:57:29 -0700 (PDT)
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
	szunichen@gmail.com
Subject: [PATCH v3 04/14] dt-bindings: leds: Add Mediatek MT6370 flashlight
Date: Thu, 23 Jun 2022 19:56:21 +0800
Message-Id: <20220623115631.22209-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_045733_448583_2DEC959B 
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

Add Mediatek MT6370 flashlight binding documentation.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
---

v3
- Remove the description of enum.
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


