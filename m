Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8ABECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69nrv/BKayymEj9f70cbXjRoS8M413ZGsp2FP8B+6Cc=; b=p1ufHQxDm6HHaAUg2LFVCQ1INL
	ohptHeG88Dyo/S7Mnk2M9n+ykWL8LEzHZ+TF5+mDqwaEKy7KMjRGFZBqtsy+nWiForg00LSOgFlXw
	IQsj0RKDoCFUeC/q7EXMD43caa8BBRHB3AcaR+pgJ2cmceggsBrfXOJ57ktpAwCF5ToFIHQufvAxR
	moieqMKsZksUXEv/pUXETsOBOEt/lzVTJlPgmDUCWrePIt2zRSxC26l4pNfpytgcpX2Dmd4iKN9ww
	ITP3XxlsGbv1G4hCtqBMpwoSr0uWMYsw9uKclNSz0OcUMSAuhUFPKdgBgneVtx9hPtOg+71ujalO+
	st2PiZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL94-00DXxW-Jf; Mon, 19 Sep 2022 18:05:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL7N-00DW7g-7S
	for linux-mediatek@bombadil.infradead.org; Mon, 19 Sep 2022 18:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=69nrv/BKayymEj9f70cbXjRoS8M413ZGsp2FP8B+6Cc=; b=THtJc8N56nMDckPy6AF4w+eWwR
	5aRP17XsN/I5ivbjHocijqH9Y+K9hVbzcLob+8SEr8bUqcclRUFHvGgPlb443+QQoImv78WnJqC7s
	BmRrnMOHXK9MOy9xNeLfMjDHv/wKhmxL2h1OUEOyuSGl5c8m5xCo/piBXv76gydQ2wc79NscyWt1j
	ec0FlGoi0TyMWRRjyoHr3YlWU1YDVIlGKbo9OSKCS1WZvxfFhyEGnj9ndxOsC21g30/2S0zFsbbAY
	tamH43hPirKcDAY07P2mitxmBah+zeUAG+dyzvZueptic1VCEt2puEHAuS/53qWkRq8xap6WIRr0B
	xLsH2Zrw==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK7g-00E8DL-5P
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 17:00:01 +0000
Received: by mail-ej1-x62c.google.com with SMTP id kr11so90523ejc.8
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=69nrv/BKayymEj9f70cbXjRoS8M413ZGsp2FP8B+6Cc=;
        b=2ZDgXmtX7kBtwoUAyxz8rI/gnLo1usAqRIcFp//WkgUEpHJhCUTPn56LV4nSD4vc96
         4ADNXslH3B5Shd0LcD3JYJ/7M2ZPxpmYvmlBYDwnciQmIb+dd8rT5emdFWvOx80yejKt
         MMM8QfLsaPoNoAkDCdmmVoQB2LnGEf+DCqPv8SpIhTDkZiFUJpu0OAbbaTMsM6wKYWVG
         lg3lGETEKJf+8OgeAlqZ+L88vbRecsFHARHMiEUM2ZXJKQC9sUEXHYWN4IGWITGu4Cvj
         f6wMQhd6qOjwNEIuq/p2LxdNHcLGhBDZkGkNOuxddNG8AASoFiH/teUXDgyW9sEztL18
         s+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=69nrv/BKayymEj9f70cbXjRoS8M413ZGsp2FP8B+6Cc=;
        b=ai/AG/BgkRugVsNZ6VVwZUGova0hqnCXY9d7y62EyOXOZR+0yuDpx09KU8oDj3h/mH
         MkRgeWv5fP4+ubuHNtr8hyGDA0TDXcTVS/lRPsqaZqWBOBwnWYfvInEKzn6s3oHk/yQa
         cxMAzUMXJVTG5yDf0V0TPHASMV7Od31Z8QU8Ob51V9RY8LiI6tswb9YSd08o/vaP5wHq
         rz3RI+oWKBpDrpCsjDaoD9xTEamD1XmIDl5w7WK+8VRfiJE9ObzPVnMOevOcYkpbez09
         JlBWsRn9jMhEDF05F5xHC1NcNCJFOfKwuJb1qrkh1fsk0SLm7bEfR/t2Ak2TN/uYqBiM
         h7XA==
X-Gm-Message-State: ACrzQf1xdHx/7AZJq/iUzb/CoFf5FYb1XfYRYpHRia6S/6Ekx8VMoh4c
	oSGbugwn03wC9RfCIm67z9dxVw==
X-Google-Smtp-Source: AMsMyM6XlPFlhgC04B9QuW2zwPNOCYiGRhmcbXp9t18fVx3nugtxHUNV8fsXdbf/C+/TYrDgfmHhoA==
X-Received: by 2002:a17:907:7b9a:b0:778:adc1:1b0b with SMTP id ne26-20020a1709077b9a00b00778adc11b0bmr13092811ejc.569.1663606791165;
        Mon, 19 Sep 2022 09:59:51 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:50 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:02 +0200
Subject: [PATCH v1 04/17] dt-bindings: display: mediatek: add MT8195 hdmi bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-4-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, Guillaume Ranquet <granquet@baylibre.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_175957_167402_2CA4084A 
X-CRM114-Status: GOOD (  10.86  )
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

Add mt8195 SoC bindings for hdmi and hdmi-ddc

Make port1 optional for mt8195 as it only supports HDMI tx for now.
Requires a ddc-i2c-bus phandle.
Requires a power-domains phandle.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index bdaf0b51e68c..abb231a0694b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -21,6 +21,10 @@ properties:
       - mediatek,mt7623-hdmi
       - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
+      - mediatek,mt8195-hdmi
+
+  clocks: true
+  clock-names: true
 
   reg:
     maxItems: 1
@@ -28,20 +32,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: Pixel Clock
-      - description: HDMI PLL
-      - description: Bit Clock
-      - description: S/PDIF Clock
-
-  clock-names:
-    items:
-      - const: pixel
-      - const: pll
-      - const: bclk
-      - const: spdif
-
   phys:
     maxItems: 1
 
@@ -58,6 +48,16 @@ properties:
     description: |
       phandle link and register offset to the system configuration registers.
 
+  ddc-i2c-bus:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: Phandle to the ddc-i2c device
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier as defined by bindings
+      of the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -76,7 +76,6 @@ properties:
 
     required:
       - port@0
-      - port@1
 
 required:
   - compatible
@@ -86,9 +85,55 @@ required:
   - clock-names
   - phys
   - phy-names
-  - mediatek,syscon-hdmi
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-hdmi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: APB
+            - description: HDCP
+            - description: HDCP 24M
+            - description: Split HDMI
+        clock-names:
+          items:
+            - const: hdmi_apb_sel
+            - const: hdcp_sel
+            - const: hdcp24_sel
+            - const: split_hdmi
+
+      required:
+        - power-domains
+        - ddc-i2c-bus
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Pixel Clock
+            - description: HDMI PLL
+            - description: Bit Clock
+            - description: S/PDIF Clock
+
+        clock-names:
+          items:
+            - const: pixel
+            - const: pll
+            - const: bclk
+            - const: spdif
+
+        ports:
+          required:
+            - port@1
+
+      required:
+        - mediatek,syscon-hdmi
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 000000000000..3c80bcebe6d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI DDC Device Tree Bindings for mt8195
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-hdmi-ddc
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ddc-i2c
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmiddc0: ddc_i2c {
+      compatible = "mediatek,mt8195-hdmi-ddc";
+      clocks = <&clk26m>;
+      clock-names = "ddc-i2c";
+    };
+
+...

-- 
b4 0.10.0-dev

