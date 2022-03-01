Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4745C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zVgZMfDd01opMJj6A/edan1S9NpUsgNh5gd9mWbQUjM=; b=wJv1pUccPXXyrc
	YtyFV/YqfvfYCDlDEmR1deB9U78T3p+Qnp0dZFTh1ULQBzrlAl9ZLjXYtWtnhzaXqASq5fiZAbW+5
	3Gcwp1eJblCMo4bV2RIDSN1rZACd9yB0P6sCxinlRFsTLIQBMT/oYi3hERx4q0QiUNenNUjOBRIcM
	qhfJ2oQF4Rudnn/wFvEklU5SsYdrGclg394PmsBC/UZEKuSO3yXH6VU5m4TdheacIbY7V6DzJoPUp
	zzpp9e/lqMHyDQcDwiuZl42K6VIizf23c7yLYdHUJfmiZfrd/3UZe135fmwTEujkSAuHnJ+yVzTQn
	631Z1SkdsBS5YrR8/JBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPC1y-000s7y-L4; Tue, 01 Mar 2022 23:35:46 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPC1l-000s4n-AR; Tue, 01 Mar 2022 23:35:34 +0000
Received: by mail-oo1-f47.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso78136ooi.1; 
 Tue, 01 Mar 2022 15:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mjAm0YWASTEf57JVUS2I1+2cvaNRD0CHbjx/YiEWgzo=;
 b=4wK5slx0I6kHYD/FzBU8Jbss6yhle467F115NG3tPi4ufkpDfPKl/Hina0OM6iDCO7
 SrwqvmRdiiiAw0NQd0UPRHGww5kpDjLBhSjX+qyfkDrp29h/usZ8LunPjBA0P2g953KZ
 V6gAulJiwXhIkNZwi7dtuVVXBWt4xtDJszFghrosRBhW0oZY3fMjyKiub2uwcOaf4uAN
 ZpC3AAr5ipFQEVVyt1AcSEmmXOTNCAr3/U7UqKv6gspGGrgH73UoDGNMWg2HIiYXTQxD
 0y2ExHen4BWbxwRubsd6/u/Ynx21Vi2M6d0CM+bAAq9jOX1sDzJYgBiOE3z+5k5QEQ2T
 CZ2Q==
X-Gm-Message-State: AOAM531KGDaNIHWljeVtHedecAnd/u6hkLgRAkiAW3uzW7pz8TuFrxdx
 oh/+/cmKMs0xvEdwbO1+pA==
X-Google-Smtp-Source: ABdhPJzt9hj8uaSjUrfFAo0GVVDli7ueQD5CfQhr+S2QXfU8PSjp5ZmMY3gZvPNE+wzjCn+Xdx2IuA==
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr7641309oab.32.1646177732368; 
 Tue, 01 Mar 2022 15:35:32 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.googlemail.com with ESMTPSA id
 36-20020a9d0ba7000000b005ad59f1f783sm7337990oth.3.2022.03.01.15.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 15:35:31 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: media: mediatek,
 vcodec: Fix addressing cell sizes
Date: Tue,  1 Mar 2022 17:35:00 -0600
Message-Id: <20220301233501.2110047-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_153533_388693_550C8E96 
X-CRM114-Status: GOOD (  15.04  )
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

'dma-ranges' in the example is written for cell sizes of 2 cells, but
the schema and example specify sizes of 1 cell. As the h/w has a bus
address of >32-bits, cell sizes of 2 is correct. Update the schema's
'#address-cells' and '#size-cells' to be 2 and adjust the example
throughout.

There's no error currently because dtc only checks 'dma-ranges' is a
correct multiple number of cells (3) and the schema checking is based on
bracketing of entries.

Signed-off-by: Rob Herring <robh@kernel.org>
---
I noticed the driver is checking 'dma-ranges' itself. That's generally
wrong as the core code should be configuring bus dma masks
automatically.
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 122 +++++++++---------
 1 file changed, 64 insertions(+), 58 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index d587fc3e39fb..7687be0f50aa 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -72,10 +72,10 @@ properties:
       Describes the physical address space of IOMMU maps to memory.
 
   "#address-cells":
-    const: 1
+    const: 2
 
   "#size-cells":
-    const: 1
+    const: 2
 
   ranges: true
 
@@ -205,61 +205,67 @@ examples:
     #include <dt-bindings/clock/mt8192-clk.h>
     #include <dt-bindings/power/mt8192-power.h>
 
-    video-codec@16000000 {
-        compatible = "mediatek,mt8192-vcodec-dec";
-        mediatek,scp = <&scp>;
-        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
-        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
-        #address-cells = <1>;
-        #size-cells = <1>;
-        ranges = <0 0x16000000 0x40000>;
-        reg = <0x16000000 0x1000>;		/* VDEC_SYS */
-        vcodec-lat@10000 {
-            compatible = "mediatek,mtk-vcodec-lat";
-            reg = <0x10000 0x800>;
-            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
-            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
-                <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
-                <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
-                <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
-                <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
-                <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
-                <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
-                <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
-            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
-                <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
-                <&vdecsys_soc CLK_VDEC_SOC_LAT>,
-                <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
-                <&topckgen CLK_TOP_MAINPLL_D4>;
-            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
-            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
-            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
-            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
-        };
-
-        vcodec-core@25000 {
-            compatible = "mediatek,mtk-vcodec-core";
-            reg = <0x25000 0x1000>;
-            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
-            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
-                <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
-            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
-                <&vdecsys CLK_VDEC_VDEC>,
-                <&vdecsys CLK_VDEC_LAT>,
-                <&vdecsys CLK_VDEC_LARB1>,
-                <&topckgen CLK_TOP_MAINPLL_D4>;
-            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
-            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
-            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
-            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+    bus@16000000 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges = <0 0x16000000 0x16000000 0 0x40000>;
+
+        video-codec@16000000 {
+            compatible = "mediatek,mt8192-vcodec-dec";
+            mediatek,scp = <&scp>;
+            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0 0 0 0x16000000 0 0x40000>;
+            reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
+            vcodec-lat@10000 {
+                compatible = "mediatek,mtk-vcodec-lat";
+                reg = <0 0x10000 0 0x800>;
+                interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+                iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+                    <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+                    <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+                    <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+                    <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+                    <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+                    <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+                    <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+                clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+                    <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+                    <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+                    <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+                    <&topckgen CLK_TOP_MAINPLL_D4>;
+                clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
+                assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+                assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+                power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+            };
+
+            vcodec-core@25000 {
+                compatible = "mediatek,mtk-vcodec-core";
+                reg = <0 0x25000 0 0x1000>;
+                interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+                iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+                    <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+                clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+                    <&vdecsys CLK_VDEC_VDEC>,
+                    <&vdecsys CLK_VDEC_LAT>,
+                    <&vdecsys CLK_VDEC_LARB1>,
+                    <&topckgen CLK_TOP_MAINPLL_D4>;
+                clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
+                assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+                assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+                power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+            };
         };
     };
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
