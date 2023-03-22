Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78057C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oO1r+1wOZPdRmVHFSgMXfniQwXiQpryzfNXnQDmnsok=; b=fginoWaWJJqxbSF27CG29NUcSK
	ba+Q3XawQ2E5NFNWz49P/Vp8PR4OgOUamLjy6yXNK+HBr1ZFNfM/bvtBrilw+Uh1IwibSbBeu2/qH
	aQCXa7eWJrUp3wIw89cwukUgoSf10eP4dZS3XfuHTsTGEADbiLibbqKa8hmRczstwTVdE9vHhNlZb
	bas0/HEd0OZGHKslLi1vpDAv7+jWeArGigBJFm49aOn7hG9cAoD1oAFB5BiuPN3RHfFokmXvWQUT7
	YTABOX6FtX2gz8/iisR9jZsmTTnsSksDBzHDc7W9+YgDACOSONZx0cBwkkZAavr54y4Ax263h/5H5
	vmgyfkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Mo-00GrEW-2o;
	Wed, 22 Mar 2023 17:35:18 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Mi-00GrAy-0e;
	Wed, 22 Mar 2023 17:35:14 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17aaa51a911so20178778fac.5;
        Wed, 22 Mar 2023 10:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oO1r+1wOZPdRmVHFSgMXfniQwXiQpryzfNXnQDmnsok=;
        b=BLhZAXGoLBJed21tM533ejlWGoSNn6qR/MM6zYVy5xyTEofyG9Sia8GE1vjcim0j72
         Qvzxe9ALuOkAOGpVka8AvwnurZOK15UdwYk69Lb8vkNnd9gCVlXbYxY5yPt1uOvAV6ao
         0Wpos1bOcfnKjuRBtp46n5s/FHDCUCMGI9LBdCq2/3mhZEM+KCqdgb8bWyu/TDMNq18A
         6iOY1W3oet4Qg36+p3JlNjr35tV59IHys7bryJkyjAMQvVOc8dm9HlAgCZuNrLswdvVE
         GvNXTq08ttnYwuA8d1USf56ldPLYTzBELljSPoANmFCFdcCwnb6917z8hoDn1JST/UIF
         UIXg==
X-Gm-Message-State: AAQBX9dw3NNIuz6ip8eGy7LbXZpH7z2G5KHBFRxHR0cWIihVdy84MH1B
	o86uZJ0wP2wuoIyOLgyiOg==
X-Google-Smtp-Source: AKy350aJQ/zu7y+zv9sL8buQx6HyBBrINb9iplEr6ICsp6AZ6NaLtLRQHTohfmvE7kyL2L6Fqk+mRw==
X-Received: by 2002:a05:6871:706:b0:177:c72a:a9cd with SMTP id f6-20020a056871070600b00177c72aa9cdmr453896oap.13.1679506509996;
        Wed, 22 Mar 2023 10:35:09 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ug21-20020a0568714d1500b0017af6149e61sm5437878oab.21.2023.03.22.10.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:35:06 -0700 (PDT)
Received: (nullmailer pid 3971125 invoked by uid 1000);
	Wed, 22 Mar 2023 17:35:05 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: arm/soc: mediatek: Drop unneeded quotes
Date: Wed, 22 Mar 2023 12:34:59 -0500
Message-Id: <20230322173501.3970991-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_103512_310669_7987322D 
X-CRM114-Status: UNSURE (   9.96  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml   | 4 ++--
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++--
 .../bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml    | 4 ++--
 .../devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml | 4 ++--
 .../bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml       | 4 ++--
 .../bindings/arm/mediatek/mediatek,mt8186-clock.yaml          | 4 ++--
 .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml      | 4 ++--
 .../bindings/arm/mediatek/mediatek,mt8192-clock.yaml          | 4 ++--
 .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml      | 4 ++--
 .../bindings/arm/mediatek/mediatek,mt8195-clock.yaml          | 4 ++--
 .../bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml      | 4 ++--
 .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml    | 4 ++--
 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml    | 4 ++--
 13 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
index e997635e4fe4..ea98043c6ba3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Infrastructure System Configuration Controller
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index d1410345ef18..536f5a5ebd24 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek mmsys controller
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
index 9fbeb626ab23..d89848a8f478 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek PCIE Mirror Controller for MT7622
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index 5c223cb063d4..efcdc4449416 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Wireless Ethernet Dispatch Controller for MT7622
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml
index 96221f51c1c3..82f64469a601 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wed-pcie.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wed-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek PCIE WED Controller for MT7986
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
index cf1002c3efa6..7cd14b163abe 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Functional Clock Controller for MT8186
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
index 661047d26e11..64c769416690 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek System Clock Controller for MT8186
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
index b57cc2e69efb..dff4c8e8fd4b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-clock.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Functional Clock Controller for MT8192
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
index 27f79175c678..8d608fddf3f9 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-sys-clock.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-sys-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek System Clock Controller for MT8192
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
index d62d60181147..d17164b0b13e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Functional Clock Controller for MT8195
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
index 95b6bdf99936..066c9b3d6ac9 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek System Clock Controller for MT8195
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index ef62cbb13590..26158d0d72f3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Peripheral Configuration Controller
 
diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
index d0a4bc3b03e9..99e2caafeadf 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -2,8 +2,8 @@
 # # Copyright 2020 MediaTek Inc.
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/mediatek/devapc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/mediatek/devapc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Device Access Permission Control driver
 
-- 
2.39.2


