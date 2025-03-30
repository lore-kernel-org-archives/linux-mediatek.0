Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F932C28B20
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Mar 2025 17:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3nc0PQV6vj26zXMitxB1YPCrHRA8WdHjebHRj+ekXo=; b=DZ+5J8/7YMEMiMdPruXQFwVTv4
	dMfMUrO7fyTqgC85ODFKnkB/23LoGcnW1lwC7UTw8UohdiS6NBGsYxUWN3NuiXEnM6EH7LPpppLJF
	wi3X/KcjA/G8DmAj9ls3ioJrozbMpK/QI3sR1z8M6gJsT6sAxsyZswJQuE9Rlz8yspuXxknSR3aba
	4/9VpFQhAyRkViQobF1s65Wfbqn7Pt+kiKWu4Ny1PraUkB7hIdapmLiR7cyRCQQMNmF+i6TDeDYrX
	I47DKs2dx9G0zL0wCqDuSzM4BwW456Ow00oJaBdrkFdNdOn7NwjGK9xtPtcouLSaqqXMU+k8JI+B1
	Gjxkxoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4Y-0000000GPsh-2csi;
	Sun, 30 Mar 2025 17:03:46 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4W-0000000GPrH-0p2I
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Mar 2025 17:03:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B65982FABEE;
	Sun, 30 Mar 2025 19:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354220; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=T3nc0PQV6vj26zXMitxB1YPCrHRA8WdHjebHRj+ekXo=;
	b=ArjQQDOpQ6apaD+6oXA4DGmnUThte+9c3s7f0vi2EVMXzh5MdeSYubJMzqvyG2Z+U7uSpM
	gkAdMbqk1BsLoYrs6odxKq57T7rUUpP3nWZzaDJgiyjGr717ZXp+QCXQOkZHcJJLeK9lw6
	nsYd7Mk+Z2qhjNqQG6DWnrhF/q9BG6sB6k9M7Nd9g9ssN9Ss+aJQ0/ialWN0aFmskZsrK0
	cJs96AW4PDJf/MMY0D8xkgC4LExRf79EYFANx6CCPFeFQyPUii9IhbARaKZY1vTK3sgNpL
	Jhx8fLStKJNl1nF4HqcGRd7FDgCXBYvFzpA2rt30F+aP1YscJIsg/JL6kfa65A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 02/10] dt-bindings: interrupt-controller: Add EcoNet EN751221 INTC
Date: Sun, 30 Mar 2025 17:02:58 +0000
Message-Id: <20250330170306.2584136-3-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_100344_427305_2F130E8E 
X-CRM114-Status: GOOD (  14.18  )
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

Document the device tree binding for the interrupt controller in the
EcoNet EN751221 MIPS SoC.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../econet,en751221-intc.yaml                 | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
new file mode 100644
index 000000000000..5536319c49c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/econet,en751221-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN751221 Interrupt Controller
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description:
+  The EcoNet EN751221 Interrupt Controller is a simple interrupt controller
+  designed for the MIPS 34Kc MT SMP processor with 2 VPEs. Each interrupt can
+  be routed to either VPE but not both, so to support per-CPU interrupts, a
+  secondary IRQ number is allocated to control masking/unmasking on VPE#1. For
+  lack of a better term we call these "shadow interrupts". The assignment of
+  shadow interrupts is defined by the SoC integrator when wiring the interrupt
+  lines, so they are configurable in the device tree.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: econet,en751221-intc
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt line connecting this controller to its parent.
+
+  econet,shadow-interrupts:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      An array of interrupt number pairs where each pair represents a shadow
+      interrupt relationship. The first number in each pair is the primary IRQ,
+      and the second is its shadow IRQ used for VPE#1 control. For example,
+      <8 3> means IRQ 8 is shadowed by IRQ 3, so IRQ 3 cannot be mapped, but
+      when VPE#1 requests IRQ 8, it will manipulate the IRQ 3 mask bit.
+    minItems: 1
+    maxItems: 20
+    items:
+      items:
+        - description: primary per-CPU IRQ
+        - description: shadow IRQ number
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@1fb40000 {
+        compatible = "econet,en751221-intc";
+        reg = <0x1fb40000 0x100>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interrupt-parent = <&cpuintc>;
+        interrupts = <2>;
+
+        econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
+    };
+...
-- 
2.39.5


