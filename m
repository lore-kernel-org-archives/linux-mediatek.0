Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FCBC4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxs7yJaWEy8nVn6Vmxrh4WNd6xA3nlO71xbamclQUKI=; b=2lCJB1uEUbZNnvyyXN7AT/4R/U
	luPiur3Tr8jVJKF25MWL2VR8+iAscXu5BhS98o3w4bTwjdJFrX5mG3z/L/1gIwNtVSv6grB+VZvFg
	XjcCHz0ihhbPWGZXe8eCFhYkGyOR5Vgl2Utcwav+DBb2Q7BVFn04rea3eeM6IHzgg2FY6fmFO7N8B
	/AJyaDkrsIlBJ7gxgbhXdLEKJAbQxzJ+oEZiE87fPt+4IcUv12CvtonstbpitM8CmFm9f29hnhmD9
	e62rgP/bsHm2ZHGN/WVUOYYAAQ+LZ1nQpkGflIeri+oIOctvqHag06Q9qEE3XeyKy0hpzRanuHPaK
	n6Kz74cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYCQp-0000000F7fv-0WiG;
	Thu, 08 Feb 2024 21:59:43 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYCQj-0000000F7cO-2iUJ;
	Thu, 08 Feb 2024 21:59:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a3864258438so59195766b.0;
        Thu, 08 Feb 2024 13:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707429576; x=1708034376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxs7yJaWEy8nVn6Vmxrh4WNd6xA3nlO71xbamclQUKI=;
        b=DLct+wjIBEWFwlbYtY0lo1v7n80YINCKrxwsl3Ca5b2IEdzmUd7rkzB3Krw9jA9/Uf
         glZTV3G+wcGoiO8ETebdgG9WMQTRiln0VSGmOipAYc0+YG2/hi2qwN9Ng9NDYt5mON1L
         KGWwpjMFsjTtBsq+1Z8c0FoCaIsTGGconqO2fcS8i0Wz25i9WZhioRC4bSGZ32VYW2kG
         3dZOHgJTMgEtNA4OqoJDTsXvZfqYR/xf3ND9QsDY6w1akdhYecGQzHuZsA9rWq13NroZ
         I9izvs024o5FJizdLLF1I8pXUo3QH2TmAwV5bncxgTGl2Ved56i+YXtY30S1LFZtS/26
         yodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707429576; x=1708034376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxs7yJaWEy8nVn6Vmxrh4WNd6xA3nlO71xbamclQUKI=;
        b=T5MgCn0BWBD7P6t+KPMzISQ4VwbQ6At6t0bCo0TPWGRF/pf7dIGn2/JBH+OhQR1BGu
         A3pAHjjjuilDhEnr9DjmQEOs9Uoqc/pQv5HSmpg1cdzVya3iIYWqgON+zG9/NZNK6PiL
         4p1rJs7YZh/alyKG8PBWmKStE9vLVtYkozQiKkcn64r9Gj2JRup/7eiEXQeIGBjJqYY7
         XC+L+FamKNR4eZaY+qd2Y9sbgez11zxZAhJedlzbcrRnQ/xv9JmR12bJdIE8KYDjZzHK
         nDs277bkU74nvIrpEezbGSON/IR1NLKzdSqvPcBIMyRfSJAGkLg+wVAxOnCeXdsqIrKy
         gQfw==
X-Forwarded-Encrypted: i=1; AJvYcCXqH2hoNUwp8wvZUYBSyXBNx4PBaEWnWx27naOIZIzHkPSzvtNWM5+jKR9FtRQITlm/9/JpWKGMV5youKpNnxowQQV7eqzPUOxdKfctMQf588hCuVJ18VmJg5LK+LCwFb+hOtXt6cvKzQSqDPHIvFc62M3Y79KrNoo=
X-Gm-Message-State: AOJu0YzrdyDMcrEwHupgZZZz/Wz5OoxZMw7wWTV1nQyrzVJ5aDHx4k6V
	7KfgUHMdf9k6Vfb7jT04Npt0xbdnVFTEC40yNRtKhyXAM9sA4LEV
X-Google-Smtp-Source: AGHT+IGPsZeHNB8r4fMWoVT95fkP1nA+CcvmyXpOh+PpzxhK4rM2J/gQL61+rynSUXTxgpFpay6f7Q==
X-Received: by 2002:a17:906:b7d8:b0:a23:7633:59ae with SMTP id fy24-20020a170906b7d800b00a23763359aemr744793ejb.9.1707429575727;
        Thu, 08 Feb 2024 13:59:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsHteBGFr4f+wVfaR4K3Y7cO52t+YzohayYtb1UWIeOqdULNH69dRGaLDWHuP7Wf2k8sHqTznLvMe0Ts/NJKWFqiADpfgy7fLJJtSpaHFZqnQLaPSyvi/8n+Gz2EnbK43svHPryAuZwLfKEMy4GZy8ubC/SOsmuFqadzLamANYl4CnBRlvG5s+LbdvvDtW03LMKendex5kV8PlgLjfv4m1cu1J/9ykSm+habVUbMQBADE538ctE4QiaKLUNJDWRvm0s/rvHYrnN9S8lq9jhfUKmQ5rZNxSvpQUAslUZddUTJGMSjIFHQp5fQb11GZYoFldf1EntxEiXBcIPHWGxWM9hEsUVk4JDA/xisNn0kuVrSoIyBWrIROANrizLhUY6Og0Rv/NE5beafDV4DDKE9eXmePPVsc6V00LvJ8si4NW/rjpV761z0wcwR9XkhplVOcmdJOgwQYHoWjWVQeZeXDbiPR5q5hpOZJuXqPUW9+zcwAbjW62dGUlVjXDYYYt3r2wlcE=
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b00a3743142429sm108255ejc.39.2024.02.08.13.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 13:59:35 -0800 (PST)
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
Subject: [PATCH V2 1/3] dt-bindings: arm: mediatek: convert hifsys to the json-schema clock
Date: Thu,  8 Feb 2024 22:59:24 +0100
Message-Id: <20240208215926.10085-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208215926.10085-1-zajec5@gmail.com>
References: <20240208215926.10085-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_135937_716962_D2F7C9B4 
X-CRM114-Status: GOOD (  16.21  )
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
2. Documented "#reset-cells" property
3. Dropped "syscon" as it was incorrectly used
4. Adjusted "compatible" and "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ----------
 .../clock/mediatek,mt2701-hifsys.yaml         | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
deleted file mode 100644
index 323905af82c3..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Mediatek hifsys controller
-============================
-
-The Mediatek hifsys controller provides various clocks and reset
-outputs to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt2701-hifsys", "syscon"
-	- "mediatek,mt7622-hifsys", "syscon"
-	- "mediatek,mt7623-hifsys", "mediatek,mt2701-hifsys", "syscon"
-- #clock-cells: Must be 1
-
-The hifsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-hifsys: clock-controller@1a000000 {
-	compatible = "mediatek,mt2701-hifsys", "syscon";
-	reg = <0 0x1a000000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
new file mode 100644
index 000000000000..eb429337cdf4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt2701-hifsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek hifsys controller
+
+description:
+  The Mediatek hifsys controller provides various clocks and reset outputs to
+  the system.
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2701-hifsys
+              - mediatek,mt7622-hifsys
+      - items:
+          - enum:
+              - mediatek,mt7623-hifsys
+          - const: mediatek,mt2701-hifsys
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
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1a000000 {
+        compatible = "mediatek,mt2701-hifsys";
+        reg = <0x1a000000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.35.3


