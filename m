Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0C7C4829C
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Feb 2024 21:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm7RlLurDkB9nfwalxlLQ2JW0yHxYihI8gdZfuipTWc=; b=VXDgwi6LG90Gz9HNND+2VpmBuY
	4hQhljUnqCtf/oGXrCogNMs84G+8BPtf4KywVPDq25arWD6Nr8WbmFP17CO/AeS9gzPQAHGDDPzG/
	uuRyHVmbzMiwKw6i8KyZ4uLgapxjD/K/VXaBC2PF2R1+GO24nnuntt0a/bMaxDANyzzKoB3z9vVh/
	R3B2y6DCzhj4r1fZH0fWVWq2aroXwDyu2JShaIpfb82VfdIV8LinlSMYURtQFoPVUDn1WpSPrMaJe
	BwHs0kF/3/Bfxks5fpgtU1V4LH/F3Qd7JexIVcvQ76dL5H8JNkf1OlV+W9t75ox0LqAvMtDss7vFR
	qT/A37sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZHYB-00000003M2d-3gtC;
	Sun, 11 Feb 2024 21:39:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZHY4-00000003Lyd-2pNt;
	Sun, 11 Feb 2024 21:39:42 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a3832ef7726so293588166b.0;
        Sun, 11 Feb 2024 13:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707687579; x=1708292379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm7RlLurDkB9nfwalxlLQ2JW0yHxYihI8gdZfuipTWc=;
        b=UjFzX0HqEfwPgfMWup4m1CuKIHrtbEc032xHNnNsgU9d7ycO1W+WRW31Bal7bC7IIM
         88sNZbTEj5tcnOfuWDKSrIBHgYLzBsdaiiWbgxj0LswNWzd9vuqqFqgtnn1T8h9l+yrD
         gw0O1YXgAnTJFnl0DfSgmV/Z7wNmreZ9xGIq1VkRKr0T1XRW/b6iGV9uqUFPNBGChj3e
         KtAZMcq/dQDKWavimC5v4OaggCbQgGrTdm+8Cnm/F/IQnWnLl5Buqtuadb0L6J8ldr4W
         e3oC+1CeNjIxzV1fqpHFz/OXk/wkmiWUbi50O77UZYyz6VVZdMVfhZ53Ipt9jjm/egV2
         5X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707687579; x=1708292379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm7RlLurDkB9nfwalxlLQ2JW0yHxYihI8gdZfuipTWc=;
        b=ZXtHMFwnoJdS4Ayrm2TOKY3uatLzrqDdEcT27tzbQ/SMcjZngNlQxyE6HBJgCjedAI
         uHOgCLWssfeeuoY7fGwaapgvk530MwS0V19e+0NxHSP6dqqmycoT83XGRui/nFLCZhQX
         PCk8Zb4koNGTSJi4vuWpzAqcIM1OjpsuU1hYHygjgDYoAxel31N9bGrnivQPqNm+7sCk
         ib9Ev71qWZFhNyUCltsgm/0L+I38xs8hWn/ozq6tCuAuWIxzjbt/cER2neIQt6SVYzT0
         qcrb4DsEyT3JnYJoFsvzMryRHCPfvhs0sf4Z3glkku2WsxbO+uBxJ/0Xv96qBnlvvqHD
         zBUw==
X-Gm-Message-State: AOJu0Yy1LpCG+gFtO7UTaQwSQXHjGhaqccuYh921RVrzO8RQRI2Joaaf
	1LYMLCww1bnVjxVhFYIY4joAGzkzhyIYyU6ZxnH8DhHd+SUnwWYk
X-Google-Smtp-Source: AGHT+IEWEGxiqa0nVStbul3b5PFLnalXG65PJVNIAUyBMQG81zfzM8hx+xJmLTO2HQSakmnaydRC5A==
X-Received: by 2002:a17:906:230e:b0:a3c:a655:3a3c with SMTP id l14-20020a170906230e00b00a3ca6553a3cmr412496eja.16.1707687578712;
        Sun, 11 Feb 2024 13:39:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXG0zji+/RT4h8jx2M6HlPz8tko0mW5GDcJr4n0rfjWvJlJE09IZcQmaTxmr/wKnu5NQV4S1dFz5Fc2pdhn9vFQ5rymN4bSyZeVpF/vr7svVGRrbOOyCPqAAf2M4RzqpJeV8sQjIyiw96XXVi5axlqxOIswoti1Ss6ZIAWdy5v1q4c6R16uy2YkOm+p0c7hEZpjjvBzMQcfWTFTLUa7W2d7XyC0MteXTica8HOk8yDueWGxhlWD6+Wx/b4BdWJottk7DDlR9rCivSlbVuxgRNFyHFIDvLu4410sunh8VoYifm7XgglF/Qjn6YA8qYzJLS+I8ZtwVVZPPC8f+Vpiftqbs1JeAIkW6jZYSgAntktsllWDMfCSn4xBG9ZlIAhQny4WnekE/1MWlAfOeAsoJVcD1/64hPzgDDvLN80F6O8w8/oxQR9I5BwT+Qs9qIPbD7t+phL++ZJeH9DGCohTscDu+mJdS2+dG0PNt1hH0GE0R5w7hSxDmzKImjEIw16riFekyaEyKDQERRbJpJu/f8rEfIv5YlmGaPnGZQvizx2orwLODw==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ps6-20020a170906bf4600b00a3c66ac512asm1206344ejb.214.2024.02.11.13.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 13:39:38 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 2/3] dt-bindings: arm: mediatek: convert PCIESYS to the json-schema clock
Date: Sun, 11 Feb 2024 22:39:24 +0100
Message-Id: <20240211213925.18348-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240211213925.18348-1-zajec5@gmail.com>
References: <20240211213925.18348-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_133940_844305_C016D6D1 
X-CRM114-Status: GOOD (  16.68  )
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

This helps validating DTS files. Introduced changes:
1. Documented "reg" property
2. Dropped "syscon" as it was incorrectly used
3. Adjusted nodename, "compatible" and "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm/mediatek/mediatek,pciesys.txt         | 25 -----------
 .../clock/mediatek,mt7622-pciesys.yaml        | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
deleted file mode 100644
index d179a61536f4..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MediaTek PCIESYS controller
-============================
-
-The MediaTek PCIESYS controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt7622-pciesys", "syscon"
-	- "mediatek,mt7629-pciesys", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The PCIESYS controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-pciesys: pciesys@1a100800 {
-	compatible = "mediatek,mt7622-pciesys", "syscon";
-	reg = <0 0x1a100800 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
new file mode 100644
index 000000000000..c77111d10f90
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PCIESYS clock and reset controller
+
+description:
+  The MediaTek PCIESYS controller provides various clocks to the system.
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7622-pciesys
+      - mediatek,mt7629-pciesys
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+    description: The available clocks are defined in dt-bindings/clock/mt*-clk.h
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1a100800 {
+        compatible = "mediatek,mt7622-pciesys";
+        reg = <0x1a100800 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.35.3


