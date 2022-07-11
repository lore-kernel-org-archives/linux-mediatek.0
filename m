Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34074C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNv9QOnXv9weH+V6x/HkNHjngpnnJdPXJnZmNdoQqyc=; b=pgG4R5cHZjPXbfZthvywOCP72w
	Nxc0zd8VloH8jhkFR3ytUaaeRWCEy0oxOmr+9amds1IzG1urf6Dg6JNmM21oTrOo68SqOXa3fop4I
	PIiqn19UiuyUCtSaUUPGbFdLC/eIksXTaAJ7Er2C9Co3WhLM0Eliqmodb61q2+ysInGAv9CIbWYWG
	DIwT+uQZx+3NdmDT8oWKQxk7ltk+sNhdxKjwIfisnBWQOozanhhdSbORTN1CbIPIHLgEd9Dlbrror
	pzxmokNlS9E3MRaxwFOumtyfWgqQdNo7bRSWiODVaj3tdAjC55RJsdH1kddvlzCwh0mpTxzUGF0c0
	QdSNixVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsTm-001OEj-4D; Mon, 11 Jul 2022 12:25:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsTP-001O34-OK; Mon, 11 Jul 2022 12:25:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ADF4366019FE;
	Mon, 11 Jul 2022 13:25:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657542309;
	bh=WNj+Fngrs3bQ3s4zywv4THTLiM1Sc7weFg7rQrZYyA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ceyCqKo7TRKXqpMJLLjVVVxkeX7NFgcmBVwiHVgHiBdWcrBW4wXbasuam2Zv3o1Gq
	 Etiy5WNb/pI0J2BHtC9mAvQo/cSHGBdpmV3t6zR4UELoDyyo5Bn4GKVzCHcAD2u+V0
	 6w2dBWmD8VEM6WdDolQBqFiGgmxPIgUNiNPoTA6VkkCdI6TZbi5JviazImVZ7JCX7G
	 IeOY9F692AZPeAhqbSGzEuzgeP185qP1hdaDmgaegDAN8MZ5M8j5MiwA/++YH6jDVy
	 UxEj155zUjI9vKvxhe4Hw37V5WBTOUIr/ZzPvNsNkibx5JYwHb3EjpzZnIgW7HOkXU
	 e5Fgt1Cg8qqQg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chun-jie.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	nfraprado@collabora.com
Subject: [PATCH 2/3] dt-bindings: power: mediatek: Update example to use phandle to syscon
Date: Mon, 11 Jul 2022 14:25:02 +0200
Message-Id: <20220711122503.286743-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
References: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_052512_085935_C030FEE1 
X-CRM114-Status: GOOD (  10.68  )
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

The preferred way of declaring this node is by using a phandle to
syscon: update the example to reflect that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../power/mediatek,power-controller.yaml      | 125 +++++++++---------
 1 file changed, 63 insertions(+), 62 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 848fdff7c9d8..bed059e4401d 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -237,76 +237,77 @@ examples:
         scpsys: syscon@10006000 {
             compatible = "syscon", "simple-mfd";
             reg = <0 0x10006000 0 0x1000>;
+        };
+    };
 
