Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B20C61DF4
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03wonMi6/ThM2gO3QCZn24JsXK7jMYiMUg0Bft7Hcig=; b=hA6v0Ls6e4Q88qEgQlPU3kBMez
	oBvd/MEEr/5ekcGngxXciXFMq9SgJPM5MxsgW76XNIFxdAhYOOj2Ljh64kEWkLPBGpH1IycwzU/v8
	lZGpIWzMoWf2bw4a9/S1+R0kHQlUK6HxIBoJ19ktfh0djkZbaRkw4eeM1YP+XY8sJYB0h01OS6PrP
	1y3mfu1tymzdkGTt8LxkPFItqWUR1zczTFWYocKt2L25HBgxz+agK3hmhLgM+INdASMeEgDTaDUyv
	A1+AQcwg8PEDMzi57JJ43RtL65KmA6WePMOfruyH/V/umhaWCa6wxob/eWGpzVhervAsEQtjruwVi
	p8MNy7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6geG-008FSa-19;
	Sat, 25 Nov 2023 00:35:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gdr-008FAf-1x;
	Sat, 25 Nov 2023 00:35:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-332e3ad436cso1232352f8f.3;
        Fri, 24 Nov 2023 16:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872520; x=1701477320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03wonMi6/ThM2gO3QCZn24JsXK7jMYiMUg0Bft7Hcig=;
        b=cM4aD6nqc+SDYAou/YZ1bMPJfmg29ZV8QA+6/6Pb35urrJs9/fQEvjCplQooA3wzPl
         bD+ABtTFNNHITs7Hf3OfFU42GE2GsLiEo3PlphEq0DNJhxvcqlhm/ZmB5Wd2/YjETUQ7
         f93KZfPdMLozDlFwo5ckEuKW/NmGHi86BzSQcnEdrW+2sJzo7gima4CrjZOp4AhhYd/v
         8uaptaA/WcpUo6MZM1zihyky9WWgSrI+zdlcHW2Fx2Flc3U7q3tWohArplgnV7omCyVY
         ZYs9E2ucdirsyGMH/weo8O7t2ZcuhqHp67YpGC4pkCrbr88LpY/84BbWMJHNyxX8YEkq
         qS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872520; x=1701477320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03wonMi6/ThM2gO3QCZn24JsXK7jMYiMUg0Bft7Hcig=;
        b=Jf1/20fhYuzVuyeOYNqaQceSp9KVGNBAYt42ynaWM9HTBLuG+buo1CwouJ9ledIll1
         u1JrWiKe2OLM9Qyy+B/vndLfNrK6XlHVeyworz3jyTWGZ6Lrbg1hJ42Z4xlfdYMdIvoH
         empk42cXfv6zIeMebZKRC3Ie5687p1DCuOWMdK5ljtUFvaUEGABeKILZYpeLtwon5GKe
         EGZqgnZeZ8qlC1hG31HVHyYnoEgyUZzeim6d8YrRdV8pDJrlab/BEIJHweHg7+wvt9PX
         V1rZNTbHVzbP4a0TyCWTwmm15W2s4OXdLnfKoFr1FoWiebC1tRDXUqAIzMW9CvwoKvIu
         i9Ag==
X-Gm-Message-State: AOJu0Yx3ssLqXzzCf5j9abev8xRjHlCawpFEAbK4/1ZJIDUmQsBVrF0T
	7wNCDUwuXEj27VgYNAuA2KY=
X-Google-Smtp-Source: AGHT+IHEXCiKhc3oIX7bfHnHDv4+GrDV+EmGNkZQq6BamuJtr7wYxNTmW7a5qF0Rt8heIN6J/MZhxw==
X-Received: by 2002:a5d:6605:0:b0:332:e31b:1f3 with SMTP id n5-20020a5d6605000000b00332e31b01f3mr3398583wru.31.1700872519970;
        Fri, 24 Nov 2023 16:35:19 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH v2 02/11] dt-bindings: net: document ethernet PHY package nodes
Date: Sat, 25 Nov 2023 01:11:18 +0100
Message-Id: <20231125001127.5674-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_163527_653882_548EE45D 
X-CRM114-Status: GOOD (  15.87  )
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

Document ethernet PHY package nodes used to describe PHY shipped in
bundle of 4-5 PHY. These particular PHY require specific PHY in the
package for global onfiguration of the PHY package.

Example are PHY package that have some regs only in one PHY of the
package and will affect every other PHY in the package, for example
related to PHY interface mode calibration or global PHY mode selection.

The PHY package node MUST declare the base address used by the PHY driver
for global configuration by calculating the offsets of the global PHY
based on the base address of the PHY package.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/ethernet-phy-package.yaml    | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
new file mode 100644
index 000000000000..943952749b40
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ethernet PHY Package Common Properties
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com
+
+select:
+  properties:
+    $nodename:
+      pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
+
+  required:
+    - $nodename
+
+properties:
+  $nodename:
+    pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
+
+  reg:
+    minimum: 0
+    maximum: 31
+    description:
+      The ID number for the PHY.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  ^ethernet-phy(@[a-f0-9]+)?$:
+    $ref: /schemas/net/ethernet-phy.yaml#
+
+required:
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            ethernet-phy@0 {
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <0>;
+            };
+
+            phy4: ethernet-phy@4 {
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <4>;
+            };
+        };
+    };
-- 
2.40.1


