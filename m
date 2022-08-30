Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1586ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 03:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=; b=mb09KRw/vFNE0j+rcpMlyyEwmv
	SYWDZip633MId7Q6XQj7iIWYsuQ6RB8cnxWoQob0+GIGPvDzh3DAPA0cik3u7yzNteedG1psKGd1L
	bwCU4GBAcfuwf5K/JekYKJqLO98rgNq2M+N8rMoK2UB1nwGI9S4v15U5i3Z0dYJxXP3ChVwwrlmyv
	lAvYUXCMTpvA9aEak/4wfQfnnOOnU5ClcLwQzupO7yRkBwQUwdHNmrTEsHgb824vmaSKbvSKh6qkJ
	gP1xwubHevt0IgAMaTKVx7LX2SjA/A5T6YXkP0QHmr/+dkVKuFSMFRL2D0R/0IXem9RHwvebpL83R
	2+EEkIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSsAY-00DqSJ-Tq; Tue, 30 Aug 2022 03:44:06 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSs8Z-00Dpae-7T; Tue, 30 Aug 2022 03:42:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id z3-20020a17090abd8300b001fd803e34f1so7998920pjr.1;
        Mon, 29 Aug 2022 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=kC8ejgxBHW4BvKEvMuzbJ1b7vMRdrhYLsB+0dVMOcni16inBeQb9PK+Uy1jwvm/SYV
         8ldjsDxnSq+lQiOLdlADmDYA/GFYN5MBipfGf4w+TAyqewCDjTsepQ8S2jvZv1nDFVju
         fSRr5pmIy28/XEL91D0CILqJ8guDmAL54TnK8xXqkApiKByjq7PXUmXHjTuWHU6MDk+w
         zKdjyIQSbpb78KZHgdTEC2ieq82K/HokmOsqXUs3eBayOFk5FguDrbgf0Qt2YIAb+LjQ
         Wpta/W0OnEdxtJZhNXKvhXuueNzcPLMKpnlpiulpfF++7H91FWLZIbTuqJOdpZi2V2pr
         FPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=QmV3c8Sb1yM5cybnVZOJ5k++N9SHWYJFRbFj4ULZtID+wOcdSKXF7w/oZOOONYCiDm
         ifPMbOK1X9AfVW5EoaX7uGrRKPIBPFi+VvUS6HYZRWQGnd/x/HQ+BWi3ifqgkWHbiJI7
         qCLkjTR7t08niG7PRfykCmQZ8+pzoVkFUKjpCyOCozMdWCNxwX8lEUVdnTbbhhTRNV8c
         BVUhQY3vRTYhcRXXgz2S/gdoOmP6HVaQ0ExUEeMzCp6rq2+4bl9DqyPj0tPk89FKbGMj
         rYYdZ5lN8/NxLCT4vTnwJSH8IComAI5XeiO0h7Wg9KmdVSu5AGBYZLh3hhHK+zNEFP0U
         7IIg==
X-Gm-Message-State: ACgBeo2qXaQBd+xTlj/piJzjEhc4u19z0eBNQn0vK0eJjl7lsj7pElJ/
	aeW9tZRD12Eg6Atr8PHk5wU=
X-Google-Smtp-Source: AA6agR51dE7ptDcuLrufetVtj+iEdfE6N9pp0vDnAfNSISu8pYX+GFkZu4hpsqWd6ml8H3VuqulzMw==
X-Received: by 2002:a17:902:74c9:b0:174:e7dc:1dfb with SMTP id f9-20020a17090274c900b00174e7dc1dfbmr5407565plt.1.1661830918558;
        Mon, 29 Aug 2022 20:41:58 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net. [42.77.88.242])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 20:41:57 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	deller@gmx.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	andriy.shevchenko@linux.intel.com
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
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	andy.shevchenko@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 03/10] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Tue, 30 Aug 2022 11:40:35 +0800
Message-Id: <20220830034042.9354-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830034042.9354-2-peterwu.pub@gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_204203_330811_E5F0C524 
X-CRM114-Status: GOOD (  11.17  )
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


