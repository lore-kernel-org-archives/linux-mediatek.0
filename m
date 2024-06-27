Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A218C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyyT2YLj7brwLoXsAS7A6EY+f9NU6Kl4lWR4a3U/7uY=; b=jH0JmLOBLJQlCc+fM93GlHjwFo
	UforIL5w7nu05FEen9bRTT0IrwkSaNgOglqCcyEnu118BJDw9XqU19fbT+wWoQqXSFvYg+cFSQrur
	TW4F0RbA5RUX83TeI7BTcWxlygN8oHLqylikZ35FtdmdIlLVXN+KUahGc0pV/zWvV0E+zoRleZJM2
	CgotjHBKLVhIlrof9tBjkEhpRr62cpH6xs5xlIS+pXRU1a85DxYBakpSl23VBewU2zXD6WNwfGafx
	yWsE8I3+amMzeCWsWB7svNZBYWKx5MW2NeGJQKN7antA7BO3qmWYg/RSjX4mSb2bcPD0VOnyJm6dG
	AtmOidbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmRI-00000009xSF-1bxL;
	Thu, 27 Jun 2024 10:33:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQj-00000009xCQ-3MLd
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 10:32:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-364cdfdaf91so5445004f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 03:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719484360; x=1720089160; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyyT2YLj7brwLoXsAS7A6EY+f9NU6Kl4lWR4a3U/7uY=;
        b=r70RxnJjqO0qc36Y2PDIV5m2HOFpmVTpJEhePjPTx08/A9kJYw/0zRxGU8hRPYOr2S
         JskR2xXJRqoKzPY/tkidoPt02QlJ1+1f4HJJmyolLr5uGuhBier0/ezYSj6ZygRV4GiZ
         w01Chzre80dxJzMLAclF7awmXEiXR0LkCT5e1oZSpmvmrcbWCWLvrF+ytpgNfAh5AC+Z
         wqb7+QXYlEmtUUtEhUjHeU9Clgx3m9zPZzK0swJjqEYdUbbU0fcwQ8qTjsM9Y8kkKlqm
         J9EImxv5KaRgExPfcO4pM7IoDatRAcoKyHHskET3uUh0ht87yFEREXddImnXH2zFdQfd
         lF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484360; x=1720089160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyyT2YLj7brwLoXsAS7A6EY+f9NU6Kl4lWR4a3U/7uY=;
        b=KSvqBtWjcK+6t2+IQqRMG8fo/aeFa2RRPnfuphGELfj2/bM296PxNV1xbd8m6mbqVR
         tfpDgkqIfAhJbgdvmihAmTCaEPnl3iVB1gOohPAj8Bxa7WgvzK+YHDm2x3//N8Wc8DMU
         STmAkBza0PgfSj26y9jUTiR1qooR+AzGk2F8Ipw3ksg5wNa3GdHJp04RZiDzS+/qA8vv
         pgHc/K31kkk9Kg9woX+xVXt5vd5T6Q3YH8zha7wWEJfarQXAjgmH1GyZjrbk7Jaj6C0e
         WdRLNcOiNr4GF49y4/lHU9/7H8owRKJSaN0YukILRk2uFw45RN2JjmgKfAgU0k0yCx9c
         Vksw==
X-Forwarded-Encrypted: i=1; AJvYcCWMtE6TWX+CfKh3BRY9WYo4rz4NBuSMrX2VdwxbSr7/xapisTYZrWdNg06hjdxtgOd7JbNKkhDv0No1MfJT132VqQ0/k6khgyl05tyWV7uX8PNT
X-Gm-Message-State: AOJu0YwCWwXYx3vcrRZa/7H/8PUtvaLA031HREH6umwycA9T1UgGbyx4
	uQkakZ/VPY1qIN1bNyVBx0m1EEJ3EvcSsHjr362AbLcrUh+yQwjc9bidtaw5SMY=
X-Google-Smtp-Source: AGHT+IFf6o0GrwG79hGkKV8BpMA+VgRIYka7BL6S10ENM3UTqNVZUG1ifMp9bXGVi+65SzGW46BiXA==
X-Received: by 2002:a5d:6c6c:0:b0:366:eb00:9dde with SMTP id ffacd0b85a97d-366eb009e9fmr10140507f8f.1.1719484359946;
        Thu, 27 Jun 2024 03:32:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367435852afsm1384352f8f.53.2024.06.27.03.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:32:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 12:32:18 +0200
Subject: [PATCH v4 2/7] dt-bindings: soc: sprd: sc9863a-glbregs: Document
 SC9863A syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dt-bindings-mfd-syscon-split-v4-2-dc6699a9f3e4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GpB46U0rTX768acpnwCp30n8vR+PPYQrOeVuFcF/H/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfT+7urnyUm67uS05xuiWGT99fvgpqym5iM2tn
 AtPDzdq1T2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn0/uwAKCRDBN2bmhouD
 14HgD/9hZ5Rm28PSoSHukbEojyjJCkKSW8278sh5Ambb3G5hXkmasRs6lrutbdJ+/I9rLkdX+Hh
 BHl5djEG5ae5Xsk8HtctIzyuAmti7NeEqrEnWgXMj6gPfmUqRzBNGkm2Z13Dx43m+/ZKGScUtXg
 m7wE3ZrmGsJkNGoC6Q39uI/u5xYK8v0Li8DE6EwyU8E48foO32DET2jpQocvqccPb9ax7NSkAAk
 o4ykewTkU8eOBnJ1LA7bOd7nSehxpeOTqutu6/jnzJB8RmFGHC0bgVAozQFMIqHWf3VgILcK4ly
 J7K4gOzyuIdR6swq7NJOjn/IrlwuJWmTa9h/7OVhthnIWgDvexFvGIBoGeSvHadBDstHtX019Vz
 kr+4a+vuSkEuJjYdSN7v+bUvB6c4tHV2xhg8+9hdWFr7uqSwRaLTBXFlabroIqU/1+OxYaGy71N
 R1xuPwJFwt8IIH5GSj3uNhlWGmyJWceWn1KxbG7CGqdsuxJYm3oJgjUjp5ix1hKj8BzSh/KdSkd
 PaFQtR+8wxcQ7pj+3r3aM8TpE4+qhkg7t8laAtkTVUb3O17dvIF1nMZXWcQpdaZx+dJ+1OvOwg3
 XAlZ46/c1XCw0VqUWLrGdWYHFkhN5Jmpb2iKWze8qIsGCC16KYONtmA5GwC1PAhxgJVyd/r0ota
 TcDsu6yq5unuZ5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033242_772251_DEF5BEEC 
X-CRM114-Status: GOOD (  10.77  )
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


