Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1D9C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 11:23:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFEFA61209
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 11:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFEFA61209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fWpl9HtSNselRQIyz2RvbzHxTIbnyCX/O2FmS5CYtPE=; b=MbZPkQk5WEeilLrhrjxUnuw6dk
	IRWtRsWCXMLHdeyx6YXkyzRCuDNk2ZOM/s1xvnO04KHAqgbizLs+Ojb8cepAGxduypkP/dopAMyu3
	tTN0WajBEevvULtUXlTOZVlMp9InuSzICou6hsQ5QxypvKr5IFNzi2GZKcTqyjOJeralx2fJ7KfkZ
	ltfrPvejJbh/FRObrURzLcwUVKolOg2NZnCLr1LqHxdW/qlk+Wc5LPjajnsO5l13iZF8qEfB83rGi
	gG+obgypTUDzdfSXdkF7KW50aLrYE4pnzCc2ndOuVLpC2kUpPEjRNaVRiVPQ2Vra1b+FpnbuKnGzq
	bOWXo+sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lixoh-000XCX-SE; Tue, 18 May 2021 11:23:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lixoW-000XAr-PH
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 11:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=DCCqrr8wK9Z3oX5rCaA/n2nKsKJmS6s8+5KqyY7fBB4=; b=J7/qh6arT1C0UuCMIYDhUkA1bJ
 j0Sr2CjSLm4dmtwkCZGknhAEjm6mleKPSCNi7thEFYhs12joqx6kdbc8dnnyhVxn0HDdZuJ2SoQpq
 ArjAcTIwAAACfraxZeaaC/of0d+SZOAagMtei8bagwirVUVkq5WUDiB2R3djZgBS3j3mLc4eAwabu
 HYKj9kiDlxF45CJer4zpQF6PJTx2jPufezYcsoQyySGmQZkZ6jG987jeJ9uhM8ZaULFYkbCS4zuDn
 XaaaWqjvaINDzfX/dNaJ533kLZISKIzyS7aqfw0jJDTdCTJ10XDD/4DnuZvIAO/y1jHDgkpPEguWV
 xSe0ZeUQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lixoT-00EbC5-B6
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 11:23:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id i17so9761744wrq.11
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 04:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCCqrr8wK9Z3oX5rCaA/n2nKsKJmS6s8+5KqyY7fBB4=;
 b=ADRUVcjfyh7wZo3ai7Jq+kamkrpn1NhqE2Uw9xnl7FpO6NO3acOJ188VsHlZh4yXed
 aBMn0Mg9z1PGgva7uPUyTXObcFMPAL7XkomDwf1ygn6kCsZ2P/FqRF8QQE9LmKVEebBD
 BWdo60LPPy42Ak5WblviNwa40W0eUHs1VlDY8voDaWXGRP3rVnz68rAY5HfXXeHF97+c
 /hIYla5G5VSW6srZin6MsA4xVbPUY5D+lfKTanbB5tYkHmQq10mdAvHoH6YBefBOoCaX
 1eKuuhHEdjbNcVuoQfAJkPCqwwHlsRi6W+7GPWVjU31bmXaatCxQe5qZmgCRaDwWNZ9h
 lIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCCqrr8wK9Z3oX5rCaA/n2nKsKJmS6s8+5KqyY7fBB4=;
 b=JYR5KaSjTag0lB1BrjJc2Pa7GdcqrHeSzsv+Hq74xFhDL7IsX8KAmgyNEXE64XOZnU
 8978FaH4WlZLyVnzlwdhGxNDHUtgJsKR8mMx/q0tTZNjKTLohDV2qGn4ORKjKoBSenNs
 bJAwaUjiy12UA9+0rutnglfktMne6jZ0QNuWGR5SDkfNHGptGT5X0eX8Ea9cQXBL5fOc
 MAJPxE/oJZBS5RUgiWhQKoIB7knzmDHjH6l+yQ1rJyfJXvBNxgL2kPrmDiz+0De2zifK
 TtTrVx3KhvELnyuvHxT5lKD4WKoOlkUOut+yed6fwbR+ToWvw7+Pxsgi8+Xwy9Ip2VhJ
 cx1w==
X-Gm-Message-State: AOAM532pAlGZYkLVysb4UnGivURb1CdPVMmL9ocOY3SfK/jBmS9qDBmO
 2q3TXl4Pn50Owxp4lR3hY6cZ7w==
X-Google-Smtp-Source: ABdhPJzWfBKWSIvh12WRInRFuIbcscfo06bwrlqRgQ6iVnYGxH1e0APjYYd/RYQzdnFUMzyG5/s2Zg==
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr6217248wrs.333.1621336978698; 
 Tue, 18 May 2021 04:22:58 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id y20sm2881337wmi.0.2021.05.18.04.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 04:22:58 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: rng: mediatek: convert to yaml schema
Date: Tue, 18 May 2021 13:22:49 +0200
Message-Id: <20210518112250.2146819-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_042301_468741_BBAD7288 
X-CRM114-Status: GOOD (  14.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert the RNG binding for MediaTek to use YAML schema.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/rng/mtk-rng.txt       | 22 --------
 .../devicetree/bindings/rng/mtk-rng.yaml      | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rng/mtk-rng.txt
 create mode 100644 Documentation/devicetree/bindings/rng/mtk-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.txt b/Documentation/devicetree/bindings/rng/mtk-rng.txt
deleted file mode 100644
index dfdcb5cd2ea8..000000000000
--- a/Documentation/devicetree/bindings/rng/mtk-rng.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Device-Tree bindings for Mediatek random number generator
-found in MediaTek SoC family
-
-Required properties:
-- compatible	    : Should be
-			"mediatek,mt7622-rng", 	"mediatek,mt7623-rng" : for MT7622
-			"mediatek,mt7629-rng",  "mediatek,mt7623-rng" : for MT7629
-			"mediatek,mt7623-rng" : for MT7623
-			"mediatek,mt8516-rng", "mediatek,mt7623-rng" : for MT8516
-- clocks	    : list of clock specifiers, corresponding to
-		      entries in clock-names property;
-- clock-names	    : Should contain "rng" entries;
-- reg 		    : Specifies base physical address and size of the registers
-
-Example:
-
-rng: rng@1020f000 {
-	compatible = "mediatek,mt7623-rng";
-	reg = <0 0x1020f000 0 0x1000>;
-	clocks = <&infracfg CLK_INFRA_TRNG>;
-	clock-names = "rng";
-};
diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
new file mode 100644
index 000000000000..d9731f0ae47d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rng/mtk-rng.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Random number generator
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt7623-rng
+      - items:
+          - const: mediatek,mt7622-rng
+          - const: mediatek,mt7623-rng
+      - items:
+          - const: mediatek,mt7629-rng
+          - const: mediatek,mt7623-rng
+      - items:
+          - const: mediatek,mt8516-rng
+          - const: mediatek,mt7623-rng
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: rng
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    rng: rng@1020f000 {
+            compatible = "mediatek,mt7623-rng";
+            reg = <0x1020f000 0x1000>;
+            clocks = <&infracfg CLK_INFRA_TRNG>;
+            clock-names = "rng";
+    };
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
