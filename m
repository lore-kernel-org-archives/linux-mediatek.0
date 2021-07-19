Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08E8C636C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:43:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D9C61042
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D9C61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=We3mER+fQ717SOMuR8BIjGR26sW5argWijyIopBH374=; b=HJiUEglvGz2/kG
	6LRhjE6jbWGKi6gN6qTg3rBlQzYTrzU29hndHGjT0Tl6RvLRDjVbCKX0eKjN4Dpj9dX2oI0cWXk/G
	OyElfDJ14v1KcZqUqWk0ewLl/6Fgd2VKIUx2XNX/Z5Pz98rF2jV8/rlsXoQCoG35xiQWSKVGj/1yp
	0T+HTU4NHgBS4OKAk75JRX5FY3uAafK4zsq9rjaGKsn3A+0GRBp4iOJg5SJFR41kDjWpufHcAH04b
	m5sAD42thVA6uHzCDUTLMCX2ZU8ZVMX2w5OLzZQqGOEkD6p99kSFB7G+JEavZcYJEA86GG4T74IRF
	DDD9OG4RswTqphX6Vu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5KBk-008MIr-Tk; Mon, 19 Jul 2021 03:43:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5KBC-008M8x-AZ; Mon, 19 Jul 2021 03:42:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id v14so8874296plg.9;
 Sun, 18 Jul 2021 20:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JuzSaJeX++ckGWb53wf2z0OIXSlH3HjOOCWZ8LzlB8=;
 b=rfSFdAuoGFQZVDyuWy2BxzI4AynDBx0hHl/9vKjc/eQQCvce5P3ypRQpz2bPirqGtz
 go9HCGb+7ZsMzw/bjmIFgomUGOjp/TquQ1Tqrn8Sk6A/D75sutnN3nn/H6RgWg9POzA0
 EI3rlPPbv/xgW6V08J439/bZ92EzXtGOnWa0e7NqozCRzQKTxUAvqOPM6Y+7MPoCcJz0
 aPMvgYjOgH7L9XoEgv5nsQFfHewqOuYw3bV7QsSBwOCmybmgbnL0aAd7SD5UaDPSfhpf
 pkKU38njatxDC4c1S1i7w6OjRmQyura23jmA6Ry4dyrzjmrk7hYClCU5RotbuJrJVkYv
 um2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JuzSaJeX++ckGWb53wf2z0OIXSlH3HjOOCWZ8LzlB8=;
 b=PWOc5baVPi4v4Gl1tb/lf7QqbHYslHbs8gLaYSKW7ZV6ZZG3U0TYCWalvYKji0slb5
 vs/vMEnrd20kucChvxly04tynOI8OVbJP5wvOqOzddrDJavbNFuSsd7jV9QNviz5kAVm
 Bm5NeTC6FLpG4HDCPA/fwggLvyP++yFX7TNKKd3C91IiFxtzTaLBgLNbD5MQdf8ngbgx
 h3F/3eZOCxXpQU2NlMoeKuq2RdZVJnVEjCEuNgjW+cbNEky06hHxhUWf62A0sa3iGwSm
 +nMRWwd1Ajx0dzzjXxfpj5FK3Kja36xn1ILR5RwOSqQWVLOCOGTWdRluvjpLy60W6iUE
 cKkQ==
X-Gm-Message-State: AOAM530Pm28m/HSncQFloGnt6hmRPd9VHzlQJv3xTj0TFb0s5rZSJNnL
 aYkdjc0uMnv3IUdgdOiS7Eo=
X-Google-Smtp-Source: ABdhPJzp+ue0kBm5Uego9ybT0VJOyR3eJwMn50/b15mFJpH6Aah0Q2o50anwEnDpFt2fn7k+QVNuAA==
X-Received: by 2002:a17:90b:347:: with SMTP id
 fh7mr28330233pjb.2.1626666173545; 
 Sun, 18 Jul 2021 20:42:53 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:58d:ffe9:427:42b0:88c7:1ff9])
 by smtp.gmail.com with ESMTPSA id
 c12sm17949448pfl.27.2021.07.18.20.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 20:42:53 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org, matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 sebastian.reichel@collabora.com, Rob Herring <robh@kernel.org>
Subject: [PATCH resend v6 2/3] dt-bindings: power: Add bindings document for
 Charger support on MT6360 PMIC
Date: Mon, 19 Jul 2021 11:39:13 +0800
Message-Id: <20210719033914.16990-3-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
References: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_204254_401231_201F549D 
X-CRM114-Status: GOOD (  12.80  )
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

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for Charger support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/power/supply/mt6360_charger.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
new file mode 100644
index 000000000000..b89b15a5bfa4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mt6360_charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Battery charger driver for MT6360 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  This module is part of the MT6360 MFD device.
+  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
+
+properties:
+  compatible:
+    const: mediatek,mt6360-chg
+
+  richtek,vinovp-microvolt:
+    description: Maximum CHGIN regulation voltage in uV.
+    enum: [ 5500000, 6500000, 11000000, 14500000 ]
+
+
+  usb-otg-vbus-regulator:
+    type: object
+    description: OTG boost regulator.
+    $ref: /schemas/regulator/regulator.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    mt6360_charger: charger {
+      compatible = "mediatek,mt6360-chg";
+      richtek,vinovp-microvolt = <14500000>;
+
+      otg_vbus_regulator: usb-otg-vbus-regulator {
+        regulator-compatible = "usb-otg-vbus";
+        regulator-name = "usb-otg-vbus";
+        regulator-min-microvolt = <4425000>;
+        regulator-max-microvolt = <5825000>;
+      };
+    };
+...
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
