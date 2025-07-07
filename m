Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D682C8303C
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jul 2025 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NECInMbpiQG/PwLqSg8ezbjPUfOcvwY5Z/4a27S/mu0=; b=dT3YmJ424H6oIj
	DV9jRxpDUYgn618er9zkkiFG8s8fRENRPVKTmPdma/4VkrZGS+BYSe1BWH5bBLegn5mGsaAGJpZhl
	Q8YjIUaHHV78w9xBtRmeCHivDCA/fJTDfvzScn0JI63JSHXZSotbSRtiHNqAv/WpGN7C3asJJtu0U
	Yf4M/NLFYbyRLWoHD6bl/V64Q2LtoPuNxnsJG1bqw93Cx6RDu/AcxkB2MEPaKtIqZ/qEmM3D8Zj3R
	R6QlNgwbMKpN3u3lBwJHkEwXzGupI28xIAkA9l+/DRXWl1UAIRMSEQ/atq7gEclsE/hxHf+0eFO4E
	CxKd9/5hfJ3FhWkQybqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYk68-00000002HqS-0tO9;
	Mon, 07 Jul 2025 11:33:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjWI-00000002DBe-0v5Q;
	Mon, 07 Jul 2025 10:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NECInMbpiQG/PwLqSg8ezbjPUfOcvwY5Z/4a27S/mu0=; b=msVHwY381ENeTUk3KwDnXNxPV8
	Q/BilPx0c1SXhrH/PeGI76JCAvlrSNmYqJZXe/Cp5Fk/iMl9mt4gYaGiT9X7ovm5jky3mYPo36ZiM
	kH4mOTftqYDAAU5VrNNbAdVKbSA2H3/K09DF391stOQOCT6EsEwqESa+LNoyZDoXK1bK+srUHgZp2
	F2ASjmle55/2xIsglXuqIz4kBQZi2JZqxoCD3TQSV8/8s/+6dW2EO4bx+LEIwGKf8WU21Zfeg3dmR
	SAMVkvTYCiUYF2/P9sKf1VupCvIKOwUMuzMewZQXcXxQ/BQGgkPWzHjEQYSP+eb4lv1s0xKkE3lpn
	d5wkiiUQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjWE-00000008SvF-44TO;
	Mon, 07 Jul 2025 10:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751885777;
	bh=mJNDHPpArKghJz+dCLO1GxtYWSj/lPdQ4uLFczfyhGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CjBAoZCS9fRNqDaAF+owIAkgBE1lWANHZTdJqUKVjvTH6Bl64l1eGNl8TUXt4Hgs2
	 ZlTiZf1cFhXsQ1BEQcS2uBsdjNtGS0Z0n0od0ph+LbsWiJYX17+t1bP2eo0W5MFycw
	 ZC64f1pWxHW7Qar60Jf0hNdG3b14dylhkaoss0IdvhgmmOmJzfX0qTr4MAYRIYSrv/
	 2KVVX8P53Xct1m3iGqQW3BuBIScFykObo2B9A0G19XU3GjGWkQYp0yOxVkrWWKHi0s
	 heHrWM9/Y36KiQYO13RkDsB4VTX51kQVbgn04I0cZ1tICLx/em+9Bwz1mw5ETI/rTm
	 GBbr7W+L+ZuoQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A3A417E108A;
	Mon,  7 Jul 2025 12:56:16 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 02/10] dt-bindings: clock: mediatek: Document #access-controller-cells
Date: Mon,  7 Jul 2025 12:55:57 +0200
Message-ID: <20250707105605.98248-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
References: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_115619_345295_B8568A98 
X-CRM114-Status: UNSURE (   8.07  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, linux-pm@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Allow the #access-controller-cells property on all of the infracfg
controllers on all MediaTek SoCs, as this always acts as an access
control provider.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/clock/mediatek,infracfg.yaml         |  3 +++
 .../bindings/clock/mediatek,mt8186-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8188-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8192-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8195-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8365-sys-clock.yaml | 15 +++++++++++++++
 6 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
index d1d30700d9b0..27f1a31c3424 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
@@ -47,6 +47,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index 1c446fbc5108..2a1bf9073b7d 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -36,6 +36,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -48,6 +51,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8186-infracfg_ao
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: syscon@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
index db13d51a4903..08472d363e8a 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
@@ -36,6 +36,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -49,6 +52,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8188-infracfg_ao
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     clock-controller@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
index bf8c9aacdf1e..f1ab8b0e0a98 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
@@ -26,6 +26,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -38,6 +41,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8192-infracfg
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: syscon@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
index 69f096eb168d..dcce8b188e4f 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
@@ -34,6 +34,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -46,6 +49,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8195-infracfg_ao
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: syscon@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
index 643f84660c8e..b6f074f98db7 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
@@ -28,6 +28,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -38,6 +41,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8365-infracfg
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: clock-controller@10000000 {
-- 
2.49.0


