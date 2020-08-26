Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540CBC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 10:50:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC502080C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 10:50:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r67sY41Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnrqKy6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC502080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9muGjhxbqJaTc7BeWSpvwaAaJyJeB+sDPMdNMq6Nwk=; b=r67sY41YJNnqVseKrbOkch2JYM
	SasxvqqKYb+vr3CdmGv6UCGFYbmVT6z7LGgbKV3Zy7dhiStAiiXP6Ug4RmJXfR3nQD+Y3JmJzyiA4
	AQsW6qZOTdzTNEqWv1kqx4HYEX3MbwUxb+LOmdKL/6bUfB0ZloySsrZcQc/LzjgoimLsw+QR8FpRZ
	NA9Kk6CeG1BUv4eN45R0nh94ADmmgLKkPslWwuWGuc1W+BAsz9kV8QmGACYluZLzOWxyImImwg4ky
	9gzcdYCnQjp1wzaRO/7dKUVIojBwWZzcYPmsf8b6C8IKUis0+bcvgG+9LfHRirM6e6zkWBgyjAvsk
	0dCoH36A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAt08-0008M3-10; Wed, 26 Aug 2020 10:49:56 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAszw-0008Gm-TA; Wed, 26 Aug 2020 10:49:46 +0000
Received: by mail-pj1-x1041.google.com with SMTP id nv17so701539pjb.3;
 Wed, 26 Aug 2020 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fNxSfFiY1tuDXOCkxl1KwXHZGTRpS8Bl3VyT4+22yAo=;
 b=LnrqKy6kUV8a9EKcK25PoRKI9k6qjlOBP+xLiHlzbrZettbU0f4DgQtgLdNC70ibBC
 lK/Ehv7u5BEtVEnpEdZF6c+jdXIq2UTFBgNmFEFhR2dKt5ec+qQty6/Dmj0gkThl8LTh
 /XVDkNNHvdJhaRRzHFx3w45IZP6adC8/MPVU66BJ8ZdCGpvIBBdpzs3TX3f0vDkuCRSX
 +BymyRY9VnnzxBQqnNpejZJhjsVSu9bvBq9+GMcZ2UtRlVSvmRTdTIfm2Db+dAZyktGX
 JQXQRNrIACVJV61C9+SiGGI/N7xv/5h8MVQBneqoHKWQVJnpu2IsAjW7X5rZ2oOUZ/4m
 GTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fNxSfFiY1tuDXOCkxl1KwXHZGTRpS8Bl3VyT4+22yAo=;
 b=hEGtD4k13mVo2jMkC1vnj2QRAxcUvBepw8I94wGsAkJI46rQOcVQHkofZfyiho3PxQ
 j+vWw64keFiPLnXeJFVrSPlkSvQMvmRCMKMuQe9O2Ce5aj3B4XlbgP96itIJeDgNrxPU
 a+a/1DyGC2KqyRimmbSzoDGF/MmcapPNRWYqBXb4iIqvow2qt4KSJcM2oNM+/BddFlTa
 wZGGev3OJmCVWJhKBCwQ+8lFQm8pd/Vc+9uVWvMyeZEJNTGZQeBr1bwm1ChQYPMsvwyP
 G+Qsg0iHly2ZDCbaOhcbNjHm9ky2qg1vvVspNjKMo/4JmFaIRdMIfk7QWUUzPSuDhayG
 Bekw==
X-Gm-Message-State: AOAM533xDbS1kjDZYT9faG0Qc6vdug0OWpwhd25s9ALjkP6/JBjSyrd0
 l8rTwB1DFMZmEvNo4EQHyGo=
X-Google-Smtp-Source: ABdhPJwtA/oSnHx0Arv0mc9TbHEnQGYbVoG5raqyiIQx3CBTlOSm4BqHHLhZxJ02XDVfMRSXGVAX6Q==
X-Received: by 2002:a17:90b:410d:: with SMTP id
 io13mr5052761pjb.63.1598438982873; 
 Wed, 26 Aug 2020 03:49:42 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:2197:d2eb:7e49:dfa1:a882])
 by smtp.gmail.com with ESMTPSA id d127sm2540349pfc.175.2020.08.26.03.49.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 03:49:42 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v4 2/2] dt-bindings: regulator: mt6360: Add DT binding
 documentation
Date: Wed, 26 Aug 2020 18:49:18 +0800
Message-Id: <1598438958-26802-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598438958-26802-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1598438958-26802-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_064945_185176_41370BFF 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add a devicetree binding documentation for the mt6360 regulator driver.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../bindings/regulator/mt6360-regulator.yaml       | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
new file mode 100644
index 0000000..a462d99
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
@@ -0,0 +1,113 @@
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
+  LDO_VIN1-supply:
+    description: Input supply phandle(s) for LDO1/2/3
+  LDO_VIN2-supply:
+    description: Input supply phandle(s) for LDO5
+  LDO_VIN3-supply:
+    description: Input supply phandle(s) for LDO6/7
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
