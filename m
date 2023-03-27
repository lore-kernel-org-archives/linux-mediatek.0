Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E6CC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g36LB56fmScqFYQLMR1QrBmpqkKWb5a6f9AKykOj3Bw=; b=vjSuqGOgRqQj2VGLI6zPyzmP02
	k1kJjxOxD+hXphIPbIQYHvb3NuMDhIY77GW6EJMsjtcQM9TKqKMMUuLH5qr8krwbPHp9mkhn06j2F
	aEH2Vfmr0HF3F5NDjEDw/a0EdR5fUaiOLglodk25o7nLK6J7jSFXpI4reIV8lJf0Dn0T6VL1TZKSI
	35XV6oK7JSZljZLDi2JdZxB/ewOPJwMbo8SG9+mvuHfv1PS2DgeZTzwdnMux3etX4TqIV68CGIcTb
	nTcdxSDNg42Q2dYFcPD+WpNt8kkslUoVENlw1wb6q4ytqnEAUKuAXFqgrxAkMkPQKDz7N0gXDb9+O
	DURtYzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqEX-00BoS9-0e;
	Mon, 27 Mar 2023 17:02:13 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqEN-00BoDO-10;
	Mon, 27 Mar 2023 17:02:04 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-17997ccf711so9995099fac.0;
        Mon, 27 Mar 2023 10:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679936523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g36LB56fmScqFYQLMR1QrBmpqkKWb5a6f9AKykOj3Bw=;
        b=GlWXj48M51e3G1znSB5znLyxlnx8whqqufRdESn5BskGtJYAxznjqBZ0lSm7Uhz9li
         4+kFxXLnBi9XWS66RFyD9lg97tSjr3zcW6gyCRlzk5AWG5udmq04FPnUpsuwPXgdcVaC
         oAoAnWrptP2I5HIyzSczJkxBvN5bvvyHMlHiI8OebiiNK4mrSjukkbhF4prAphuvdZwN
         97G/Y4qfDPChR92J+moZ7AtcJe+QMeZZz6nEPauIg4FYXTNVg+nDpB/G6xHW6ko9eU/R
         zStKafPI5W2qCSD7TCxgRYv8Alw+nDqdbgBeypzknnQCOyEYCXNa/l1z/vJ/g/xexazF
         w5SQ==
X-Gm-Message-State: AAQBX9cSL8P6bSrLe30zDXJuy9fZgbCab1MCiVgmjkpUJGDpesJyBsvx
	lMOLnP6TDCAv1fySk1/O1g==
X-Google-Smtp-Source: AKy350YnHstOEw1avVxSXYtmJmZlzDSW/DDiq3a65+LUgrmEvX2Gwz7648gA6HnLvYFD+vanJTRbEQ==
X-Received: by 2002:a05:6870:e255:b0:17a:a7af:6ce7 with SMTP id d21-20020a056870e25500b0017aa7af6ce7mr8867996oac.39.1679936522863;
        Mon, 27 Mar 2023 10:02:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bf9-20020a0568700a0900b0017264f96879sm640694oac.17.2023.03.27.10.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 10:02:02 -0700 (PDT)
Received: (nullmailer pid 4106102 invoked by uid 1000);
	Mon, 27 Mar 2023 17:02:01 -0000
From: Rob Herring <robh@kernel.org>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: rng: Drop unneeded quotes
Date: Mon, 27 Mar 2023 12:01:53 -0500
Message-Id: <20230327170153.4105594-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_100203_347432_FDC63FA4 
X-CRM114-Status: GOOD (  10.92  )
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 4 ++--
 Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml | 4 ++--
 Documentation/devicetree/bindings/rng/mtk-rng.yaml           | 4 ++--
 Documentation/devicetree/bindings/rng/ti,keystone-rng.yaml   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
index 09c6c906b1f9..457a6e43d810 100644
--- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/rng/amlogic,meson-rng.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/rng/amlogic,meson-rng.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson Random number generator
 
diff --git a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
index a00e9bc8b609..827983008ecf 100644
--- a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
+++ b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/rng/brcm,iproc-rng200.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/rng/brcm,iproc-rng200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: HWRNG support for the iproc-rng200 driver
 
diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
index bb32491ee8ae..7e8dc62e5d3a 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/rng/mtk-rng.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/rng/mtk-rng.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Random number generator
 
diff --git a/Documentation/devicetree/bindings/rng/ti,keystone-rng.yaml b/Documentation/devicetree/bindings/rng/ti,keystone-rng.yaml
index e749818fc193..06a6791b3356 100644
--- a/Documentation/devicetree/bindings/rng/ti,keystone-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/ti,keystone-rng.yaml
@@ -25,7 +25,7 @@ properties:
     maxItems: 1
 
   ti,syscon-sa-cfg:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: |
       Phandle to syscon node of the SA configuration registers.  These
       registers are shared between HWRNG and crypto drivers.
-- 
2.39.2


