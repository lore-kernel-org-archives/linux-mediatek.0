Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77116C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:44:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FE64613D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FE64613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=We3mER+fQ717SOMuR8BIjGR26sW5argWijyIopBH374=; b=QZRA7XDoNgIs5x
	Wf/XqhjV4d/Tkg916/Z0izHZuJmLr1VuK+H5LzwceJCI2NMzNqahgVfHLgyqrPXf3BdGXSexfxU0T
	PO0mpFs8uIdSFSXlkz4MdNsGgafRqZhjHzfJvZu7epUDD8dumLNNWtY3Bbu4/ar/6njPFw747NECD
	XHilkvzizQw9uTGSrwyyhAjNx21CiTD62Ej+0JhDjta7zMFxBf+gEAoNOUjSwHHDPtKlmY6yC5Ibh
	WHG9J+fvp+6DvSS2PyJY3trltHUsWoQ0wb4sSl3c1Kgf6xXm/UhnUv9P1M5EVTJ5sfB4kctnldrBe
	ne/G+ElK8XzHF17YCU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4KOe-003y3d-3Q; Fri, 16 Jul 2021 09:44:40 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4KOB-003xwB-FH; Fri, 16 Jul 2021 09:44:13 +0000
Received: by mail-pg1-x533.google.com with SMTP id t9so9435531pgn.4;
 Fri, 16 Jul 2021 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JuzSaJeX++ckGWb53wf2z0OIXSlH3HjOOCWZ8LzlB8=;
 b=RrmRxtQJYJHug+4681IZOjE1binXrtH7BvMSoNlzX9eqH+BGBLGOHk+/W4dXovFyMR
 Zud733tbnhYLcSObrtJgYbaGbV7korNtaoeO9987RtQdXm6isY8qY0C6Mjc5bcobQAW4
 U+eia9H7c7ot6RuTDeB9jjUgyKqpWTbRxQJq4V9oXpG4kqar5uQ8d5Yld2NptKJp5G6N
 7XCDkJQT95IVlddvYJHOrwScc/MxLUAz3H+1VLeeMoRWf9RnTaH0EQCawMgGpQei27O2
 Wb58lSDy21I80aXEfOQm7622QSXWmpjuT+AnBZvaH/E344dkKV03kvDgnYhaoCtRP9Iz
 dr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JuzSaJeX++ckGWb53wf2z0OIXSlH3HjOOCWZ8LzlB8=;
 b=Ce09YxZ8s81Sqxl3U0p9ao5Bixg+LWATMK8lWve+t291anOrO4cpMKuuCKRgaRiTg2
 khpEtTrCvABZXoNZH4XC2EhOOV+7lNZQ90Eeh3Ifkns1UrB6+zkOxd7lMifcCrCIHkLP
 nHDyy077K+gvCcgj6m9gW1qJV/xZNwHc9FXaO0VBT5ezkHr/iKfKNn/YpDHibFoLsI17
 nP6ZP7DVH2Bj+BUYwfcq07Ie+o+TD8Ila26W/TcyC3X6ZZQAFBKsqQyId4LcVNMLCXvK
 mLhrNnTluQTZjzACFlppICvl10Bpg+FYdWrci6nm+8QKz3fzWG1XKkjr5Bb/gDTUJAff
 BMAQ==
X-Gm-Message-State: AOAM533n6+Yfkg+Dxd7I8GztwklEE3UR73oThfXOvL5gT0nT2iAfV2yT
 dYKMvt0dJwqHhcIKoJ3YdDU=
X-Google-Smtp-Source: ABdhPJwHAvbqLIirNjVveYH4wzjNWCVGuA9LLfRVJhgHVtNE+bW15gdmRZusmu6XwTRTonxig/AFMA==
X-Received: by 2002:a63:1246:: with SMTP id 6mr2865211pgs.436.1626428650771;
 Fri, 16 Jul 2021 02:44:10 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id m21sm9508800pfo.159.2021.07.16.02.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 02:44:10 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org, matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 inux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v6 2/3] dt-bindings: power: Add bindings document for Charger
 support on MT6360 PMIC
Date: Fri, 16 Jul 2021 17:43:52 +0800
Message-Id: <20210716094353.140536-3-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
References: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_024411_540898_545D2307 
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
