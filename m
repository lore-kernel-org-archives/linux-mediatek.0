Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7820C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Q2pWCMQEpUjmp0LD/XSQH5zViblha4T0DSEzE4MXvI=; b=C5DFb+Kip24+5a
	4+98KMaxrRHXxYFqksaaA6OIq1H95860aNUR4oPsrKqxmx0vZOnbxTkY0zxqhTKM1LiJdzF/iyPfo
	c6529zTI5KquS+uD13Esz6i796dgpzaj1yn4t9oEH5HNpECeaSVJmGVIRUxggSdnenMSzZ58+lUe7
	LZ1K02xNqnxERosB5349XrbKb2t9iu17KJvT7ujAS0Ewz6lRLstF//r4fKHyN8U27C1EQfpzEPf1H
	LcU18INBLmDDTd5wf/Cj4cE9ENjs2cLZEgshuel4bYOY/jcG4nnnDVBpSDmynZnzPWOENsIr4rTe3
	fX/0IvtDiZgmdxdBLQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWeV-003gZk-Pu; Tue, 08 Mar 2022 10:01:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWSz-003cAN-Kt
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 09:49:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id e24so14545772wrc.10
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 01:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8Gn7RMbXnK5pOX3NLfwNAKfKCwU3agMth+Gnkiqncgw=;
 b=n1mtQkUkGKPBmZFNsNswSmpz1kilToriI0Gn2TXWimIaqUwnDcc793xA5k7sXREWB6
 aDIQ/y9tV1HqnLZy8JuSpLONMKWZBzeYvyd/x5N+mpbnjbPY2kBQ/c/WhErow4Fj1gor
 uOUMKwuD3519EGocbq+2HEjX84vF+gNrm4pDky3TtSrp9TCsWw1OZXF1eKhWMwb6bucv
 AWU1SucCnbuQgDzehoDmQV4lYdc4iMbLZtYMON9jA38ZZANdSt7LNKT/DbZXN9Z64NET
 EM7BtQDNvqOrhthwtkfpqZjHH6GSMyGu3tVGyEkyZ95FwSLGaBhQvvuuU3nXZgpE7ZyV
 yYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Gn7RMbXnK5pOX3NLfwNAKfKCwU3agMth+Gnkiqncgw=;
 b=AaHpfssyIHRsKPXZNUaugqW6Wtql5/T0nxHHTjjet4HlhMz6no5bFFzMYqTn1J0MRW
 LFXIIqOb/WP66VvhnxCLx7TH5Dc7s5n9YLffiPeAO7p4PjAC1o001TjaYOKm+CExOgvV
 PvGAYqkVLhUNy/3+dSM8vaXsoQcyxe7HPji8FbZ9fAUqhLKy89bJPYDLzfUEGC1CvS14
 PEXc2Gs3uKHIbVwOvklCZq3PiGYcziv9O7CCtMiBUpuNarCVE/us4zczKptq717tk+t9
 iAFvfZ+5G2Ts7vjG4EUZHH9MetAr5QSHt1YHtCkTxgfgdkis2W2xCyqRQqCdk+XF1Sjf
 X4Vw==
X-Gm-Message-State: AOAM533u+eV5QunTCNgSGSEH8sPumq1c7bKw06zSvouMP5HQcoV5sgHB
 AbuQK5IENZ5vtxrBxy+vzdQbcw==
X-Google-Smtp-Source: ABdhPJwgpwNlL+6iw/j8w2WjZiYerIbGT8Nl7xwa9rGUtNmbZvaZejExak5PLKkv0MXEHhHj+9F2TQ==
X-Received: by 2002:a5d:6344:0:b0:1f0:21ee:9705 with SMTP id
 b4-20020a5d6344000000b001f021ee9705mr11450999wrw.93.1646732955982; 
 Tue, 08 Mar 2022 01:49:15 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm1684885wma.21.2022.03.08.01.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:49:15 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org,
 laurent.pinchart@ideasonboard.com, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, arnd@arndb.de
Subject: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: Revert DPI support
Date: Tue,  8 Mar 2022 10:49:10 +0100
Message-Id: <20220308094911.2680291-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220308094911.2680291-1-robert.foss@linaro.org>
References: <20220308094911.2680291-1-robert.foss@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_014917_704419_8C796A9C 
X-CRM114-Status: UNSURE (   9.71  )
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

Revert DPI support from binding.

DPI support relies on the bus-type enum which does not yet support
Mipi DPI, since no v4l2_fwnode_bus_type has been defined for this
bus type.

When DPI for anx7625 was initially added, it assumed that
V4L2_FWNODE_BUS_TYPE_PARALLEL was the correct bus type for
representing DPI, which it is not.

In order to prevent adding this mis-usage to the ABI, let's revert
the support.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes since v1:
- Rob: Instead of reverting the entire commit introducing this,
       do a partial revert of only the relevant parts.

 .../display/bridge/analogix,anx7625.yaml      | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 1d3e88daca041..25b5ef3f759ca 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -91,22 +91,7 @@ properties:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
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
@@ -155,8 +140,6 @@ examples:
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
