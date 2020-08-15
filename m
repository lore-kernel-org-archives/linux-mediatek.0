Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43739C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 17:21:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E322123B32
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 17:21:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNC9x3qP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sDIvQvbr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E322123B32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EJlt8+If+vuhSNRuvYsioM1ceY3+PXp2ycVLk8k4/do=; b=aNC9x3qPyzqJzfil0QKWdU3Va
	/wwD+QG9zmWQP30twOPTPezNXQMs+cTV1mAByNd7e1j0YzCP3os/7v9X3zhmnD5/U5RVedfHEW8HV
	8fBTlJbjJQsRyQto3zpcwsDDm+QKTLUgOZS2upl1FbUfj+D2xy+DoEBT3yka8osoD4VK7Pv8trbnA
	XEVlGdZvB1SULDeP2u4rh/nVDdYeoE0B/oF8mOmG8Q6ZgbzXtDNIJBexFcaiKFXYZ5e1ZEnoMvX7z
	zJVIplFEp5qeq6P/BMUqm3reOBnyq0et7O4Y/g3LV2N6ppfHpZQPWF9EW2+KFvDGJ+RMv6gAE3YOk
	5aw49JBAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6zra-0007qo-E8; Sat, 15 Aug 2020 17:21:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6zrS-0007pF-HK; Sat, 15 Aug 2020 17:20:56 +0000
X-UUID: 9cb8d2cd72364cac866101b1501bba67-20200815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oOpRhM5PzYwgYcVgRxy4CLIfl7M/RAvNtdo4Alg3gMU=; 
 b=sDIvQvbrEhfX/JE6BgnRDLGw+9EBT/5W9ZB9BvOWJrsc0n0aq8AbiPEl5aB5kw5h8QJMzsxKTgCCMCuZ8Awf9TbhFQ0dKcOrSKDyfV7tNxAnaZ3yu0/bguQ2AI/sO/27coIeGFlAOBf/+DXq1b4S9/BzsjM8MGug7d2Nw+3I10k=;
X-UUID: 9cb8d2cd72364cac866101b1501bba67-20200815
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 274031058; Sat, 15 Aug 2020 09:20:48 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 15 Aug 2020 10:20:46 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 01:20:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 16 Aug 2020 01:20:43 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/2] dt-bindings: mediatek: mt6359: add codec document
Date: Sun, 16 Aug 2020 01:19:40 +0800
Message-ID: <1597511980-16281-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597511980-16281-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1597511980-16281-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_132054_843822_070465E4 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, bicycle.tasi@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 eason.yen@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds MediaTek MT6359 codec document.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../devicetree/bindings/sound/mt6359.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
new file mode 100644
index 0000000000000..a669b49965874
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6359.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6359 Codec Device Tree Bindings
+
+maintainers:
+  - Eason Yen <eason.yen@mediatek.com>
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+  - Shane Chien <shane.chien@mediatek.com>
+
+description: |
+  The communication between MT6359 and SoC is through Mediatek PMIC wrapper.
+  For more detail, please visit Mediatek PMIC wrapper documentation.
+  Must be a child node of PMIC wrapper.
+
+properties:
+  compatible:
+    const: mediatek,mt6359-sound
+
+  mediatek,dmic-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Indicates how many data pins are used to transmit two channels of PDM
+      signal. 0 means two wires, 1 means one wire. Default value is 0.
+    enum:
+      - 0 # one wire
+      - 1 # two wires
+
+  mediatek,mic-type-0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specifies the type of mic type connected to adc0
+
+    enum:
+      - 0 # IDLE - mic in turn-off status
+      - 1 # ACC - analog mic with alternating coupling
+      - 2 # DMIC - digital mic
+      - 3 # DCC - analog mic with direct couping
+      - 4 # DCC_ECM_DIFF - analog electret condenser mic with differential mode
+      - 5 # DCC_ECM_SINGLE - analog electret condenser mic with single mode
+
+  mediatek,mic-type-1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specifies the type of mic type connected to adc1
+
+  mediatek,mic-type-2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specifies the type of mic type connected to adc2
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    mt6359codec: mt6359codec {
+      compatible = "mediatek,mt6359-sound";
+      mediatek,dmic-mode = <0>;
+      mediatek,mic-type-0 = <2>;
+    };
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
