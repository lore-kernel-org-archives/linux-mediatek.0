Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281A1C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:49:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEAA361920
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEAA361920
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5DxwFiBCo/9MZIr1ASxX6lsFaVexJk3livcw9HhSSWA=; b=c7BERjC3xBLB4DU2hQzfw/fQU
	iKBPclQRUUZaBDvBoJ71423hnPRRn0Hkl5W0T9Gfo7b2GTQt06GFq2F38YprMC4KVGKrLclFDOcGA
	TPciUhxSc3PebFCItMKfHMnU75Qsbw0iwYwKpP7ZoduyzeSZ31Bz/r83qhk15vwSKSaqin54dQt86
	WMudVR7L5fk6qRIMxmYtO48WbFJQV3/5Pr9Ru9Btwqm09r69bcdVSGVYtv672pDcr1ANS1QoCfzj4
	mMEJLxU3EnL67RSohzt5kuGq7LRcnMOUTPtIooJ9KFGPVJQ/boPdhTHUKetes8lqOLSImcmgCKqlc
	6wkW1DG2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfXN-00Eo1p-2i; Tue, 23 Mar 2021 11:49:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfUS-00EmG4-GM; Tue, 23 Mar 2021 11:46:31 +0000
X-UUID: 39fba80a16ec4942a05cdb142d1b642c-20210323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=k9ftKhJdNJ6rED33qCHOwn6r2jmcm0kLhLo7D3asDzo=; 
 b=qwzgiPNyvZii9gDmXzq9PIrEAUsD8Z5JEwYH/l4/P51/vEaCWALMK7LLd9mPcl8ohlXn2EPlgxRC5PyK2cMFLeYiNdrj9UCwQj8DzrGUIaIjYaBK2fLw63nOY2f5A7LV32drBakSkF4nEyKhalgLO396oXVJNb2x/Q3cwnVRLQQ=;
X-UUID: 39fba80a16ec4942a05cdb142d1b642c-20210323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1927842517; Tue, 23 Mar 2021 03:45:37 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 04:35:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 19:35:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Mar 2021 19:35:34 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v7 04/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of scp adsp controller
Date: Tue, 23 Mar 2021 19:34:54 +0800
Message-ID: <20210323113512.4980-5-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210323113512.4980-1-chun-jie.chen@mediatek.com>
References: <20210323113512.4980-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_114628_932865_727500E6 
X-CRM114-Status: GOOD (  13.43  )
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

This patch adds the new binding documentation of scp adsp controller
for Mediatek MT8192.

Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 .../arm/mediatek/mediatek,scp-adsp.yaml       | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
new file mode 100644
index 000000000000..1b4335c054f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,scp-adsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SCP ADSP Controller
+
+maintainers:
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The Mediatek scp adsp controller provides functional configurations and clocks to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-scp_adsp
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    scp_adsp: syscon@10720000 {
+        compatible = "mediatek,mt8192-scp_adsp", "syscon";
+        reg = <0x10720000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