-            spm: power-controller {
-                compatible = "mediatek,mt8173-power-controller";
+    spm: power-controller {
+        compatible = "mediatek,mt8173-power-controller";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #power-domain-cells = <1>;
+        syscon = <&scpsys>;
+
+        /* power domains of the SoC */
+        power-domain@MT8173_POWER_DOMAIN_VDEC {
+            reg = <MT8173_POWER_DOMAIN_VDEC>;
+            clocks = <&topckgen CLK_TOP_MM_SEL>;
+            clock-names = "mm";
+            #power-domain-cells = <0>;
+        };
+        power-domain@MT8173_POWER_DOMAIN_VENC {
+            reg = <MT8173_POWER_DOMAIN_VENC>;
+            clocks = <&topckgen CLK_TOP_MM_SEL>,
+                     <&topckgen CLK_TOP_VENC_SEL>;
+            clock-names = "mm", "venc";
+            #power-domain-cells = <0>;
+        };
+        power-domain@MT8173_POWER_DOMAIN_ISP {
+            reg = <MT8173_POWER_DOMAIN_ISP>;
+            clocks = <&topckgen CLK_TOP_MM_SEL>;
+            clock-names = "mm";
+            #power-domain-cells = <0>;
+        };
+        power-domain@MT8173_POWER_DOMAIN_MM {
+            reg = <MT8173_POWER_DOMAIN_MM>;
+            clocks = <&topckgen CLK_TOP_MM_SEL>;
+            clock-names = "mm";
+            #power-domain-cells = <0>;
+            mediatek,infracfg = <&infracfg>;
+        };
+        power-domain@MT8173_POWER_DOMAIN_VENC_LT {
+            reg = <MT8173_POWER_DOMAIN_VENC_LT>;
+            clocks = <&topckgen CLK_TOP_MM_SEL>,
+                     <&topckgen CLK_TOP_VENC_LT_SEL>;
+            clock-names = "mm", "venclt";
+            #power-domain-cells = <0>;
+        };
+        power-domain@MT8173_POWER_DOMAIN_AUDIO {
+            reg = <MT8173_POWER_DOMAIN_AUDIO>;
+            #power-domain-cells = <0>;
+        };
+        power-domain@MT8173_POWER_DOMAIN_USB {
+            reg = <MT8173_POWER_DOMAIN_USB>;
+            #power-domain-cells = <0>;
+        };
+        power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
+            reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
+            clocks = <&clk26m>;
+            clock-names = "mfg";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #power-domain-cells = <1>;
+
+            power-domain@MT8173_POWER_DOMAIN_MFG_2D {
+                reg = <MT8173_POWER_DOMAIN_MFG_2D>;
                 #address-cells = <1>;
                 #size-cells = <0>;
                 #power-domain-cells = <1>;
 
-                /* power domains of the SoC */
-                power-domain@MT8173_POWER_DOMAIN_VDEC {
-                    reg = <MT8173_POWER_DOMAIN_VDEC>;
-                    clocks = <&topckgen CLK_TOP_MM_SEL>;
-                    clock-names = "mm";
-                    #power-domain-cells = <0>;
-                };
-                power-domain@MT8173_POWER_DOMAIN_VENC {
-                    reg = <MT8173_POWER_DOMAIN_VENC>;
-                    clocks = <&topckgen CLK_TOP_MM_SEL>,
-                             <&topckgen CLK_TOP_VENC_SEL>;
-                    clock-names = "mm", "venc";
-                    #power-domain-cells = <0>;
-                };
-                power-domain@MT8173_POWER_DOMAIN_ISP {
-                    reg = <MT8173_POWER_DOMAIN_ISP>;
-                    clocks = <&topckgen CLK_TOP_MM_SEL>;
-                    clock-names = "mm";
-                    #power-domain-cells = <0>;
-                };
-                power-domain@MT8173_POWER_DOMAIN_MM {
-                    reg = <MT8173_POWER_DOMAIN_MM>;
-                    clocks = <&topckgen CLK_TOP_MM_SEL>;
-                    clock-names = "mm";
+                power-domain@MT8173_POWER_DOMAIN_MFG {
+                    reg = <MT8173_POWER_DOMAIN_MFG>;
                     #power-domain-cells = <0>;
                     mediatek,infracfg = <&infracfg>;
                 };
-                power-domain@MT8173_POWER_DOMAIN_VENC_LT {
-                    reg = <MT8173_POWER_DOMAIN_VENC_LT>;
-                    clocks = <&topckgen CLK_TOP_MM_SEL>,
-                             <&topckgen CLK_TOP_VENC_LT_SEL>;
-                    clock-names = "mm", "venclt";
-                    #power-domain-cells = <0>;
-                };
-                power-domain@MT8173_POWER_DOMAIN_AUDIO {
-                    reg = <MT8173_POWER_DOMAIN_AUDIO>;
-                    #power-domain-cells = <0>;
-                };
-                power-domain@MT8173_POWER_DOMAIN_USB {
-                    reg = <MT8173_POWER_DOMAIN_USB>;
-                    #power-domain-cells = <0>;
-                };
-                power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
-                    reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-                    clocks = <&clk26m>;
-                    clock-names = "mfg";
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-                    #power-domain-cells = <1>;
-
-                    power-domain@MT8173_POWER_DOMAIN_MFG_2D {
-                        reg = <MT8173_POWER_DOMAIN_MFG_2D>;
-                        #address-cells = <1>;
-                        #size-cells = <0>;
-                        #power-domain-cells = <1>;
-
-                        power-domain@MT8173_POWER_DOMAIN_MFG {
-                            reg = <MT8173_POWER_DOMAIN_MFG>;
-                            #power-domain-cells = <0>;
-                            mediatek,infracfg = <&infracfg>;
-                        };
-                    };
-                };
             };
         };
     };
-- 
2.35.1


