Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334D4C7EE2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mr1L/m4ima+2h/NhXtcjqbHddpi6u41EWoGArxh1iQ=; b=v8BnVhbSoZa5BvUO/sTCFA5njJ
	FLCygm46fyVxDVLCOcKOFG9RSwaYu1D7qA9kGkdWo7a0LQVgwPQpQHRzV1zxZqwa4ES2DJmV8PQ2L
	2MwcUNXKERN+NeGven2w8D3l1uxzYU2i6WCfRVG3A6bbD1xXnaIflx+S8VdIw9uI3SAG0fIpgDJkq
	H70VqEecz1MXQ/nlVCitUmvI55XbyOS++SQG/fCCZ+PJV7R7nvyKVzwFkOcz6JX9pY/5yMQgZqIw2
	L0cvCVaXh3h9slWaitK1rjoIt0eJF4feODEN3nwx4YwJbxxmdrV5mHWkUGposgPj/eZ/ARYbH3+IU
	qaDuaBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJZw-00AONp-16;
	Wed, 17 May 2023 16:00:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIWM-00ACET-0i
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 14:52:55 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so8864105e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684335171; x=1686927171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mr1L/m4ima+2h/NhXtcjqbHddpi6u41EWoGArxh1iQ=;
        b=pdG2+3ODw0cGuNg/LORzvNsUqX1IiweDfrWioVGocQZDWZOWLRqkDaX4MTzyiQe1c7
         pkyEeUQ7xqMrhFPqgtTXbdZp3T0rwW0l0BIMsILSnzXcX/Sd7NVDoMo/aiSxsYvHmvbE
         9CFhqMy1vU2U8NqgvLhl8WgFol9WpTF6r6EFUqq/RKyHw1v7dAJHBpN4C35EGlhKFu2m
         bv8X2zua8yim+q2TU1Nwjf+yYUMToKg1IrzAFE9ZZPxUgS9V2JJXJY3xZezoYKEGwVXh
         5JUMdyDg8DXWWvuNp3X07uEX8GvfXlSZm2H1ourLwVfh0bfHuRQHtAUbRtnalP8rK24w
         5aJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684335171; x=1686927171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mr1L/m4ima+2h/NhXtcjqbHddpi6u41EWoGArxh1iQ=;
        b=jBVnZ2R6Zo++w77iudWT48t3XHS4MbSw+PGshss+d4uaWIPWDZEzq5CMOSuqH8CtrD
         kcomr7JcnpSxUg3qwf5EwMQi6UkvN5SsZ/Fzsl3Yx7dhX8LVETMMagwQX9hyP4WlVkNK
         vCuKNRmyO/nUKGu8NNxpwxE53dsUOYMv6hJsyKQ47RsQ0o3rzAhjXL7GAZGla1YDE4LF
         sDtFnS22CSY9CJgsPCGNpVl2iokhMlm4YBfr/fqaJG+7hhIL5rtLD2gg1n7lqtn6+WeH
         l/ZOa1HYakSZkuyf48eu+GzLTIs2Zl08ErKVZL/5HDn1p37qz9rgFXi5HcXn6rnCgU8f
         pMIQ==
X-Gm-Message-State: AC+VfDwtGKssl6bL26FeiY7hv9Dj3N5tWwc53dk6OjtFLQbIcUhTXrJQ
	xYJ7BeUgrp3TONluD+DaDYzKTg==
X-Google-Smtp-Source: ACHHUZ7D+XIYOY7fwEt1VA+EKenIzVfyhPoXQPx4ACohe42JP1CZtzERdmroTv625PctD16NHx1kmg==
X-Received: by 2002:adf:e450:0:b0:307:97dd:1de2 with SMTP id t16-20020adfe450000000b0030797dd1de2mr930581wrm.25.1684335171626;
        Wed, 17 May 2023 07:52:51 -0700 (PDT)
Received: from blaptop.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d678b000000b002f7780eee10sm2979098wru.59.2023.05.17.07.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 07:52:51 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	jstephan@baylibre.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	khilman@baylibre.com,
	nbelin@baylibre.com,
	bero@baylibre.com,
	Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Date: Wed, 17 May 2023 16:52:37 +0200
Message-Id: <20230517145237.295461-8-abailon@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517145237.295461-1-abailon@baylibre.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_075254_259536_81907039 
X-CRM114-Status: GOOD (  12.24  )
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

This adds the device tree bindings for the APU DRM driver.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Reviewed-by: Julien Stephan <jstephan@baylibre.com>
---
 .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml

diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
new file mode 100644
index 000000000000..6f432d3ea478
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AI Processor Unit DRM
+
+properties:
+  compatible:
+    const: mediatek,apu-drm
+
+  remoteproc:
+    maxItems: 2
+    description:
+      Handle to remoteproc devices controlling the APU
+
+  iova:
+    maxItems: 1
+    description:
+      Address and size of virtual memory that could used by the APU
+
+required:
+  - compatible
+  - remoteproc
+  - iova
+
+additionalProperties: false
+
+examples:
+  - |
+    apu@0 {
+      compatible = "mediatek,apu-drm";
+      remoteproc = <&vpu0>, <&vpu1>;
+      iova = <0 0x60000000 0 0x10000000>;
+    };
+
+...
-- 
2.39.2


