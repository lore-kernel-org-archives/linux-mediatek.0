Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98821C4708E
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F65D613BA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F65D613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=We3mER+fQ717SOMuR8BIjGR26sW5argWijyIopBH374=; b=zDfJl1eWGuLxxZ
	Tuq7qUXETZdlYIuS7AsyjtiPlLXZbbkFeh4pa8GP8dd35QxLVGzNBApvV9JWsJMcYXZzmtQPxZPAx
	E0dkjZeNsmtV7tEBMcs97CcKhyHXL+MOsotslXfBTzGqiqTw2XYQzTvqQEfg3f1AZPA2A1XRCAIXd
	wflXWVneqWf1U8iO5eWG+MRLxS8jeKukO00caCbYmkSZ8U0okl02IqOFCXnLZ8vIfHEfE/uZFroUp
	/kq7+iNVtKWcNQ80JR334S3xe52kYABsBNgHkx3tE7fSKd/Vhg5+v8i93ktDJitlYh/sg9R89pPvg
	1PmnWj674hWUwxN3OdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXe3-00DKsX-3G; Fri, 28 May 2021 08:15:03 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXcO-00DJyf-Ib; Fri, 28 May 2021 08:13:22 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 29so1936102pgu.11;
 Fri, 28 May 2021 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JuzSaJeX++ckGWb53wf2z0OIXSlH3HjOOCWZ8LzlB8=;
 b=uYycyqPXkgt61fbVNu81G9i5MhBxFqUmYRGVyeq/03jZutSsobb5tnCIVg19AQMAEW
 ACeh+OmaKpjqqG89Ho8Wtg85/Ujf9W5uJiyadZQKTRXVAH9YosiglbPEMMr2MYaqIncv
 0XDGNfQWGvNQGcVKqFNWpxcSqbqbd3djx9kmDq46UnQSRaQkrWUoGaB6f7py/huBfZzH
 63p2qCM8dYLfEzPpnYaDFPXglp5s0Sx8PRnCwubn3sueRcLnIVU0Zp3mMjOpDQsu3TzM
 lwootisMm/ISGiLEGyIq6G+QbFCqWyAyO2UKGxLYs4fBPECDcL3h5DKAmiRGr8mtmSom
 PpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JuzSaJeX++ckGWb53wf2z0OIXSlH3HjOOCWZ8LzlB8=;
 b=uBa7aS/840e6WfVfohJuT7nEbSLBvnXHfziCQyGdenbS8en/XZaIPMtzPmtvkEs/YI
 dOdEwprPThA5jo6LeDrvRI7d2OJtE2bnPBPtPImn3WTk7hHrx+96R1LxAk8shKLL2FPR
 jtYCnerK9me2belet5eu5hYEAy9clbDfWgmq3FQTuSx2EoT97D2xZk427MLhCN1WdJga
 HeiyFde2cYpxRXm6UZ6eVKeDaL6YNRxuzSKZM/CDAcsTMqug40Rq19dneT9il9v8xzYp
 PjYOxa58OV0oVm1X36fR0kf0lCW8eF1gqYEC8N0Go604+ODyUh7gAGCZEQ9Hn8aRNSaU
 cflg==
X-Gm-Message-State: AOAM530/t8n+rbzsYRRiMBL8WH63/v+rkZnjx3+/Wbk7w5Og3vdWquW3
 Qcm+TgF+575jC5Qt6cp2zC8=
X-Google-Smtp-Source: ABdhPJz0lmodWUJUQCZwq7sQh1ltf7tdBdNSpySeirHXUURY9IlOJf+kA6KzHgr6aho3E0Zz8C+yZA==
X-Received: by 2002:a05:6a00:1992:b029:2df:b93b:49a with SMTP id
 d18-20020a056a001992b02902dfb93b049amr2749686pfl.11.1622189599844; 
 Fri, 28 May 2021 01:13:19 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:3194:b541:419e:4878:8a93])
 by smtp.gmail.com with ESMTPSA id z18sm3846594pfc.23.2021.05.28.01.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 01:13:19 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org, matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 inux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/3] dt-bindings: power: Add bindings document for Charger
 support on MT6360 PMIC
Date: Fri, 28 May 2021 16:12:59 +0800
Message-Id: <20210528081300.64759-3-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210528081300.64759-1-gene.chen.richtek@gmail.com>
References: <20210528081300.64759-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_011320_704353_DCEAFA71 
X-CRM114-Status: GOOD (  12.31  )
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
