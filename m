Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B777C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KourUAOz8IcUmVJaZcvu8aUOdbfWK51Y8UNancAg+0c=; b=nnG7jbmuDrYyvw
	O+y5VGgmsic+ZXbWiw5ZP6k0uJi7ohD8TT9GiCUrBQTR97COVVGHTaqQ71XWvJOou7Jfr/d+9yPDV
	OuPDNa9DNIbc3JPs3oG2wBMe2ip3hM8tZopAQkn4nrdQOONpH6ncLJNfU75eyC6RzpKkJxhfw0Fic
	hUHs8jwQhAhY8Vgjvo5nPV3bgD/ULq55+w+zh6ibthkOxJ+D6RZIau1gK2fkkwhQFduAn1f+76kqv
	hC9My+nCJ91FqKG9MBWsdShD/bNK2m+Mwm7aSctkAjzBp8W8yeBpz6aqIzpp45NyP70dgvRzQi/rJ
	c+oAYN6AZNpcKWv7fV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnaD-002ifw-Dm; Fri, 25 Mar 2022 17:18:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnYQ-002hR6-VB
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:16:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso4778919wmz.4
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWuHqcRax2E7zzIXZh7ToC5GlWwIxifW/4CmtpMgB/Q=;
 b=e9fQyZ0WE4Z9h6IyESMybIA7h3EtJ5dTgMV5mf91m3HTYR3d6PR3x3ANzlsJDjJpFX
 xyZXVKaHjuCfMF0lwm2Qu9a7yuhgIE8FNiY3Ra2C5iqjAr38LTWfu0BJ1+fhXSTWmUih
 aM3pvBv9RdHz220XVpBcXT8iiq7aPvagI4hTcp8GseBYMM+pFmDDxSClw8erRNva9gEY
 2imqr9DiFYjUmXQtnWctQLqe2NXNA30qtmtWcNWqvaW0TdlhnfPmu+EdWfkrn8Zm2deG
 A+8Q+xLGHP3uj/hxELbU2uz03u/3WDCI7leUQAxmTATuBJuts6p2eUn35MBM400RFU+U
 mxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWuHqcRax2E7zzIXZh7ToC5GlWwIxifW/4CmtpMgB/Q=;
 b=KzGCENxFoeOAMeZvFTC9+zFEHPpErdsZ2FMBgWCyGoW5urXLA/KqxsbmlUR3p73NrA
 d7oPm1Hr+8QSHVJ/ckWafTYOLPF7VO0AV7AqjDG2ttV1K1KtSf2IDoiLMkQSk6p6sm+R
 uHLF8qQtBGeqWa/kx5BJNhh/qYfH6tuXQE589MliRZ9lZp/DSRbAVQIGC8JQZFi/31AS
 Qr0i1ShYA0AKiMfaoqFYe3hifaq4Z7eBVs3pJpdeX1o/TcJPVPHjnVOY5qREPywc0rTz
 ZaMr9FsIRBSKWjLadAZ+ivuDWOOl0mGrWz9T9SGfHmkOOc5Moq9ZjbRrCqoT/BF4GtzK
 K6vg==
X-Gm-Message-State: AOAM532+9vDDTcTXqGL3ZcsVHwRhSFaF80plv7V74PnKLZvL+HUkc5V9
 tBZMMsRF8uywwLtQfOnkM0qJqQ==
X-Google-Smtp-Source: ABdhPJyseADl0QeZy7YFh7ZKp586b0q8d6AxSePwH+EeyXqFYla8oR9D8vfPuUxPBa3bYk7yPTd2ig==
X-Received: by 2002:a05:600c:4e91:b0:38c:c1ac:c018 with SMTP id
 f17-20020a05600c4e9100b0038cc1acc018mr15761137wmq.189.1648228609419; 
 Fri, 25 Mar 2022 10:16:49 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:16:49 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, markyacoub@google.com
Subject: [PATCH 03/22] dt-bindings: mediatek,
 dp_phy: Add Display Port PHY binding
Date: Fri, 25 Mar 2022 18:14:52 +0100
Message-Id: <20220325171511.23493-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101651_053530_FDAEEE9B 
X-CRM114-Status: GOOD (  12.27  )
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

This phy controller is embedded in the Display Port Controller on mt8195 SoCs.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../bindings/phy/mediatek,dp-phy.yaml         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
new file mode 100644
index 000000000000..4180d40f4fa7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2022 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Port PHY binding
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  Device tree bindings for the Mediatek (embedded) Display Port PHY
+  present on some Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dp-phy
+
+  regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Display Port node.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - regmap
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    dp_phy: dp_phy {
+      compatible = "mediatek,mt8195-dp-phy";
+      regmap = <&dp_tx>;
+      #phy-cells = <0>;
+    };
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
