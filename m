Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858A6C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 07:54:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 504462076E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 07:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lAgFr5Rg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rmbca0gZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 504462076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8Bx65WRi2h3/RzZb5Z1J5QmARiKuk2lAEsEo+oViSk=; b=lAgFr5RgewTEldhoOmybhyIhB2
	4KQjotTMksGCxKjT6fViAgwUFhV00UHqKxwaAxZFgZC5cE2k1vXgIzP2ftD/VBnEF6dYv0VJPwpFB
	zAd9+P1ke9P/HJE28Id3Pg3Y7KeFSAtg5guIFhZlFSvF0H8GVNRjt9TInBn5k2x865ESWwZ9egybY
	2SbCxZBGuwOuvLqkatgN7N+ItnOlPcf0CapsEfnOXffx9wRadDGcm3CNnoe+RY4ZfK0Dsg3IjYO2x
	FR034eOBYaQi9h4L8fgvaviQDcl+f7pIGsHhpC6prS2XFKvemzAVeQ0RvpQ3HegknyPtj11x9PkzG
	7P/ojgUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8fPD-00009l-MD; Thu, 20 Aug 2020 07:54:39 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8fOZ-0008G6-OO; Thu, 20 Aug 2020 07:54:02 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 2so609142pjx.5;
 Thu, 20 Aug 2020 00:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L6XcNPt3VpQMDvZ0mNUdfcDjhf2wDDj8sz3vu9Nex4s=;
 b=Rmbca0gZkTga9MvR06LWAq4amNuEK44vVuzhKpGlOK66VbqaaQBcLcyZDHaacflRoX
 yMT92l+XipUiWyeRzF6Nr4iAWutE2EVR94uf8AooJr5QbCeXkVaguK4JHZqmKAcMheQy
 wBL6u1Qpm/Jc0H/DuKGaTJd4LjXghUXF5yS+Ywg35yfpnLdurC04ysrmuR17HNAh4Vzs
 JauwEupUVRAvoJVcPEURUOt2PVtQVYn2q7oWPXx86UUsEwSOKYK00VTZ40sZGIFIVtuY
 7zzxXIq/WOTfEtr7hRypMYrGO7nkgOGKy9Ckn2giVnMsiwfafrTUvxdcwCwGKAz7N0Xp
 iMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L6XcNPt3VpQMDvZ0mNUdfcDjhf2wDDj8sz3vu9Nex4s=;
 b=k0DC5f5RaL/t96grDv2yXgPPokIfgfY0fHkiDB6wqALtqFLGZdRaVdS3iTW0rYF1MU
 Y3hVyt+0fr/fcxxoByh/+wqPEtix7MBFjnhcl4wCGhz37Vteby4qGhn8G4Kxhijed16B
 iSERL2EAFtBw5RK0mLxAaHiOpBe6WN2dfoYt7qVaDL03yOeMx4lnPPvO78dv7gKKgp28
 WFhqc75eELP8FmvoK9u/1nAbV/eoWRaho4C3W+g69DLrx4lMlV4DUbqVfRuf+OQLnkDt
 VKr+enwNiRPCArUSR8SLLHMNzBpz76c4tK91e0CIiaqSHAIvgs9EkmnjYFqvjpxFuuIx
 LEtA==
X-Gm-Message-State: AOAM533JXgY203tW9VQ8+cVJ4y6clxS6OszWq8QIZ17n+nW16hSxkmR9
 M2a3meaurW0i5QyjKxieGyc=
X-Google-Smtp-Source: ABdhPJyJ6SpAgxr95yJjkgAkUw8N+YqFNffE0rdoXSym5kZQv1YxN7wJw739dZQmvbBPN5uP1snR/g==
X-Received: by 2002:a17:902:59dd:: with SMTP id
 d29mr1689481plj.170.1597910037468; 
 Thu, 20 Aug 2020 00:53:57 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:577:c217:67e6:a40c:a3bf:1945])
 by smtp.gmail.com with ESMTPSA id q71sm1273832pjq.7.2020.08.20.00.53.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Aug 2020 00:53:56 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
Date: Thu, 20 Aug 2020 15:53:42 +0800
Message-Id: <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_035359_898368_DF7C44CF 
X-CRM114-Status: GOOD (  15.01  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add a devicetree binding documentation for the mt6360 regulator driver.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../bindings/regulator/mt6360-regulator.yaml       | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
new file mode 100644
index 0000000..bd66754
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mt6360-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6360 Regulator from MediaTek Integrated
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  list of regulators provided by this controller, must be named
+  after their hardware counterparts buck1/2 or ldo1/2/3/5/6/7
+
+properties:
+  compatible:
+    const: mediatek,mt6360-regulator
+
+  LDO_VIN3-supply:
+    description: Input supply phandle(s) for LDO3
+
+patternProperties:
+  "^buck[12]$":
+    $ref: "regulator.yaml#"
+
+  "^ldo[123567]$":
+    $ref: "regulator.yaml#"
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+    regulator {
+      compatible = "mediatek,mt6360-regulator";
+      LDO_VIN3-supply = <&BUCK2>;
+      buck1 {
+        regulator-compatible = "BUCK1";
+        regulator-name = "mt6360,buck1";
+        regulator-min-microvolt = <300000>;
+        regulator-max-microvolt = <1300000>;
+        regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+             MT6360_OPMODE_LP
+             MT6360_OPMODE_ULP>;
+      };
+      BUCK2: buck2 {
+        regulator-compatible = "BUCK2";
+        regulator-name = "mt6360,buck2";
+        regulator-min-microvolt = <300000>;
+        regulator-max-microvolt = <1300000>;
+        regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+             MT6360_OPMODE_LP
+             MT6360_OPMODE_ULP>;
+      };
+      ldo6 {
+        regulator-compatible = "LDO6";
+        regulator-name = "mt6360,ldo6";
+        regulator-min-microvolt = <500000>;
+        regulator-max-microvolt = <2100000>;
+        regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+             MT6360_OPMODE_LP>;
+      };
+      ldo7 {
+        regulator-compatible = "LDO7";
+        regulator-name = "mt6360,ldo7";
+        regulator-min-microvolt = <500000>;
+        regulator-max-microvolt = <2100000>;
+        regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+             MT6360_OPMODE_LP>;
+      };
+      ldo1 {
+        regulator-compatible = "LDO1";
+        regulator-name = "mt6360,ldo1";
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <3600000>;
+        regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+             MT6360_OPMODE_LP>;
+      };
+        ldo2 {
+        regulator-compatible = "LDO2";
+        regulator-name = "mt6360,ldo2";
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <3600000>;
+        regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+             MT6360_OPMODE_LP>;
+      };
+      ldo3 {
+        regulator-compatible = "LDO3";
+        regulator-name = "mt6360,ldo3";
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <3600000>;
+        regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+             MT6360_OPMODE_LP>;
+      };
+      ldo5 {
+        regulator-compatible = "LDO5";
+        regulator-name = "mt6360,ldo5";
+        regulator-min-microvolt = <2700000>;
+        regulator-max-microvolt = <3600000>;
+        regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+             MT6360_OPMODE_LP>;
+      };
+    };
+...
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
