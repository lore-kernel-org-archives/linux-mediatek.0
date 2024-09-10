Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D029EE01F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 23:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YytXRplb8q0rvadFFQE6Wudst/QUcjC2BlcOMK5ZcAE=; b=C8rYLHDudmi0mjdUz5toWLB7GE
	7FumWrRuCtokTY/y88QdWtEKMYKCwonzTKUyTgKXfNcJDE+tqrsr9QcXeOHPMLJZzAHlF0XXPMR8B
	isb+DLmqlPUnKsld9C71iyP8PxBwZOo12Ywe194Ul7Yk/kWoS0HjPxIXgEcUSNifSbUTW6UH5L27m
	Jd/0wH7Jgta+0rfBlQfocCaViyK8zB2X2UHDg0dDwKOp2wm+6ur5AEmMoR5voVqv8t5sThQPOpVNu
	rxttqsCWiRz66HJsyPyCqXREbGjB6MgJtHnCen9YZH9UQaolTRM8VVEXKPjD/yCCTkl9EbkCTPq+c
	15nOCI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soAY9-00000007TEu-3FyR;
	Tue, 10 Sep 2024 23:45:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soAWy-00000007SeN-1HmG;
	Tue, 10 Sep 2024 23:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 080D95C0368;
	Tue, 10 Sep 2024 23:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D33C4CEC3;
	Tue, 10 Sep 2024 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726011858;
	bh=52dbOaQAtE+QBJjRy/7NqFe/CweE7AfpiSDKiTqjnSc=;
	h=From:To:Cc:Subject:Date:From;
	b=lGfW+LQdt7Hvg6FWWW4JPKtvNm9rou75N0NKO51O5If8V8GEQuEzECS7fs+M0Uonl
	 cRzvGS8Sz92Cs2kpZ5ZFCE2xXvaWQ7MHzdgxjxchGlB3vJZfN85WFvRwDNUyX5sNi5
	 EhyXjLXGUQx8ZnNxcdYsWFxUTh80NhM86WTj3d6JvAax2Ni9OkYuNt2sV11aAWfAdf
	 e5a+rICnZ00EwzhbKE5MH066caMpTYGjWeuqNvB1b0QThx4N0vvPzZ93UDUuQQWmU0
	 am8J79XYsiueJyXSC3K8hWByRmW0feoHKN5cxclswiZAjVaHkeSRaL3S5LswD/C1go
	 qr0wQwj+E02ww==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: clock: mediatek: Drop duplicate mediatek,mt6795-sys-clock.yaml
Date: Tue, 10 Sep 2024 18:42:37 -0500
Message-ID: <20240910234238.1028422-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_164420_434992_0A6E5387 
X-CRM114-Status: UNSURE (   9.58  )
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

The compatible strings for mt6795 clocks are also documented in other
schemas:

"mediatek,mt6795-apmixedsys" in clock/mediatek,apmixedsys.yaml
"mediatek,mt6795-topckgen" in clock/mediatek,topckgen.yaml
"mediatek,mt6795-pericfg" in clock/mediatek,pericfg.yaml
"mediatek,mt6795-infracfg" in clock/mediatek,infracfg.yaml

The only difference is #reset-cells is not allowed in some of these,
but that aligns with actual users in .dts files.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../clock/mediatek,mt6795-sys-clock.yaml      | 54 -------------------
 1 file changed, 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
deleted file mode 100644
index 378b761237d3..000000000000
--- a/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
+++ /dev/null
@@ -1,54 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek System Clock Controller for MT6795
-
-maintainers:
-  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
-  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
-
-description:
-  The Mediatek system clock controller provides various clocks and system
-  configuration like reset and bus protection on MT6795.
-
-properties:
-  compatible:
-    items:
-      - enum:
-          - mediatek,mt6795-apmixedsys
-          - mediatek,mt6795-infracfg
-          - mediatek,mt6795-pericfg
-          - mediatek,mt6795-topckgen
-      - const: syscon
-
-  reg:
-    maxItems: 1
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-required:
-  - compatible
-  - reg
-  - '#clock-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        topckgen: clock-controller@10000000 {
-            compatible = "mediatek,mt6795-topckgen", "syscon";
-            reg = <0 0x10000000 0 0x1000>;
-            #clock-cells = <1>;
-        };
-    };
-- 
2.45.2


