Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E470C3ABCC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xUpIOJ31WmrvP6c37F2pwlE8Ac11OcAayqXYM/2Q9s=; b=uFMM9YIOx0S5Yq85EaM6WuEWPV
	XJezKi3cuHWiqJrefi65Z+t5qfYSHH/twB97PdXFld32TfbMG8Py0SJ2q1UvOXvhaQN1ZAlIM1sND
	IUGt/xyiYu1bUnPptrH94q/pVAv3xLMfIlBAwxwvLLs0oftX2vpS3GuBzR8PyAR+tZ5IZTezE8vxq
	YibmXoMyShSpOOStW7dx5bwLQty1Vt514efNyZU15s8Dn/Y7dgdS57E9GKb4e74F4A6Rb4so3w12L
	nGH2UdeCjd1uzDvlzl8RxArKcTty9PicZ0GyePvmHefojMaojbavQ/9y5nEsRs8PTuPgQBf1C8Voe
	BPzMETIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfF5-0000000Fell-1mIT;
	Wed, 07 May 2025 13:55:23 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf5P-0000000FbzL-3pzt
	for linux-mediatek@lists.infradead.org;
	Wed, 07 May 2025 13:45:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B862DBBF0;
	Wed,  7 May 2025 15:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746625519; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8xUpIOJ31WmrvP6c37F2pwlE8Ac11OcAayqXYM/2Q9s=;
	b=lxqmvzjoFgZLMi822BVsm9RiDf5rQRpnWcGwXR0/wTbx3RI3y+g2muifdAnNxGypE90F5i
	a+8LQQ6ueobNUJEULWGWyvW+pwz96QXShkASCtikjaArtC0utAd7R8xM2tGCMZ2dEjAsVn
	qL00emLbzpeh3XuE9H1d04aRdJieyvZf75+j66h5uCwhWuyttS6XUxWC0FChOc5q1NxMaH
	ONcEjHCRCZxwiglcOQEuSv0YE/kjpYfpZGGZzxJdNXjffGCmxNLFC6KPf0tgFFBvMsgZI6
	+vIZLPoMAcfIxz6ckWJB7NCoZlLlNOA9j2JNwwrATQShIqJhs2xIzgvR542/WQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/7] dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
Date: Wed,  7 May 2025 13:44:54 +0000
Message-Id: <20250507134500.390547-2-cjd@cjdns.fr>
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>
References: <20250507134500.390547-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_064524_154793_6BE2AA4E 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Add device tree bindings for the so-called high-precision timer (HPT)
in the EcoNet EN751221 SoC.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/timer/econet,en751221-timer.yaml | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
new file mode 100644
index 000000000000..c1e7c2b6afde
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/econet,en751221-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN751221 High Precision Timer (HPT)
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description:
+  The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
+  EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
+  count/compare registers and a per-CPU control register, with a single interrupt
+  line using a percpu-devid interrupt mechanism.
+
+properties:
+  compatible:
+    oneOf:
+      - const: econet,en751221-timer
+      - items:
+          - const: econet,en751627-timer
+          - const: econet,en751221-timer
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+    description: A percpu-devid timer interrupt shared across CPUs.
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: econet,en751627-timer
+    then:
+      properties:
+        reg:
+          items:
+            - description: VPE timers 0 and 1
+            - description: VPE timers 2 and 3
+    else:
+      properties:
+        reg:
+          items:
+            - description: VPE timers 0 and 1
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@1fbf0400 {
+        compatible = "econet,en751627-timer", "econet,en751221-timer";
+        reg = <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
+        interrupt-parent = <&intc>;
+        interrupts = <30>;
+        clocks = <&hpt_clock>;
+    };
+  - |
+    timer@1fbf0400 {
+        compatible = "econet,en751221-timer";
+        reg = <0x1fbe0400 0x100>;
+        interrupt-parent = <&intc>;
+        interrupts = <30>;
+        clocks = <&hpt_clock>;
+    };
+...
-- 
2.39.5


