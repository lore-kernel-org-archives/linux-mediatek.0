Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F78CCFA458
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=; b=DQNHhgXK+e4kBgXLLyU7jZ69Ts
	7GLHQTy9X64bH8SewQNhNDtNcDkylKom6F3Su4/I8B6z6S1r/GqbAcXWhjxlRpxpUDj1Ak+JrSQh0
	6YtKq0czuk6j46RIsLVJWn1WpxwUeBktDVPAHV+IukB9On9AiIUigLBTt6oB7zA/PGArxtfMP8xVE
	C/aQUIvOB1xRq1ZTUMGeIWBEBQ+sVcF9dJq/HfNO5TIDTYcum/+G/qGAfn9kFcXMeNmDmg4TzDwup
	bJdmAQkjgk+LobjfQirsZAr9iBKf/WYSqHp48OSHuJ4TiAi4BRjwFT9R8ojE3rrqj1CJjrcEsaVHc
	8k8C4o9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6G-00000007ZEA-48Kk;
	Thu, 20 Nov 2025 23:30:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6E-00000007ZCh-1Zyl
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Nov 2025 23:30:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso1160593f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 15:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763681400; x=1764286200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=S9D+hu2aMjI3md+gi49cy8UrjtzHhBEKqDUwMDwTV/J9kgGUWkNE6Qqi80+QZHIU74
         COJsfKgWTt1o20xdkwvXKH+oxgfG4z/uuFC3RvDkegAIoE1XDdhBPVe0YGeIvzLLKpGj
         FAKcKqCYlvsfsgeaK2ZDNnK2HjaxJUEPN0mfsiiz6tty1JVfiRlmdZWczaiVCAt8rik3
         /nJqQTF+bmOT/yqLd3n/ilDgL/Jc772Q10pzIiLtsXqxBqR6vh+FGKl1OkzP6KkbzJ3c
         3MVUid5+7tv9o7NA0x89+Lb/KgCbhRdvV1lGP8266LdchOMIpthsg2u50/YSx4o5pUY6
         ACwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763681400; x=1764286200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=ugTqVXBTFqs4OV22pt9sZT965liyrKvrWeQgAxgKPDm8s/fvRYm5S0YDGROSkRSwQP
         yQxIYNuNe0DKGiHXVPwUrV327FMuGBNdcVq41vo1RXEbUmhadq7G4eck/+s4H3mz2dJ9
         VAEuFbHoiLY2TEzEIuYZ1CALBw37AUL9OUFcaeEJDDZoehbkrl01LXTY+NU+wbCNkcaP
         LLH2rpr00TUcb1PRARPV8yrX9Fg3qEpg345wsrWa2zZ/We2KWepdj5RHtD89gNMyiZOl
         +b97RKKrZk0pFhsF8vu7jAH4/Xu08lLSn6tQaSRYaDftKMaaGVCzgUUYbaAQumXi21xx
         GHcA==
X-Forwarded-Encrypted: i=1; AJvYcCUahHK95t3czDuULW+jIXRBkmqMcdoM7eh559Z0oylzI9yEXcAeOslWNGEVfoZpACkbO/I4iRjuCJGA89MxOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ16wNRCgGy3n9oapYO5mvZJajlu9oTJoPMWjIRaT+OPP7Wsex
	k9ybs3Ek1nPZrMp6I/A4gstVVWSZ6Tbe4U3XiQoEsFNxiqCcXP+Cb1WY
X-Gm-Gg: ASbGnctUWD8ETs+2EJr1w6mkZO8oMSIEWPSNjAOXkExyb31oUHI958y+Cgl7PM2+jlm
	7v/4Rq2u8ckU+NUAc1SKM4gbOI6ybffuoVilyxX6PhTCm8X0O6XtTI7ecfMkEQMXJ1gs8lpWe3r
	0+tQYl66jwCt7E+nj0KI7U9Ey8/jbws6jPbmWY07s7SnXKiltbnCIB6SnLIgSKflRioi3MUeNGw
	yqDAsk3Yfdj0vMoeAY0WoenV6R+D8xBC0lb1TAS5EOBwJKoqP3f43YNyLLlgzpeH9knUjS/CFPA
	8Shi2YMWhwy53E7fujDWkkFr+1rZNpIX5UFr2Ei/a4yBgg1XUJATq/jbkoec8ptCXxcmTzREQK0
	6NZhWSytzauAQF4j14YlQFDG4k+ftv/gbCHgDzmm/2WhwCrGUBYZQGQ/b/rWYzQrjVNYfGJ8hGH
	DUiKqmeUokXRH1gaPcYtG/nZKgjG9j/mGCJ7cQl8N2
X-Google-Smtp-Source: AGHT+IFkcSWktgO2c9cw3ZmsJgiZ5al3O9HH0pDkGB4u/dkR0XIinpd++pYOt4jbYtH4OgfnVILTXw==
X-Received: by 2002:a05:6000:2284:b0:42b:41d3:daf9 with SMTP id ffacd0b85a97d-42cc1cd5d3emr109924f8f.2.1763681400373;
        Thu, 20 Nov 2025 15:30:00 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm7776315f8f.36.2025.11.20.15.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:30:00 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
Date: Fri, 21 Nov 2025 00:29:10 +0100
Message-ID: <20251120232913.32532-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120232913.32532-1-ansuelsmth@gmail.com>
References: <20251120232913.32532-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_153002_430453_6F052A89 
X-CRM114-Status: GOOD (  12.69  )
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

Add documentation for Airoha AN7581 with WM8960 i2c codec YAML schema.

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
2.51.0


