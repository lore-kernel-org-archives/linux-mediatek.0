Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC26C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 01:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MBmMXx6SBYjr/qWdKIGzMCOBTgU3mtqpBvSw12TnKI4=; b=vGYUoDi75xyXhN
	2hcbbK8qBJfePgwMC/QHKfeN/w1GiC1F1lTDqzX8PrniM6yvsNwQgEpYc5sKq0dImvuyrNE3Dxwlg
	jdxw5slIFW74+SvgiLAUSO1cWj3I8P9Dr3R80HasT0Qy5G8RYXdbI61MabwxmbU7vGOT5GSsNKU4P
	+sPuQwlN2FNBxooAYO/eCVQ7FabheikLwG5+GyCt++Jrdoq4aZCc40RYGR+C4Hk8aKrZShXrfVPKu
	QeYnPKxoRRAHCqgjTNlWHecQQyCyn2QR7+rEOtU1rPt2bP9c0xE8aa6fdqhiwrzvEgxHoIngOV7HW
	YqfMgeLzXHfcGhtLGJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2Vv-00DCH2-JZ; Thu, 26 May 2022 01:42:11 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2Vk-00DCEU-4q; Thu, 26 May 2022 01:42:01 +0000
Received: by mail-oi1-f171.google.com with SMTP id m125so633852oia.6;
        Wed, 25 May 2022 18:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d+Z9RgiK3EIxVlZZsUbr4/gk0SD8+6Vq2nxSeiDB3Go=;
        b=YtA1bJbZJ2f11Mtrk9KOEnLN1cw9lBTm1B2suOoyH8jI9+wvxQOwLXndrCy1sbiRc5
         7y3uCeblMdbUF+rY1xOsVadOU4u9bvWG5uBRnhyBrl+A+E9ROvUkHg7lFKiMt1QjL8DQ
         h/Imn7H/ykT++oH5fqpbUdhD2LkV0KUnXJ/3WFR0PerWE9ub4jLJE8coSCW2cG4OxvWY
         Kvpjo6WSBcVqNyoiedSwmHmp0fAlJB7fTHtl79XIvbMdAopIjQVSg8ipS7/GH45rd9nV
         M7vGWuXIseJqnF3VpEbi5h8uJyI/Dq88NNcP5p9O2PHE2dxkHPRMThTXyBLwkpHKkrco
         azuw==
X-Gm-Message-State: AOAM531pQW7hr6QeKCfYZrJxrSmb2XC7aOgawegjnHJgRQvo7Q9CAol1
	SWNx/GydKunzL1SSbo3d0A==
X-Google-Smtp-Source: ABdhPJxuUpgwjNNVehgCikH94aM0C278Tato0V32TMxGzCsr8Y3hkxPGQkpU0UbT585q/wH8Oxdo3Q==
X-Received: by 2002:a05:6808:210a:b0:326:77be:466f with SMTP id r10-20020a056808210a00b0032677be466fmr5336oiw.184.1653529318875;
        Wed, 25 May 2022 18:41:58 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id pi12-20020a0568704c8c00b000e9b8376a7bsm162542oab.23.2022.05.25.18.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:41:58 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Biao Huang <biao.huang@mediatek.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: net: Fix unevaluatedProperties warnings in examples
Date: Wed, 25 May 2022 20:41:48 -0500
Message-Id: <20220526014149.2872762-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_184200_228201_9CC8A0B6 
X-CRM114-Status: GOOD (  13.75  )
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

The 'unevaluatedProperties' schema checks is not fully working and doesn't
catch some cases where there's a $ref to another schema. A fix is pending,
but results in new warnings in examples. Fix the warnings by removing
spurious properties or adding missing properties to the schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/cdns,macb.yaml           | 1 -
 Documentation/devicetree/bindings/net/mediatek,net.yaml        | 3 +++
 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml      | 3 +++
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml        | 2 +-
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index 337cec4d85ca..86fc31c2d91b 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -191,7 +191,6 @@ examples:
                     clock-names = "pclk", "hclk", "tx_clk", "rx_clk", "tsu_clk";
                     #address-cells = <1>;
                     #size-cells = <0>;
-                    #stream-id-cells = <1>;
                     iommus = <&smmu 0x875>;
                     power-domains = <&zynqmp_firmware PD_ETH_1>;
                     resets = <&zynqmp_reset ZYNQMP_RESET_GEM1>;
diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 699164dd1295..f5564ecddb62 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -27,6 +27,9 @@ properties:
   reg:
     maxItems: 1
 
+  clocks: true
+  clock-names: true
+
   interrupts:
     minItems: 3
     maxItems: 4
diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 901944683322..61b2fb9e141b 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -58,6 +58,9 @@ properties:
       - const: rmii_internal
       - const: mac_cg
 
+  power-domains:
+    maxItems: 1
+
   mediatek,pericfg:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 249967d8d750..5a12dc32288a 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -51,7 +51,7 @@ properties:
     description:
       Specify the consys reset for mt7986.
 
-  reset-name:
+  reset-names:
     const: consys
 
   mediatek,infracfg:
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
