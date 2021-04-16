Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E15C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:48:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3110F61184
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3110F61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KayOieAkXyTKQv6tsNpPk6mndzyd83Bn+1e8+aZFH6s=; b=cDq7f+VvcxiA/xitUlt8FK+oA
	+zn3uVnZg5hC/42M89wSOf1OIBsHvSujdE3/6gwY4Q8D16JAdb2SU+hN4k7kXsfBUuHsCjFpk0DZO
	b+EXWPL1rOlp4SKrgCAclFWlVNpwJhnrMi+QLOXf1q2Gty1Hx3O/r54ObLYgaE8l5UOD/+DG3CkVR
	9mb/PdUYMx01iByeUwTFrI2ag2YuNwNkfMopll5O0RTo1De+sCDFwnZkZtSGN2mopLkPblIfY5YoZ
	WfvyHH6AcqOOk4znKGF5p4TPBTyBKlOqm9DISfkpwquIIN9a1Yojv66agCNEZ+bdWITqnpO7f9xTM
	jzoi9vqGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXL4o-001beh-OA; Fri, 16 Apr 2021 09:47:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKpz-001YZJ-5a
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 09:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=yxFxffXYzG94NY/TSzI2aGXJPEGEi8wNJjSEnL3r92Q=; b=dgnZ5VlbBSdRSnoI+lmpTp1x7Q
 b3zLkCNmGXRQqcv6HAitGIE7bguMuVp6WaYbIYhUen1Sa1UztoXVP7d1uaYqHjmhtJn+S6bRNkYZ6
 bVq20xr+N8h09/aIhaKWcmWb9410Dz2CVr/M8AbtgEmnsCC7RyjBn2RyKCiM/ydidF+vLlsjOfsRg
 s7Qqmo0BTZCdQLJxH4dLrw3DilQX4oDUv5PQQ5ZVF/ZnlgBB+UmKIw4/ueYoA3bheDZJwPMEBOauR
 MVpk39iTaPB33UjjFsXq3TI7DsRWu7V8qvs9zQ7R5EiYn6JqtUi3iNdAzHHyudJBd2s8lR2nOF1EE
 JovqwX7g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKpw-009FDs-6v
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 09:32:30 +0000
X-UUID: fb8167863855442dbea7af49b86b6665-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yxFxffXYzG94NY/TSzI2aGXJPEGEi8wNJjSEnL3r92Q=; 
 b=ih3bqek9hjL4r2784VA3qdec0vsk1TnLtiPkexB7NLLsBc2R2ovKgaWxTofxdMyPVGzd/fceb8SHKyInza9LuaLB6iqNac3DJYk1NtsTGqk+cnQ2q8eJIyl1svXZkJVhdzbzOX/YzLE6Gr9lkv9iaWYSJB3CkXqXv2CYVrdxixk=;
X-UUID: fb8167863855442dbea7af49b86b6665-20210416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <pk.chi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1051268694; Fri, 16 Apr 2021 02:32:26 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 02:32:24 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 17:32:22 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Apr 2021 17:32:22 +0800
From: Po-Kai Chi <pk.chi@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>, CC Hwang
 <cc.hwang@mediatek.com>, Po-Kai Chi <pk.chi@mediatek.com>
Subject: [PATCH v2 1/4] dt-bindings: memory: Add binding for MediaTek DRAM
 Controller
Date: Fri, 16 Apr 2021 17:32:15 +0800
Message-ID: <1618565538-6972-2-git-send-email-pk.chi@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
References: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_023228_280505_D213170D 
X-CRM114-Status: GOOD (  15.63  )
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

This patch adds the documentation of the device-tree binding for
MediaTek DRAM Controller.

Signed-off-by: Po-Kai Chi <pk.chi@mediatek.com>
---
 .../memory-controllers/mediatek,dramc.yaml         |  162 ++++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
