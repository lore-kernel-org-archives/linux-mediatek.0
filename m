Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B9EC30659
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zrd8K+qyBfVetpIrLm6qlKeNQKmHjz4ob0FFgn8jaII=; b=gN4YNQW649i7CDH2s0zRmu/rU3
	Ox1LJshLt5M42NN4u3sVyFnDnTlTTykmF0eMd/RV3eiBHJXIZdRmSTF91pP6up51LL8zZYtZqkCrc
	Mb45DaJYi53G6CA1Sy0q4pIbNO+nL0vTDrCxWFcu5ycYFNzNDTAfrNvfP+KdRrVNDE2KzDCTHajFF
	zcUHYuvVakMCltcP7X6a/KStBZUaHoYaS+YiuFg8AukDCWKmL/p+VGC5358bsg0bsYkDz2KY1uYGP
	JtuZVQTwln5hUepPbRRR7P+HfI7FRY2K0HXwFT9jj5a2xScDMoRZgV9d6RSB8QhJEIDaVeOuELtyG
	kghHsRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPbs-00000006Ffk-3o2x;
	Wed, 26 Jun 2024 10:10:40 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPbK-00000006FKB-0lxX
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:10:12 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-376243a112cso25343425ab.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396603; x=1720001403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zrd8K+qyBfVetpIrLm6qlKeNQKmHjz4ob0FFgn8jaII=;
        b=K8WMp/VJftulpaDBq0CMiQsErgzG4lrfaALiuc1pES193Y5FZeadmqp7D1TOMhprBl
         RrNDOyTKYUt5v3xfbQ/mj4B/xKPWGsEljkVeeETHqoaKm6/eTYm5AwOrFWK/9yTibrRW
         y3aEWSJxP9Qq0wrggq7R7wMmpmr0KYHe8DA5/JgpOiHf3fZ8SlBv0jGFhyAGNlYDv7/U
         8cOUJI91y46eA6fSz21UH6DTnCF7XiDfIpX8o/bMdA6Kv44hZQunP38qzoCG7TnJwzig
         qBk7RIZ8jc/Qna5iqq/PSoFOGp9nkYLvsUT9admdFeHBwGz0nt0DwfD+k8qVADHjpNtW
         MKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396603; x=1720001403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zrd8K+qyBfVetpIrLm6qlKeNQKmHjz4ob0FFgn8jaII=;
        b=ddFcj0SZOT9hiyJLtw4Fw3NnYetk+Cw++FCZSRpjzMShA8rKElTNK6bqJYWR1Q1vAV
         goaKnpjioP19Mdmu/mWY1KGF1g9Df4MmiPQB5qUWw1oUT6omVq92SDy8RjtHEJJ+yFVr
         Y0UVralEVB1B3bTdZrZCrHXp4tmYpCBR7J9NLKipwAufQQT3lIfNfKk5gJW1q7bTLLqs
         pSbYC5OYlx+dH0gvoPSAqknl4CSYhJGcJMrtvgGfpxogLUGmMMHmrk/wLWO0qPdHqf1a
         XVwctA5bTuV3Ymvw1X33uck5jPnRSzrfsMM4fm/E48fUkF5hwtFmIvCfL/b837OVnx6G
         luNw==
X-Forwarded-Encrypted: i=1; AJvYcCVrg/KFJllzZCzyYvrqddePZ+9O6uO7cznOR9T1zphupXE8d1fKmKUiNfHynDad3OM9UQP6vAXCSU0rLnIJ6r2xjwXLMvozyBSKCCCDjqbBpX0+
X-Gm-Message-State: AOJu0Yy9lzEqda5uBvP3zo8nGVc7BQNpnBCKHv42GS9UgpYw3KjQCb3K
	PCzRvqbQ7Y34oaF2M6i2t9yKJ7zqYegCtHN5IpyWlKx6brRULS7j1jkHyhWm6zk=
