Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A46C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syoRFXdXQzcM34VIbzkvZvVLjPFv9mAzVTqdtXYiV5Y=; b=bBNzhgRwMoZtH6
	5MhbjttrUE/ws0SH3dBcTTR5X2uVHGSu5gT53RlyQ+/zFxtoRNJaeSePPsQYlYK0bNyqji6STFBYD
	1uljSHGWT3Vig4G+r3BprVinaQ8YQ7T+gv3xREK4jDZXTe3q+BaZJOJjiMJDpZWfyKQqraimuW0js
	dN0OdyzqA2+L+IRh287iAtMWSXPdHwBNj/bwcnRynxuknwX6Uh14O34/e9kmeuhoSmsfZOz7igtJ/
	0K0SPakhLUUg5lvQ4v8M0v0i7u4Sv8XGahtZrIwhkeZ16K677J4geV4wUb9ki/OATRDfoXdtYy4d1
	CpR5zanqxB+lU7G7vfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1Cr-00AoyC-OH; Tue, 31 May 2022 12:42:41 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1Cc-00AotS-Bd; Tue, 31 May 2022 12:42:29 +0000
Received: by mail-pg1-x542.google.com with SMTP id 129so8452988pgc.2;
        Tue, 31 May 2022 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U7ahqBydDZnP+CjyjsQFK3suIZ5X/7W6Ul5AL8gL7a4=;
        b=pbtIgDiOlAAzMPQJX9RSET7wKKMb0cURNTYAf8khBIJ7tgAMritvSeyBHK88OgWp3J
         p2eY3mg3nQEC5svVgaRYVeHAiWB0LK1plQskY/5QYNoiPRdVCIIoFp6C7FMbAF8UGrrd
         lBadBgtoaMg++H1MWs2p5uzAP/rBSoi7lJAW3YNDUwxLdmQJga2RGklhnlZheYx4tGWA
         JDLreq67j91X+rNozmBhfZclynEPT46jWN/SwmgF8xb5UhpKWmTArXQaEu+WsdRc677y
         XMwxshss89EaOuzNJZgSx1EX9fVS7xIgMGz1U4lbxqWjQpEQZw1NlJ6XcpFM9jWAulGH
         LEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U7ahqBydDZnP+CjyjsQFK3suIZ5X/7W6Ul5AL8gL7a4=;
        b=EPieetC4rJaChnW004AmFP0NG37ywOOnSMi8m04u/uk9EZMurSbw2yvZC/V9byhLDw
         Cd9XazVHQk1fpswg16wH6hcB0ESWwkPp200RCfmhj3ACXdIslwS9UmxMzqKhHK7R6eO1
         amek2eFgKba6i6J28f/ia5wXL7dufjkzbFmcuVLWPIZR7/fgjyvexxyb6pJg4N7LAxyD
         BlWpjisL67ed7HJxF3Z1zoIhscebZSicv5T46nwYy3TKSYLeb3Dc18NgjtzMD9DEY8b+
         oeWJXw2a39+ZWqPjSSl+3l5IoEa1RdDgcv4WTyYKAfOka9ClgETE71Xxio0d7ZVlLQcO
         VYVQ==
X-Gm-Message-State: AOAM530Ws9rstrEquoi5n4YDWjkBQeQqZOmkznpojIAnZt9xSYe3FAJO
	KWlj9o5Lk5/6npHJM/ve9SLW5FJ9PQs=
X-Google-Smtp-Source: ABdhPJxfNtDreP69KzGE54ZQe7nNgxdxT4MxnC6lkz0a7elU8yTD8DI/llg0zMIxb1K6PG6nwQyNxQ==
X-Received: by 2002:a63:1066:0:b0:3fa:c21c:bf38 with SMTP id 38-20020a631066000000b003fac21cbf38mr29418134pgq.453.1653993756469;
        Tue, 31 May 2022 03:42:36 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id d19-20020a17090ac25300b001cd4989feebsm1525829pjx.55.2022.05.31.03.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:42:36 -0700 (PDT)
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
Cc: cy_huang@richtek.com,
	alice_chen@richtek.com,
	chiaen_wu@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 12/14] dt-bindings: leds: Add Mediatek MT6370 flashlight binding documentation
Date: Tue, 31 May 2022 18:42:09 +0800
Message-Id: <20220531104211.17106-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531104211.17106-1-peterwu.pub@gmail.com>
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_054226_424356_E9634DA2 
X-CRM114-Status: GOOD (  12.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Alice Chen <alice_chen@richtek.com>

Add Mediatek MT6370 flashlight binding documentation

Signed-off-by: Alice Chen <alice_chen@richtek.com>
---
 .../leds/mediatek,mt6370-flashlight.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 000000000000..b1b11bd3d410
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  see Documentation/devicetree/bindings/mfd/mt6370.yaml
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
+    description:
+      Properties for a single flash LED.
+
+    properties:
+      reg:
+        description: Index of the flash LED.
+        enum:
+          - 0 #Address of LED1
+          - 1 #Address of LED2
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
