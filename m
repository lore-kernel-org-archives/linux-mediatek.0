Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FABC55167
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 06:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnCPTgzK0K1N6KmRazTWagiYgQDYqM7+kmHEqM+ZJpY=; b=45cz3QhG86dVUg/UCaOe8osSDx
	H38OnI0xGbznt3KtNNFinlY46+XYK1a79iHvv2SRPly2aAdRkUIChXUPfEENLRDC+4HAtahrtt4ol
	k3l2rJMBY/ceQox+v0jGpHEafMuLJm3xGK2Ehe0ffug0TLdZiWISZuRQa+5tD/ZwCpqBkT/hMcqcH
	5Z7AFOA3lqGolNSt/EqM+tyiR8gfMA3sR/lhEgYADGwgYScYjguzblJrSFdID7+LeW2tKP/ZfKUDz
	vyVEhaH+zfok6EvBsSoRmvoQFxOtAx2lD0LjQJ3NLqTIjyvjl69KwhDVFNEg4I6zi/kUVl9sJ4DoJ
	OtxavzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgy9-0000000BttT-1DAu;
	Fri, 31 Jul 2026 06:43:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgy7-0000000BtrZ-0RVm
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 06:43:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so698980f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2026 23:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480221; x=1786085021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gnCPTgzK0K1N6KmRazTWagiYgQDYqM7+kmHEqM+ZJpY=;
        b=b8rAhU1N0GdWoWbagT/gHFHfJ1IN1j0mo9G5z65FLcpPHvJK6Au5QLYlHZra565F4A
         7+lv8+4QF9EyDq0QzZHpjPHiICYCdRqykh6k18VpQXoDndcDJ3q/tnzr4WjCFIq9Iqlb
         2kEjyEnYT66kd+gzt0j6c+f8M5UtJVLpLvBazBMtXxVXEQ8d4Cn5IXLr0PSg7SjBwMx+
         gtqDXYyCp5N+xI7JH8kkwTXmi9lPFyaHsUeR2li2y55lNPvMK9AWD0qhVlMZFuFmCTl/
         n5Y0Cb3to8nw4qp9Z3onbDSFbFthZDMHqL55xOxpfX+AU/ThmTGWlgiAVhT6ekMe1yON
         KDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480221; x=1786085021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gnCPTgzK0K1N6KmRazTWagiYgQDYqM7+kmHEqM+ZJpY=;
        b=di4W8+Aq1cXFL6SrZ7gAC0K2prk7eP9vI5Rjv5CZhNNdPt0aYI5xPiyMQiRXebbbbW
         UtmbOysRL4HAmK1pmoVtRGqCOD3eL2L/812qwXW27WPsxWe9WECTWZbluR7Eo/HZFzQi
         KjWPJ7br2VfGczYCBsT5aRnc3ytZ3+Eme96HILeJkbn4er4DwxfJmRqRGSEUCusB5guj
         fP8Ia1d1uy2biPzB0asihCTvaP++9q36MyNTnyuuHx1ES4fYBuHCgII3TBHLXRaIIueA
         BKuYTRSG708xMf3tTpDi+NYgDrZLHfPp96l+yFcKhx7qc15iS5RNnfK4x3MbElAebu2z
         rdNA==
X-Forwarded-Encrypted: i=1; AHgh+RqDYJd6ibF63PzzEzpN1qLm9w4slioTlymOO2yuJ8zfCQsQMfLXN9ZKZFIK3oAS/HHUnJ5bFLeGoowDh+sQUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTf769j+51Tk3MiSaBUV0o6JagS7FHvdJL8VZM4wPr4eDSNIKg
	0HjlFRREwTjrcHQGswVss5LfZbnltlENsjKw7JCTZOG20++775hu/YsV
X-Gm-Gg: AR+sD12qLCj+h9DLR/8TIvhL+aaHNqZPnBHbPdT7WsDb7PwFRxl+3vKPB1UUk7fxav8
	IojuMlYUsgtA/l2/0ulPMsoPHlj/aeKeJs7cy7mFDI4m7TpC6BZr92sqe4YkQujlCoLyFIy1bS0
	FuHod1G6cipoaQP4jI8y3a7VxXj4m6IaNptcCqDPJn1lNBJBN+DoOEiZA7GNiftWZWB4qXU/7Iv
	IHGUjzf7+Pg7ze91MOwct2oevVCxvLLiopd2BtJ+yIPXVMS+C/tiBJU5TcAJ/+Xj28AB0J+HqSr
	QkcgPRN8z8VyWteP191GjvKinRkoIkbOyvbr4Ml0oh3awltykdTDNT20SoxDnwulFCMQI18jrXZ
	L7BMkkNUxtMVawjPETDLyDLy5R7JIYGjQX5X7KHo4leJS1bI7piCR3Hfto/eYww4fTh2Q8MWMIh
	M7N9H52nl81gSK2Mw1bMYlGzWEdA+4TgBBgsDsBViPRDU3I2ViT7ibiCxGN1gTfKjbM4oGqQWpv
	6b4nl5rMqDp6cMW8zFiOeR5+RZGdI8dlsWi/wxuLCOdgpp2GzYi3A==
X-Received: by 2002:a05:6000:2889:b0:47f:9442:f753 with SMTP id ffacd0b85a97d-47fd2b5dbb3mr1767774f8f.52.1785480221395;
        Thu, 30 Jul 2026 23:43:41 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:40 -0700 (PDT)
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
Subject: [PATCH v4 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
Date: Fri, 31 Jul 2026 08:43:21 +0200
Message-ID: <20260731064326.2284228-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731064326.2284228-1-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_234343_171605_D95EF309 
X-CRM114-Status: GOOD (  13.19  )
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


