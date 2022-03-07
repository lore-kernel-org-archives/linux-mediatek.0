Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7449C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vX9U0//6WlfkUmeotSIH7A+Fa9v+3ZdAar0VGGsqS0c=; b=bmFszab90Qn4ke
	eeBD1lYAIsGibSumcB9zk0KFHxgB+FK9kYm8gKyV8AZa4vuBIyK13IMlG4KVMpomz2tJDWyrjbhzo
	8sUXMC6+0z+UNJumb3ccmm0ECiO2laqaljcmsdM0p8BYz6t6sFSIENEW6e9vlmo+VuXL0pFPT7/3R
	vkEXi6KIUvDAyRtaQQ1dEnSaOO6rIbTp//R1oqPjQsXzvMLPcUZqfGSnJkwqgt55sXnrRDX4R65pB
	Nkkns6Ygl5isA9wspmJVr6ofvcZF9A5x8qECk+omDikyKKEqHhwK00dfBRcRxUjJb9OfLDxY31Qgz
	vdgu2KvHKFKJayMByqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFZS-000gCl-Ga; Mon, 07 Mar 2022 15:46:50 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFYv-000fwE-MA
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 15:46:19 +0000
Received: by mail-ed1-x532.google.com with SMTP id f8so20502665edf.10
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 07:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L5m6P7fLCOpQVhAoLkaaRIYTfvk9veUQCuvJDzF/V1c=;
 b=PdZQVIGYoSypt74Tuo0iLHZLHiWRG6vXCYsgFDwpM6qXsOTCeEU7R4CQIoq5C0dkh5
 jjExHORdLRHgqKN2d9StsZC092OGT4wCkFoODQBDAnEPYkvKtiu9hk5y8H9QiX3zHK9g
 osvrCBdLuY19+5Ed23HqTWehMMRZfA09MZ/AxURGswP/lN283j86aGyEzAaRbyMDswxe
 KhGNvLZN8Pq3ZPZkevCDHI+QRSNJ6padD8lh312vJ/dUCvCdU+pUyPajHJCWzseeu8qI
 pu39e3BojrA/uZPZODDdt5MXr9tsT0MIaW9FW7xJ70BOfWTu6FcoYjH6qQvk6x0HZmHO
 nm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L5m6P7fLCOpQVhAoLkaaRIYTfvk9veUQCuvJDzF/V1c=;
 b=ON0pYOOvuQfD48XbjcGBDM5rj563fKBl+t6kQUU5YPGux7iKDavH/Q3z6kijvsdaYI
 Ujw/lnaZ5IYgFTRcWfvZ1HuAVfyekn6WqJ8XBQ1y3QcONV9RAc4Q8VPwWTjxlsJoPhOK
 cVCDBmBIv2ujdxsUkt0A8ojSyw+7eFRZBmnyW8QCQhH/qCQ0x2TGxN4BdqB/80s8gZ/G
 tz71eEsfxtcpfhko/KudVCzTbvCMt3+ya+ybx1QlcyuKbE+aRqWz6eRyu2bRpIaYIiqy
 VR5Xq82D3o8gBh1n8V7A2C2ZZlka5+3Gor2ufJW9ZCslJTuyAQXg+AfvPk+dmtaAYIuT
 FsCA==
X-Gm-Message-State: AOAM532G7aUJY8VcexqhK3FpNj4xDW/TuzQwPbRL/myppEbymQH8diUO
 h7Wnz20ov9kKfvup4M0VQznalw==
X-Google-Smtp-Source: ABdhPJz+TkcFsHL4kC2nAluY7JPswqrL7Wk2RJBJZ8M0konGhmQuUI7nNxB6e/fssM8GX54SAHaJRg==
X-Received: by 2002:a05:6402:d06:b0:412:eafd:8b9a with SMTP id
 eb6-20020a0564020d0600b00412eafd8b9amr11749516edb.278.1646667975836; 
 Mon, 07 Mar 2022 07:46:15 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0041615cd434csm4210747edz.60.2022.03.07.07.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 07:46:15 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v1 1/2] Revert "dt-bindings:drm/bridge:anx7625:add vendor
 define"
Date: Mon,  7 Mar 2022 16:45:57 +0100
Message-Id: <20220307154558.2505734-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307154558.2505734-1-robert.foss@linaro.org>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_074617_734859_3CB3171C 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit a43661e7e819b100e1f833a35018560a1d9abb39.
---
 .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
 1 file changed, 2 insertions(+), 63 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 1d3e88daca041..ab48ab2f4240d 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -43,70 +43,14 @@ properties:
   vdd33-supply:
     description: Regulator that provides the supply 3.3V power.
 
-  analogix,lane0-swing:
-    $ref: /schemas/types.yaml#/definitions/uint8-array
-    minItems: 1
-    maxItems: 20
-    description:
-      an array of swing register setting for DP tx lane0 PHY.
-      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
-      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
-      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
-      [Swing control] setting.
-      Registers 0~9, bit 3:0 is [Boost control], these bits control
-      post cursor manual, increase the [Boost control] to increase
-      Pre-emphasis value.
-      Registers 0~9, bit 6:4 is [Swing control], these bits control
-      swing manual, increase [Swing control] setting to add Vp-p value
-      for each Swing, Pre.
-      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
-      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
-      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
-      [R Termination control] setting.
-      Registers 10~19, bit 4:0 is [R select control], these bits are
-      compensation manual, increase it can enhance IO driven strength
-      and Vp-p.
-      Registers 10~19, bit 5:6 is [R termination control], these bits
-      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
-      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
-
-  analogix,lane1-swing:
-    $ref: /schemas/types.yaml#/definitions/uint8-array
-    minItems: 1
-    maxItems: 20
-    description:
-      an array of swing register setting for DP tx lane1 PHY.
-      DP TX lane1 swing register setting same with lane0
-      swing, please refer lane0-swing property description.
-
-  analogix,audio-enable:
-    type: boolean
-    description: let the driver enable audio HDMI codec function or not.
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: /schemas/graph.yaml#/properties/port
         description:
-          MIPI DSI/DPI input.
-
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint: true
-
-              bus-type:
-                enum: [1, 5]
-                default: 1
-
-              data-lanes: true
+          Video port for MIPI DSI input.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
@@ -143,9 +87,6 @@ examples:
             vdd10-supply = <&pp1000_mipibrdg>;
             vdd18-supply = <&pp1800_mipibrdg>;
             vdd33-supply = <&pp3300_mipibrdg>;
-            analogix,audio-enable;
-            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
-            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
 
             ports {
                 #address-cells = <1>;
@@ -155,8 +96,6 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
-                        bus-type = <5>;
-                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
