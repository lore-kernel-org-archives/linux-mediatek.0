Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE5C4829B
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Feb 2024 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EDbWqws9cGFaTSgQ7d/JTeQtcU5zOGhJZiE31yQ40s=; b=x3EYpvOvh84ltaxVMyKVxRbe3F
	zZlwactt11MI2Xsw8EkCxKLlQGttadj2JyyPJlir7IHCtPcSSi0MxUgROJXtzQrddXTQTB1DChwHa
	E8kFvSHD6GzaIYu+i+Q/pfU13sVM28ZHTsprg9ErbBhfpXsO8Ts101Xrj5DbPsz7Q1hGQL/JfdUJt
	7VZCi6yD3FWHbeu17ipMqjZijOmGoYsodJibLxxQHKaVFaQrwPhVYnu4F6FkUd6KWAy/BoRsT+mIO
	FLBLAX8jIuu9GN5tvIfwqCp6GVDcSkj1D1Q7UplJV/3nww7OPBONZ1oook/1krcybNC0vSrz8FlQY
	L+TF9s1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZHYI-00000003M5v-2K6s;
	Sun, 11 Feb 2024 21:39:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZHY6-00000003LzV-22Uh;
	Sun, 11 Feb 2024 21:39:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a271a28aeb4so322939766b.2;
        Sun, 11 Feb 2024 13:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707687580; x=1708292380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EDbWqws9cGFaTSgQ7d/JTeQtcU5zOGhJZiE31yQ40s=;
        b=TnInpcW12KDCyy1ySpmNxLTA5Tx09PAYf5+MgdMJh4bwV0bWqbohYPqfrK27IzU5/A
         W86VoLRWxoQ2OZVd/s16cb/hKpY+3k+iRbEYxD1yPVAFdC0FNLBSiYfd/5UDTZgGhvr6
         4KfuUxi54vfGlWbSwAq6D6eXsDvNgyoUbJblqUF6sCGYUAQvC1oRyASv1Gwue1xT+ORK
         WnTDd4cuixheMW39YhWpakQxEk4wb10FwJTHB0BCoMtgUzf/IXg4iyibXoXY3jYibCnd
         qTcBPhM+So3lRZ79+lJdqmbHTd5BvSesgLG1JF56eGjVBYuZ23+BaFCI/FnsbIyxszXE
         Pa9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707687580; x=1708292380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EDbWqws9cGFaTSgQ7d/JTeQtcU5zOGhJZiE31yQ40s=;
        b=ffKwdGwhfDMAky5M3fLxln1M71PK8MC0/0PvJ+9kg4QGrU4BSLBKNBI/47hHLEds5T
         7l2/FSQjsP8cFZhdI9uFZ1B2h3lkNjv3n+Ouj+ME6U03mtQjZa57pylxPWcq5OFk2XTF
         p/+s+6vQfv/KtsCKM//Wn4/VAtdHNOmkINT47sd/hHnvA0FBSJoS7nAvjlgDSz8xIDbb
         jd9XDHNpfIygEjzAeslUOWdcuNfwjPlxVJeoHDD+oYDma0Ao6HOhTmDsOGQkxjih3q27
         b92JtAyVSB1KAOeILThGpGXc6MYGQ3xpB1MdYI1wafPJWkEMq1GoFSPnSvru771l0kQQ
         jJEA==
X-Forwarded-Encrypted: i=1; AJvYcCXMRVd28y/9csJDQmVJSSTcVz669QWaY0ENXIHj+ol8bfaxc9SiA5dq0KZiDedZ4SSI9ZM7AwWjua+WneQu0Ho6bKmX1E2O261aQtoz2i0ZokrjAPRa0Cs8hOkQJnyj/dV71cgbMcPnMZI6KsYtpUwwbzDHES3XlOA=
X-Gm-Message-State: AOJu0YzcqWOg8Q5gLFSTb0x3HZKW4a71YWHRrPaiWtF5nsihRaOTJVOH
	TVSlAmMVxJKDtIpa6ZFgAVngzDgEd7NB2dIFLWtbO1iuLSteS6dC
X-Google-Smtp-Source: AGHT+IGoT67/Zk5VRMY5JxMDwjrPQIy//74w/ZJz4vIhvTmeGkhbIjvy7LLSQ1GOOo0IdshD/4Hr8A==
X-Received: by 2002:a17:906:3e50:b0:a3b:eaa3:ecc4 with SMTP id t16-20020a1709063e5000b00a3beaa3ecc4mr3428920eji.60.1707687580350;
        Sun, 11 Feb 2024 13:39:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnOiPrRQU6g/KcAGXBm4PkuAYH/5MKHSz+jA/zC0Z9hHXwj+OZBs8CukESzauvKFAXsSX6P+Cd6H+vWhMIL1j9W4uIirC0JLn6+paa25HOTDHOqsnEJjHUdByz3gV/cdIupMpq+DxudSKt5/dtT2bpiQkJ67PjCTZa7zZLVgshE7W59gF5fH+YzngaWD9xYmKxXXrXIvtZ/kPv68x+uI4ml/Rk4Ms3gCJndjdglUelwC7pr8Fx9DfCgwOwnhouqRpoNypUt+SaCLAhWCZW1Fce7uG3arn1tG2NrafmqJUAzn4HHpa4Rqa34PwerXhlmRyAWWwWGCSBHrTud/zTWEQyP2NkzhogfFPoUZs/xSt6YTVsyU4FyVArrjZF6lR5XsLrYaxHIL5NWSA9vfuMzq0Ic7YsXmgSqigPIk55NVvPuO/YIiRNw3bmX06GR7FCc0kJ/7pa87DxEXhHGP5UwO6abD9LMHkQ1LL5zV9nMUMDe2ASkM0CkH4sRTo0IjeOOer3oGoUvUcj7aK92RfPYx6Fjn2W+SVRbxlG9EnMYXJNsAFGWQ==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ps6-20020a170906bf4600b00a3c66ac512asm1206344ejb.214.2024.02.11.13.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 13:39:40 -0800 (PST)
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
Subject: [PATCH V3 3/3] dt-bindings: arm: mediatek: convert SSUSBSYS to the json-schema clock
Date: Sun, 11 Feb 2024 22:39:25 +0100
Message-Id: <20240211213925.18348-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240211213925.18348-1-zajec5@gmail.com>
References: <20240211213925.18348-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_133942_616571_16A8F00A 
X-CRM114-Status: GOOD (  16.90  )
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
 .../arm/mediatek/mediatek,ssusbsys.txt        | 25 -----------
 .../clock/mediatek,mt7622-ssusbsys.yaml       | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
deleted file mode 100644
index 7cb02c930613..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MediaTek SSUSBSYS controller
-============================
-
-The MediaTek SSUSBSYS controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt7622-ssusbsys", "syscon"
-	- "mediatek,mt7629-ssusbsys", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The SSUSBSYS controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-ssusbsys: ssusbsys@1a000000 {
-	compatible = "mediatek,mt7622-ssusbsys", "syscon";
-	reg = <0 0x1a000000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml
new file mode 100644
index 000000000000..da93eccdcfc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt7622-ssusbsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SSUSBSYS clock and reset controller
+
+description:
+  The MediaTek SSUSBSYS controller provides various clocks to the system.
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7622-ssusbsys
+      - mediatek,mt7629-ssusbsys
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
+    clock-controller@1a000000 {
+        compatible = "mediatek,mt7622-ssusbsys";
+        reg = <0x1a000000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.35.3


