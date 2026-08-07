Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8D6C2A09B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=; b=C1jG/ltBKBDjyXLbOIY8cOZfZK
	wZuHgw1fms6dsxGnT3libRbmmetLs04A/DVn02r6e6jz3I52V5tLw9WP7gH4Zsx2O3N+ife9CjmOf
	jftQ6DAg6BH1YA8Gkmjx+k9MtLyfPg4bLIpVeA4GKn8X02NM9WgqVj3pP6mN9Rs8pWSpxjCZo0W+9
	yOLwB3xRPjaEeggbDb24miglinRSlSAImiNgo4AHJEvjYfQS4aAf4th7cF7fA27K3pwG0dE8OK58P
	Z9kgOy1BTs3MeQ24k3w269UFTDs0n/OSNpwEVuo6JloHErCWzpo1bMvyTIlrl1C8xIgU8asiDO0Tz
	nuPeuEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt6-00000008hKF-3OR6;
	Fri, 07 Aug 2026 20:09:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt2-00000008hH0-1SVG
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 20:09:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495635a85d2so31573345e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133386; x=1786738186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=BQrKOCASNwRnW/NYkzM4VxT1RWHYEe45pFZdtAUBoaCA5nVkdedr8h2R7DwuTMlKRP
         py+dLLG4C6lAvR6G8rWM8k7ftQYgpIHHkjmKm+wohISn+yCJgojDdsmF09MUJ7JVAb+d
         aS3qVZQhWqaoUJQFLn4BAo7N5Yvitnd5Pw9QGMAnGuGRqaYjETXtqWWPoNvuj37dY24z
         Jvauz3nqsPz86EE6v/pyNl8vlkQ77YOIu2iFkQNH11YjDDbL8adwQn+x2y1OSL1lhF+C
         MqjqkFzhQUeESxzu9fSK2OW44tGqaBDa6j/9T8jJUA6k3onAQEBMbniQUzT4vNkKe9wC
         GjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133386; x=1786738186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=IWn/ps/2KlqNLQJsP8SvYdCwE65xeaqH60vtFIBEjKJ5OA2NZ4HN+E4eyKPkr8ohw+
         czZgdHago1WXfTdK7cJb61vyhxBs8HOAkFxViOo4vELGkgOK6NhI+AJLqATW/nk2tZqf
         EDWqPE87bcysoKHLuPcFZ5lb6ISAb9SXWjrd1QRsyRMPBIRi/jQSn+hPB2FmsLfXCnvG
         JBFzyysgBAjz4UMbyLT/EF3GMFjg6XwSTUqrOdemd1v/SgaE5+PACokmuIa9u2Kym52Z
         T6Z+E67AjBLyFcJaHox9ZdMq/Xu4Ry7YA3yoeRmopjwqhJWKrzBIkkhfq2VOr0Ne5gC6
         l4oQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcyUXpTRHXkI16aPqFWduTmqPqq2AOzm+cXA4vrkQzNKK1dVKDoCXz2Rx0MqqQihX6BRZxyhCxR4dub3D8Mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjWQvdvisrqXDwgQCoRX7YuXQFwc/p49xprOqnFYQcmZ29+h1w
	0iEKeoorWpGJN61Iu/77vkQelkJIIK3IqhbDhBE6lTmC6nzNWlsevkpG
X-Gm-Gg: AR+sD13ld5S1tOqmL5VwajzNi7eqDA2bx5ODbO4nmgTWcby9lz640m33YFoyRSXKk2M
	7yuTrszEFN9fuaWiHsss7sFAUP5OUUf/NAnFWAgDvVdxZ991imLLwrtIoAOYYXTXTKc6ZKdGPDl
	a4jUzDa45P2D2sXV+JQoXQ3VRuvZVs2Xni0iJdaD3lnAkHMMs4Rgbt4v1HEl0hB6y25tw9jaDTc
	vf0uSNOCjz/uDw+UXgMUrBQWNv/8nKhAMUJHwmgGG1/jSC/un5UxsKt5fZyUT0O81Q59JgRw2ee
	/qQL9JuLpW+68l7/ztzbiC3Nn4zj84scBznLgSxxIzNoFqAD4iHUQiG4CGtGqcvhD+cEHEQBgHz
	oWgQAMF/C+o6xLwSicDQXJalyGkwWLQ8ZZBJaWAy6qTAGxqpTrvhZ8UHrKwxruahO3FnZ3OpMF2
	3Fu7ux+Op5k72WcsNPiLK+dvXL5N2kk9mGuxrV39ihA3x6ignlWz9b/gBy7hnX9OF6jjg+0T41J
	GtXkW6YAUqOerwgmA1D092UdXpY3/p6dlHfjWh6THDJXG/ExkAXZDVwMEPFNgqG
X-Received: by 2002:a05:600c:5791:b0:498:11b5:3ff7 with SMTP id 5b1f17b1804b1-4994e7d8a85mr280779925e9.18.1786133386236;
        Fri, 07 Aug 2026 13:09:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
Date: Fri,  7 Aug 2026 22:09:31 +0200
Message-ID: <20260807200936.201827-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_130948_393750_A92C7846 
X-CRM114-Status: GOOD (  12.57  )
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

Add YAML schema for Airoha AN7581 AFE SoC sound card.

The AFE handling on this SoC is very basic with clock always enabled
and all the power saving feature not available.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.53.0


