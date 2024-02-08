Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E46C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 21:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeAmHmtuylGJLNzh3ueLyRJFJ1gmDfZc8JyHSqj91w8=; b=Dv8cgLARk+781cBDmfT1bvURVl
	T+iszuyHLVPtuJ+4UyW4WR+VpNv08c/tpPY4ZLXGHGvgYAFj5eQl0qRzMd8m0+g6iZaOxN0j/TGHN
	9Q98IGtW0SjabGw6Ds6PyIsdk3uKbnrz702dKPBNJC3bCtcfidcuSDi75HFhk/8ThiEyt9SbVlrfg
	eGddHJeeSvtNc4t4k6mqQUCXiFmOIOiGB2jZNJC6iIAARq366Tkcx7sHCu95CEkCTX5LG4GfRbupE
	kmZUNCgZ+Pjff+t70iOFA9GU9oplyjxLa5Umj7MthF/J+6PAxW9ByLlPkuy8U/N5d+UZJzQY+gi49
	PLlND0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYCQt-0000000F7iA-1kaR;
	Thu, 08 Feb 2024 21:59:47 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYCQm-0000000F7dU-101j;
	Thu, 08 Feb 2024 21:59:41 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so41204466b.0;
        Thu, 08 Feb 2024 13:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707429578; x=1708034378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeAmHmtuylGJLNzh3ueLyRJFJ1gmDfZc8JyHSqj91w8=;
        b=D3pAWfWJ+A3IC7eNgBgn0PZthaiXp3C4ScOkJg8Y8BPp1mzPfSS1ue0afy0lLq5fKv
         Je8lxTQ3zDYUZQ3B+d0YN/seC13yKNyLJ0VfIqpP5qXoAwKA8lFamWuDcv54LLXB0Nx1
         b5a4eAefDEDIsXpohx5wheA+gAZiPrFkJ8Z+RmuDbjJtQUfsFMb8Jt/MjnKjciWVSZc7
         otnGlY9WVtnpqDM0S7IGFHrnFgJRSVH7brNsPMoGoaGOG0qRn/aJCqoaIz2X3mjLjemk
         Es8OvsjL3WWzAX1Dgh7fuvono9rLKAvSBJShLn6Or81qvypO9uIN6CpaSisLAmeCXIn6
         7o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707429578; x=1708034378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeAmHmtuylGJLNzh3ueLyRJFJ1gmDfZc8JyHSqj91w8=;
        b=ea4WTlztplPn3qx+sVQvfHdxloWTIW/PgDrXOkkVgdkMIdoURdk6mhYnVpKQaeDRhB
         orMNed2DlOSp89L9jmN/KQu/a46AQMdY6kJTrMNVH1dvtF/PCTO5kcQuDEANNNivMuIS
         pwa2Sw5GxUTnqr9JriAJTY1kkofyT2TtqBF4NL38MD9FAwIb9gGf4StAVpurWGHMRJDS
         EAiVBevfZwx6UG1yEvb6wzYlFWx+LUTV3dZaZCOpA1/eyR4C+NlEhsqTUzo8AE+BoYUQ
         3wrJDPgZplpc5LplQK1LUMMR8DJVNa07qsZ5UeG4wz9AyWrS8cmbznFBGKACRhDqJnki
         zoQg==
X-Gm-Message-State: AOJu0YyKj6/s5KU3xUwLdTswg3Pzyp+Wf6u4ZCpJcQG5WQVmLDg3+rjp
	zlw569HEfNDMQP4rr4uJM9JwrnNRR7FX3862Er/HDlVn9wxOfVQ6
X-Google-Smtp-Source: AGHT+IHmPgWSOLtLs+Nyfep3ErUyyxdizCanfCowfDUpJU2c+fXTJ3GLxnI7xq55RoFsVMrADvcnyA==
X-Received: by 2002:a17:906:aed7:b0:a38:9fc3:3d8d with SMTP id me23-20020a170906aed700b00a389fc33d8dmr390460ejb.46.1707429577716;
        Thu, 08 Feb 2024 13:59:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhCgss0C0rgZFIaPdY59ajK1Bar3J5lmPTYtD0zsdtpziXQgWSvHS5QdaNLyzf8CNUKFtfF/hiu0t1mnTFwSi1AONqWfSWOCu0ZXMuWJUZDtH7848iAkj7/e+Sd4KMg3N05EA8gmc1p3eGAk9MpJRE7oOYI4oCIziNM/ria9zUh8JQHe7ZUNHpBtJ6pnWONzoacijysVTANphk2KRK/uxwVPQk1AB4X50jR2QENYL5cBDyaIEyqEdN55BR3Pd6fNw7s0P9E5uPE/hlfFXJ8BTacPUJDlUWvMW49NxtDqTUWWeewrg0/CagaqSQIT5dWwSf8txE/upsIt70Hp5W6sNRVqK3OE4xglY8ofJHyvSRke1vJctCu9si8SDTrATRoM0caRm7GrJiMRcBCZtbouqX5RkOu+jtHtkGgnBnQiiAUMy+VhyPJub3H7ANpm03X/gqO4y9Ps+dXar70BhEn0M/pd0ibOXevGoTZ7yq2dxUI62p9tNvmAjefEtlP3boFv7w96w=
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b00a3743142429sm108255ejc.39.2024.02.08.13.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 13:59:37 -0800 (PST)
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
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/3] dt-bindings: arm: mediatek: convert PCIESYS to the json-schema clock
Date: Thu,  8 Feb 2024 22:59:25 +0100
Message-Id: <20240208215926.10085-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208215926.10085-1-zajec5@gmail.com>
References: <20240208215926.10085-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_135940_322062_80E47BEF 
X-CRM114-Status: GOOD (  16.81  )
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
index 000000000000..27b19d5e3a85
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PCIESYS controller
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


