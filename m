Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39720C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 11:19:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73B6205F4
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 11:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZK9/+eC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLswLrk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73B6205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pIIRGdjq0K3KjpRlRvInuVH/YrJLF9Ti78Joxt9Hfp4=; b=EZK9/+eCDVtuVUKGwQZ3whWkuM
	Q+AfHPBFAWI51xX2wG2+y2QW7S1o2SMdZR8lFIqBeNn/dOS+utOdpnRhfZXgdgBvyjYMdWp0f/daq
	dSmjOyu/t8TA7kJRcNOGAqidhNwhYZOLlmr7Nz81RGIqb7A0caMMglk5EXDP//6mL5TLLDMlnYsjk
	lznAYTtrF1Zkzkrdy+aP0tm3ohJ7jpbuQxfYnr3TscdjCCSRGkFZ5Ds/B1CGdf0ZDpK9rMeEjrFpI
	VCgiZD0MpGSHyY3ixtwWp5JZT4kIma+N6QMafafvts/BnB7I2PbiTggnSaDzfwIShSqDP2V/8GlT/
	yftX+/hA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL2nR-0004iu-TD; Wed, 23 Sep 2020 11:18:49 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL2nK-0004fe-Lv; Wed, 23 Sep 2020 11:18:43 +0000
Received: by mail-pf1-x443.google.com with SMTP id z18so14854478pfg.0;
 Wed, 23 Sep 2020 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7WNGKPx7P80fSH8HCUI8e1FELBKekz/aYKgxcKHN5ds=;
 b=fLswLrk+e7QN82DV+NF1kTEJSNPNUN/srUAt5gMWtLZMkHrb4UbLKgx4r3IkHbPpN/
 1iMmRXtqrj7Xefvf6Pjk14wawK4M9if8nUOG8IRRS2C0eLm4nE2b2EmegCRq/1MsZClp
 p/KmYzVy0a+ZIgo7dY4U7vS5ezZsutdJybqqamuB+AXbYyvo9+1CjtOJ2BDKM8kTdAJf
 MtTH6FzgEBz2bFoqrDCeDSixXloPviCZlgTug14Fq88EeQA5QW3BfMdtnD7NBPUKhjDA
 iklYpeP23Dbz37yYpHefzBIMzDhOnwd8tAmdb5Ez4b9kNuEtvkL3Lwuy+4iMKiQsIQnA
 ySgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7WNGKPx7P80fSH8HCUI8e1FELBKekz/aYKgxcKHN5ds=;
 b=Vw0VGKYvfUnV37af8in8a2GU2T6LfE/p1NrWA6fnNhTZgtH2wxNBuSNxzG+609zvZm
 Z8N75/YdxtgWtM3Eo2t2RWBCQI0sn0q4WsG0hpQWfMgG4g17sgj2Qhxo0/sSCjYyTPVh
 b+i8dLYRWiF5J65LBycZAPxjIctja3EPppDqjpqtRbz/kab7yXernoN1uyPNsn5d0Jqh
 myvXoAzySKlEc3R3rhjp+rmxHLY2TiSelmw2RL3RsOgXYKg3B5lzye8mUGkcOQULZWIN
 pjN80P9Tae1aDhcXGtYGKGxKeFCllDk3J1rEgf7QGzQy/uvUQjD5mdD8R5Wb9rkDkX/H
 MUIA==
X-Gm-Message-State: AOAM530Hp8KWC7YYcx8cZiGToUfgsOM6LwxPDCsGAH8PqBPsYmCiHEpE
 GDbfNlXoVcDEqrIYR7fT+Du1ZsGWRtQ=
X-Google-Smtp-Source: ABdhPJwJ3sGbKfNfOeDqNYze2sgU8ZtcXt+CyLHpXNk8j1WSvxzSE/U9SkUgM3Bo2HbUrGN6JQ7EsQ==
X-Received: by 2002:a63:547:: with SMTP id 68mr4498525pgf.177.1600859917914;
 Wed, 23 Sep 2020 04:18:37 -0700 (PDT)
Received: from localhost.localdomain ([117.19.194.39])
 by smtp.gmail.com with ESMTPSA id 25sm17549693pfj.35.2020.09.23.04.18.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Sep 2020 04:18:37 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH 1/2] dt-bindings: power: Add bindings document for Charger
 support on MT6360 PMIC
Date: Wed, 23 Sep 2020 19:18:29 +0800
Message-Id: <1600859910-15855-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_071842_731330_FF2CB2D4 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for Charger support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../bindings/power/supply/mt6360_charger.yaml      | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
new file mode 100644
index 0000000..711fc19
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
@@ -0,0 +1,44 @@
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
+  vinovp:
+    description:
+      Maximum CHGIN regulation voltage.
+
+  usb-otg-vbus:
+      $ref: /schemas/regulator/regulator.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    mt6360_chg: chg {
+      compatible = "mediatek,mt6360-chg";
+      vinovp = <14500000>;
+      otg_vbus: usb-otg-vbus {
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
