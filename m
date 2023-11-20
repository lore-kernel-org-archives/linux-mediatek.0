Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E3DC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDe+pQVEhH3Sr9b4984YEcBYZXzy8ixz3G1rWEEdZm8=; b=fs3nfDP5fh9mznwVeMBl5ulubm
	SMt4xhFbUtS4pB1SbcAWD/bXr2I4nSDdKhOI+e39lZVSvODTZGgihqkqO4FdqO0qqQYKCU86J/vWO
	ftvZ4KroGWlakP9+pM3srlcT7IeYEVZ7ecx5jblM3cbYrZK4QQfnXv0QJvyQsSEzcEd75KVdyDkCV
	WE8wpHqRd/CqZuUWY0iu9fITR11Hz3HLFNR9yV9kZxBIM0Cgsi7dau3RP487ShpZfHpB0guKFJZRK
	rbtgLdJcRcSyIaJRKwBZJ3NzBMCkTacu470PrlEh6c4dz/B/EF79aKtetYv/Ko+pKOCe/wjIqRo9M
	vYFIabaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55lK-00CRlu-1L;
	Mon, 20 Nov 2023 15:00:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gH-00CBe6-0T;
	Mon, 20 Nov 2023 13:51:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4084de32db5so19083975e9.0;
        Mon, 20 Nov 2023 05:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488275; x=1701093075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDe+pQVEhH3Sr9b4984YEcBYZXzy8ixz3G1rWEEdZm8=;
        b=SuYDEgxv7mZbftmTDMAYeB5ylWhpoXpGBNTIU5yLejAhpV5EcMOfK0YB7Z7iz4mxr0
         Sk0Yygw//mTAe1/x2Gxik4guDAyob4NWn7LJq6EmKQ6jiLbvwoV9wCOHO5B01vyXya6L
         sTIHekQdwcUBHkcg0fEs/CCq26AjCSmwQtuuM5Skba9Dt+6exUGHSPa3V8SUvWBZVUDX
         mA+dcMNuX2qlfH8iVoz1lwwhF+SarXFFJ7oxdVIkCiY60wwxVI3iAPlnTzZlaCJAl1M4
         44RNjeBio7kTVeg6MZ51WrnFqBYz3XvUdhyb13VOFE9h/i/B5oRx1e9IDmwCU67qmSSt
         n+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488275; x=1701093075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDe+pQVEhH3Sr9b4984YEcBYZXzy8ixz3G1rWEEdZm8=;
        b=E9N4lmUQTXbxEuEXX0LQu1n1FfKDO4GHeX3/0VTFwo9N7efvIVd/vvqDmmNvcym1B0
         BpfRkI03Q7/j97NL16dv7IJFEFgFncfEnrWf/Xz9tLQRxCOhkrovtUJWeiM2nNt/+NfF
         YrAy+7KSzbshCZn9eBpfQfCdTLmcxcFEM+5omaFEYHDILa/Lln+I/eElAWC++2KRJB6b
         A8Gb28mBrkikgNYlV98CiA7VK8xs26ycrIUzYQRzM1j615uKJMciE8bMukTeEEYIZhSo
         eiRSfN7gVE7gBzuPLvnDxctWFWTMIhLR5YjEyWMEju7JP2JumEbZLOm95nSlz2ieJwCX
         fOVw==
X-Gm-Message-State: AOJu0Yxznv7LAUKaVtqeJhQjlfOqWGVnk+4y950NIkm4/5TU9AZYDwb9
	K0YiQxcrgh9ZJXf970SpaUk=
X-Google-Smtp-Source: AGHT+IHVHnzgf8EEZJbwbHrD1fJrQtGhYDQUh/AnVfNHdAOlAXGB/wAsBqejt0p1a7rxHshO7e2S9w==
X-Received: by 2002:a05:600c:5248:b0:408:3ab3:a029 with SMTP id fc8-20020a05600c524800b004083ab3a029mr6210181wmb.38.1700488274368;
        Mon, 20 Nov 2023 05:51:14 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:14 -0800 (PST)
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
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 02/14] dt-bindings: net: move PHY modes to common PHY mode types definition
Date: Mon, 20 Nov 2023 14:50:29 +0100
Message-Id: <20231120135041.15259-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055117_184566_07807ED7 
X-CRM114-Status: GOOD (  18.03  )
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

