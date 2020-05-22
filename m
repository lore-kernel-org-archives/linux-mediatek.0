Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B743C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:09:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 423C2206F6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3DTw6R3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="ive/SXQx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 423C2206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDBjgzxxO/qCqCJd8LaN5j2DVZx9fmRr+CDbOY/6MVA=; b=r3DTw6R36v+dvv
	9gzbRY0L22X6Im5G2SB4K1A+lGl3nxaVY+DdUIARfIik5HIObVanEw06tUdJqEsstdbTAdIHw7jnj
	qBqifczLX1qRnzjbCXA4PqdVgFyf9ZJ4MTi4OZ0nOlKxDmB23l+9HU1hy5jqyMVdmXRfUi0dsCseW
	hEWcLBXB3evWyyUdTohcJsh1Ja1jzjd96tjC7TNqxHqq3Z4DuekRE2Lwfso5U48XokCTJriAOKDZz
	xWAUbW7NxDR7XVSXl+oA4HBSa7uivHL4As+m4KNROvpakHbxmgzArnkT5kWPu/JEhVesfhXSb8Kto
	jFUHhZfMmbrKtARQjaiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6UC-0004qo-8T; Fri, 22 May 2020 12:09:12 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6SU-0003Gz-Mf
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 12:07:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id h4so8418122wmb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 05:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MAzJNRl7denaMJiKd3+TRewxkBzsyKS+1FyrOm5aCWE=;
 b=ive/SXQxt5s2pDXP4TWmu4Ys9wRpRSQymcCM5LMgqsL9p5NnfsCO/xrcOMXD8WcBeR
 olaAhRkbe4zMwWYqOPs93rQrj/6pZM9vrvFpw1n7EzwShF042tSv4YA/H2mGuOoGL/Nn
 gAkMNCW2yaJnKt014rskf3LvJaOz8nsfWTiHPwLx8hGkxR9acPnN5D8aldoSanXWfxjC
 VQD5/uf8dOTPDoYRBDEq4JJhBlyC7GfiTFbFBYzjj05z0FtnJDSoJSJ4KU/sDyzP+iiI
 B7E5J0M4oupKLsSq+sAVPsjVJZZ2VMiVhOklYFACnj/RrN3QIW5MuieIH6pqY+YXYmWP
 57bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MAzJNRl7denaMJiKd3+TRewxkBzsyKS+1FyrOm5aCWE=;
 b=CXy2Y2bbrH1rGBCNBqiRxb1jyekrk+wGETgPYeJAN9AMDfkO9Oeic8o/f0im5hQP3N
 xe7LGKNFUT0SH+0r7g6QAdumQGg1xFyIb3f4OhHTZGHhXStSpznvjsf9GKvRuL9mZG4j
 aIZSzals5x/qLRC1WYMftObjH30Pje5D4ngTrlAvvsGSXXQ0RZBAN/ptrVJZ8/JgwpJr
 EkM/cKeT9sHFdoor+5lZGOSJPuab7HUQasycD2prehIF+VpiQZrGUGonIhKmqQcGN+Wi
 X9Cmu++HrrzozFZ0yHf4Yi83rw6n4z3WJ9B/mLE2CmYeXeg4k1+Rbw8PYCa+751u1gm2
 SW+g==
X-Gm-Message-State: AOAM530sxoyE+R/bVezBQKII4bjyg/rfYXmv/0lBn4T4bWjqw7wjrce6
 6EPVyT6o+gc0BTEyw/wqrAzV5w==
X-Google-Smtp-Source: ABdhPJziDSESxwHOJYIEXItrvrHloQQKHniTvPFl1/zdKylGfKoSeovvjrCBLYzNAwuLkVdTvOeA/A==
X-Received: by 2002:a1c:2707:: with SMTP id n7mr13564997wmn.147.1590149241597; 
 Fri, 22 May 2020 05:07:21 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id f128sm9946233wme.1.2020.05.22.05.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:07:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v5 01/11] dt-bindings: convert the binding document for
 mediatek PERICFG to yaml
Date: Fri, 22 May 2020 14:06:50 +0200
Message-Id: <20200522120700.838-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200522120700.838-1-brgl@bgdev.pl>
References: <20200522120700.838-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_050726_776273_A2478DE6 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Convert the DT binding .txt file for MediaTek's peripheral configuration
controller to YAML. There's one special case where the compatible has
three positions. Otherwise, it's a pretty normal syscon.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../arm/mediatek/mediatek,pericfg.txt         | 36 -----------
 .../arm/mediatek/mediatek,pericfg.yaml        | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
deleted file mode 100644
index ecf027a9003a..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Mediatek pericfg controller
-===========================
-
-The Mediatek pericfg controller provides various clocks and reset
-outputs to the system.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-pericfg", "syscon"
-	- "mediatek,mt2712-pericfg", "syscon"
-	- "mediatek,mt7622-pericfg", "syscon"
-	- "mediatek,mt7623-pericfg", "mediatek,mt2701-pericfg", "syscon"
-	- "mediatek,mt7629-pericfg", "syscon"
-	- "mediatek,mt8135-pericfg", "syscon"
-	- "mediatek,mt8173-pericfg", "syscon"
-	- "mediatek,mt8183-pericfg", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The pericfg controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-Also it uses the common reset controller binding from
-Documentation/devicetree/bindings/reset/reset.txt.
-The available reset outputs are defined in
-dt-bindings/reset/mt*-resets.h
-
-Example:
-
-pericfg: power-controller@10003000 {
-	compatible = "mediatek,mt8173-pericfg", "syscon";
-	reg = <0 0x10003000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
new file mode 100644
index 000000000000..1340c6288024
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Peripheral Configuration Controller
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+description:
+  The Mediatek pericfg controller provides various clocks and reset outputs
+  to the system.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - mediatek,mt2701-pericfg
+          - mediatek,mt2712-pericfg
+          - mediatek,mt7622-pericfg
+          - mediatek,mt7629-pericfg
+          - mediatek,mt8135-pericfg
+          - mediatek,mt8173-pericfg
+          - mediatek,mt8183-pericfg
+        - const: syscon
+      - items:
+        # Special case for mt7623 for backward compatibility
+        - const: mediatek,mt7623-pericfg
+        - const: mediatek,mt2701-pericfg
+        - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pericfg@10003000 {
+        compatible = "mediatek,mt8173-pericfg", "syscon";
+        reg = <0x10003000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+  - |
+    pericfg@10003000 {
+        compatible =  "mediatek,mt7623-pericfg", "mediatek,mt2701-pericfg", "syscon";
+        reg = <0x10003000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
