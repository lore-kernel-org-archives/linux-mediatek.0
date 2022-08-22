Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68842C32774
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDgzoGfvkSJprn1pVjh45rvsUgwFKfwgOyRxpaD3tAs=; b=pMVU1kvmTVzYbNCTzlhCMhQGtv
	6PO0bklKuJx1i1JzgrWc6WUNBOKpaR/91ttzry5v0EnTKttOFZoYOUJszhcwoi4Aw1PhxlnfHgstv
	fzvWYJWiGGV68bch2MRoiFNyTf/m6rwrtNyp0qGlq3Wac0Wm4JrLnozg4cV0YI+IVY8+oRRYh5q4+
	ryWfCtRB7LazHWIKRsC7CKN+Mpe/Ui0ScEbGdjhIUzgCk0Z0w52lPT9Lq9CfhDh2/sw5UZSbQhO59
	cfF8XbAClRloCDfUGlLdJl6DpJGs4TUs6SkQapXaX67Hs8htV9107tN42BpqRSDNyUx44lVn5h6CQ
	G3bZ+2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8hr-00BjTZ-M3; Mon, 22 Aug 2022 14:47:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8gM-00Bgi1-Ih
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 14:45:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id n7so13508686wrv.4
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=hDgzoGfvkSJprn1pVjh45rvsUgwFKfwgOyRxpaD3tAs=;
        b=uV6WZ94rfyaXVoUh/a3cSluphqUec+lYu1z+0VkR3Tm4ro//0CSirXWFgW68u3rQa5
         Nzc8DnBaHh0WNcqiTCGoWa7wJFzAtwym3pDqM67pa7R/q7WWv7JL5X4JHfMYs12dAplF
         sEw9sqvvka4ViiNqO52p1bN7LbOUI4bPeVT3GQDJY8ZwthfGdPnPmc0Tevx5d/0UQ445
         OE6c3HA9Lbu4NlF+24ZSHs1V9fZ1tzzUO9a6Ma+2brbjykei70MHWoss9Pb1vVCuqIgh
         bTHQbUGqPzHsgMxFECQpuzhSFmbZVBvM8Bc9GP7QJDuJxslgeVLgg2AyaEMnpHxEVPhL
         OZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hDgzoGfvkSJprn1pVjh45rvsUgwFKfwgOyRxpaD3tAs=;
        b=EHOaF6PXqmlNxubhT/I1kV3cxPG3iumVxYxc84O9xCKEHTqAlf7iJl8gLkOqopBux3
         d6Ow7bZHTmhyIKnz59UcnGLzdds5E19qbnyY0XLsfD1jjqEMLEvfLDSSj7oEr9f0wZtu
         EhH+x82k5Gv1a3EcDz0Pl6rXVMVLDt5iOq4x/0q789a5mWbKk7GZL23lGtkX7pxyX9EI
         vbKE3FmmkFzLygIqoCIFqDSt3O9IQ+wsrtJXWi4o6pwXdy4yB5mURiZalKf1XPfciw3q
         yMOxOx3RXpftfFnyQIJ7FltwRgui1bMpUFv6eS/UlihAh4i5eGGC1sTwotnWb9rebQhv
         xoSg==
X-Gm-Message-State: ACgBeo3QMWPz29J1+z9OWpH0ztZYnZs6ynNvu47AIWsUkoL1Bc1AELyi
	Wb5kT8tngYiIVmePU3EexWLCIA==
X-Google-Smtp-Source: AA6agR5fjdsY02I9D0DN/Zu7mCPzLbITeHSwG+mjAqQHFtmzGXS7a6CE8dStN62WGowvrhmAMz043A==
X-Received: by 2002:adf:eb50:0:b0:21e:3d13:3a91 with SMTP id u16-20020adfeb50000000b0021e3d133a91mr10682767wrn.484.1661179521924;
        Mon, 22 Aug 2022 07:45:21 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id z24-20020a1cf418000000b003a5dadcf1a8sm14670935wma.19.2022.08.22.07.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 07:45:21 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 1/4] dt-bindings: power: Add MT8365 power domains
Date: Mon, 22 Aug 2022 16:43:00 +0200
Message-Id: <20220822144303.3438467-2-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822144303.3438467-1-msp@baylibre.com>
References: <20220822144303.3438467-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_074538_832405_ED4FDA07 
X-CRM114-Status: GOOD (  12.36  )
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
---

Notes:
    Changes in v3:
    - Renamed mt8365-power.h to mediatek,mt8365-power.h
    
    Changes in v2:
    - Made include/dt-bindings/power/mt8365-power.h dual-license.

 .../power/mediatek,power-controller.yaml      |  2 ++
 .../dt-bindings/power/mediatek,mt8365-power.h | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index b448101fac43..a8702706dae4 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt8186-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
+      - mediatek,mt8365-power-controller
 
   '#power-domain-cells':
     const: 1
@@ -69,6 +70,7 @@ patternProperties:
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
               "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
+              "include/dt-bindings/power/mediatek,mt8365-power.h" - for MT8365 type power domain.
         maxItems: 1
 
       clocks:
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
2.37.2


