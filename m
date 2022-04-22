Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B95C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 19:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2sPwwCQhWd/pVQCq2elDSDyAJKPWBxoxnZuiSnTM560=; b=ZIdjPPzlz00ZWj
	wrAmpAc3ofStI8RkqcbK1JNTddVtBLbn7cdnzQ1Xt83EYKVWN0zJm1T5f3Qyk3Cv2WHKEGnX4weDz
	yIj5CArJDU+QX2H3rB6/LefCUOr1d3qlCRqUBeBgmgr3Y+BZu5bbJYPmlnL0RcRfSO3Jps2iB6Ife
	8d+58y6OhWxjBtGk3GV8XrTQWi+w5tdU5uwmiFe85Fy/XP6UJ6CihxdC/Px9lU0tdS4BRE3qKLaWm
	Va4sUtoc1o9gbSLU6UnJFqpYyuOW71UX+U217veMQ2JkrJ69peH7rvQ3Ddp0uPJ0ssQSdBheTLDWc
	rmzE9Qm8ck60ne67MAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhyqI-0027HM-I9; Fri, 22 Apr 2022 19:21:22 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhyqG-0027Gd-9V; Fri, 22 Apr 2022 19:21:21 +0000
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-e5e433d66dso9622194fac.5; 
 Fri, 22 Apr 2022 12:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0gc9s0Nu7Dy/f5W0uxa+JhgkFQnmycRULJWoNHmae7s=;
 b=WeoMHa/KUgHrJAzaAPNe71pi1kJksmHuo9IttJxZs7rOlQ16Xd5Fht+UUQgm5TYty4
 UF1oW4W0WWTnKcGGxDF4Yi6HV5Yu2pM8MAU2cfEc3JsNqSadea0iTdPi8vhsG9Ba9uLJ
 mdoNlN440Bk/345otCgx1jcAAukMVBhLngbz/+JY11noRdr5Ojw2SGEsh9LJG2qT/n8f
 FCXu63r0rEyGsxtK11UsU2atTxE4XnLZzG3BnRVgwVm53Vvfu+G4MwAVZ08N+7o0aeKn
 eJ+sM5jl+H8GX9wxTgFMoS4kXjvN5rBk5EV6dkU+l4bo/CA4OimU709HPNWkajQO91BK
 zUyQ==
X-Gm-Message-State: AOAM531Y6X24PLD13r1kRHlNqqO0j1rUcmaBzCAD1Fkd3xfhatPU/F5/
 a2mDoV/rTNcp5L8WZvDRoA==
X-Google-Smtp-Source: ABdhPJy1+14fIkK9Z0u5jvsEPpFvTFjZbVR5xwcjkuW3Qq+dGls5tB9qudMev6OqfOIz/ed6iA+g2g==
X-Received: by 2002:a05:6870:6196:b0:e1:e1a2:5c65 with SMTP id
 a22-20020a056870619600b000e1e1a25c65mr2782990oah.190.1650655278243; 
 Fri, 22 Apr 2022 12:21:18 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 bd32-20020a056870d7a000b000d43d4d2de1sm937317oab.5.2022.04.22.12.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 12:21:17 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: iommu: Drop client node in examples
Date: Fri, 22 Apr 2022 14:21:03 -0500
Message-Id: <20220422192104.2591462-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_122120_366797_ACF2E2DB 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

There's no need to show consumer side in provider examples. The ones
used here are undocumented or undocumented in schemas which results in
warnings.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml      | 10 ----------
 .../devicetree/bindings/iommu/samsung,sysmmu.yaml      | 10 ----------
 2 files changed, 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 97e8c471a5e8..e0389539194f 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -173,13 +173,3 @@ examples:
                              <&larb3>, <&larb4>, <&larb5>;
             #iommu-cells = <1>;
     };
-
-  - |
-    #include <dt-bindings/memory/mt8173-larb-port.h>
-
-    /* Example for a client device */
-    display {
-           compatible = "mediatek,mt8173-disp";
-           iommus = <&iommu M4U_PORT_DISP_OVL0>,
-                    <&iommu M4U_PORT_DISP_RDMA0>;
-     };
diff --git a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml
index 783c6b37c9f0..672a0beea600 100644
--- a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml
@@ -86,16 +86,6 @@ examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>
 
-    gsc_0: scaler@13e00000 {
-      compatible = "samsung,exynos5-gsc";
-      reg = <0x13e00000 0x1000>;
-      interrupts = <0 85 0>;
-      power-domains = <&pd_gsc>;
-      clocks = <&clock CLK_GSCL0>;
-      clock-names = "gscl";
-      iommus = <&sysmmu_gsc0>;
-    };
-
     sysmmu_gsc0: iommu@13e80000 {
       compatible = "samsung,exynos-sysmmu";
       reg = <0x13E80000 0x1000>;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
