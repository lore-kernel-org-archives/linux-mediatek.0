Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7655BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syoRFXdXQzcM34VIbzkvZvVLjPFv9mAzVTqdtXYiV5Y=; b=4kR53s7gZdAGDC
	l1SncWaSqwLrqhBvUNWhtQMmfWq8HYG/8uADDbcbS++Udr8vCevvVb6HWrML59gPLSPC+RRD7tXhj
	l1AhKdMh/ZRyG1mJmMzoUlBO8GdX/ZJIewZoFdHxFSajDhgLiORYuth3xe29avE0rGPdO0aBFbLxL
	+JlMpDQTDU4R5nIGlDo/8lr2m4k1VT+m+KZ1uOz3+d+MC6R2ssupM8Td2J8WUeTD4YokNvnM3zTK0
	7roEb9lSe5ojtvT01w4zln4FCcjgmaM5CIJ9jUzM77G5LCzEKcKph+2rQ31C1Z1CPF7QFp4dG3Lml
	8N0YfM0pVhTPZ/K4ivWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0yS-00AkC6-Dg; Tue, 31 May 2022 12:27:48 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0xn-00Ajyg-VO; Tue, 31 May 2022 12:27:10 +0000
Received: by mail-pg1-x542.google.com with SMTP id e66so12687336pgc.8;
        Tue, 31 May 2022 05:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U7ahqBydDZnP+CjyjsQFK3suIZ5X/7W6Ul5AL8gL7a4=;
        b=V5itc85HJVOWLynsGAGbF1b5IIyjo0uTDnuVBTCCvpXUdjthi8sBYuyxa4mOI983QJ
         QRaZ23PoQwQuHk9R5/xKIoGSln9pltwe9Lb6AnFLQotGz1OZ4dGRMeT+wZp9RU2qFn0b
         lciRB2KdKxg4IWBsOWL2RR3ezr4cEzL5zf+aF41EqU9ySuL/2yKglUC/xzz9Xd8mMjDG
         8chU43vxbt3ZkKn7/jcxCwm11FuTojBCXfq8Cr+A66YKjx++ANR8c/mpuuj/bNex/otj
         LeRysJHhBMTXapMxRzgaAlKfUP6g5WXMCrZvMYi5XjLOZBFPgxstIbP+1lR6a/81s6FX
         1xTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U7ahqBydDZnP+CjyjsQFK3suIZ5X/7W6Ul5AL8gL7a4=;
        b=6bXgjhpJ59uKJAjJrxpRxQqq54JYliaR1o3/XQFo4tys7Oa5TdHxF9aIIQwBd+3818
         D4VhbsKwgJ50OzeJBPg+6eyGWK9//50o1SHblPjdwGIDwZoCDY9OwkbBFfkIUiSG8vaA
         2xeSgedyd5YTLKjuhQty2k+yML4II5gJJug6J26zqNTl8Tfbgn6TQhTvNybfQ5PM7tZs
         iEWY5MngF0cPc/ejtXQE/CAO4Gn9yqmx7a56aQ47cfQBWLoffyT01k5ErxSAYCuAaa1O
         ou0r4oQC10AENqVHbnOkH/3BeQPzZl2J1YxdLVy3BT290TeO64wnhsRJVUaDpphmlhjE
         C9Zw==
X-Gm-Message-State: AOAM531plzC8Nh/WTxpu8VMxyvqExBUmIEbP4J+Lt9jNiBlad2H+MwOn
	nX4ctsRf/QvCCdPvBbY7TrzcVfF1Uf8=
X-Google-Smtp-Source: ABdhPJzR0hOuFaR8Ft3dRJkMlyvX58IIHNvptaqVZwrijhZ0GTUJ0qsvccPRjoO36QbkdyU7o6Azrw==
X-Received: by 2002:a63:6806:0:b0:3fc:3b43:52d5 with SMTP id d6-20020a636806000000b003fc3b4352d5mr4887737pgc.319.1653993071115;
        Tue, 31 May 2022 03:31:11 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id c1-20020a63d501000000b003c14af50631sm10216519pgg.73.2022.05.31.03.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:31:10 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de
Cc: cy_huang@richtek.com,
	alice_chen@richtek.com,
	chiaen_wu@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 12/14] dt-bindings: leds: Add Mediatek MT6370 flashlight binding documentation
Date: Tue, 31 May 2022 18:28:07 +0800
Message-Id: <20220531102809.11976-13-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531102809.11976-1-peterwu.pub@gmail.com>
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_052708_032165_2ADA8B2C 
X-CRM114-Status: GOOD (  12.63  )
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

From: Alice Chen <alice_chen@richtek.com>

Add Mediatek MT6370 flashlight binding documentation

Signed-off-by: Alice Chen <alice_chen@richtek.com>
---
 .../leds/mediatek,mt6370-flashlight.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 000000000000..b1b11bd3d410
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  see Documentation/devicetree/bindings/mfd/mt6370.yaml
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
+    description:
+      Properties for a single flash LED.
+
+    properties:
+      reg:
+        description: Index of the flash LED.
+        enum:
+          - 0 #Address of LED1
+          - 1 #Address of LED2
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
