Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF42FC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 05:33:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676E96192F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 05:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 676E96192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x7dulFaWkOZWHEj88ixA/EFQhLqjklaTW0rc1ZvsgD4=; b=RJ7KGA5sJvwBiONQw7VmgNd3a
	ic++qDsum10XsKvv+n9NKWi/NBtcCFXRvtO6WmlLVyK0WLv3+t3PbZ43JQChpa5KEtQW7FGk+AqaA
	DNdF0LictAX8gJTJxeNc+Mx1uzyRVk5tf7aF9/cPdY0K4mF1NNjwYhQWjGpNquMsoyDyQHibYBEN2
	+XYNtv16meMgl9JTjN7X1XGi7yptlvTgu3MhW9AFcGI5a9Pcr3fB+SaP2cmYyKEN01aMNaIOItXni
	ox6DU7mw2q/MjyPMbCNMmD6eKNYb1dG53QMEvXuu3iSd24TJ6gJsvmbM3cI7zl8Txjx3qetjOdTIa
	kNj5Ql/Tw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR6zu-002l0z-Jv; Tue, 30 Mar 2021 05:33:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR6zT-002kvc-Gw; Tue, 30 Mar 2021 05:32:37 +0000
X-UUID: b9425e0952644037a4a9e6361f881adb-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zBQOtn4bg5/EOJR48pDp4YZ7yX1zX439AF83TTkP2FM=; 
 b=DD415O6dNuw6KY0/yGz7ngshDVWuDp1Wan8QtFZmw/CMHStT63eCIXvQrFAsKLRINkzh+NVD9abRm54SfaJQcQOBV111i74B3/xjYdHS8/I+0abMbSsI+gZRG4kaIj//6rKarVVmJNTPp/6/TwQ0rL/T9LxVo4KtsCBOGeXiqcI=;
X-UUID: b9425e0952644037a4a9e6361f881adb-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <pk.chi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1027346302; Mon, 29 Mar 2021 21:32:22 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 22:23:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 13:23:10 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Mar 2021 13:23:10 +0800
From: Po-Kai Chi <pk.chi@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou
 <loda.chou@mediatek.com>, Po-Kai Chi <pk.chi@mediatek.com>
Subject: [PATCH v1 1/4] dt-bindings: memory: Add binding for MediaTek Common
 DRAM Controller
Date: Tue, 30 Mar 2021 13:22:08 +0800
Message-ID: <1617081731-7408-2-git-send-email-pk.chi@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1617081731-7408-1-git-send-email-pk.chi@mediatek.com>
References: <1617081731-7408-1-git-send-email-pk.chi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1B7773B3E072068AFF43EB933B81C47B2DBED63C82C53329F7F32FFBF188551A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_063236_025431_C0CC20E7 
X-CRM114-Status: GOOD (  16.04  )
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
MediaTek Common DRAM Controller.

Signed-off-by: Po-Kai Chi <pk.chi@mediatek.com>
---
 .../memory-controllers/mediatek,dramc.yaml         |  155 ++++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
new file mode 100644
index 0000000..0217ce0
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
@@ -0,0 +1,155 @@
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
+  dram_type:
+    description:
+      The DRAM type of current DRAM chip.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+
+  support_channel_cnt:
+    description:
+      The maximum DRAM channel count supported by SoC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 4
+
+  channel_cnt:
+    description:
+      The DRAM channel count of current DRAM chip.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 4
+
+  rank_cnt:
+    description:
+      The DRAM rank count of current DRAM chip.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2
+
+  rank_size:
+    description:
+      The size of each DRAM rank.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint64
+    minItems: 1
+    maxItems: 2
+    items:
+      minimum: 0x0
+      maximum: 0x100000000    # support up to 4GB in single rank
+
+  mr_cnt:
+    description:
+      Specifies how many sets of DRAM mode register information to provide.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 40    # total 40 MRs for JEDEC LPDDR4X
+
+  mr:
+    description:
+      Pair of DRAM mode register information.
+      This property is filled in by bootloader according to the board hardware
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    maxItems: 40    # align with mr_cnt
+    items:
+      items:
+        - description:
+            Mode register index
+        - description:
+            Mode register value
+
+  freq_cnt:
+    description:
+      Specifies how many sets of DRAM data clock rate supported by SoC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  freq_step:
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
+  - dram_type
+  - support_channel_cnt
+  - channel_cnt
+  - rank_cnt
+  - mr_cnt
+  - freq_cnt
+
+additionalProperties: false
+
+examples:
+  - |
+    dramc@10230000 {
+        compatible = "mediatek,mt6779-dramc";
+        reg = <0 0x10230000 0 0x2000>, /* DRAMC AO CHA */
+            <0 0x10240000 0 0x2000>,   /* DRAMC AO CHB */
+            <0 0x10234000 0 0x1000>,   /* DRAMC NAO CHA */
+            <0 0x10244000 0 0x1000>,   /* DRAMC NAO CHB */
+            <0 0x10238000 0 0x2000>,   /* DDRPHY AO CHA */
+            <0 0x10248000 0 0x2000>;   /* DDRPHY AO CHB */
+        dram_type = <0>;
+        support_channel_cnt = <2>;
+        channel_cnt = <2>;
+        rank_cnt = <2>;
+        rank_size = <0x40000000 0x40000000>;
+        mr_cnt = <1>;
+        mr = <0x5 0xff>;
+        freq_cnt = <6>;
+        freq_step = <3718 3733>,
+                <3094 3200>,
+                <2392 2400>,
+                <1534 1600>,
+                <1196 1200>,
+                <754 800>;
+    };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
