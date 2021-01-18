Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F000C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 12:42:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 093CE2231F
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 12:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 093CE2231F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4P+lSWuHDZ/pILDG4B3HsHEGTQ96nwELrtyfQfBlMM=; b=NmZLAW3gn2JNXtjQR3Buujpg8f
	87P5L9iRFZ7fBskw9zS49GtuXjLvHgDBunEF4Z5h6g2cbLujbB7hj+J3eN2cQE15W3BRKbTAeT7jV
	YgbfCKyPZOcZoY2C1MQZ4ioE/a+8k8ZQggghSfCfVyK1BwVxIvCKqYUagfdVB1OEkZUe4SkkoPn02
	ce6LJ2ajAcFk9Sfu+30uEte6FUjavYvh/QKkmUwRT7xd2rrpNWCys6ybx+2GPhLfDSOKGA0rSTeMF
	SyI0DVN31sd7lsj4RssMxleGKK3Iq03+pEH5Q+tm3gObIdyYycYlFjBX2pDe99gLl+RdXy4hn/bhh
	cKLxB+Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1TrF-00086s-3X; Mon, 18 Jan 2021 12:42:09 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Tr7-00084I-4O; Mon, 18 Jan 2021 12:42:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id x12so8578660plr.10;
 Mon, 18 Jan 2021 04:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LevLbOCn+wWVy1pSLuh/5mjmYuoAJpxbht7K62GCCWA=;
 b=TJd4T2BeDxzLCoqjwoGu3zS2UKxa+G11wyaADQoVAXFk45xEP7GlVaUp/yO+RrAvQv
 p/Ya6QNpi7YrATI+Ko2KUBKgMnKWp6n/UY6hZzD54fHYevXh5D+HjY5Fi4C/v4ahZ0vk
 FwDH4++2YZueH1FFvuii66SnD4fTM/qMCJTMh8eVMIae5UzLtjR5hcsUk1xu0CBiFSzP
 NEGIXaRx+gZeRDUC+qoTzn7ZN/0RHfoAcii75A52L719pt6TDjwidGZrdcJE9QWvhQ0j
 rVKKuUN3VLXs6jXGzzFOVT6peF/ieiJ2j7fV917on+4ch2rUHVJdp5tsHDiC2UCNvkUG
 XKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LevLbOCn+wWVy1pSLuh/5mjmYuoAJpxbht7K62GCCWA=;
 b=ULSBGF+ilnTtmpTgCtllTElq7Hw6uusy9kazVSFWChY+1xxbKJyIyEI4A31p0/dbXG
 yuNbgmauL2KoJxGGSJ64QXRzvkHCal56XfxMfLYgaYwWewTJyb2J/s8gCCxm8ku7dMbY
 XOBQsYNnd4KieMhcKNHj5tyW2T5n2hQ7hb/KTiM0y7Pzn5OE+5RmV8uwOS8Ax9mqg8pb
 +wo2FF5PpLtY2vqBK6o9mQKRWcF5UBsh/Vj7sIJsRQ0C1IprvH8b1lcrIpGEUT3VNlfb
 XsNxADA7aKjmWgf0ODBsJqDAXx86UctHdngyKCV4JmvUVEVExpnlio7a/Tg+C8C30UaR
 GuTw==
X-Gm-Message-State: AOAM532ZfUJYUHPkWfOBjNEIYLc/U0DalaKX6BYXiH494ISfHavVmis8
 j8cRtuib7W1fd4iy1b/OgD7Qsf3iPk0=
X-Google-Smtp-Source: ABdhPJw3Oabx0M15W9R/YssWtIM/hMbMPttfatugEnRjKI6KOwhPbiLN5GdY98Jj1TTA4YFFZtW0Sw==
X-Received: by 2002:a17:902:d4d1:b029:de:30a4:360f with SMTP id
 o17-20020a170902d4d1b02900de30a4360fmr26446042plg.83.1610973718920; 
 Mon, 18 Jan 2021 04:41:58 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:fa4f:eecf:e69a:c4f:ee4e])
 by smtp.gmail.com with ESMTPSA id
 np7sm15563431pjb.10.2021.01.18.04.41.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 04:41:58 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v4 1/2] dt-bindings: power: Add bindings document for Charger
 support on MT6360 PMIC
Date: Mon, 18 Jan 2021 20:41:42 +0800
Message-Id: <1610973703-676-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610973703-676-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1610973703-676-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_074201_216522_9242FAE8 
X-CRM114-Status: GOOD (  14.17  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for Charger support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/power/supply/mt6360_charger.yaml      | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
new file mode 100644
index 0000000..b89b15a
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
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
