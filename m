Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B66C4829A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 06:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm7RlLurDkB9nfwalxlLQ2JW0yHxYihI8gdZfuipTWc=; b=XNrw8dvaVdTv+sy9yFjZgLtjNI
	PO9eJNog8fqro6t8G4cgzrjVms3Jj8BVi1BroXJS1G6HRbAExikKhcCOuxphqFyMMDQmJwxHQdl9D
	gugHb7lDB8OjqTYorDd8C1UI60NPqCGQ6Q4T6+/4dxitWLFfeCkiwlkjJc/L0LecbJ1RbOOdBwNQb
	0QVWId5odPj8fkUkJFwnmoe3V6kF+EvvaEZYzDRSvqdXyp/Vq9tXBDD7VrBsYs7FOLN8CYXQVzqru
	LD1L8niYvUJo6ziz+IhqmP9FpGfOeTY0uAIgneyN+4m6x/m8bUyBaz8b8Z81lp0RqegoxOo9+rzHN
	eQ2KRd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8WV-0000000BvqS-33nh;
	Wed, 14 Feb 2024 06:13:35 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8WK-0000000Bvki-1832;
	Wed, 14 Feb 2024 06:13:25 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56386d7e7a9so75690a12.3;
        Tue, 13 Feb 2024 22:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707891198; x=1708495998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm7RlLurDkB9nfwalxlLQ2JW0yHxYihI8gdZfuipTWc=;
        b=gGnS54DobXf+ZdCEUhlqTH6jMACkTQv7ENttuaKTNPcQTp1YuKt3tt3z8yUOOuIhJx
         xWXfuXWxtNISN1/2zmwydlQJI800+FE+K+5eSS75dOuEy2+o9qvVlctQEw1uvtdqvSKP
         uCcAsm0wglGDeGN0eJ9SPbMOK3PJKR5pbfQMfYfe4OgjQdYQcYq3SHOHXndvLTuZWogj
         YVwhgY9kJVUi5sZrGsgc2e1EUvNjJwxc+DKuXdvyjLWfFuz8X4SwWjfOKFYPVc6WTGhv
         sNypfsLUXV0PAROLZ5pFK2fETCDh7aDiD0cLSG8zqjgN3d/qZOMFRf5DKlyLWh6AFzZY
         Mfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707891198; x=1708495998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm7RlLurDkB9nfwalxlLQ2JW0yHxYihI8gdZfuipTWc=;
        b=WTAy/qMC4xUhIdO7Iy0hNs9s2CdbkkPBkKiqCgC0yCsUzAywtcmzlg+h5ch1XCBj+V
         ALtmPV6XNQ8BEyJL4ncwKMcWsun6rniNaa6VuWSh2Mp0UV7imvf3dUiwDPMtH5TEVbQy
         GGjBbdM/jmLkMTLju2jZQxJSKD0l/kG5N1tvXajdf8AsAyDR5QoASjEUoTyrzX1JzsRX
         XLNq6UYEpbLbYVXhy0ItDqwzGQdNSP8DJ3zl5bwHazy9/kijLDGKy6ekXqKteRiL8dIL
         zrWizzUC5I5vLPzs4OJrR8tFNMdt6tgYr1WlgQPrU7UjnJmmBjh2AX4qaYEgOA1MFxkO
         /GEA==
X-Forwarded-Encrypted: i=1; AJvYcCUx3UErS0+It+MZJPoj0JCvD4npJtXNbCYnERb1ntfTe44Fw2uvgVGNgAkYeGY7Q7jJi0FwLIjwDDqTTivZETgsAcJzRPuxiGVt3zwhIy8ZY3tj9EViC5t0qWnHMQPSP39BCSPOrIi6EH0ni2f6M36mOSur6q9R9mw=
X-Gm-Message-State: AOJu0YxfIWMYhG5Yn6LCY6K9bhabcMMy4eQzbhy8x2u6heK9xB4QE+dG
	uV3C26uFQhXcD48aO3JgQVkUeV7uU+s39oMrrplI3fzZlC4RofprEaWSeo4R
X-Google-Smtp-Source: AGHT+IE6vAggKpthxxjybdmDgBEebRvguPc9ZiRq1zVHc9Ghzh2ZwyyLhUgUWwF+aT64O1YJHrAJgg==
X-Received: by 2002:a17:906:e086:b0:a3b:ff1d:43a1 with SMTP id gh6-20020a170906e08600b00a3bff1d43a1mr1118210ejb.53.1707891197676;
        Tue, 13 Feb 2024 22:13:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHguzWqGVn3ASuDOAp0rM46lm7SYe7FHG+PybMh2tpknnmhFcGzex29Mbwnueqj87nMN6va+oMQLeM4fi1wv7FI5tDe/6uOGjwn8p/wOUa1V0KMlm7MnOXnlwCeLKQwwoer3opr9Po2HPEpPtC+PZiYrWgMmk1LnyPJ6/zJ+5eg5+DyqBToRMPJYZnA41PbqOmDWpMJp3W174xSgzKbrVToOhWUS7AfroOacBZzARd4mVqtGHHnZBALrcdP6ruEoBmrYzje9uoT8Av2mO17LJ/agGuL82ybmLfNJ9yf5RqfAZcldNVmz1SaWWskV4euwbBaNl6Zyid42YUyswBdLWiLFt+zmaNxovv9HcFsC/aJ/DTkwRFLwniScEp27qVJf8TZJf4TzOhRc8rQ2Xv/NWhPk5khH/phtjQcPVFgZ4vP/nknheQnyfc/U0JbJo5Fc9T+3OQ50rNlqkpe2Y8MHdS2WtExiCs76zCCOYOR/Zwwq9Ba6j7pjbvBKS0WWpWvDj0J38uYBCjEi8seTvuFMUJw52ZYutZ9vQVfQ7lYNx71AEFbBgDwiPn8KnZJfAAMcsqxeW8T1MrVGm2QPDlIQz0kC/BiByo9C2T
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ca23-20020a170906a3d700b00a3caccb8f66sm1980163ejb.44.2024.02.13.22.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 22:13:17 -0800 (PST)
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
Subject: [PATCH V4 2/3] dt-bindings: clock: mediatek: convert PCIESYS to the json-schema clock
Date: Wed, 14 Feb 2024 07:12:32 +0100
Message-Id: <20240214061233.24645-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240214061233.24645-1-zajec5@gmail.com>
References: <20240214061233.24645-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_221324_394348_BD888C84 
X-CRM114-Status: GOOD (  16.70  )
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


