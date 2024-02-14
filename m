Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1E6C4829A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 06:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EDbWqws9cGFaTSgQ7d/JTeQtcU5zOGhJZiE31yQ40s=; b=Djg5H3+JGKskI6/ZU3+QrOh/w8
	OoA5Z7+ro57jC/z6a05vX8dVNEiQ6XaEnVSyMeiOUAmX3QZgUXsH1njbTHslUwIG7nocVnH/tpX5+
	b+as8u0lA+PPBJup8Q+YepFuDtKIn1RjwANkoQglH6QqijhkwZUdw3OJ+lExk6nYmZmOoCKKKG3F1
	fPKu2xdZMPX3tUDrV1E9+lU/oaTg4SHy4WAsw95NQ9tvffffAu6z7aUBD0S7flawldEImaLUxhswv
	s1NOwx/eudCDhgOn8Bb5C3XFb6+IdNqZc2mvU0AD1fEVu7wmy4ASkFJAqWZ7nI1F+ajzbo4qX6tu6
	FMS8cNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8WQ-0000000Bvo9-2LN8;
	Wed, 14 Feb 2024 06:13:30 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8WK-0000000Bvkj-0IkZ;
	Wed, 14 Feb 2024 06:13:25 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so246436866b.2;
        Tue, 13 Feb 2024 22:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707891199; x=1708495999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EDbWqws9cGFaTSgQ7d/JTeQtcU5zOGhJZiE31yQ40s=;
        b=e9QjHDB55Cn4pQx/Q1fFys1LOB1WRaGCS7e/8iqHf9VKgzv0bQ4RyV9iFgY3GBTyYP
         49hnq7HAzhEzIYRLXHK/OC9jLv+BBW34/mGmuFV93X1AKlwnmRc0VAzSns0bP8j5WQ0f
         59t+wb/mAoi1q+unZkDVt+/5nnu51riJ8DkQ+YsQEqHAItjSUny9Goy0xTDbbKGwJ2Dv
         Udnlzhmk+w8V9MjuktdPcns/u6R3fdnqNSYesngTNHWlD/9XZyGWYBzQR/nRZUxruWGP
         uXDWJXM9FuDb7z0mwYRa5+RNwdQ1VIOqa9VqUQNvgrswVmbeAsa3/QnUICp0UWAWZz/c
         UHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707891199; x=1708495999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EDbWqws9cGFaTSgQ7d/JTeQtcU5zOGhJZiE31yQ40s=;
        b=iSMFW8efDi0woLtJlJ0XdDsZ5BuTdoF9gGUAY6KEfakwFgfEu6FcEzYBRrQSpOsCK8
         Zx9o8kBvJpZj1AU8ayKzBfyRVioQNHEY5Pcp/25/Pvjh7HXsk0bjF4rlg9fCesrQAB6C
         LaWG4pYDAxlIXTN8K57UiNbweksi/ufvHfwbtfbfwoJdk09PtxKEgq30omgo45p7Qsk3
         opYKitYQ2F1Wq6mB3EovRmu4DxcvC3mKUVnj+HEF7GSG8IdaaVaj18KIJ80qlhRy7iXZ
         QFS8sey+ypeBFQaedIr68oBs7JGFvCOATvQFBBSpUQuNrq5yS3rIXuQ6Uld3Ig1JRjxg
         5YQg==
X-Forwarded-Encrypted: i=1; AJvYcCUFp0RrEDcE163p4bkCzBLZDy1HQUDh5S+sDTZJ/+U4QZrbfPynTPchI0WFNC48W/rvHzjXZznVJGxpCmM+WNsX+BVXYMGg6ApaZxNVdQKpTh7lch2PyiG0XLtTDNavVlBMVO2mqzH5VvnfvDx5KbM7xDw4efO8ZJw=
X-Gm-Message-State: AOJu0YyjlPTSDJQWGeUq+1zXayjzDHdNyFMBcjdy03pvm0DjyKyj78mD
	MS4XVYItl1NK6q2W6z5mjGmd+vZ5x8m4MbyKP39C5vfHVd3MjVd4
X-Google-Smtp-Source: AGHT+IGcdc9MhMF2QCYXKDqgHAb2iQpgiSM62KSdnvoJCUvMTwnehra+UAazTEfsrpPrGHVZ7N5lZg==
X-Received: by 2002:a17:906:4a8e:b0:a3d:4dec:26f7 with SMTP id x14-20020a1709064a8e00b00a3d4dec26f7mr338386eju.6.1707891199525;
        Tue, 13 Feb 2024 22:13:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyN8G4qtIV202cD4o9ZwYJxigXomwvuwD44sYYENvf/P+NZwmHwC+mlVJd32ng0LnLOo9xX0nuFr/NU8vNqFrz1ovgcR8wX1qhe7TG0oBhaDIMxI72PveuU+FovLjBEjxV3p7D6LjZUGfZAOIJIQIPEu8V/Wnz6UiXHisSL5JdnwfTAWPeVR5p2K9YINIb6WWGS5OzzSRTBVmp6ss8jeiU17vEeY/gOX3eDR7DitLuGjk6NTbvX0dp8Mfz81Yy3mPEnBvnboRjx64eSXmpoB+euFmIldHnVa/qec9QCz6iZFrKRjAEWaOTMdRzTqDazEH5WhWuNxCUq9sFDPr6JWBdYcjY9dwaGRMViSQ9zfWsIo6BFWJY9iTUk9asxQuaKIvajlRHSiGuMbit17oxV64VTTIIQA64qPVNvfJzERtbiVXb/lg/rELNSmEr6XH6z7I0Fc3ceJOGl2CnlbCg4jGyjQhXih9QZn+YCd89S3vkyDOicm/XoFyHiPWvYhm/x3ARWvFaGc/0c5cJGlzD3xiGTlV3MhM6SgOkrGTB63eTTeZ2byCN5NMiG5/XH/28JI891Gy4FBixopGm17QS0EgZ1mMH/wFkjY/h
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ca23-20020a170906a3d700b00a3caccb8f66sm1980163ejb.44.2024.02.13.22.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 22:13:19 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 3/3] dt-bindings: clock: mediatek: convert SSUSBSYS to the json-schema clock
Date: Wed, 14 Feb 2024 07:12:33 +0100
Message-Id: <20240214061233.24645-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240214061233.24645-1-zajec5@gmail.com>
References: <20240214061233.24645-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_221324_143811_EFAE3B1E 
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


