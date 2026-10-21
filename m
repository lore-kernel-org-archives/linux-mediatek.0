Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF41606A325
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0PhkAMwF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MsvqLmV+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=; b=0PhkAMwFe471IsbIpvv9NohcLN
	o2SYs1OKOX/56JQ7ZQJo8gSwIygXp20GB16tHhsm8LkCbnbnBD6yQGwWV5WXqbG8gXr13IJTPw3pm
	m6N8XtgNkGWR5q088D0HNBnRQLE5Y5YvngUCBv1ZnyPhmmMM+M9GamENY1Hfkr3AYM2ldW5Kr669k
	0SSkI+OCd/h2iMxLx4jmnAk4uTFqVg/PLhPbWY8du0k+lVtzSS9nt5E08V0qDC7ZfTm09FRhdyFhi
	3i3dbVDcg1r7Ym2d1TnuhD3srmQU9Q9lXsIkNz8XfIkkRftbpnjh2osraEYgIkWwM2dK5yJ2pNqQO
	TsLxXz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTw0-0000000Bf6t-3XFk;
	Wed, 21 Oct 2026 10:52:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvv-0000000Bf44-2D0k
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 10:52:38 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4956869750eso4267575e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579954; x=1793184754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=MsvqLmV+tjOLGFsjD7jgQ5fasWcJIfIJl77GCcOfREcFt7EYM0y8ufSKf3LaYfkZ1Q
         hX7Tmm62JQJSd8EqMTgFeT4bwZdi+TRM02AY37ZE/LD9sX22q2gr5PG1PXeZQay2N8hD
         c6z+dU+YUhbVKAgv5OSpQZhP8e/zFW6yo0ctj0st2b2sKjcGtPKzEo3BSsIl0JT6S5Kz
         Rqtr5dqmE4kk62L1k5sJQoPheuEttcBnwi7y62nrhZVz+pUKJYiABNnmoXfNWVL8Qtii
         fcnhRwSDo5XI/kk5l2SzmmxequnfVH/a/KdKj8rkwknQqgnvQZVzvEM2vcrf0cqvEFqE
         tOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579954; x=1793184754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=Lk8RHAzVo38nPx4FW7qKDiVkxrGy1AGZ+kVW7CdsfzLZPLiAnupqKZ4SJa0fnLhV9H
         /Q3JIa14Z6VYmgdQ/YpT4LOXXUA3f/9B1VCZjQ8cF71yfj3aDxSrWHM+jPbIclh8jdmr
         ca4MrZLr50V4NHXhJfJ1jniR1StZpDR6pkEEnmLlmiE2/el1zOvCktLR3H34mLEOuYlb
         YxVkcE2KWCBaG+G3+lwxd+0+3Qo1CkCp9bMNiTp8zmFJFzpwPjEQkIHUwWDOMQpwE1Jh
         KVXJT0VOqrM0Dvu7FUoDyxT8C3PeER8Q8iiUjmpcpaWLRxDBH/ZsQi4Q2/kh2un2URv8
         rahA==
X-Gm-Message-State: AFq9FYJ8Gu07WuI9NoSJp2q8nTwjTqBzbxSHn9O7Y/R/TaU68RfNjRBH
	jl+FwJi8wxzauCQmurHlANrAitbzflwQOsH+869Mm7Nk1+zU3pikDfRkQ56M2kxw
X-Gm-Gg: AYBFou3+C9zZgWafNJ7ISNqr1yU0IKatd5V+wLdfx9eTlMGL0Q/Beo5yQNfoAX6qthE
	f1NNnWpXD+qxWYLRUvOQPAhi0Gr2HzFq42KI5iKf31Mecbm2FAPu2qkV9kElE/QHKZCK7zrzojr
	6DXHG4DaELsXdc/PsRc/LuBioBtxZEu1IaM5730f6PrP/6OvgmQMq5lPQCHiOkcrsgei1YKKuzS
	M0Rn8bYH6khIFTcCyYMgTznQ3WcW9wzmiNGIw2oklQ4cId9db5TkRpM8kZ2eUR9a+VvK0mR2/r7
	uVWITsByMJ30bdVbHf/steg2m7IaC/9zbpXBGFRbTJPJWs5BIF38u3RDFbaVaJ2PXJ/FcZ+WpBj
	yPm33AspSClogEkywOAUb5FFEfZklB8jLt516TOWgMXjplBLgMlQwABcQO3r8aVjEdkrOho120a
	b6jE0aIJr7Im0Dcfoa0UghioSpp16nVNB9W7Yd454U77MABil9vnIyLHtACFCsF9yizwyGp/MEX
	OZDK0KjwBTDzxmQUoxpt9zp/TUdM4x9hlhwcIXQS/F8eS/LDmI=
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr31171585e9.7.1792579953510;
        Wed, 21 Oct 2026 03:52:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Wed, 21 Oct 2026 12:47:21 +0200
Message-ID: <20261021105109.199886-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_035235_615207_6C59B472 
X-CRM114-Status: GOOD (  15.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


