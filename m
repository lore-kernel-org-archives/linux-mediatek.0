Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7229BC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 08:53:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A7C7206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 08:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uYlb3Z8k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Hb4rp7h/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A7C7206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S7Rtg5LII4vntme0+5PAeBd5SvbZ0VZ8LYICuxcP4BY=; b=uYlb3Z8kNLIdc/XgfzQbSd8G9
	fryrIqusiuROuLwxgTUgnMa/7I+cwjm6Itmwi5lze1yOKDfq5oHSGAA43M3zjkJs4t+hSKXIPCu1j
	Sr8G6vQpvgqSZqCKrR5QtAC0Uy0k1x4+/AIinVOgq0T62p595zHLnp74RLo9CoJ2BLleFeZn3qgpg
	3cIxMKoz8KihQdwnThe4zfrd6UO0SROg+FiCvzqZck1JYgLmbK6rBh3zopCVU8/1/bd9I67v08Bt3
	7UW1fX6fekMtpiJkaaa36EmHr9h6nZ+EMBklUI9UjfB8ZWT9z80u1mQ77bjqJqVx/A6XZZuJiRZEB
	ysSiTOciQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8gJs-0002rt-20; Thu, 20 Aug 2020 08:53:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8gJg-0002kf-Df; Thu, 20 Aug 2020 08:53:01 +0000
X-UUID: a0d22bc76d7b42a786f6ddbcc1ee78f6-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=j8a9SVlwQsp8owy5SXHZ0yPh88UDv3/JzrMYfl377bU=; 
 b=Hb4rp7h/vaVZO7ISl2iGdF8kYsR2JY82xan4aQCOp/99fOCGO5u4AzXJjkRp5oC71wRyppf8KmtOH65FsoVO8iEnVTilFMpsWS5UxlJlI6NNDUUBbyV1wdEIzXboa8ftbo2xbu+V1LKbFUceCNKSpPjEeQAzVCfyG4s+yYTNT7Y=;
X-UUID: a0d22bc76d7b42a786f6ddbcc1ee78f6-20200820
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 783805885; Thu, 20 Aug 2020 00:52:50 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 01:52:48 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 16:52:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 16:52:45 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 2/2] dt-bindings: mediatek: mt6359: add codec document
Date: Thu, 20 Aug 2020 16:51:33 +0800
Message-ID: <1597913493-10747-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597913493-10747-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1597913493-10747-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_045300_748968_CEBED525 
X-CRM114-Status: GOOD (  13.37  )
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
 .../devicetree/bindings/sound/mt6359.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
new file mode 100644
index 0000000000000..a54f466f769d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
@@ -0,0 +1,61 @@
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
+additionalProperties: false
+
+examples:
+  - |
+    mt6359codec: mt6359codec {
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
