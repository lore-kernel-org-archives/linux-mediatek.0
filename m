Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058CFC7EE30
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaMxf79DO1CQ15GwbjLqNx3nQuf5cG/QHn3WlZsqaEo=; b=c8N8xCcuUOPUUZOzO76cn+QVuY
	VjVUjmMBybHoNMPwQfZEmVlRhBmJ5pa8won/Er0MmZK++o16NEMnHYt4pY4UCQbgYl9nnS30lSbqA
	zdcLK3Yd4WO+g88ys9G8ZY0XwN2ImQ/8hCy8z2706vpQDf8HkBChtPF1VpsJPVyF24KSezZyUYkTZ
	K5cHODQgn7kWLa01qiY7OXQYwORV7HoeJN4fJDDvZuNwV5hw6hcz/BvzPtR+6HeLXR0opIaIDzq12
	u0UjND6zSCFQlxksZUl6GMnvPRCbpvsY/kaDcZcfsIKLA/TzwRr9a38L5Z3sPR88XPCrFpoBD70Ga
	72MhfxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXi2B-00286R-F6; Thu, 02 Mar 2023 12:27:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXi20-00280O-Hg; Thu, 02 Mar 2023 12:27:33 +0000
Received: by mail-ed1-x52c.google.com with SMTP id s26so66714512edw.11;
        Thu, 02 Mar 2023 04:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677760048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaMxf79DO1CQ15GwbjLqNx3nQuf5cG/QHn3WlZsqaEo=;
        b=JWQNsh3+31Tt7qB7PNgYAQWcgUPJrfYp9gpYmeh9aDdpnjXrCH86wNNA1uOOg6HMpJ
         Cx/2Rfgw1qEinj5wcrH5WVW6UOjguGMfDIJwUGsfNSnW9sL55kjLQyzFGItGedUmEUyj
         GkH++vbp9y9P8EbBTToGqgJ25ShBysUpkg7Ta4oIB5yWBRh8+T9k/3PhxDS2OTWZb4a4
         xLGb0SrXjLspD2HiRrPodyXQoI3nST0iWveorQu4l1QqfN8VNQGKP+FqG6sXksWqP7ej
         748GU4nT3+RC5Zo17tZNCy480PstybSX5yqwclTeQ6P7LpH9kEzm+dKj9u5RU9nNJRWM
         BKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677760048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaMxf79DO1CQ15GwbjLqNx3nQuf5cG/QHn3WlZsqaEo=;
        b=5phUO4bkgoPmXgJzNatBOi/2uGlGFaW7n7O8Kzyvb7OoOWJhcGrGfE1FLvD0bsTblr
         YnYWn8xaq/5YbUznmpnOLxLG0K8eYTmmF3nvRvEs2Js7hWJ7T925/y4CTtwwe5VbLw1Y
         QGprhFL61kMMzAt5rUIzl77XTmuWnpF2wl6+4mewMrCb+oUTcnEnbdvIaOY5Nbb1HSQ2
         54M4HJQ7CfFxLMfq2N771wDqtTY8AmNCYQnQ/OJ0Gm4Htf6wFT2/YLHn28god3A1ec1h
         jvIcMWJoaFNyf4Cl2FWPGqI9IJPZCQB2bhVV2aW4bu9WA23HgBDo73T0hygbYOHSur/V
         XMDw==
X-Gm-Message-State: AO0yUKUuxsbIxKfVMTnBP0ysaFtGDDrpj7q9vdyNihCwlKHDsSVpICJq
	n8gGsYPjpnpKoM7cjHaEjp0=
X-Google-Smtp-Source: AK7set/OHR5ThPdEqYI5LeAp7bLBO3qP3XVmRG3sqzE6cxO85Tq56+/eE87yq48Q4LsornEOmNRpRA==
X-Received: by 2002:a17:906:4d87:b0:878:72d0:2817 with SMTP id s7-20020a1709064d8700b0087872d02817mr10773308eju.29.1677760048812;
        Thu, 02 Mar 2023 04:27:28 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id qc17-20020a170906d8b100b008ca37f3eae9sm7038375ejb.131.2023.03.02.04.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 04:27:28 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	"Garmin.Chang" <Garmin.Chang@mediatek.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: power: Add binding for MediaTek MT6735 power controller
Date: Thu,  2 Mar 2023 15:27:07 +0300
Message-Id: <20230302122708.73848-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302122708.73848-1-y.oudjana@protonmail.com>
References: <20230302122708.73848-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_042732_634465_E854B4CC 
X-CRM114-Status: GOOD (  13.72  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add DT binding for MediaTek MT6735 SCPSYS power controller.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../bindings/power/mediatek,power-controller.yaml  |  2 ++
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  1 +
 include/dt-bindings/power/mt6735-power.h           | 14 ++++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/power/mt6735-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index c9acef80f452..710db61cab53 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -23,6 +23,7 @@ properties:
 
   compatible:
     enum:
+      - mediatek,mt6735-power-controller
       - mediatek,mt6795-power-controller
       - mediatek,mt8167-power-controller
       - mediatek,mt8173-power-controller
@@ -81,6 +82,7 @@ $defs:
       reg:
         description: |
           Power domain index. Valid values are defined in:
+              "include/dt-bindings/power/mt6735-power.h" - for MT6735 type power domain.
               "include/dt-bindings/power/mt6795-power.h" - for MT8167 type power domain.
               "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index 2bc367793aec..3530a6668b48 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -20,6 +20,7 @@ Required properties:
 - compatible: Should be one of:
 	- "mediatek,mt2701-scpsys"
 	- "mediatek,mt2712-scpsys"
+	- "mediatek,mt6735-scpsys"
 	- "mediatek,mt6765-scpsys"
 	- "mediatek,mt6797-scpsys"
 	- "mediatek,mt7622-scpsys"
diff --git a/include/dt-bindings/power/mt6735-power.h b/include/dt-bindings/power/mt6735-power.h
new file mode 100644
index 000000000000..782b49a88773
--- /dev/null
+++ b/include/dt-bindings/power/mt6735-power.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_POWER_MT6735_POWER_H
+#define _DT_BINDINGS_POWER_MT6735_POWER_H
+
+#define MT6735_POWER_DOMAIN_MD1		0
+#define MT6735_POWER_DOMAIN_CONN	1
+#define MT6735_POWER_DOMAIN_DIS		2
+#define MT6735_POWER_DOMAIN_MFG		3
+#define MT6735_POWER_DOMAIN_ISP		4
+#define MT6735_POWER_DOMAIN_VDE		5
+#define MT6735_POWER_DOMAIN_VEN		6
+
+#endif
-- 
2.39.2