new file mode 100644
index 0000000..18f77c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2021 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mediatek,dramc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DRAM Controller
+
+maintainers:
+  - Po-Kai Chi <pk.chi@mediatek.com>
+
+description: |
+  MediaTek DRAM controller (DRAMC) provides an interface to query information
+  about DRAM which collected from bootloader and device tree.
+  This is mainly used by MediaTek Extended Memory Interface (EMI) and DVFS Resource
+  Control (DVFSRC).
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt6779-dramc
+
+  reg:
+    description:
+      Base address of MediaTek DRAM related hardware modules, each channel has
+      its own base address in order of
+      DRAMC_AO_{CH}, DRAMC_NAO_{CH}, DDRPHY_AO_{CH}.
+    minItems: 3            # 3 * N channels
+    maxItems: 6
+
+  mediatek,dram-type:
+    description:
+      The DRAM type of current DRAM chip.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+
+  mediatek,support-channel-cnt:
+    description:
+      The maximum DRAM channel count supported by SoC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 4
+
+  mediatek,channel-cnt:
+    description:
+      The DRAM channel count of current DRAM chip.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 4
+
+  mediatek,rank-cnt:
+    description:
+      The DRAM rank count of current DRAM chip.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2
+
+  mediatek,rank-size:
+    description:
+      An array of 64-bits unsigned integer that describes the size of each
+      DRAM rank.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    minItems: 1
+    maxItems: 2
+    items:
+      minimum: 0x0
+      maximum: 0x100000000    # support up to 4GB in single rank
+
+  mediatek,mr-cnt:
+    description:
+      Specifies how many sets of DRAM mode register information to provide.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 40    # total 40 MRs for JEDEC LPDDR4X
+
+  mediatek,mr:
+    description:
+      Pair of DRAM mode register information.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    maxItems: 40    # align with mediatek,mr-cnt
+    items:
+      items:
+        - description:
+            Mode register index
+        - description:
+            Mode register value
+
+  mediatek,freq-cnt:
+    description:
+      Specifies how many sets of DRAM data clock rate supported by SoC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  mediatek,freq-step:
+    description:
+      The DRAM data clock rate may be slightly different from those defined
+      by the specification due to errors in multiples of the base frequency.
+      This describe the mapping from real data clock rate measured by
+      frequency meter to JEDEC data clock rate.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description:
+            Real data rate
+        - description:
+            Spec data rate
+
+required:
+  - compatible
+  - reg
+  - mediatek,dram-type
+  - mediatek,support-channel-cnt
+  - mediatek,channel-cnt
+  - mediatek,rank-cnt
+  - mediatek,mr-cnt
+  - mediatek,freq-cnt
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dramc@10230000 {
+            compatible = "mediatek,mt6779-dramc";
+            reg = <0 0x10230000 0 0x2000>, /* DRAMC AO CHA */
+                <0 0x10240000 0 0x2000>,   /* DRAMC AO CHB */
+                <0 0x10234000 0 0x1000>,   /* DRAMC NAO CHA */
+                <0 0x10244000 0 0x1000>,   /* DRAMC NAO CHB */
+                <0 0x10238000 0 0x2000>,   /* DDRPHY AO CHA */
+                <0 0x10248000 0 0x2000>;   /* DDRPHY AO CHB */
+            mediatek,dram-type = <0>;
+            mediatek,support-channel-cnt = <2>;
+            mediatek,channel-cnt = <2>;
+            mediatek,rank-cnt = <2>;
+            mediatek,rank-size = <0x40000000 0x40000000>;
+            mediatek,mr-cnt = <1>;
+            mediatek,mr = <0x5 0xff>;
+            mediatek,freq-cnt = <6>;
+            mediatek,freq-step = <3718 3733>,
+                    <3094 3200>,
+                    <2392 2400>,
+                    <1534 1600>,
+                    <1196 1200>,
+                    <754 800>;
+        };
+    };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
