Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4589C30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyyT2YLj7brwLoXsAS7A6EY+f9NU6Kl4lWR4a3U/7uY=; b=fDav+6+rsheheovZbKXrxYTYhf
	PrwNk/hOAxdiYh/anP3ShfvJYBzA6qZRhfpzbUNQo2LhDeDQCiU3YwTEyiSrAxA3mR3vp0Tso/70n
	CLjEGnVxX1D+53BsUYHx6wHnMi6hVYy36E1RY0PnbXTbwhUBwJzjcIvylORDj893woO3GEgtbHYfQ
	rrwzncCJFRDCgUGHThIFN+8kaQ2DsSPtzfQYxyOLuhG8UjG3yCwa12d4+huGsm/WJaOzj5RmAkvc1
	kvb1K2D+E4gb1Z9bEjUj+2DXVJK3orKWDodNMgU1aKgbnG1i1ynyaM9wmsZhRWFt7j9KcfnEUoREW
	CRC3I7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPbe-00000006FWL-28FZ;
	Wed, 26 Jun 2024 10:10:26 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPb0-00000006FGd-1cGC
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:09:48 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7eb9e7f3da2so270917839f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396585; x=1720001385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyyT2YLj7brwLoXsAS7A6EY+f9NU6Kl4lWR4a3U/7uY=;
        b=dO6jI/YG/CeufTT/WGsxX6aJfLCCBYD94+MbJtgjdG0uR9T8FRqYGUU5FzegEoPKlJ
         +gkG8apWE7YwBvMd/XHtjP5KVVhwzByHyKj6G/CtaE+wJHfT4tug0tYwzrZkTwhEVgtd
         gswhV25pN9ZpvPijKr1ihsXxxX9mmZWgPHhWRIQqtw2YdYueYJp/NiqUIDbsntUM5yNC
         sCFg4ldkOq5qOue8z4L1MMjEuPmekjtyE0g/TLXj/E3JOqRVBzUDjvKnJ3QtaVCTvC3U
         NbBbbaYw/WgJbmIOILpbvJ+UD3IXeDJLm0h5uLGDBHNDNngGm3u/FHevMfdaqUkyGeAp
         EHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396585; x=1720001385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyyT2YLj7brwLoXsAS7A6EY+f9NU6Kl4lWR4a3U/7uY=;
        b=s9yOGhEZjGZBtQfdC29KgZ5+qPhRerXRguGgp8BhjhZ3terleQ/kv0aIJjh9sX4YK6
         RzPLsSNHeoLOxbMsUUK1N4x3YIHpyICirsQJXOM6NgOtMGXhI4j6RAij/kYc1FvTrY+A
         EPHwbbwSDFqYYE4tJtxruxNyuUT44xyQJZ11445YWWCa8JPd95TROINPMhqMUHd1ulNE
         Sx5LzB1KevNpZOh8vzXrIKQSYWmbQMx0E+FUdJ7xrWBf1sLylYKVo1rS6+k1m9iHr/br
         j2mKINHcBgVAVHqGA3Cp+hLjSBc72YRS1ZneZ2khL1zQe6/ZvXrL4p+xAPvGstaXgpvp
         qXkw==
X-Forwarded-Encrypted: i=1; AJvYcCUv97ZJzn8aY3HOZD1YkmmcBBM5zVgeJfq3Zwwksa0GGpH/ARcMFIz0TgE3xFGhYpImhnhOaCWLUkeaI76bKiiVyMkhkduw6T0We+6qyAKssxa/
X-Gm-Message-State: AOJu0YxqRfn02uCFPI0O9vzwMfel/RedNv+2Qwoi3hjGR5wcHQ9oyScV
	ve2RTMWB7jgSVwDUJmkdFzSD+W2th89UPjNBpSwEmPBExl6CQEaHv/EWf48L18k=
X-Google-Smtp-Source: AGHT+IEMyq8R/7/WsaxJZZQs9BQNgFhkEqurTmNJWnTSsdyT/suqRyRek2pxzdymC0qyY/6OUCmztw==
X-Received: by 2002:a05:6602:27c8:b0:7f3:c683:2257 with SMTP id ca18e2360f4ac-7f3c68323ddmr511439439f.19.1719396585029;
        Wed, 26 Jun 2024 03:09:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9d121859csm3079108173.137.2024.06.26.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:09:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 26 Jun 2024 12:09:11 +0200
Subject: [PATCH v3 2/7] dt-bindings: soc: sprd: sc9863a-glbregs: Document
 SC9863A syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-dt-bindings-mfd-syscon-split-v3-2-3409903bb99b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GpB46U0rTX768acpnwCp30n8vR+PPYQrOeVuFcF/H/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBme+jOPW/pRpNa5wcaDuQgo+GKD9ufJBS2slVI9
 DUEmVuVg5aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnvozgAKCRDBN2bmhouD
 16DyEACDsuY0Tktlq051+p1lqoifw/KJMVcMX2UU77MTJEF1HKhqQHK4B6GJyxo3bh2kWVca0eG
 Y9BgrGeXwzifNVFFTuPUDtXDyLHE0Zn5HgLPhoddn/ncOHzt+FxG1id236lYEMGruUsNmeskoPG
 dtLCw8lgZCiQOayt7l/vrnjDzOu8agzemjxc/2/XnkaSdfSC/Yfke4IaRj5/G543Bn496TA4nW3
 gSTr7+97WiCje+TlwGhoMZSkU02yIesrFjbbVgCkC1rGfxK0eNDbnztrbX/jjXz2FfXuh6y6Mzs
 9ftjD85kwaZ7M6byl2isVmGLIXy1DQSh27uVFg6rUXrMKf+AacQaJaf+xBT5BpYe0GwogsnK2HV
 z+v+NYV3v1/C9BZl6VTvapfVb5+imZ1Ofd5JiTECnVTS2hvxSSFGBqctflxKXNKeTiDvOIPWhPa
 FVeO4b+3z27/H4eKATNA/sy97lWgijt7zop2R5SgcJTc+EOZKp0pC6hotTf5PQVJHCf/CfWeaFS
 IJH4YKT25gvpc2MR98qjT4upN8fsBJ3nuas0yRo5Ww6oJVIIZtV207OIc/sHlujBtyO17TwTvcD
 KhqjLNg4nZmcsG67EPl6orIaGJmzT4bvu9S88FJyZO6j0MOBZ6GFv4HylfFtuCLIFCDd8yza2ZL
 ll+MEQ7GYUtEm9g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_030946_611176_05081E7E 
X-CRM114-Status: GOOD (  11.08  )
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

Document sprd,sc9863a-glbregs compatible already used in DTS and other
bindings example.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sprd/sprd,sc9863a-glbregs.yaml b/Documentation/devicetree/bindings/soc/sprd/sprd,sc9863a-glbregs.yaml
new file mode 100644
index 000000000000..49add564e5e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sprd/sprd,sc9863a-glbregs.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sprd/sprd,sc9863a-glbregs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SC9863A Syscon
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - const: sprd,sc9863a-glbregs
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "@[0-9a-f]+$":
+    $ref: /schemas/clock/sprd,sc9863a-clk.yaml
+    description: Clock controllers
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@20e00000 {
+      compatible = "sprd,sc9863a-glbregs", "syscon", "simple-mfd";
+      reg = <0x20e00000 0x4000>;
+      ranges = <0 0x20e00000 0x4000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      apahb_gate: apahb-gate@0 {
+        compatible = "sprd,sc9863a-apahb-gate";
+        reg = <0x0 0x1020>;
+        #clock-cells = <1>;
+      };
+    };
+
+...

-- 
2.43.0


