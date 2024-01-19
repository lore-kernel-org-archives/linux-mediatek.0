Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A48C47DD3
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 06:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwGx9t8Ya6K6n4RmygSg+WES02bkxAi+xN+PSkJnWU0=; b=VmvRISCk6YF6Gr9AwlK/qFgXDM
	rNY6fvYnNCoQlhDBWJOz+po2/cCwQd46LhUcCO5d5UOwTmUAENGsrFr5qd2+JFb2hf8xmCPDl5g8i
	H8vGafUt3bQolrQD4Or7IvFmooOhwzl8YAIKAFokJ4uZ9RpuzVzKSEQ7k2ZvAEkBpWu9Tn9zl7HkG
	u9UVhsZiKzpPC8y9t6H4JcIAT7FimUUSyYvZ7SBWLLhNJpwBJGKSZ+0Fjw54AwYkFGtunhHBJtMPc
	KWjQgXxETmpLGwqg+dt+ZZNdnICf7ResDdW9BACIUiKK3bvlVk1ITD0o/os5/FioZvOwFkhgt8jba
	JMwsNNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQiRG-004bda-2S;
	Fri, 19 Jan 2024 06:33:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQiR8-004bZG-0q;
	Fri, 19 Jan 2024 06:33:07 +0000
X-UUID: 98647c64b69411eea0bf134e88e6c2dc-20240118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FwGx9t8Ya6K6n4RmygSg+WES02bkxAi+xN+PSkJnWU0=;
	b=sUZqtrfC0pMroa0QePz2g6QAzOJZ16rtq7O0ZG7oEOzQCY4DfVvCoU04GKOCloLfsUSYM8TZIPJ3DMQl4RuBXZxNQcEeE3nNoqhgUBKSZwXzE4rWLWepjbGeT5SHzxqVvRFCVmQll+s26+OR5D9uG0WwObd6cL6NtTDGvj7IG7I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:325fbebd-8888-4de6-bed3-6dc9ed7ed7df,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6e16cf4,CLOUDID:7b1e572f-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 98647c64b69411eea0bf134e88e6c2dc-20240118
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 938578866; Thu, 18 Jan 2024 23:33:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jan 2024 14:32:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jan 2024 14:32:25 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Date: Fri, 19 Jan 2024 14:32:22 +0800
Message-ID: <20240119063224.29671-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_223306_303242_4C71923A 
X-CRM114-Status: GOOD (  24.62  )
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

Add mediatek,gce-props.yaml for common GCE properties that is used for
both mailbox providers and consumers. We place the common property
"mediatek,gce-events" in this binding currently.

The property "mediatek,gce-events" is used for GCE event ID corresponding
to a hardware event signal sent by the hardware or a sofware driver.
If the mailbox providers or consumers want to manipulate the value of
the event ID, they need to know the specific event ID.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
new file mode 100644
index 000000000000..68b519ff089f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Global Command Engine Common Propertes
+
+maintainers:
+  - Houlong Wei <houlong.wei@mediatek.com>
+
+description:
+  The Global Command Engine (GCE) is an instruction based, multi-threaded,
+  single-core command dispatcher for MediaTek hardware. The Command Queue
+  (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
+  mailbox framework. It is used to receive messages from mailbox consumers
+  and configure GCE to execute the specified instruction set in the message.
+  We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mailbox
+  driver. A device driver that uses the CMDQ driver to configure its hardware
+  registers is a mailbox consumer. The mailbox consumer can request a mailbox
+  channel corresponding to a GCE hardware thread to send a message, specifying
+  that the GCE thread to configure its hardware. The mailbox provider can also
+  reserved a mailbox channel to configure GCE hardware register by the spcific
+  GCE thread. This binding defines the common GCE properties for both mailbox
+  provider and consumers.
+
+properties:
+  mediatek,gce-events:
+    description:
+      GCE has an event table in SRAM, consisting of 1024 event IDs (0~1023).
+      Each event ID has a boolean event value with the default value 0.
+      The property mediatek,gce-events is used to obtain the event IDs.
+      Some gce-events are hardware-bound and cannot be changed by software.
+      For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX will
+      send an event signal to GCE, setting the value of event ID 597 to 1.
+      Similarly, in MT8188, the value of event ID 574 will be set to 1 when
+      VOD0_MUTEX is stream done.
+      On the other hand, some gce-events are not hardware-bound and can be
+      changed by software. For example, in MT8188, we can set the value of
+      event ID 855, which is not bound to any hardware, to 1 when the driver
+      in the secure world completes a task. However, in MT8195, event ID 855
+      is already bound to VDEC_LAT1, so we need to select another event ID to
+      achieve the same purpose. This event ID can be any ID that is not bound
+      to any hardware and is not yet used in any software driver.
+      To determine if the event ID is bound to the hardware or used by a
+      software driver, refer to the GCE header
+      include/dt-bindings/gce/<chip>-gce.h of each chip.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 1024
+
+additionalProperties: true
-- 
2.18.0


