Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B14DC001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0qTvBf5FgaTyQcfbl+e1xRZRJHDSVi0KUDZ9vhIQHg=; b=F/j44hhndpUZ4yYPYDmn+iqBiS
	npCD8mPndXnjBWaPDnMefLZN2CWdvS5t4ZN2GI3JyV5I61MFn0HwYn41LhXX0alWWn0PDm6VTk/uM
	whQDiVM3dgQ8wlHsjyz19C0LhKZacgiaiOboGk5tuEXPwu0cMjKck2HqCzyLyg6xJjPpjqCegADFb
	+JsXJqMPVHDRQc5OZ9Z0qxPWuolMy3/VTMaqGNA6Zjn6A+E6lUjuDUqtS6Kud2fHrb8zsbRyRZTih
	XMxHrn3xlb+pzGb4UeSCJQgl9ySIUSZiVr4V5HNtgfPQ5WuTt3fB4pLvKjMGpWi7O2TnhEojOv7dD
	RND9NmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxrz-003eyy-0b;
	Thu, 13 Jul 2023 15:04:39 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxrq-003eqs-04
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 15:04:33 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98df3dea907so120526266b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 08:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689260668; x=1691852668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0qTvBf5FgaTyQcfbl+e1xRZRJHDSVi0KUDZ9vhIQHg=;
        b=4VNzRyteYrFfKexzB8Qn3VbI/bFDU4Kbe4VCy941Q3FmJcywE04PS//wnYk82YJRO/
         fblUk8CEjBGspi5ROwN2cN/mi//wecUfx04FbbjDK0c4Lurm0EJHU639KPMhk+6HNUre
         /LmmSjbTpYsyPyrWZXTjKV5E7YyRYyD8HQFsci9vkjD9a/U/YfDl9FihdflLMEzMT0lZ
         Ws+c2K/5Pxs7k0g1j8CLlIkXldxa/Aa4b8oJbyjbixem46i/hfM7n6PCFOrFKGXH+R8Q
         M6X4ZnBoC1fVBOtk6dSlr+QX9q0gkGTf3Adi09kYYxgsEVDTsQnoYqLCR4unc79PJ1wy
         rz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689260668; x=1691852668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0qTvBf5FgaTyQcfbl+e1xRZRJHDSVi0KUDZ9vhIQHg=;
        b=ARlgfOmc3RQUYRcuDLfnvMnmx/i4+0ANzrLo4zDHeMZCAeBKU5g9n3bQGdYGu+fwS4
         yXaKvWHe9FETn5/MJbxJubZW/7n8pWFbciws1EhhKjasXBqDXpstNdYmsZ3k29r7w/Zg
         xQhZg2hKvsERaS6970EWgAMki5I6aix6Azh7uS8S/uJscf+DPYurZUbmhYvOefBuu6ic
         juic9OjfUvF/6O3i0olR7dFL7YU867hwtR7+PpwB3vFlkhkITqWtcuWoxSSbMqd6Rb7q
         Rwsfwad4/gykmghoRPuvcR+H2Yd9W4g1Kf57834k2z74HoNQW3MOyjvBX+1BE+QuxB6E
         itYw==
X-Gm-Message-State: ABy/qLbVNrqVyqDb7k9S/Q7vPax10/yccdnTBTn6t8YT243m/sOHEtG+
	EfrW6y9UJBVbVuebpliJgs7/eA==
X-Google-Smtp-Source: APBJJlGmB6PaFatY8+84gJNEQfODAH4Hsrd1Jkh+iEMF5Q8ud/aawSFeHhlV64SUdDYXtjlA8AoMZA==
X-Received: by 2002:a17:906:224a:b0:991:caa8:fc3a with SMTP id 10-20020a170906224a00b00991caa8fc3amr1704354ejr.72.1689260667614;
        Thu, 13 Jul 2023 08:04:27 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a247:82fa:1d6d:d215:e7c4:dd5e])
        by smtp.gmail.com with ESMTPSA id cd26-20020a170906b35a00b009929c39d5c4sm4102939ejb.36.2023.07.13.08.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:04:27 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 1/8] dt-bindings: power: Add MT8365 power domains
Date: Thu, 13 Jul 2023 17:04:07 +0200
Message-Id: <20230713150414.891893-2-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713150414.891893-1-msp@baylibre.com>
References: <20230713150414.891893-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_080430_084995_1667A040 
X-CRM114-Status: GOOD (  11.92  )
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

From: Fabien Parent <fparent@baylibre.com>

Add power domains dt-bindings for MT8365.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../power/mediatek,power-controller.yaml      |  6 ++++++
 .../dt-bindings/power/mediatek,mt8365-power.h | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index c9acef80f452..8985e2df8a56 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -31,6 +31,7 @@ properties:
       - mediatek,mt8188-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
+      - mediatek,mt8365-power-controller
 
   '#power-domain-cells':
     const: 1
@@ -88,6 +89,7 @@ $defs:
               "include/dt-bindings/power/mediatek,mt8188-power.h" - for MT8188 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
               "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
+              "include/dt-bindings/power/mediatek,mt8365-power.h" - for MT8365 type power domain.
         maxItems: 1
 
       clocks:
@@ -115,6 +117,10 @@ $defs:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the INFRACFG register range.
 
+      mediatek,infracfg-nao:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle to the device containing the INFRACFG-NAO register range.
+
       mediatek,smi:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the SMI register range.
diff --git a/include/dt-bindings/power/mediatek,mt8365-power.h b/include/dt-bindings/power/mediatek,mt8365-power.h
new file mode 100644
index 000000000000..e6cfd0ec7871
--- /dev/null
+++ b/include/dt-bindings/power/mediatek,mt8365-power.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8365_POWER_H
+#define _DT_BINDINGS_POWER_MT8365_POWER_H
+
+#define MT8365_POWER_DOMAIN_MM		0
+#define MT8365_POWER_DOMAIN_CONN	1
+#define MT8365_POWER_DOMAIN_MFG		2
+#define MT8365_POWER_DOMAIN_AUDIO	3
+#define MT8365_POWER_DOMAIN_CAM		4
+#define MT8365_POWER_DOMAIN_DSP		5
+#define MT8365_POWER_DOMAIN_VDEC	6
+#define MT8365_POWER_DOMAIN_VENC	7
+#define MT8365_POWER_DOMAIN_APU		8
+
+#endif /* _DT_BINDINGS_POWER_MT8365_POWER_H */
-- 
2.40.1