Move PHY modes from ethernet-controller schema to dedicated common PHY
mode types definition. This is needed to have a centralized place to
define PHY interface mode and permit usage and reference of these modes
in other schemas.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/ethernet-controller.yaml     |  47 +------
 .../bindings/net/ethernet-phy-mode-types.yaml | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 9f6a5ccbcefe..40c1daff2a48 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -55,55 +55,10 @@ properties:
     const: mac-address
 
   phy-connection-type:
+    $ref: /schemas/net/ethernet-phy-mode-types.yaml#definitions/phy-connection-type
     description:
       Specifies interface type between the Ethernet device and a physical
       layer (PHY) device.
-    enum:
-      # There is not a standard bus between the MAC and the PHY,
-      # something proprietary is being used to embed the PHY in the
-      # MAC.
-      - internal
-      - mii
-      - gmii
-      - sgmii
-      - psgmii
-      - qsgmii
-      - qusgmii
-      - tbi
-      - rev-mii
-      - rmii
-      - rev-rmii
-      - moca
-
-      # RX and TX delays are added by the MAC when required
-      - rgmii
-
-      # RGMII with internal RX and TX delays provided by the PHY,
-      # the MAC should not add the RX or TX delays in this case
-      - rgmii-id
-
-      # RGMII with internal RX delay provided by the PHY, the MAC
-      # should not add an RX delay in this case
-      - rgmii-rxid
-
-      # RGMII with internal TX delay provided by the PHY, the MAC
-      # should not add an TX delay in this case
-      - rgmii-txid
-      - rtbi
-      - smii
-      - xgmii
-      - trgmii
-      - 1000base-x
-      - 2500base-x
-      - 5gbase-r
-      - rxaui
-      - xaui
-
-      # 10GBASE-KR, XFI, SFI
-      - 10gbase-kr
-      - usxgmii
-      - 10gbase-r
-      - 25gbase-r
 
   phy-mode:
     $ref: "#/properties/phy-connection-type"
diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml
new file mode 100644
index 000000000000..6d15743b4ffa
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-phy-mode-types.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ethernet PHY Common Mode Types
+
+maintainers:
+  - David S. Miller <davem@davemloft.net>
+
+definitions:
+  phy-connection-type:
+    # const: "internal"
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string
+      - oneOf:
+        # There is not a standard bus between the MAC and the PHY,
+        # something proprietary is being used to embed the PHY in the
+        # MAC.
+        - items:
+            - type: string
+              const: internal
+        - items:
+            - type: string
+              const: mii
+        - items:
+            - type: string
+              const: gmii
+        - items:
+            - type: string
+              const: sgmii
+        - items:
+            - type: string
+              const: psgmii
+        - items:
+            - type: string
+              const: qsgmii
+        - items:
+            - type: string
+              const: qusgmii
+        - items:
+            - type: string
+              const: tbi
+        - items:
+            - type: string
+              const: rev-mii
+        - items:
+            - type: string
+              const: rmii
+        - items:
+            - type: string
+              const: rev-rmii
+        - items:
+            - type: string
+              const: moca
+
+        # RX and TX delays are added by the MAC when required
+        - items:
+            - type: string
+              const: rgmii
+
+        # RGMII with internal RX and TX delays provided by the PHY,
+        # the MAC should not add the RX or TX delays in this case
+        - items:
+            - type: string
+              const: rgmii-id
+
+        # RGMII with internal RX delay provided by the PHY, the MAC
+        # should not add an RX delay in this case
+        - items:
+            - type: string
+              const: rgmii-rxid
+
+        # RGMII with internal TX delay provided by the PHY, the MAC
+        # should not add an TX delay in this case
+        - items:
+            - type: string
+              const: rgmii-txid
+
+        - items:
+            - type: string
+              const: rtbi
+
+        - items:
+            - type: string
+              const: smii
+
+        - items:
+            - type: string
+              const: xgmii
+
+        - items:
+            - type: string
+              const: trgmii
+
+        - items:
+            - type: string
+              const: 1000base-x
+
+        - items:
+            - type: string
+              const: 2500base-x
+
+        - items:
+            - type: string
+              const: 5gbase-r
+
+        - items:
+            - type: string
+              const: rxaui
+
+        - items:
+            - type: string
+              const: xaui
+
+        # 10GBASE-KR, XFI, SFI
+        - items:
+            - type: string
+              const: 10gbase-kr
+
+        - items:
+            - type: string
+              const: usxgmii
+
+        - items:
+            - type: string
+              const: 10gbase-r
+
+        - items:
+            - type: string
+              const: 25gbase-r
-- 
2.40.1


