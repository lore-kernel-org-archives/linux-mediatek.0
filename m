Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E35C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:01:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DA220575
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWU2rjjj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="KxSaq5XT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DA220575
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDBjgzxxO/qCqCJd8LaN5j2DVZx9fmRr+CDbOY/6MVA=; b=dWU2rjjjA3iwEi
	AifRVAkqiI0sDu1NBdaACcTbKfaXaAahsFrr2n1qLJBKQgTcIkmS+LSWVotAEQ5fybcQsW934+smP
	miZwZ8DnPskUrQuJYZ+lnmZTT0ImP9t6zFYmrK1WaA6O7MOyQg3uxD6QxymzUdu/ERsQKAtuIC0Ga
	dfe7DeE5vIzCI4oNdZeAlhDbFuRc2gKDL2iV1FDXq0BxLzd11AhzmAQ1KfCLkvLJxjQqVnEA2bNVX
	r++PtVTeSqyzwZVi6iuGIUHpAPFVYycgl11TfhtkqLS0VfBWtnuke/yCagRV1o3iZ8s6EOmI3Nb5v
	RDh2yClpxwq1lPhp3uqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8nZ-0004SX-MR; Thu, 14 May 2020 08:00:57 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8ml-0002VT-EO
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 08:00:11 +0000
Received: by mail-wm1-x343.google.com with SMTP id f13so756960wmc.5
 for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2020 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MAzJNRl7denaMJiKd3+TRewxkBzsyKS+1FyrOm5aCWE=;
 b=KxSaq5XTxVnVtwBXUOoDMp6SZenmSrmrS6gLUnxY6vLkzVplpObQpbGhAWb5e3scZb
 G32p4TJzF966nh1yZL9JpgsEt6Uc5gC99jEqeY5/lBrPjylopUDYUbnK02TMyTRx3iz6
 YucGl5to1Lmqvw4cFTcJf3TNiiFaLe8dp/49nGOEraC/fqVDh809GAiaP+eWfz3RQ9ZD
 q3nxMOvfy/S+ebWg7OjLrnGysj3nnHoIdEeh8QBNvJq/80dzMrMvHc/0O4SezOAYmzRh
 oynPjujMBWCtxL8iaOIFsZG06Pg2JdJBv8jBrp/PxoUNR0FZktPl1YfltiLh7wYyhe3h
 Z3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MAzJNRl7denaMJiKd3+TRewxkBzsyKS+1FyrOm5aCWE=;
 b=IVpXk0mj1sa3Sfxs0EIvkvQ+1HbBa9GjHnyyKIu/ExaLQBMGLUWY6RRqocnKcChI4L
 s1TkVVI/7ZVb9zOxaEwQC5+PtB4br/jYDnACWZ5Wu9pda3vvs+Zaa0kZgNgbgzvRtN2G
 EM1hRF56l+KtshptKJtCS8LZ6KfnyOUNP+aTOeCrlJ2QyU1QFBsHwN0a/rIlBTGUSnnu
 eu4VWOCzIkNovMKYjgz2J2J2byuODMWBxc+mp1WtxUH/pd+43b38con17IFxaPrf+uwN
 qkViBXOTfiKFR4r301q4xjUKOcLYO6ni2YdHd3xnmok3G6S7VSk2mr8oplDLYDH29es/
 KtQg==
X-Gm-Message-State: AGi0PuZDbpoewPBFZ19XqXJTwCAg015cUx9EQ48grw+5EZoZ7VKm6+XN
 4aA1CBDdUjTeBcOXd8FiDOQhfA==
X-Google-Smtp-Source: APiQypIcLG6kxXh59WxYMGwxMY8DTBtvFFG3hqTEALY2eBNk672ZnvUMGUIpRZsXEJD2i9XhJXK2gQ==
X-Received: by 2002:a1c:7e03:: with SMTP id z3mr35139048wmc.88.1589443205805; 
 Thu, 14 May 2020 01:00:05 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 01:00:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v3 01/15] dt-bindings: convert the binding document for
 mediatek PERICFG to yaml
Date: Thu, 14 May 2020 09:59:28 +0200
Message-Id: <20200514075942.10136-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_010007_494622_0798F0F7 
X-CRM114-Status: GOOD (  12.98  )
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
