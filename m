Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75628C25B79
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 May 2024 18:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4iZfdoNm6KmetFlM+rflXj8Ify4OoKkEWH1DVjf6SY=; b=LXikEv+iIbFFrVQGvUFwr05nBO
	qv4l2gF0clKGmX91tF5flSlRN3mwzm57R3aTFkY5zR/cHMVS72eab3Qj2u2KX/B+3XDZWZdbFZn0P
	Mh6BVWOJES8CoY0k2WVpfFDljSHbUN2zBBkQyMsg0bZRPmYo98wOQzVtWh0MCo+xMDBhAZDuIUuaD
	cvxsEjWvbG95JEQG9yCHBh2Ur5XIxEublfXlLrnO5Hcaovp3CD/4Y8MsRfde73Ueeo42GH0XBfM8X
	LcfP9F5p578xDXhMmEOx9xGcCwr/mZEXpbkP+OrRB3ubhXq407YSiMFK3GhuYTmqqjRYNvHKOLVaI
	h3ChJTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUy-0000000CWc2-3nJG;
	Sun, 19 May 2024 18:43:08 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUb-0000000CWKo-0zq3
	for linux-mediatek@lists.infradead.org;
	Sun, 19 May 2024 18:42:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-572c65cea55so10944091a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 19 May 2024 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716144163; x=1716748963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4iZfdoNm6KmetFlM+rflXj8Ify4OoKkEWH1DVjf6SY=;
        b=QeFNY/fqz8dn18fozXBEJO3yOXHdjWrJoBmNnZ0jImzJEg6EqVhxkCIovbNc1Nd38+
         agAlsUO5oVTG7/Dt+gps/ky+OOoHH/SnIgm8enoGEQOcCZ8xsvpk6BR50Go4O554LfHq
         lCDhyGOAAI1NxX03edxeUQfDbJGxvTueXAUyD8Rp3qk5orKuQ0sss8CMKvHtgKuF/zWT
         JDG6HX7kP8G6jzkXgCpxSTF0wZ37J4T/KIePO1CM5ePSyKwq1JCuhNe2/+m9tX9ixGGf
         zBEc7aQt96CPH9E8SNhYwIfYGm3vvCcK46PNH0dz6sKQV26A3HlHg0fwxpZyAeEt94Lu
         zVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716144163; x=1716748963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4iZfdoNm6KmetFlM+rflXj8Ify4OoKkEWH1DVjf6SY=;
        b=pacYSW9qOQVxi8AZJtvCi5E1bXnqF3BvWq7c56OpkbGyS2VCZ9NVyca0uifHhtSykq
         L7he+S0z9IYDEmklCXiKtiZKp6h64u4h8025W3dnaI9IY9Ob6QI/Conxim7r4tPldfIf
         Sd0gEq9LkvXNa+lccDPxS6CfwGisA2P2JNEh8FILR/27uMwhXfnd1Z0rPt9gfT6RMdjq
         S9nQkE8B1FMM1kkBqwGsrcbMlu8pISvWEg/EpasU1wFZDT5hSlDR5L6jHWG128pETiPV
         X10bDyEv8NMT6rjfkagyxUrn4flGsM/bTXwp0Beej4lNP/pmUqFPPHN4XQEl9+80OY4L
         64hA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0owpNyL4fbuy1yc76161aAaBlY+lKD580VIY3vr3hpAAXmv//uoZxsFld3Q7Lmnty1D+TJm8EPUEm0Eg4bA99vENh7NXH9/Q5m1gP/UQLCA/
X-Gm-Message-State: AOJu0Yy/cIDRPjFb0YtBGSJBzoGSQGN/iuWOvDXgVmgEm8qDfWGDgqy0
	TWEFGiKqHJy5TIUbe49UdAaS+3j+gFGxiU3iKmtFr4oKHT8+R9xO7wdIvOWt8U0=
X-Google-Smtp-Source: AGHT+IERAhveijxy7giHqZCwdGvg8/ABsrt2a2x/cjeUxbcFttmT+WJNsMDmCsz0XPPz7M6nBgPbSw==
X-Received: by 2002:a50:ab0e:0:b0:572:a712:64e0 with SMTP id 4fb4d7f45d1cf-5752b481447mr3925832a12.11.1716144163350;
        Sun, 19 May 2024 11:42:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-575313d97desm1789397a12.41.2024.05.19.11.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 11:42:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 19 May 2024 20:42:20 +0200
Subject: [PATCH 5/8] dt-bindings: soc: ti: am654-serdes-ctrl: Move to
 dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-dt-bindings-mfd-syscon-split-v1-5-aaf996e2313a@linaro.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OOdH/VA0xsPMRYhcDacK8D0Tn//KGept+QvEXbjxFgc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmSkgU4qP0BJA4XKDpZ7Wvn50e/Ri2RoAv0jgbH
 9A5h7StGdCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZkpIFAAKCRDBN2bmhouD
 14vtD/41lxCZUAle71Z5RV8DtWeAuAW/4vtMslb18wpwO4PjUZSfIurRxsBNpDMWmbrEe5wehNg
 IAhl1W+I41vdMBBoL7AofhxwwKbux/y1V7rCbwG5X0+GN7TFASHMg5GIbpMn96zQOiV+7W3FiFA
 imCHWAJyb9SWI6mGK2D2jEPDYxWCbLjxTVhcQOYPtvE4m74ZZzf+ovUro73pKnPPpKRLEYJhRIb
 k8+2XQDDYDnk4uXSFKwLlXmrVkqr23d22h+U4koosUkp+hwt7wg+0DTS7oXzeh3qnaSpz/7bgyV
 5xj7jAHTln/hZ33G52/KeVAbFLBmeRxymyyy4IKSYay0VXEX0sCF0VpOPpSvlFlgzE0DKifTs8E
 Mpsri0yFQWHGSc2ydrPWW9UuAbYqbRM3QI3hDYNYJ8kCiw7ow7Jce5P6T2iPindQD9Na2UeCGsO
 4dkgV/wnARN4SXiOOKsv/+h3Bp68Ij/p/CqyJ6BUWvVQWqj2kzWGwhJQTHL4E4hIQL80vbf7Y3m
 OqGNYuhwiKLkI2nn9rRYJec/AEznTgsy2jV2QYzxJ/JLv/Icowas55bmAHmN6v1EIVsGMhqMT8O
 iWrqJWeAiMI2wfiA0/KBKpUKSMmPHRpV3fjtqUyufu+foR/O0H3n07+DmdNm1ntnONRpaAFAnlj
 49hSv2Iy146uRlw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_114245_540283_288C34B3 
X-CRM114-Status: GOOD (  14.40  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Context might depend on
https://lore.kernel.org/r/20240510123018.3902184-1-robh@kernel.org
and also further patches here depend on this one.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
 .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      | 42 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 91adf781e8ba..b17fa0487178 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -116,7 +116,6 @@ properties:
               - ti,am62-usb-phy-ctrl
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


