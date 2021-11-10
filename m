Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B944C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DA4B6112F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DA4B6112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7u6T2JcpQjpBBreKCSUghtHqSYlgCpBhmx3NfR36VD8=; b=eFKB9Dc/FgC3RI
	Zvc0bDzdx5U5cFj1pFnNRU1ERb6eYy4m5uqsDPqwB/TYDxxgjldYhjaN4hi+vftDM4n73PQEpuuIw
	kxNa6nzzkyCo4/RyCGNXEG8OLmYUTwH0S0x5XwkyKED5VyiIwtInD25pdWxWxCD9cj+eQbAZhy5DK
	fqLqr3lGj+SVWKBE/4ixMwqpGXBNJ2QiqVI3L7CWrIeZQAPzrbGMVetFBJdk0J3IhKO8VBBr7eZs3
	xecqVTagiVlDW5/t2HwBX4EAEtuGWlxJ64RrVjdARnPiRdOt4LWZxI0gUwipJwpwMEWMeJcrtQB8L
	dXWIfoC4C+zWHFXtL97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mknJo-005W3o-36; Wed, 10 Nov 2021 13:07:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mknJD-005Vml-JL
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 13:06:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso4571862wmd.4
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 05:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0zmm5Uwifws1MjnZkoUoDiCdMAMP2gTWa9ThB/Ce5w=;
 b=1m0Zm/PCzG9z0NWK6pM25Oo95Vg28gOv9Xxo1+5wlKgKglsyHyBsqDFgDUzTbsMB57
 xjaltweVlNWagApW8IO23aA6bVgPVDa1mHKIQenHFxGcg1slLrTpEjrE9KxGTEHQ43Hc
 QsTCAXXZ6mxyPu8yLVIpDLuPl0PiLvgyJYTuncv0ws/0NA4Su+PgOY9mN9SqBhD/tyks
 4EDYwHGKMDvkRSzKKECAGh+vTlT2CmOIs5U6Ye9qg3JNW52SlzaPJrsHf3U1W1osTt+s
 l9AisBK1qbStdmqnc1r4cAVDnZK8oK6nTjuazIEE9DpN+tS+uDGqG8wYbSIxIC+TWn6z
 ydKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0zmm5Uwifws1MjnZkoUoDiCdMAMP2gTWa9ThB/Ce5w=;
 b=EBvXtsjv/noBLCYcLCezxIpcjrEDoAUWSOEnolfzF+9wl6HZbZZbQEOTinExCP4241
 5z5o2Vf7K27mK3L7vMuiww514+2Bv5eL7h2PzOTNKjWBrBh+YJC82uMIkusDK+46wo1u
 S7ZkzimtEXfhqWb5rrGYmjaF8inabQMjaANhKEEwxQFfkJac2tw2gHKc7BmHUCSwmKlg
 rPmyT8HY8HyeEJL7XBwzcoB4v1gVReL7Uf02jjiXI4o7dEmrCIvXRAU67cl54IMo2iSR
 WAoXaHJQg8nhdeVVX3DB7KLMQXwFsmPbR02mCtAIFxbc2B6bntSgaajsidXM0K8s0ZlE
 C6GA==
X-Gm-Message-State: AOAM533+S6Fe5s2qQVvnjAwrx2f1k32Dq2TK9cbd+io/dJ4mcAkue4TL
 zAoCc4DiiQj8MUodkZCWOaZPUA==
X-Google-Smtp-Source: ABdhPJxg96GtGO4PDG74wJnowtrVZTuUQp8gjbRnkF7TxTwbcLHbB6RNHz7trA0AOKagF0tJgbHZtA==
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr15986433wmq.97.1636549593736; 
 Wed, 10 Nov 2021 05:06:33 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
 by smtp.gmail.com with ESMTPSA id i17sm5952175wmq.48.2021.11.10.05.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:06:33 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/7] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Wed, 10 Nov 2021 14:06:17 +0100
Message-Id: <20211110130623.20553-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211110130623.20553-1-granquet@baylibre.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_050635_659380_FCF752FE 
X-CRM114-Status: GOOD (  13.80  )
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
index dd2896a40ff08..53acf9a84f7fb 100644
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
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
