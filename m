Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B682C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:42:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9716206F1
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ExNwJV4n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5AQzu/H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9716206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6K1HPqkUWqL/zB3tCx1MIjxUEhv36tm87MwPRPX/io=; b=ExNwJV4n8Mn+qF+XLgueiSoAGG
	WlQ+1/dKC/qgAFAoOzXp/LukekPliUlwNQ/xOyZewdkdHKy4gZi7NYPsy3dpO+ls+uvzHkfAlFKkO
	8BkYFi2DPRAWFtzYt85/pR0IDORHOlx39EtS7L54FUKtknNXPraxorIgEzeNNe7z/AB60/R+xhTV2
	XF2WpT0+2LL2gOGGjWH4eTn8sY+eiSbOc5xZXRvWJlPaWXIQ5anDD+Nqcn1+Tmp2ckmR6QaGd+anA
	0zy/vSEcLpJVBn9/kQ82DgVHgM8ImcRKuusfsdN40tveKPKcQYVMeIkuTU7iFbh6ap1QrTvy9HyUN
	PUxaZRtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtlJ-0006Q0-Kc; Tue, 03 Nov 2020 10:42:01 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtl5-0006KU-OP; Tue, 03 Nov 2020 10:41:49 +0000
Received: by mail-pf1-x444.google.com with SMTP id 72so7136077pfv.7;
 Tue, 03 Nov 2020 02:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DocRIoraJwCc4pCxgMjpaBmhMvt70LApw/0AXvr850U=;
 b=i5AQzu/HzLImbAH0vojQljhX2dcdbQwywZb9q8tcJpOFdCm1m4l4SdwhYVCTy+mRNt
 zSxen4BalU0mPFGn9HCgE9j6PY9VNwzIi3Rn0jtB6RVl+m52edi069UliRk/h2jTVpz6
 4EGJ2JF2Ih8TO0gbyO1ugtpQXsGNnfEi72hB4hG2p+KXkFId57yCb6vIE4Blq4NgI/Pv
 D/XnGbLwS+UBiv+5Qh7HxdXVSjTkS957ltNSeGU/BDi7V7h+GCUSvegMicTDZnPP6j4U
 nKVXUMYmFmB4/2jmdah3nd55R4M5Z7jrruWnqLxudwa+65YnihFMopWB/AKojoxZkZAv
 iVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DocRIoraJwCc4pCxgMjpaBmhMvt70LApw/0AXvr850U=;
 b=lIA6cnGBOUWKRYu+mN6cX2IwIGpdQ5CRUHCiNAW3x0zkbBpzhi/zAbHIQzrbAkV8Rf
 KklS1fe97DrC380/jtjh4uVOCrcsqqswUBs9qUsiio9//+pj4O0vX9BQaBsF7ZLY/Wym
 F5M2/NNRaDwGyDkiXl8PhyyqyDHFRmvQ1XTdQkP6vdBxNBxL/S40EVtyDoFRWut89wzC
 2kARme5KPyo8Rf0XMg5NWZUW8GysmZuFxBHGjmJUdOmsrRT+5unNQauhPBNR+iS5HxYn
 c01IbAZVH3jSVNZHgSTiqesy5DOzJCAPE5YC4aQl9/eBsYaH4OlEHMbaq4L3PhBcl72O
 Qa8w==
X-Gm-Message-State: AOAM533bDtbNwhfwbCvYMx8FrFmKXV69psSMeIWFNOP66JmHi7gGpLbh
 hFG5+La3/S0reEazkfyoHtY=
X-Google-Smtp-Source: ABdhPJzNFDYFuzU0bZZXg6OnHEiPLOo0Niu/3APBFyIUFWx0UM+AXqL2o0EpsKMJvEcoE8X3+sC9aA==
X-Received: by 2002:a17:90a:cf18:: with SMTP id
 h24mr3247961pju.72.1604400103861; 
 Tue, 03 Nov 2020 02:41:43 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id 26sm5235537pgm.92.2020.11.03.02.41.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 02:41:43 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v2 1/2] dt-bindings: power: Add bindings document for Charger
 support on MT6360 PMIC
Date: Tue,  3 Nov 2020 18:41:30 +0800
Message-Id: <1604400091-14618-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604400091-14618-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1604400091-14618-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_054148_033394_BABA6099 
X-CRM114-Status: GOOD (  15.29  )
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
