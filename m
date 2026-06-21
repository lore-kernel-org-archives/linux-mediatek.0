Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE88CDB466
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jun 2026 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr3pdjQhJUwUIpy3MtQLNp8w7Jmlbm2OlpXRHc3g1wU=; b=0D1jVQXrWV7YToM/qat1EUe26B
	p/QUe+vDx3Su/36QxXYLdDu2g56ok5ltXHr4jXOAh+F4FqUcGm/ejreF8AB6N0rFNEgOXM82gsUHX
	9iiPTDcxPdohbAGvfek71GybKXjKRDZoNlwSiEpR5cHzt861Ow1z4S65HN0969/D1upoeOXUq1epK
	O4fVV647gHhGzGbDsazlmF1pmQp3UHEHV/1rszD5AIUbZ/YU80CgTaSEWTIfA0ZrVJTfwtbW+KP1H
	77B7dhS7Dtshp+dH9DzE3dixYc5O+BRTxMGjZ2DhRasYZiyNtMsC02yx976LfrOxeXiQsln9llVZt
	a2lTfR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDN5-00000003pl2-3U14;
	Sun, 21 Jun 2026 08:17:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDN2-00000003pjK-2lMH
	for linux-mediatek@lists.infradead.org;
	Sun, 21 Jun 2026 08:17:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49249707788so6665225e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jun 2026 01:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029855; x=1782634655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cr3pdjQhJUwUIpy3MtQLNp8w7Jmlbm2OlpXRHc3g1wU=;
        b=RVIJHngGYyQm1o2CCPw1/YOYbP3WfGtWo0DEUQVctcMuFVVnBePC4utCFr1PPTXbHS
         Go77tlVGIwpvjLPAlZ3e6zyD0j64ro0+gQk811hd2Dn4jiiXzLWibnySNzfnis9JbaOV
         4aKAfD5vEvKNtk+Nw8Zi3TBHmQ4W+etymY/M2yH4awZDssNjwFRo5BUANTEzsKMlL7bN
         vNRvEd02mHP+kgaQFOkj14jkaZTK9b3SE+xP9RBdcyMBrJ8r2vEVH5Ut/oD+wsF6K86c
         +pE+rFkuGR6RdC90IAASzfGyv/ZiP8T0yHFQJUgpd4jghQuOkC2LHrVa1YVXdD0yqU46
         7wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029855; x=1782634655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cr3pdjQhJUwUIpy3MtQLNp8w7Jmlbm2OlpXRHc3g1wU=;
        b=OTxgSnMq+KJOL+MuMGMh4z/ZwvGxbW2OMa//TN14V40TBoGqP0gtfjcEqss1wvGOXa
         F23P6atX2IQwHE7qvEaS0rfJfO8qaVgFzEBMrsuPFYKKwv2DboLqiMMoBdQVq6nvzop6
         T8CoMeGfY6CU6aoIuXDRz74ChlEl1gW/vrB3+KooRtJYzQk1dSCsvq9dYVo/4qoHqC1i
         EtY7e8T+Q/c27gAxhNjB2GR5J8summZ7cwPIniH35awGDTZUScKFOApZjqHA7CT66Fn9
         JOs1twOePuL+7sKeuuaGGtGDfZU88fm+8zGUlPeWAJIl88DaZGVAFSahEwQ1RM/SvQv+
         2vTg==
X-Gm-Message-State: AOJu0Ywwac0uDt6fDrswZmQhyrA9X00ZSUDe0hN1SRPZKNXa1Z3fyelV
	3sfL+PWoeWKijZM8LZ2apXEQFQxlYAsf3ScNZEou9huX5CiU/K2kORyVk2OL5TOO
X-Gm-Gg: AfdE7ckHNG597JeRLae73SA+lTVNXpn/8wYQG5F4egC7RFx7RwyxCdQHDmNrLOEv1Y8
	BxQEhYntsHnG36HnD7itxjSCNMvyt769BcdVvcY9+I3Z0eh2u6bwh5FTDjgI3oHB3ubDvmnH4lm
	wDYvohQHN+WJRaAF2fcAow2amRbId7H0Ftxg+X5NeN3XYvbzTv9uMKO+vQLxEmMVGxGuE+q9tG1
	OW2mYldNNGW5Z1ItdG8W6ZyNGLIC0LKFXQ79ysXqrqWtQYcx8oveGe6lJwSELXT13aycK3KzPiB
	hCYnSez4Le+ycRmrNLgE7+LtYsacXBm2oW0raC/AosMoLC+My4CVLXUnYgu0Z8cZlvW28msH13c
	L5+8VwXK7YiImYbEZaJulP1fUZp7fJjZRnL5FL71YqciN0KjFtdDaZHuYSajfM9nxnEmRE1X8Cx
	Y73pKP+w==
X-Received: by 2002:a05:600c:8b4c:b0:490:be1e:6ce6 with SMTP id 5b1f17b1804b1-4924908ab39mr81863715e9.9.1782029854882;
        Sun, 21 Jun 2026 01:17:34 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:17:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Sun, 21 Jun 2026 10:13:28 +0200
Message-ID: <20260621081634.467858-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_011736_733370_7BE88FE4 
X-CRM114-Status: GOOD (  15.07  )
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

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 112 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..d74721d8f2ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+description:
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description:
+      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
+      this is an internal supply derived from vsys.
+  ldo1-supply:
+    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
+  ldo2-supply:
+    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
+  ldo3-supply:
+    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
+
+patternProperties:
+  "^v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          BUCK regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          BUCK regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 1]
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+  "^v(cama|dig18|rtc)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes: false
+      regulator-initial-mode: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..2e1f41e0ebfe
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_LP		2
+
+#endif
-- 
2.43.0


