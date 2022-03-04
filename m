Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6ACC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zka8YE0RZVPdzsxFRZB3w3kK89r3oHc3vfP/hH6Vp78=; b=3trzNxGf0VOXUN
	AS2JA/x0yvbCGZb0FMCA9r/MHGAMgrUj98nBcGQFftCpdwnV4VtHFVEzIg+CHwQUYZsGU2YeAoMwB
	PGAFtfRlXRHQyR4+MDADa1T5qXr9GIb11bVcD4ySggCMibz/wpRwjpmd6pFE/pPkLqR9xQoNNUMnv
	RqYUIindcqtuC7wl/FFzfp4DvnoXm0aKI/Zii+WLVjKYgEYXtoDtjfIh7m4lqhjzgKn088ovGi/15
	iT9TnvkvyFKm+qWOqSDm7Px7Mza/by9+jFr1BaFBcxq5s+Onu/dTWHZ5Zho1my/weETTDu46ISzSp
	H4X1JTZtNsnOwKQoKCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQAio-00B1BP-Ia; Fri, 04 Mar 2022 16:24:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQAaX-00AxmU-1C
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 16:15:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id t11so13429305wrm.5
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Mar 2022 08:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qo1oLJMa/Juuiz/8tm0dlUbpsAehCK6hY4TsDvEil64=;
 b=4ucNsu73371QER1iVg/SYxU4sTtNkFz4mcETt58TIUbIzHX0UQsNiv7/hpQbphueQp
 uE41tjRPPJVp+8VjH9CzBcNeqohZ/thG3VeH2awR9qE8+VdDciUao7ZtKsklp2Q7HMcS
 4MFMXWb80oYj5s6RUBwMkBasfLcAC3kFBfxZDTH2oFa4Zbf2w5MNjrHHTa70XJyYta//
 iv7RK5ax6bqFepe4Uuz0kwBN6Z2qVletNxzWFgc+MX18zxn024mFy01NHrKFkMHUDCnE
 c3I369eg/D7s8/pCtCAwrkXnmc9A9qotLgCQpCQn9rmDz/m6r3OM6U6LksGIJuV9Fl5m
 Qsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qo1oLJMa/Juuiz/8tm0dlUbpsAehCK6hY4TsDvEil64=;
 b=4YF+8JtXbhWv73nuS3XEl0VED2fGVKLX7+SGUFzXxXQ1QU5pWawl0K9OQOmV3O4UMy
 NwDdTgBFIq/Y8oYXuwRAHK3YcCzXvX0niJYvEssUCGwfdiGDSRz3hNewVQ81q0yjkkEl
 PWOxKJdtizIP1kOisLRy4pVjIFo6tSqIDhSu+1Y+LxnAyZxCmZD6/UMZtkqpH9ubt4iC
 DJY0KVaeoaaDRID0wM8UCUSTbbMCppngfCqpaTmJ6JNiXIE7GxjmessX7fFjNModABsG
 9lIH83t3vwtnWS/aQgHgBrrSTsS/53v6eurnLVTOT5qzs8e300e7ETjNUIvfxdhzPFu2
 CNug==
X-Gm-Message-State: AOAM532i6wxfHotHSI33+8oiIq4C7mvE4SEX7R0jy5Ir+qLPn98c4NQO
 z+4meZ5k2MKs8iQaDGElNz8SQA==
X-Google-Smtp-Source: ABdhPJypiVdEpBXufX/LYg2TlJODChhaQvP/Mg/mSfLKFI5Q9apmvXFWuBYOHKLyb5PE/15fMYRUaw==
X-Received: by 2002:a05:6000:15cb:b0:1ea:7db2:f5bb with SMTP id
 y11-20020a05600015cb00b001ea7db2f5bbmr29322769wry.709.1646410527460; 
 Fri, 04 Mar 2022 08:15:27 -0800 (PST)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm4937307wrv.79.2022.03.04.08.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:15:27 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.or
Cc: matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, khilman@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 2/7] dt-bindings: remoteproc: Add bindings for the MT8365
 APU
Date: Fri,  4 Mar 2022 17:15:09 +0100
Message-Id: <20220304161514.994128-3-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304161514.994128-1-abailon@baylibre.com>
References: <20220304161514.994128-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_081529_114703_B78C8239 
X-CRM114-Status: UNSURE (   8.64  )
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

This updates the Mediatek APU bindings to support the MT8365.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../bindings/remoteproc/mtk,apu.yaml          | 45 ++++++++++++++++---
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
index b640aa96d678..388352ccb2b5 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
@@ -16,7 +16,9 @@ maintainers:
 
 properties:
   compatible:
-    const: mediatek,mt8183-apu
+    enum:
+      - mediatek,mt8183-apu
+      - mediatek,mt8365-apu
 
   reg:
     maxItems: 1
@@ -26,13 +28,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 3
+    maxItems: 8
 
   clock-names:
-    items:
-      - const: axi
-      - const: ipu
-      - const: jtag
+    minItems: 3
+    maxItems: 8
 
   iommus:
     maxItems: 3
@@ -69,6 +69,39 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8183-apu
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: axi
+            - const: ipu
+            - const: jtag
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8365-apu
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: if_ck
+            - const: edma
+            - const: ahb
+            - const: axi
+            - const: ipu
+            - const: jtag
+            - const: smi_cam
+            - const: ifr_apu_axi
+
 examples:
   - |
     #include <dt-bindings/clock/mt8183-clk.h>
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
