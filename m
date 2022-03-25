Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16482C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yv3Bxm9crleQjwrPLh9vwJ3QOBjI8/kvI2zsH1tahl8=; b=s7+ghtg60qjloJ
	iF27LbKe1j5QFZgPVN3Y15/xyf35EBz28/slkG4fwNBH4X2NdvcU30p2r7RFLCAa1w5f0g0Mx9ga8
	H7TCz0ea6akXqTq3csRr3wSYUSqEJ+2T3iqdq4tJ5cjNLjnU2oKKjh0ZYqdzbRAufQkZ+ZThLmV9T
	gtKjRgfG8juzcbnQxearnyeb41bcIdOTnIsbKNsghaG5EmlhRx+Cqw2M/za+F9cIFMcX2y8AwW0E2
	PLJld9uLr/lFpk60sEC2BTJuWsAm+PsQREzvtuTNA4pI5YvdE/2t0fyYBHXxgI3asnpNuhKAdod7G
	+LYdBH7s67QdlivI7d3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnYP-002hR4-TY; Fri, 25 Mar 2022 17:16:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnYM-002hNt-B7
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:16:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id m30so11782318wrb.1
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjQ/r5pco9RwC0sUJWXpp29RkJXQ6qdzLc/z+bngWRI=;
 b=JCQEwvmrbpZpX9TTkHxE1XfIMryiGXzsmmGV4TrzOuO6ttzQ/mxBa1RKj0VLV9x9UY
 4g13irktKfzn6rPan75uwvJ6J8bDM+kY9QRiGd8wjdr2MKe1N1E/RsMr9ow7KUJk98qn
 ZVliZmMXo+/yp3qmfs7zCez21PLXH6qIsfXXBZk/wo28hSX2nfHo6WVEj5AGOmFa7uV8
 57wOQ/7a26LDgckOUFGxL7R5buGa2DHr0We00A4Hh5sG26apUbdinar2B81MPjgMnV0W
 J4QVcdSJFbqo9AhrMpIVXtzKh1lp4zJzAySs1KG0pDx2Kpm6+Rv3gGeoUj3vYLvjCpSk
 lwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NjQ/r5pco9RwC0sUJWXpp29RkJXQ6qdzLc/z+bngWRI=;
 b=jw/OECkLZP83AEMqAbIgK7PtcoLd7QguEGGWcdhP6D+C4sPXHuhtzkKU0tSMvEA3VB
 l5hJrLXbj1l3wF45caedspNREENUUOOHlfZoRaTEnBqLgyQdxQUHZCzFEFKBSiYGMNB8
 l2I5ackGtAtWjmL54xqW6dOtnMepNk/A66vkVONcSAF0AEvbIUs4Ykab9PRlrUQ1WpkM
 vy3Z8cPXFXNIRFlWJWDQAsIwzv9gORYtuFzI0SSfG/GhR8nBZU8OnySkFlJYd5Twugr6
 8Bwx2YeKC/yh5qA3gOgP3waRBGcUniUrIkZqUDo45bOPQQH5OR1tt8ddtLsYhEdsBE/T
 97eg==
X-Gm-Message-State: AOAM531FUj3Yixer4RJe/JC9cJqNPyXhsUzDzstTVxw/oXrOlvuTkqY5
 mQhu5ZRMYHlJE3Jie1JdJtrISw==
X-Google-Smtp-Source: ABdhPJyrSxcXKaAP25ZBJ7/tCD9C7PS/Qy2PJKAsjuVE99MIZGYJl8Bk5UUwKOQluWdrhnCKdKIRIQ==
X-Received: by 2002:adf:ebc7:0:b0:1ee:945a:ffb4 with SMTP id
 v7-20020adfebc7000000b001ee945affb4mr10145745wrn.641.1648228604779; 
 Fri, 25 Mar 2022 10:16:44 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:16:44 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, markyacoub@google.com,
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Fri, 25 Mar 2022 18:14:50 +0100
Message-Id: <20220325171511.23493-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101646_401175_4643EC4F 
X-CRM114-Status: GOOD (  12.77  )
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

DP_INTF is similar to DPI but does not have the exact same feature set
or register layouts.

DP_INTF is the sink of the display pipeline that is connected to the
DisplayPort controller and encoder unit. It takes the same clocks as
DPI.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..53acf9a84f7f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -4,16 +4,16 @@
 $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: mediatek DPI Controller Device Tree Bindings
+title: mediatek DPI/DP_INTF Controller Device Tree Bindings
 
 maintainers:
   - CK Hu <ck.hu@mediatek.com>
   - Jitao shi <jitao.shi@mediatek.com>
 
 description: |
-  The Mediatek DPI function block is a sink of the display subsystem and
-  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
-  output bus.
+  The Mediatek DPI and DP_INTF function blocks are a sink of the display
+  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
+  parallel output bus.
 
 properties:
   compatible:
@@ -23,6 +23,7 @@ properties:
       - mediatek,mt8173-dpi
       - mediatek,mt8183-dpi
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpintf
 
   reg:
     maxItems: 1
@@ -54,7 +55,7 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
     description:
       Output port node. This port should be connected to the input port of an
-      attached HDMI or LVDS encoder chip.
+      attached HDMI, LVDS or DisplayPort encoder chip.
 
 required:
   - compatible
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
