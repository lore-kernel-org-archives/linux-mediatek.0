Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72846C87FCA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ejp6dtZ8mTrWrzjYVILGU4AuD3cWclCyQt0gSPOEFkk=; b=mdzWWKJ7Sf+6ay
	EPyKOv+uzFx5fS1b3D4MomAqCUZmjvx+JTRJdK+CAp6xuLngazcMVDZZsUB0VVIW2nPCi8UuL0Sa/
	u4uWdMYCLTtoDJeRYDm1LDo7DxYh/ZFkrxd5vTR6WPVHqyOuhM98ONCh0yMhH7Aah46VmPBddMHab
	8L4mvo4k6XcSLhl54jxjGgH6+H8sipmvvZaFCxefm7ZdZ0FBSu1TCUkhZhA+VRqhuGLgt36ipuVPY
	8PB6uvHtNTqrWgxjllHXNx+W0YCF5FMXLhdRpg3fjiNdXoWVIp2TsWuZWLTTHBQC0fyCFUaYXUgtp
	63Srxg9cw1W10fWdKTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYo-000000076Tw-1EBE;
	Thu, 24 Jul 2025 09:48:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUf-00000006tYa-0pnE;
	Thu, 24 Jul 2025 08:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346399;
	bh=QX1FQ2dQ3CDRcwAseOl4+lBWXKhUPzCWrrc3PxSdZb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZP0rKQEsd8gKWsnWrNx5jYZI+QwjSgLO3Ra9NwcCWUuOP8Gw0/5LCtyQPe/kX8Ey
	 QfgUv8gJ1MfDSPBc0fJcENbXWAV0r58Z4il5SfG7vjVTGnfMbpeTDF8vFvEUw0pBNe
	 p5Ne4UAFRp75hFM0dPNHFAi9zH3SpOoXhP7TGfnL7e+IRp6ER4KV1IYnJ7mYDLNcJ7
	 d1a/hkv9XZH95W/p2R92uSmtaTSy1NlxfiDSh8+/h9IRspptBEg9SB5GvAsY+kFpiG
	 eJWjiv1xoSl/WnZej+zmI3zoQ70PzyveyIEvyVhOfE5OOEiK+lPIJ27rh10jYrAdJ4
	 XHvuXt/wDhp8w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7239617E0FC2;
	Thu, 24 Jul 2025 10:39:57 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 13/38] dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO from MT8188 dual
Date: Thu, 24 Jul 2025 10:38:49 +0200
Message-ID: <20250724083914.61351-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014001_421151_1E50CA0A 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Even though the MT8188 SoC's Dual-Core SCP IP is practically the
same as the one found on MT8195, it doesn't have a dedicated L1
TCM and relies only on SRAM.

Set reg/reg-names minItems to 1 globally and override it in all of
the conditionals for the SoCs that require more, and then split
the mt8195/8188 conditionals to allow specifying only the cfg MMIO
on MT8188.

Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index adc6b3f36fde..6818a6052be0 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -28,11 +28,11 @@ properties:
     description:
       Should contain the address ranges for memory regions SRAM, CFG, and,
       on some platforms, L1TCM.
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   clocks:
@@ -171,8 +171,10 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 2
         reg-names:
+          minItems: 2
           items:
             - const: sram
             - const: cfg
@@ -185,8 +187,10 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 3
         reg-names:
+          minItems: 2
           items:
             - const: sram
             - const: cfg
@@ -196,12 +200,25 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        reg:
+          minItems: 1
+        reg-names:
+          minItems: 1
+          items:
+            - const: cfg
+  - if:
+      properties:
+        compatible:
+          enum:
             - mediatek,mt8195-scp-dual
     then:
       properties:
         reg:
-          maxItems: 2
+          minItems: 2
         reg-names:
+          minItems: 2
           items:
             - const: cfg
             - const: l1tcm
-- 
2.50.1


