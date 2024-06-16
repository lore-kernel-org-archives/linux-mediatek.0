Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922A1C27C53
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 13:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9ZLKoGKyA/Fzir83VT6KMHwP0QAfjlVUV43lkT6aLM=; b=si3y6X/pAgdIbNBwIV1T+Je/vp
	LXSi3sJB7yFC5x+qBqAu6MagpsBfBxZKnR2wVy1Cv9X5pNL1dqVaZF+Zj14MRPUtHJZmn/vrln/cX
	zWnL6UZniHk/z+b4uY0v3yZVEtgVnRiXJY7LkrdtE397VMENYkIMEsiZNLjJMPUbLXitUZeOUcQKQ
	bOAfIFmLmnBHsfHydWtyD4eChWaUlKMXkMvtBiBx8x9sI9dACiyp/Z6Fp5ORMgj1AN8syFx4TnTD2
	ZyGlUljZDBbbyLGcxjWAeyNN3GbQJFSzUKZoQ7mR5v9OvKDIIjrmGd+6+kg2/yAUNfR2OifQZez+S
	gjuyQrrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnX-00000007aJR-49yN;
	Sun, 16 Jun 2024 13:19:56 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnH-00000007a8H-1j3M
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Jun 2024 13:19:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-57c73a3b3d7so4052507a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jun 2024 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718543978; x=1719148778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9ZLKoGKyA/Fzir83VT6KMHwP0QAfjlVUV43lkT6aLM=;
        b=EfRePE0Kinu+Ko78EGIy06OsnDQ5UqMOLcb/VrgUZVDH6if2oghsNJcvNVbJLBdzJ1
         OGudjJAgrtkUidCeSORf8vVZNnpTbt+/lhlu6x5BGFACjDDzi/Mtjh1QhMwSIz5TX0aR
         BPfIMpu9YgpsVn8HHPloFndOj9m17WG8bPSvi1AbTXB+VZMbvZxrijirzivkMjoi67T/
         Z9h/LdjURNSmCh5w0kTfcDJoWuHP0PTctvTYjGVu1+hbiNrwUItwizQOs4DBlM8Zsbtt
         kjT1txSu7O+fxDNzdTiSKCzy2NqvGw53UjHfdL3g8s3NavnikV9U4R0xvrZg6wYZdSqE
         qU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718543978; x=1719148778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9ZLKoGKyA/Fzir83VT6KMHwP0QAfjlVUV43lkT6aLM=;
        b=ndl+ajH3R2Br1HQ5ssfO2R7CggPplcZ3BfgdKVSYbIVbFHtaTlLdhYa+8COq4eRM+v
         P73+Hbob2jgcWDyoszqSzVBqxv8GyN9TDGK70ixj+HIp1+HIgu9ptTL49zFU1H+di4p4
         H7ACs2zMcmcZDhFfG+g6MStqvIQ23kZ9SzX0N6q2zVhoKGQLGlMcyFj+5O3p0DTc3o3h
         iLwmRlhss1Ijqinb9TKvJEEWa4G3eGdOUCEzdpz+5m14+DO9+PpcKt4HI0WSGLvRvy5T
         VvVexgEIck4tONG90jmm0UCKxJZBxSZf6wI3Ku7Q3xneDMka0Z4w/n6rzOuEknBBnBDD
         j7hA==
X-Forwarded-Encrypted: i=1; AJvYcCU80HIBBGRdtA9rh0P40Ej0/OnUplyEax1kzqCdepqC0EuTrl2YrRm2rkOMx1+n0ev38xJJ+dDmahU5fEtprmZ8pKluDup0QgmDO199iyR4aO8i
X-Gm-Message-State: AOJu0Yxn3UyEI6c8ik9SRevQEFMkJeNQGfWbk/A6REg84kPb0vQBFh+R
	fEyL/89Zpevtall/Dc62wRc+m/AcCM6HL/f7bY8eZHhYB5wO6613mOEv459qqs0=
X-Google-Smtp-Source: AGHT+IHO9RnbHcazsIsMGMs7VyXCSngI/q7B/q3+4iSsAbqu/mLW9gJSoHV2U3Z1C3VdPOojDxIbeg==
X-Received: by 2002:a50:9fc4:0:b0:57c:8027:534d with SMTP id 4fb4d7f45d1cf-57cbd69d9b8mr5103771a12.27.1718543977636;
        Sun, 16 Jun 2024 06:19:37 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb7438815sm5099603a12.80.2024.06.16.06.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 06:19:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 16 Jun 2024 15:19:22 +0200
Subject: [PATCH v2 2/7] dt-bindings: soc: sprd: sc9863a-glbregs: Document
 SC9863A syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-dt-bindings-mfd-syscon-split-v2-2-571b5850174a@linaro.org>
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
In-Reply-To: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dzjm2gBTdMjl6mgRsFtrUQDBw9hhYKgIAMant8cvlAI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbuZfiEg4Htf73PryBDmHhre04Usi0iIsta0KI
 HauaVoH5/aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZm7mXwAKCRDBN2bmhouD
 1wUND/4zJem/xT2bP0jF8QkDD0M/Aj7W3bmFEdpYj9UtYubYLZSSMxUk4qKXCk6kLeYVahA5rPC
 h62lhRFq1txEAblixLgsn+TiseY/cWNGESVoMdjYApbkXurI/OTfmE1WkRvJdzIHZ1lDhBoxFbp
 mAC+A90V0a9L5ylVBxj/TJsS2RT5F8TBkAn3mpkxDSdrBzOz41Hm1DsHPF8sVjKqikmJy7AfK8K
 BiWWaFi/I37y1ETVqfdhc92c8+zfMh5lTZ2TSQDiYoyiwihVNfQNbzEylvUQ3945l9sD/845fGL
 yZmIrK/dseAxgAMGcyKPy4j0YmS+fZTA4pohSsP3EBxoJYXriElXyXwKCAwaVIc2gKrU/uuuaPx
 gnNw324jOnvUWx1jchGv8Qu/wfgxoYDvYt1oXdsY/ya/VtOr7mFMxdxCEkKOAifX0ANsDB2fKdH
 SoXo6LgbDbZNoHzO8bIPOFPx6reVkj2cjnjkb35WY+2ui3BMn93C432nN91zVnS+ikyn70G/1W+
 Lrx8HNeARldbkou56Yt1wyX54daffXOPE28BtlNeL8//88syhIkTtJfUT+DRS8b+VqYs3eTojuw
 qt6esBgduNadtkatmGFC2pTnRlPdvvYDugVj1rpId0PCUt5rVqqAvw8i38jvspVgBfBn6n4Ayek
 E9lvLWTzMeLinfw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_061939_512626_42B44955 
X-CRM114-Status: GOOD (  10.73  )
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


