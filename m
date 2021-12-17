Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2841BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7u6T2JcpQjpBBreKCSUghtHqSYlgCpBhmx3NfR36VD8=; b=M2ryKkW/NswHIq
	hQdoF15c4f+6aVtje6809ivDaJmn6xVyYNP4MLL+RKWdvPMVKcieV0H9GKBnbpofejl0vSJJjYdj8
	A2kQAiMjlqF/tfucg/WXONEipS2ABF6DjmrjiJupUtO81b9eFUzCM5utVsx85ALrYX2vlSW14eC8M
	YBLGEOVNmWWRr6TIfp+E8rwfsC3OEeygX1AENoJ2xJnVdB9pT1WfgKcOr6efDkviiWbEYBuyRSCqI
	t976EcWi0H3/YGL5+a1dEmuu5osfXTsakeSHxTmDqqYtCF1xmHwmqNAK/IZdNK/51IvE085qGHC9J
	B50GzWUz3hIepr8v4FRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEs6-00Aouu-6o; Fri, 17 Dec 2021 15:10:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myErI-00AoWi-JY
 for linux-mediatek@lists.infradead.org; Fri, 17 Dec 2021 15:09:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id i22so4573057wrb.13
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Dec 2021 07:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0zmm5Uwifws1MjnZkoUoDiCdMAMP2gTWa9ThB/Ce5w=;
 b=HiI6Pzls1JZKv4QmjjgDV0dP59e7eML5Uxrijbu7h94/E6mIBwXfsvMDg/0qDsS/40
 LQ6IaIMyUkNrczWzL3lRvSWZJEjUPaaTesF8oi0tzguCd+hloRw+9tj7+nQ12eqgozsh
 XTtP75hHNxb8vbVPWp0m52ZoQFpl8RjTJnMIhuMAbhMBMQrin6mFYaW6JRGnxoMcX7xj
 LIal1DRnVz6dKP/zniJdPQCjiT7aLJt3f0GG30ccY/w2qPiaJPgA5m7PxwBBVmpNGbVx
 /pf0qcU07yC+xQWkI8l6EfwQBE+kbp7V/jj/x7NZzq0VXECNDhNuN0VxvEm/iU6lx84c
 RsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0zmm5Uwifws1MjnZkoUoDiCdMAMP2gTWa9ThB/Ce5w=;
 b=kp1BxCbxF0u3J+EUWnsjzMcfOBn/WPp1GerOLR61FMGgFxB3ruDeX7bE4IqurJyk1L
 0SNXHMTdr4wPRdnvFsRgAAHZ2+2QOT6B/l1KveQlpSOFQJxqDb5Y+68apTm3dNA6nYRZ
 BoBPbqQDhflD1OuClvNZhsczGVS6sdN3Nak3tRowJR9WsvfyyhmajE2hSGnQy0LioWsU
 VXS+bsxpFi50WWlavaUSQKLwjWdYQ321056v0ZCP2dewKR8pxrzJo+pXZ0F3Yj1D+h6Z
 nKcmtsb+DvGX0Yj1FP/uRTjYgitGBhxdPD7HJ4OuymBWZhiBJJO2ViTbsPiRYZyAwl0l
 jW7w==
X-Gm-Message-State: AOAM533z9Tzkgpn36fl9DNSb3y7t6LwF4MlyAkWtosInzV/Ne41TOTmV
 smLn+MKfJZwUHFg7gEyuqW4J0Q==
X-Google-Smtp-Source: ABdhPJx5/1BsBGu53I1FtcJbP7X+IDnOXTCM7flbne+QScrb5fAv3VQF1KMorpUVilt/7lV7ZP4BVw==
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr2935396wry.424.1639753759334; 
 Fri, 17 Dec 2021 07:09:19 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6441-43a4-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6441:43a4:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id g18sm12655132wmq.4.2021.12.17.07.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:09:18 -0800 (PST)
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
Subject: [PATCH v7 1/8] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Fri, 17 Dec 2021 16:08:47 +0100
Message-Id: <20211217150854.2081-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217150854.2081-1-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_070920_685417_99839356 
X-CRM114-Status: GOOD (  13.02  )
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
