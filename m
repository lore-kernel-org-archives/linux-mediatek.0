Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D7AC38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMnJc+k3BQCb5bXYfRL3MsvClm+VDOd3dvG9NLKDvOQ=; b=mNvQf2jvu1CW/z
	AkRXqkmQtW6D0DUJr5fZ4z5GUIu/t0oR/52bKzTi7m/y3dStyou1Vr+9r8JEOxePsHl7y2Z6zLfgi
	tHd+uEMVNWr5S1Vi/TbTt+xraur+er1/LKoHtk9oMRj7LttXM4ECDNuZ+5RwYSkRacFOPDWmXn3un
	/edbhfi0OKx4rmFCK06vRY6dH1qbzE++O1ZzAlQJJiI03e1U2x4mzSoIQJ+2ODUjQGjaqWHqjq491
	EIsn3jv9vV8Xq4W4Y9AAIVWbjJI3yPOp3V3TS7d4W9MUTNZ4FX1nNKsLNVB5hCm0XHGCJItNomZss
	XDn1CpX83yc9m8f3Z+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onK1S-005TTK-Cq; Tue, 25 Oct 2022 13:31:14 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onK0L-005SvX-LG; Tue, 25 Oct 2022 13:30:07 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 9F3AD6269B;
	Tue, 25 Oct 2022 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666704600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bMnJc+k3BQCb5bXYfRL3MsvClm+VDOd3dvG9NLKDvOQ=;
	b=bqmjXLDAHMMTdEesmQZpRVjFUesGHRW4pFIElh7RlDZ3fk2PHkd3CB6WZcs0tUkYoyeic2
	ZMfInO8tsZY1OT3/41+sXPu0C46qltffdlN69AXlPNukYwyOpyYQUCwW8Tn0gGEh3gYlm0
	66CrMJL7mR/wOBgeD2FvM08GgIvhxWw=
Received: from frank-G5.. (fttx-pool-217.61.152.57.bambit.de [217.61.152.57])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id B857340112;
	Tue, 25 Oct 2022 13:29:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v5 2/6] dt-bindings: mmc: Add support for Mediatek MT7986
Date: Tue, 25 Oct 2022 15:29:49 +0200
Message-Id: <20221025132953.81286-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025132953.81286-1-linux@fw-web.de>
References: <20221025132953.81286-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a777fd38-8390-4268-8bed-ccfa143c1ccc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_063005_857594_543C86CA 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This commit adds dt-binding documentation of mmc for Mediatek MT7986 SoC
Platform.
Add SoC specific section for defining clock configuration.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- drop assigned-clocks/assigned-clock-parents
- fix clock description
v4:
- update binding for mt7986 (new mtk version)
- squashed part 1 (compatible) and 3 (SoC specific clock config)
  and so dropped Ack from Rob for 1rst Part
v5:
- drop quotes around clock names
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 0cedeb12892d..6f8ecb4788eb 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt6795-mmc
           - mediatek,mt7620-mmc
           - mediatek,mt7622-mmc
+          - mediatek,mt7986-mmc
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
@@ -237,6 +238,31 @@ allOf:
         reg:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7986-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: independent source clock gate
+            - description: bus clock used for internal register access (required for MSDC0/3).
+            - description: msdc subsys clock gate
+        clock-names:
+          minItems: 3
+          items:
+            - const: source
+            - const: hclk
+            - const: source_cg
+            - const: bus_clk
+            - const: sys_cg
+
   - if:
       properties:
         compatible:
-- 
2.34.1


