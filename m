Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A4EC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rh33nlejTJNeLiS5J2Nit+Q+p9V7inxX1clrI9e4hhI=; b=Ujt3A7a50DrTfx
	VUm+TkhKo1Su4/Hhopw44cbF20hlVlIPZ228PKQb4M2B0kYwpZREwJC5VtPQVDvgChnDHwIYXvqlS
	RVGxd+LS0fYouoCgI67KQPnN6ZfCSlUtHz0T0WY5CiPODPbO9JtCLBRs8V3UtOdrFHw0FyZWcw0qa
	GhKJJA0+b/1Cmzbs4qYaCbe8AhY8EV8Xt+UdJzUF7OebE54PXxHhDHcxRIeumZ0yzcI1C8UZcjFqw
	nff4pUfo5hGFzeEzg/lXcskdKn616+z8mx82B92FeImbyPt+SoZwAqQugKT0g959WegsMD3HtFiOq
	y+cIY174usp3aG0jfl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbZN-006UxP-CQ; Sun, 27 Mar 2022 22:41:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZE-006UoM-0I
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id u16so17911509wru.4
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCWNoI6S3UynddM0NjUJNRT0orVS9R9xw/bHT6vllVw=;
 b=kQHdQf4XWT0zrLej+HqLhQnoLSDL4FUXKFFhNAule6XP72vXNG4dkp/EOJGjwaMoiM
 Q86SkKQDDu5NwU4mv3ZPQZEwY5GItaZM9tYCempTbaBAQ5hFfeUfXyzXI206+It7105C
 tMQ0zwgm4r72iFGKg/cO3Ef+/mT6B3JT6aIm2eztCf+hH1EKcF+AbwTH7mUct/3xuFRF
 bOyCIXPSDfRwxcKg7srsWjF31+aQB8JNyoJQLsFJ2D6VPBzloCJDntMff4zwcsiwDcT9
 NyY0T6PL94BHly+F2oZQnQOgi81yUoeVhwfVyWVbo275m/Tf1yuANMoqNnI0TC57Hqar
 Dkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCWNoI6S3UynddM0NjUJNRT0orVS9R9xw/bHT6vllVw=;
 b=0n80j/2CZjH2goXgAnkTFrIB9v49LwZ8+XgIzjkWv1VpYSTWbzoFK4sNxYTif+Nefa
 p1wJOrrLHc09rlEEgo/YI756psLblDM8RRM8fMSBVCLytf11dZskW5Rmx70qW0TG9N/M
 KSS85QKEd4BDkTv1KVBT2GQ1nCKIhOKliwPZ2r48Kv7Uk5J9+hHFDxunFgDRlR5Oe3Z2
 qRSf8qddzgLJfg9tcjKTaX8uWJvl2IjkWRN7CvUOZAKtuxMj1paRAK7Zn7W/vdFGAbkI
 Twbtgjk9xKiUrl2sBk7ZROWrJUB2djz1Wft4da1SW8KTEF1tMqIWbT6Ldxm3RgRR52q6
 dU+g==
X-Gm-Message-State: AOAM533KB9bL65BYLH4WfldX8fvDlKIzp9QaGj7BXfx6WcRhs4IESalE
 oxAb9o1RQGH8KstPZ3HPoOuzoQ==
X-Google-Smtp-Source: ABdhPJzQDzvE1ZCewkLdNbBG+s3CDiVlGo2TvrQ4rL7RxUmlq5PJuIMu0oINE6aVjcSTnHJOLFvsMQ==
X-Received: by 2002:a05:6000:1862:b0:204:e417:9cf8 with SMTP id
 d2-20020a056000186200b00204e4179cf8mr19918655wri.593.1648420858793; 
 Sun, 27 Mar 2022 15:40:58 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:40:58 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com,
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Mon, 28 Mar 2022 00:39:06 +0200
Message-Id: <20220327223927.20848-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154100_073165_E29E7295 
X-CRM114-Status: GOOD (  12.28  )
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
index dd2896a40ff0..2dba80ad3b18 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -4,16 +4,16 @@
 $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: mediatek DPI Controller Device Tree Bindings
+title: mediatek DPI/DP_INTF Controller
 
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
