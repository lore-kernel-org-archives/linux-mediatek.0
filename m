Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA50C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 07:49:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D14A422AAA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 07:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D14A422AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4P+lSWuHDZ/pILDG4B3HsHEGTQ96nwELrtyfQfBlMM=; b=L+ObMD156pvwLSCbLfZCFGmuRl
	y34KT5cM4tk+vCx1DsCiOsyLrMNKTjk81kqB1ne+1s7iGK0Z6lZuQ+m/uqTlkMjhSIzjIs3HJNHKD
	g7I3cAtEBxLi6S5/qqrGnv1j3JCfLNZ9eE5pVbnBMCSXXqteoJ53TMZRDWxzdTtnoDPGlYEB8m/Aj
	71RELG69Ii4/TriHH0Fwzrf0xHVo1DiWhCnS2WUZiU+qm6rMTx4sXDrE+EeXkSisVbt8h+yx9jDP8
	8JGl2eeYwqgfwyIFEsOXSKOrf2mEktW21Oyi5VeJhM23ij2KFwHxIrmFsMVfGi5BXdGMZQ/NlVrQo
	7yWxqO6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksLNT-0007fH-Ql; Thu, 24 Dec 2020 07:49:39 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksLNO-0007e7-3J; Thu, 24 Dec 2020 07:49:35 +0000
Received: by mail-pj1-x102c.google.com with SMTP id w1so2133096pjc.0;
 Wed, 23 Dec 2020 23:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LevLbOCn+wWVy1pSLuh/5mjmYuoAJpxbht7K62GCCWA=;
 b=tzqbqwygQ3ka6OWxbTeYVwkeh8hblHBEAD/zgH6gju0AYFgvfPGps54I76kfpj0WlA
 iFSqCiI+8fIcB0xPWXqbLfL4+SrDHwHNNLla7xhwtKUjYDNWtg4DSSKqsZzgP0FkYj1a
 c6lSTHKtK5AdzTrTdT7Yi5duh9c2YfnZibDxGdtYkwCN5n8Xfis464wkVkF+5/v2Kmnv
 EI6KtE/oduiYNZgcihpXL/IP4ghYUHY8lLi12Cex2ekQi/S/hx0OLX0PvMGKNZ8BE+jS
 DlCu6e64J49RcgRN0vBZvMIk2kAZtoPLRxOlSkqKwevB24wVy/ehTTxyRuLqjiW78rhI
 1a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LevLbOCn+wWVy1pSLuh/5mjmYuoAJpxbht7K62GCCWA=;
 b=l76iFZ9f0o61iT0b2umYysl+cLLpqEkHbQ0MSC/NsNyrTGNGRiRdlg4je/++NUr0b1
 w4BM3dldb5jhA56dmoIdg7nXzGDwcD1Fd37StFtOrSfIa+YWa7LUIYQBvT9nsqOXJUJz
 j6G3LPnQjlv7EGwtyjpVybCAqcw1/xGrRwmtoVFkumX+rDNTDkD5gf4r7oZS9YCESvAP
 ADWKIABZu2jW40nC/xSt/MNmtbNIdNgrzBDlVdcxqvR1F8wbZrSr34Wp1dibxnqWhUjv
 kDUoW0ZY6AFxrb3vwclDS9vDnqNMih0z2ceeJ0m3K5sZyRWdX3G4MPiOEZLn1tmBUUWq
 avpg==
X-Gm-Message-State: AOAM5304kKTar4fLTGpmXOjvYEikg6kFa8lw/XPzAup4ekwwGVN0Iet+
 PA4Z5R3HuU6XShAb9hn0P90=
X-Google-Smtp-Source: ABdhPJz44WBFy35ALxHWjoN7jxZoDC0DXsbw3FdnIR9Ez4VsXCyW+8X/UpApzBCC2Bl6urjQFhbJLQ==
X-Received: by 2002:a17:902:7e42:b029:dc:f98:44e2 with SMTP id
 a2-20020a1709027e42b02900dc0f9844e2mr28256913pln.49.1608796171402; 
 Wed, 23 Dec 2020 23:49:31 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
 by smtp.gmail.com with ESMTPSA id y9sm1743507pjt.37.2020.12.23.23.49.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 23:49:30 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v3 1/2] dt-bindings: power: Add bindings document for Charger
 support on MT6360 PMIC
Date: Thu, 24 Dec 2020 15:48:03 +0800
Message-Id: <1608796084-29418-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608796084-29418-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608796084-29418-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_024934_401670_46996B1A 
X-CRM114-Status: GOOD (  14.83  )
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
