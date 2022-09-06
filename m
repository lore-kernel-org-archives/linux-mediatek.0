Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB87AC6FA8B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 08:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=; b=AzQrvGiQV4S+kAaD1AOewMlsBG
	YZqwheicv6sJXZNUDCmxsK7zRXfa99prjpu+Tfa+LdQMoNuIMLtxex7AW7JSJsDzVjGH70At9G0Tk
	866XeZz0WCmHQZwBXQyjz3t4X+m3BfmjNTMSNzBCPVCNgkgKUtTUTYGmqgDHaC+y3kk5TvucdkLf2
	2YqZXid847OvWzWwtE/bboXyv4PwXdU9zLjyrmrYYFNlnYh58/U9edtKGJdI6s0znF3TLU36LWCgM
	VTVLHgQv+hgqpFifEQXr1jQgA2122knXXME9k+EzCd5cKIyWtEB/dj+gnMbfyfgn7Z1e24b41/TdH
	O6KmToBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU60-00BKrD-Be; Tue, 06 Sep 2022 08:38:12 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU4X-00BJhs-LV; Tue, 06 Sep 2022 08:36:43 +0000
Received: by mail-pg1-x535.google.com with SMTP id q63so9998310pga.9;
        Tue, 06 Sep 2022 01:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=Xfk8q/boJ++tc6ED5541SR2gX9poZWoUxjihn9Y8AOmq7ZxCdFcEB2HwppGGikcMKT
         14j3J2LkM3p3R37EYDFuViu9+ILjA0A8Oi1EOCKenDTrjh6I9xWtyGE32GrkSJLylE4c
         z6SmiFl1RwdomDTsmTxTT8lqZeW0RncJF/xrt+jbHAZm5+4d7hh+QflwnUpZPUlx+jo3
         VNxBZw+L41TSjj6s9EBGmVP5bF/FSH62Z5+TTpG/+kLYZ9myeddS26KECOo4jQuugAtT
         2lFHZrjH6KHuH8+OPNMl/kYg7MHiGVG/l7up1QBCOoTJzkd4rRLf9S8LNW97hLvVN6mN
         7hTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=VGU31MA5DKU18frFEkQDWJ2E0S80zA6UmElWkzohLsdEHpi/lm+rj1mrr2EiFyHw4L
         jWNxZK8e8BuI2BnmhsNCDSfA1BhgiV/iwhYG0A2fom4T0y72fDHx9nTuOdPclKAnLqEn
         jgP06OFWPydmSzBPPyUm2LBQ8rAaZy0nDlYS7bbobcUcc5gnMEr2mu8SMLD2dyK1BZEc
         Ev7oTS/m7cH0/a5geb9VBWOVruVIvFcdnsf7jlLgNGPxIwaFm7zCRsU5//eIZ+yjFgK0
         uHnsyiNrgUjZ6kAlcLBTBhZA+ev9V5TaUyLSalYuEWycVqL8ctOV3hflLWldIpUaWyPY
         CJYg==
X-Gm-Message-State: ACgBeo2T+i1Y4CvIEZRg1lcHj+hC1mG2oHoiDVvGi9nJTNux61TQehe0
	Mz5M7v4IwXqAhCD0AIf1s3A=
X-Google-Smtp-Source: AA6agR4mIARd2VRb2eVkGdWPStcgkOSE3UbrobG0zHPxw9lscm6zsU+2gdQ68uhAbBosYrOX5RA7nA==
X-Received: by 2002:a65:6e45:0:b0:42b:7e3b:754e with SMTP id be5-20020a656e45000000b0042b7e3b754emr42294872pgb.26.1662453397150;
        Tue, 06 Sep 2022 01:36:37 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-80-193.emome-ip.hinet.net. [42.73.80.193])
        by smtp.gmail.com with ESMTPSA id w12-20020aa79a0c000000b005363bc65bafsm9474506pfj.57.2022.09.06.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:36:36 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 3/8] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Tue,  6 Sep 2022 16:33:59 +0800
Message-Id: <93186865d8d7094a4d7d7a7dfee6d5f3058e4ef7.1662476695.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662476695.git.chiaen_wu@richtek.com>
References: <cover.1662476695.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_013641_745888_C08FA2AD 
X-CRM114-Status: GOOD (  11.41  )
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

From: Alice Chen <alice_chen@richtek.com>

Add MediaTek MT6370 flashlight binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alice Chen <alice_chen@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../bindings/leds/mediatek,mt6370-flashlight.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 0000000..e9d02ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-flashlight
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4


