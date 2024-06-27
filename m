Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F4FC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+6/jw2l8WbHbxp3JGZOU8peyFUqkM87CC9BxxmyKfM=; b=bLNTT3SCvnYUWDePaPPpMj0D/m
	wOKVFPPxtIzH/ZTeqrt7x5QMcSdrw8WQY0Nh1s/40wGYgZp2ANRjQCJD0R1g0JNtVngv5OpcV+/Ya
	EqM5yBeidrQQu1ueBwPzrfIDvctRiAI+jKTt6ew3B/7uAxWb3zpK8wCFNSpRX8zG3kgEgc9RIDrsY
	kQxQ1dT6aqcrJA4oQG6f7iUieWPhJAXh3fPyo8FM1QBzOcbOURYiq7So0SA+Vubn22tT/i2F5q7uX
	fcoqeUTX5Eb3YAuawMOaj18LvJU02rp+5b/Wi+ojGaLGty/7xKVjDH+xlWbKl6e4V4mTWlq0ySA9E
	xMzb0DxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmSR-00000009xyQ-2Yco;
	Thu, 27 Jun 2024 10:34:28 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQt-00000009xFJ-0AOH
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 10:33:09 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso6029113e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 03:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719484366; x=1720089166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+6/jw2l8WbHbxp3JGZOU8peyFUqkM87CC9BxxmyKfM=;
        b=Rmv5vyFvfQ5tVtJoXYcluHTLZbxD94rFV5HATeUQMbYwKmPKYjYLrVMmc+NDEbkoGL
         JBd9ZSzlaVvpAFiTS1cmkqy8IJCDndphkEA7OoxnsYxjDnICV5BzU9KhKBOt+wTqsSf6
         qJG6VzC04feCrwfn0XqpSVKTMr4hysAS8pYkfxtZ2jJF9BDLXzVUqb60Jq2QA8PPi8hZ
         3Fde/bVFu+bXAtV7qK8qbK7w/2bxM19dfRb2ptJ/pL5P+MqCJbJRE7wcunmrIkg5ToTX
         EWwuop58RBRUkmp03Znk2iKLhbA1CUNP6Rum8Xw3Ti4BG2Xz+RbhB+wh//EB6da2paB5
         o80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484366; x=1720089166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+6/jw2l8WbHbxp3JGZOU8peyFUqkM87CC9BxxmyKfM=;
        b=c8YVHPljK9le7q28GlSNf7nNK7om9PvA/VPehntxfobgg4ouL4U6Ew9bLo0VEqehZN
         DYomDHAoHmEehB3mk2ZHs7ofLeR3uTuME5ETdNR9oiwIEuk49gBf4WK3Bq8vBr3CGbj1
         vp/x4LOKVJ2U5k6ZT6EEc/gN/JGKxNVghPJVKM15mqGgk/oeUIPM+M37ag4ESdNjUuHW
         p6P1ynKvc28ws4Oc7V+SFiyvgMB1v5WMbIOeyTRtteeQ8ngjV+bsGhe3WIbU9v9d/ge3
         AGOpow71UKHLfJibeP1bxx8Iesr3r7Y94S5AXo02qNM597SJlqD/R+rIv+crCimAyhZR
         X0bg==
X-Forwarded-Encrypted: i=1; AJvYcCWCccn9HZrItRzTKwdRxSmScOWkXoB6VstQ/skKj1duC7J4Zs0UV1ElsuKyYwQr7xm2bNwNuYo9ZM4v35fCI/6T50ZDOmv4DvIdg04rgD41QyVD
X-Gm-Message-State: AOJu0Yz7jxVyljJdTfUwaYTmjk3dAR7F6oRXOC07XGkl1P10aYjeeY6C
	Jq6MJIZeGx5XpI+YnAyMiJSHF8VqE6R3o5JltjGjRqYvZthkcCf5XF8UYoyOaxY=
X-Google-Smtp-Source: AGHT+IEoS3M9/3U4NjfBgJrciMQw7opzkhWp4q6gkv+HvLfxXQBP/1gIhzOQ1/YNBvMXx8utt1dJpw==
X-Received: by 2002:a05:6512:e95:b0:52c:8a3a:fe2c with SMTP id 2adb3069b0e04-52ce185d049mr9830460e87.45.1719484366212;
        Thu, 27 Jun 2024 03:32:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367435852afsm1384352f8f.53.2024.06.27.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:32:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 12:32:21 +0200
Subject: [PATCH v4 5/7] dt-bindings: soc: ti: am654-serdes-ctrl: Move to
 dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dt-bindings-mfd-syscon-split-v4-5-dc6699a9f3e4@linaro.org>
References: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
In-Reply-To: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
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
 bh=8MLHDWyReLz5qqD7wVSiIOMBs4CdtSdIOqFJ3Bu/4Os=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfT++cwdCKsMdwI34XqMjKV+VEq2ZPnBb8whmj
 V0GmiqiL/WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn0/vgAKCRDBN2bmhouD
 1xqZD/9sRU1DY0+8YUNfIxhuMHDSblSlLWagDywLBIZGUHc2JGkTM3ZDq8UMCH3TCob9i4hHvDs
 caEBDFAV6jT3db5RF7euDLG5eaKkRkxBYFaEG6Z3frqUvm0q+Lf9ORvceA7+cDwkoQDfcRd5+3D
 YTY0UI1NShe72ad9B2k6wnNyZ51kKke/SXW31dwWvtktsF7JIZQcTjM8jvvCWxdJaUURfi/kWtc
 cwbFf8mjHy4bgob7jgWSeYeUoBt6Qh6FzqvEYmJOX4Ub7CqL5cVWgUAd20eDFNJJujyBW3iBCq2
 bJ7fsTQRUlTDJCjW76Z6tL+X+rtKDiTYlU+a9yHfKiC8fcsEt/lCBcDaiwCuuIkVUedG2CtmKhE
 mNHw1jspPphCtsc/nkJmcX2UaPliRHOtUwWpXtQCxCV54G8gU3OKN9HNbI/oYDRzh+MUpxCLQR3
 u1IVGZNOUZFIkTQWa4MW4taT4GFe71Dgk3aFqB1X+NZUEB/DiNHKiYEbDetjNhLk3obLiKt8YtU
 zP4tFl8gMuqnhOmXHHXYalIh5ou1abuXnuxiFi474eOf3xs0qm3UYEFUZk6+pZT4QtZj19Psfql
 P+464fNd8jx+MH0wKWB4CIqPjUnbRkXfFKTusvVRevwlWpwdOQfq3pRw5WyY9O0xLBV0NodRwcH
 wclR31GK76zyBrw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033303_048946_34838B2F 
X-CRM114-Status: GOOD (  14.46  )
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
index 49bf85e8f220..0f6fd1a41dd8 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -118,7 +118,6 @@ properties:
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


