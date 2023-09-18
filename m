Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C36C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0qTvBf5FgaTyQcfbl+e1xRZRJHDSVi0KUDZ9vhIQHg=; b=kYGIS8mFbzw13o9mOG7F2jQbu7
	RMFI49SNvAa/Vk/tPkm91ptyhAhXLUb5Im/y3o11AeLYmUCu8DK9QTX7Qq+qioip3MnEIm3u2p7H7
	bP4bAsMMCy0v8n76OMr7mgyBxNzufdmVT3ryTSTIfl0LuaOnWxeB8Gefrykm0lgS+5hCWAjjhf2I+
	L/9pVwnwM0ZL5G0R6q/6hBlbLifdjxwZ80FTKK0wYmyMF+FYiU0hdA+1TpqHJ22chEJHlJZnaxuVb
	kbIhrQ0J7WMlhOvOSMMmOcJ9OVtcb3DuF3vPzSJcsIFqTdchayYpC/r0MUa6Rral3fIQVNvHG7bXo
	P0auq7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAi7-00ExvW-0z;
	Mon, 18 Sep 2023 09:38:31 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAhz-00Exoq-1e
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 09:38:26 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so67796071fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695029899; x=1695634699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0qTvBf5FgaTyQcfbl+e1xRZRJHDSVi0KUDZ9vhIQHg=;
        b=qtiuXDQ6bjLVz7Yh/VfL60LmukZ43g9ecdoN4sLHy5PxWKAjWWwWrvQ0kE/rOg+oqG
         eIKth5t+CbyLFdU4N5h8KYRWQv02RkujffAIUXSwX2XieptbYsp/wfjjxYDC5SJhMJav
         YwE293cvID5ja7EK7zdA++3vCwhb17yl4kklN5xWbEv4AuKxWXL+D7AWOrbF/WOihs8e
         RZ/qPh5ppCDJmTfHdgVDIr/1vkJ7D7Fs0404/nMYPxrX1zPwJOjT1ec4ZVKKuhcT1jcB
         GlSVWcWHa3o6/C+h6N594kXGxATfQL6OcIEYToboSgz92BUddKPS/V0KjhA2dpGCG1II
         86DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029899; x=1695634699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0qTvBf5FgaTyQcfbl+e1xRZRJHDSVi0KUDZ9vhIQHg=;
        b=HGPigUJR+RxJsXXnvmAMIzRCd/Oo6M4Vyu9cQFluT1vjphZ8ByHoGkBwN2QdT+R3UJ
         OQTwu80xqKOJqVRI+cNemQvOk27emZeXUMzu4tVhnzkmm9GFhkY564F6TMVLqFzMPkYB
         eEboYsSsnaUf0ilY5pMg9vZdnFVNgS/oZQYBc6Sx9elAy5j6tUfZ5HzGFXE5Myhb4b04
         hJuw36WkGr9g0G/sZAykVsVUe+8XF/i8zw/ETw4vm2vmGHQ6+KBR25hjkJKXlfmKrYDA
         yjV8JfdNMJSi+1f7+FBJsb1vQ0+oUCQZsPByREns9WN5wSLGpcsXC0Hp4TQi+uo3gGWc
         96iw==
X-Gm-Message-State: AOJu0YwaZ/Vx6BxaK1G0ADjCiljZkNB2UvWgwu7ewP/2r0Mp04YaypH1
	Iu+OlxXPIONpqTuLzbf5posWYQ==
X-Google-Smtp-Source: AGHT+IHApuTk1zSQ5D9rsSPW1G3kKCj3AYq8GUd1jeVahiGLMEv5UIxIC2+BG5cae36fnNDNCoDOqA==
X-Received: by 2002:a2e:8514:0:b0:2b9:dd5d:5d0c with SMTP id j20-20020a2e8514000000b002b9dd5d5d0cmr6392362lji.52.1695029899063;
        Mon, 18 Sep 2023 02:38:19 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:8222:872:4a5b:b69c:1318])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709061d4a00b0099293cdbc98sm6251164ejh.145.2023.09.18.02.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 02:38:18 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/8] dt-bindings: power: Add MT8365 power domains
Date: Mon, 18 Sep 2023 11:37:45 +0200
Message-Id: <20230918093751.1188668-2-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918093751.1188668-1-msp@baylibre.com>
References: <20230918093751.1188668-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_023823_549825_A869115A 
X-CRM114-Status: GOOD (  12.69  )
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


