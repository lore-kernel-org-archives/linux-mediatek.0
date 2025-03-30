Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B2FC36013
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Mar 2025 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFuKeZ2Mgo5yTqNGhX/kKLsejXNkpw0wnwsa5YPEGN4=; b=HnhFSuahDmR6TqSyOge1hbCQoE
	HRbiZo8+0QoI11w7G2Q14Y9+P3dbUvl07Jy2lO0skdw+mrWxpo3ggWx8DC2bAs9+Q9st756eylwiz
	0D1psCJxIPPziEyle2rFk3Ge9+zsxFfo4sho+4lnfN5xpDk92PTd77qhXfV9pg1AgE6Vf8tRfTKeV
	5uFnwLyyN+NdMxPalX5lYyO9LBGwOVNxzXySIQSWzBow1XQLjxr5FCt2MlZa/nlPiZy9FASGk04Q2
	E99aaa4jjKnF0Fvbr+MiuD5PgA2pav+6nZ5yGOWIZiFARiQr9OjiQseCS3RXDs25RMnISMhRDwjUl
	oGP19bTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4f-0000000GPxt-3fVn;
	Sun, 30 Mar 2025 17:03:53 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4c-0000000GPtj-0sjJ
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Mar 2025 17:03:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 695112FBEBA;
	Sun, 30 Mar 2025 19:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354228; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=WFuKeZ2Mgo5yTqNGhX/kKLsejXNkpw0wnwsa5YPEGN4=;
	b=c5Fxsc8Qjq+xXMQ3KJfuXIyTa5NAWGu+Obv/NHUXY2Id2ztmg2FxM7jyYG+PMcNN64krvt
	WZsaQz0zz74RbBOthui+6gTiWGvoOY34R4xQAXCKEsDYUA1+wSQdE4MeCWudtBArEL03fr
	Crjl1BGm0gjLtxytkyB5wlfL6UTV7kuwX3FR/XznWt2zGex3VBa5+PSzm1jQnxgNv5gkmL
	GWO7bQEfqUBU1D0k13UFsj9FNtORgm6YUgxEOwPB2tqRBl04avqzjzmYUhtzWJvgZxNQ7D
	c+kVJythVKg88n8DPza/TuByJEKDD3RBY4iDW1yBMke9Bs0xwJygx96aZ9yGKg==
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
	Caleb James DeLisle <cjd@cjdns.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 06/10] dt-bindings: mips: Add EcoNet platform binding
Date: Sun, 30 Mar 2025 17:03:02 +0000
Message-Id: <20250330170306.2584136-7-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_100350_467890_4C99F3EC 
X-CRM114-Status: UNSURE (   8.43  )
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

Document the top-level device tree binding for EcoNet MIPS-based SoCs.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mips/econet.yaml      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml

diff --git a/Documentation/devicetree/bindings/mips/econet.yaml b/Documentation/devicetree/bindings/mips/econet.yaml
new file mode 100644
index 000000000000..d8181b58c781
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/econet.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/econet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet MIPS SoCs
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+properties:
+  $nodename:
+    const: '/'
+
+  compatible:
+    oneOf:
+      - description: Boards with EcoNet EN751221 family SoC
+        items:
+          - enum:
+              - smartfiber,xp8421-b
+          - const: econet,en751221
+
+additionalProperties: true
+
+...
-- 
2.39.5


