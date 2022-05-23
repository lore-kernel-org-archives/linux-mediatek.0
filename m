Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9071BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+TH/eMKdqW3oezz3Mt3ADAL9IJQPQMU+eqfUo+FvKk=; b=aI+AuFnQlHLLKp
	9xUooEbVdHshgGxElsFOKNyTU0Pj76xmsF2MIKvxTNGh/RZJpP0rp3mC92I/BuqLtTDKskkQQTZk6
	52uIDemUBqzsRe26cAwQGLcnjJKs4kOxG+0rYHcT5A/GraFOj+CzN/s7DjIQOVveGxGOT3wPhhG8L
	uE6S/ytL1hMQgjdcWIGZYY/CjRLqOw3fFGC1DTkMv7oY4Q91Omh5l3+jNuQLtRD2yM2GiLqrY2bf0
	qvvQFSSBwgU918mW/qkpmllpOhS7ijYXmMn7h6ic9P19ZdmK+OflDV+fw/1AtUnEfRZsrdPTB4ogt
	dglIw75Y8ZS6a7YXrtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6EE-003heB-Di; Mon, 23 May 2022 11:28:02 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5dd-003PUs-Uu
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:50:19 +0000
Received: by mail-wr1-x444.google.com with SMTP id u3so20778101wrg.3
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OqXYVhrRj9CHgAnfmavY+OUOGAECWuzwcnTYspWQkrE=;
 b=g/rnOuq2Ks4ma+AdgXNaku8HasO87T86iTPRwuDZffAiRvRN9E4rDlnu5km/QOEpFm
 qmztUmdpfx6YpBrMnDQMYH50vC9CzOA2qWZBXrqLmnZw/OYCMc2HoCQA5QZJgBTbS20v
 unujNoN+7Au/jJ8A49uL1w8fX78FPztttWQObyDlZFDdk9Run4HSzpoefjhG92Zqlwsh
 E9vDx1lbyKrZ2HCvgMT2VKaPbdRD3Anqa5gaZ7knspM8q9LBU/1gmcL4LbFrlZRoNOTr
 +bcNiKzLqpLepsy7SedpuzdpUI2eD18nSQln1JIYNcoljS7sjdg5CZLe6R0VhhFCzg7O
 gNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OqXYVhrRj9CHgAnfmavY+OUOGAECWuzwcnTYspWQkrE=;
 b=1h//gPuhY+4AxczTcURE/qqj7/bES5H1U3OrrBp1EWuBvk/qdnnubvfrDOkVxdi8SM
 1BdTpTuhT60luFe8swSd1+f+IXnZ0l9jqjet/0DPdHOiC/kDDGA2m0GN1CJ+WjDorjF/
 Z4bX4z66zCRPTaxXFLiMhcwTqEwHu1ie7agze/DW5VZof7xCGB4Y0tFuYCCd5AqnEqut
 orLhMN5Qli4vLPxYHF/r0swiN5wYu2J+HUyeqRWC6WFJWro480FNWKsR936oH9Hjdo0N
 4arxAv6wJTWH0BMmpmiiKLfkqaIaOwf/+tQ8fkFcpWmpcFSzaf/apSXi5OEC64Qs9KlZ
 fhTw==
X-Gm-Message-State: AOAM531tmEOeLngVRK9P+Ij3jdGeGH9kXPhcCQcZuzq9bxGci7RONRV6
 C7BtZLk+0VQ6H41mgJ14h0E5Fg==
X-Google-Smtp-Source: ABdhPJxBnLXMcYy77fFpeAyi0ruOH6Xn80k3CU5iV4vZcHjxIdmYPEXeJK7hqDTk6+kltw4LwUnbHQ==
X-Received: by 2002:a5d:5910:0:b0:20d:6e9:d4e9 with SMTP id
 v16-20020a5d5910000000b0020d06e9d4e9mr18395841wrd.69.1653303012296; 
 Mon, 23 May 2022 03:50:12 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:50:11 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v10 01/21] dt-bindings: mediatek,dpi: Add DPINTF compatible
Date: Mon, 23 May 2022 12:47:34 +0200
Message-Id: <20220523104758.29531-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_035014_245028_150D5182 
X-CRM114-Status: GOOD (  14.25  )
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

DPINTF is similar to DPI but does not have the exact same feature set
or register layouts.

DPINTF is the sink of the display pipeline that is connected to the
DisplayPort controller and encoder unit. It takes the same clocks as
DPI.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..6d9f6c11806e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -4,16 +4,16 @@
 $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: mediatek DPI Controller Device Tree Bindings
+title: mediatek DPI/DPINTF Controller
 
 maintainers:
   - CK Hu <ck.hu@mediatek.com>
   - Jitao shi <jitao.shi@mediatek.com>
 
 description: |
-  The Mediatek DPI function block is a sink of the display subsystem and
-  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
-  output bus.
+  The Mediatek DPI and DPINTF function blocks are a sink of the display
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
@@ -35,12 +36,14 @@ properties:
       - description: Pixel Clock
       - description: Engine Clock
       - description: DPI PLL
+      - description: Optional CK CG Clock
 
   clock-names:
     items:
       - const: pixel
       - const: engine
       - const: pll
+      - const: ck_cg
 
   pinctrl-0: true
   pinctrl-1: true
@@ -54,7 +57,7 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
     description:
       Output port node. This port should be connected to the input port of an
-      attached HDMI or LVDS encoder chip.
+      attached HDMI, LVDS or DisplayPort encoder chip.
 
 required:
   - compatible
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