X-Google-Smtp-Source: AGHT+IFUZzMErxpLYVEJfjbPiqJyGKvbDtnALq/jGvRL0oxC3s7sFwdWv/jSN7Scrt6aDPMiIQgoiA==
X-Received: by 2002:a05:6602:6427:b0:7eb:eeba:5e92 with SMTP id ca18e2360f4ac-7f3a4e4748emr1288982739f.13.1719396603486;
        Wed, 26 Jun 2024 03:10:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9d121859csm3079108173.137.2024.06.26.03.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:10:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 26 Jun 2024 12:09:14 +0200
Subject: [PATCH v3 5/7] dt-bindings: soc: ti: am654-serdes-ctrl: Move to
 dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-dt-bindings-mfd-syscon-split-v3-5-3409903bb99b@linaro.org>
References: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
In-Reply-To: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2452;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dA2BvNuDdbIFKkStpUlyQC5zc7XFrh1545e/AvgMWBA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBme+jRx0FlUKs9m7U74Cl3aRCoF9QLcGf9TXxW8
 zEdB694ZDaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnvo0QAKCRDBN2bmhouD
 17GeD/9ttG1wj0agCEdCp2J1UVba8gqRUHHk9HtrVHO0PJV3qgTr2zDrRQDq8umUBkbNKhvceRs
 j/B3B31vXhOrLr5Vxd0OEp9Y9rM+q89afgjdQysN1szBsGzd0465MObh6jRFyrVCuGINTxKpS8F
 yQE4dS6fgoIIJRfX5GoY/gGCk66GVE8mQiWj1E+ATc0tmGtw2Uz7pSUm+55Yu6cVqS4HLB7VwCX
 SFepNQvkCIYsxaacKdJNxkcDh8P2k5IcNgbEpCpe2s4eyZmcDYkcY3uP2PRzckYG9Svwwly2/VU
 sCCD5iiRyxY8M/waZoEHbcWfTYfiUCBcS88241a0t7MlKcYQq/FdVEGDX4H2KvpRDYJSonayugZ
 /3KR1xEfPG4UC6PizRklUScg5fP9voO/inXN4SiB8KQvqD7JaFpsRpn8SciEzcD3xniNHcqFMR7
 Yu02tuZI38F65YkJrrGFL0bZLDcaUmRwfOo4d8LZNYC/qJGkmg9I4QIF+oDFtR4jIcZLl3aAC58
 5kSdZ9qxXKHEE0zMQhK30NYVZSfSkBOsv3U53TXhjH9ibHu0uGIMif+QROwn2QukdH8wkXZeyd4
 uWEwtdZ2VYO8Bzyx/9r4MNazK1IHpu9DPQ5lTl0ZBAjomrtvvTLe4V93mgQ02RhYKmSKbQBXHvG
 asVbvlvhTTM/b1w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_031007_005918_C2A4EBBD 
X-CRM114-Status: GOOD (  14.49  )
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

ti,am654-serdes-ctrl is not a simple syscon device - it has children -
thus it should be fully documented in its own binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Context might depend on patch in Lee's MFD tree:
https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
and also further patches here depend on this one.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
 .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      | 42 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index abd3debe5faf..d6fa58c9e4de 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -117,7 +117,6 @@ properties:
               - ti,am625-dss-oldi-io-ctrl
               - ti,am62p-cpsw-mac-efuse
               - ti,am654-dss-oldi-io-ctrl
-              - ti,am654-serdes-ctrl
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
 
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,am654-serdes-ctrl.yaml b/Documentation/devicetree/bindings/soc/ti/ti,am654-serdes-ctrl.yaml
new file mode 100644
index 000000000000..a10a3b89ae05
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,am654-serdes-ctrl.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,am654-serdes-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments AM654 Serdes Control Syscon
+
+maintainers:
+  - Nishanth Menon <nm@ti.com>
+
+properties:
+  compatible:
+    items:
+      - const: ti,am654-serdes-ctrl
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - mux-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    clock@4080 {
+        compatible = "ti,am654-serdes-ctrl", "syscon";
+        reg = <0x4080 0x4>;
+
+        mux-controller {
+            compatible = "mmio-mux";
+            #mux-control-cells = <1>;
+            mux-reg-masks = <0x0 0x3>; /* lane select */
+        };
+    };

-- 
2.43.0


