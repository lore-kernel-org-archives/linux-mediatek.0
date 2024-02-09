Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CE9C48297
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 05:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mf57nKobtsp78hnGcDhJlA31IVpSkcv337k1qnzv71g=; b=NXeoEfjfM9s37545J6IgHCoS4p
	Zv0WgdWoGKSMC/kKcn+8phey4N0+/I4Okkw0xXBQJ7Q9PgYw2MoQUMenWxjJL4+oDfjpS+fekAhSV
	E+PJn1eZtzTh6wl4iRYr+yEPrpVfOdO8RvD6QW0glKyU3eksF8CzLFTiG79MGHgrZHuUKB5PxeDl4
	oF3wjuwHyNkKgmKgL72eoU4aqsenPVindXTWpKp3aPTTjD7Ln77D81EMfdtIotu/6lCRny3eUXJLQ
	NllhI1t/+wiIU7SpUvT+dzkxWZxqNq0l1XDFGGOp6NYMlzxhDcRo1qz2yb6N7kTsGOy0uhc/e53t+
	Df9iKGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYJoL-0000000GCQJ-1rLR;
	Fri, 09 Feb 2024 05:52:29 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYJoI-0000000GCPf-3YhI;
	Fri, 09 Feb 2024 05:52:28 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a381df83113so55071766b.3;
        Thu, 08 Feb 2024 21:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707457942; x=1708062742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf57nKobtsp78hnGcDhJlA31IVpSkcv337k1qnzv71g=;
        b=aLE9j0tDHeKCiU7E6YXYiyT28+K6mdHfZqqHTni00B+Dm0oT00VH36JRyDPgnwn78q
         WC2iEKo4gWJ7O4mo54LOHnwn0qKKA+LcVbstFyJGraSlJRCm6TIB0E/I3ndJ++t6vnbZ
         WY2jtINDk+VYd2fGPxpXa+ZtlPzFqQo0NEv9LLzqXU0rBiPa7YmVTCcCt6Fu4oaLl0YK
         yFcTivOGj/mjeubedn2ynKGv25FXZpsMH3crrUJIlW49ZpwVpcqnpFA2YtYfiIYfzHQh
         h5VJ+tlvV29EQ7vX1kHqfMfxX0sWyA0GDU0Klbk5TDqIl6jbUAEzaKCDVDXkG9GLVqh1
         cl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707457942; x=1708062742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mf57nKobtsp78hnGcDhJlA31IVpSkcv337k1qnzv71g=;
        b=HvL9x3uTDklrzhb5DtiOkp46+vbbdZuXEDKpHQb3WOMyXA7DfttQv3QqevSzhj+sKc
         Adq1sl9wAw9uHuWdzjgCnyPUCBqlF3KE4QLu4cazv7wBZ0PObPVsQNQ5/nPABu5Vgcyk
         dcfTC40RF/l/YFC8qKvGQyeNCCNnHBwk6opMoX6oNRkqF5gFA6pvvystmqZjW+fdR4zY
         3d9hecc0wouR8tep8eLXah7bBbMyZuq2VJZEgwmlW4p/86kEmL3Kk9OPuKaedjL80PVC
         Y5hTsFCWj6jZQ92oinGaovAL341WCc98ZaHx8p6maPQrRJxKuXl2/EGzlJF4bVnKyhmc
         UVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVVawWSFGTV7fVnhVnfY+lkUV+J1++0HmF8q0QcmWRpJIzKVLphIet2/Hye2mmItZdhOQPyo0UFkYhNHqrzEKrU9gHKruqfJeLL3taZSGYxXxLfrq5wwk9G646jpgsxdgC6zaXaFJ2JISUY3UZVMkwcpnnyx8vSic=
X-Gm-Message-State: AOJu0YxoqOlQLZRpG71t2zUm7O6112aUrMasgRNYwDWEJZf1p2HRnyJu
	WOmJP628sml5OMw7qjj8j5VW2gsj4UNMsGgtrZw87Kd0uYQ/J1qT
X-Google-Smtp-Source: AGHT+IExdn4j3WLpPkGZHSKFJQSuFHiN82pOOTC6WPoYbiqwyvGkAeQonPfG93G/w/yBTpMA0QcwdA==
X-Received: by 2002:a17:906:1156:b0:a38:66ef:14d3 with SMTP id i22-20020a170906115600b00a3866ef14d3mr334720eja.13.1707457941890;
        Thu, 08 Feb 2024 21:52:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjiSfPNrT9WvFt7lXwMCztpAG3PneMTXFgXSZNJO0QyErCoFzz8jHQ97qwEZQzOmh1KGcAgD0kijIEZVJlzrwCHTY1cJan8Z6xfHt2mUHit0t+usAqd3KUFEmaTQOwANRE/62yreyyvM7cOEaIlM6kJ92U2MEDPRe6ChZ3tIxvEYDqI7wMir0jIGjVStl5TusC+nLm1bYM8kcBj4776kpqnsiXeSOcdVpv+AsSezDDFdnMPF/iRgAg9dqdlumnOObL1KP3MRzlLtsYf1R1B0BloXTngqvAtKn/2S+7aC359odNoT1wZe3XCWTItO9WG7R+U91vXs7x/XH/TlyoXPSqbrXxNqb5HTZbtBTFAQKVTzXBrCOo/ZgqTuxnwztu+1fdXRuXEgdQfjDm5ugcsTNEkxMFjXdO/kNcn3tQK/VY0iNtaI5Tun4dE7XFqrdgzRxYxy2liKG6JxhsIix4JMeSS4Fn5v2aieEkWm2q3odDFPcmBAX6e8ZapFSUx4tKsx7nZiZr61zoDh9+Eg2fyfBlKH65lzpcRcQWQ/d/QJ4D/MTHsZe0pOtkliA9Rx/KBjJtEsgOGoVrsjk0GR/LxjChgAap
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id vk3-20020a170907cbc300b00a37fbee48f8sm404551ejc.133.2024.02.08.21.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 21:52:21 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH V2] dt-bindings: thermal: mediatek,thermal: document AUXADC 32k clock
Date: Fri,  9 Feb 2024 06:52:03 +0100
Message-Id: <20240209055203.17144-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_215226_937732_C9ACA54C 
X-CRM114-Status: GOOD (  11.58  )
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

From: Rafał Miłecki <rafal@milecki.pl>

SoCs MT7981 and MT7986 include a newer thermal block (V3) that requires
enabling one more clock called AUXADC 32k. Require it in binding.

Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Disallow "adc_32k" on other chipsets (maxItems: 2)

 .../bindings/thermal/mediatek,thermal.yaml    | 31 +++++++++++++++++--
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
index d96a2e32bd8f..e7373d78618c 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
@@ -15,9 +15,6 @@ description:
   controls a mux in the apmixedsys register space via AHB bus accesses, so a
   phandle to the APMIXEDSYS is also needed.
 
-allOf:
-  - $ref: thermal-sensor.yaml#
-
 properties:
   compatible:
     enum:
@@ -38,14 +35,18 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Main clock needed for register access
       - description: The AUXADC clock
+      - description: AUXADC 32k clock
 
   clock-names:
+    minItems: 2
     items:
       - const: therm
       - const: auxadc
+      - const: adc_32k
 
   mediatek,auxadc:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -76,6 +77,30 @@ required:
   - mediatek,auxadc
   - mediatek,apmixedsys
 
+allOf:
+  - $ref: thermal-sensor.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7981-thermal
+              - mediatek,mt7986-thermal
+    then:
+      properties:
+        clocks:
+          minItems: 3
+
+        clock-names:
+          minItems: 3
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.3


