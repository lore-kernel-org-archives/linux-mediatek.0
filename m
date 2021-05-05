Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4197C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:14:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 347AF61222
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 347AF61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WiSnW4xQBHWsJyZIKdyzbg0JUk79neZ5jtaJ/PofMLc=; b=l10HeGsX8TUSMp5bcH+NDUzoC
	BMTk7ovWYOfWWrhXrBIjBpRc4JnEUQray91jMtiK6mMC5csRxsqidsGoNPXuhc40xO7szFUCSe2De
	jyxoKKiVvVOMoBrxHIqolKoIMGdcQHPsSEqA9RV/m4jl2veUy2HNj4bCWNCsMPVB7iRrxe3kPs5rz
	f+lCL//G6oeAMHhtxpIsTqz1aDkJkCMecuCishbMjiJnZ6p0Sd4JU3Nc8WbNDVTqK2XKkV+NfJ1Ob
	49yRhq8ptnPpQ8ERaMKVeYDdNs2dP77uaGQP7H3gj5sgO0akupiftDQ5qTe/qy1AIWQ6jqYyxAel0
	TySzWB8Ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leEY1-000rY4-Kt; Wed, 05 May 2021 10:14:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEXO-000rMH-7s; Wed, 05 May 2021 10:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=jrfCp8ArrJfpROsJXHi5WMVWf1bg3np/ju0qKM6cV1s=; b=lv+jPlJ4DnZFmgDtu/nAd/B8Qp
 4OLxcZqgnVO/K/EEPTqE3Ts4FEsnINUX284gz1ypp7N1s85SbsBDOrLqXFWyXzOPLtS5bwMxBWJKd
 f7TRKuh/WVaoQNRca6HxAJtUCvZdwdy8fWrSwyKocP5NWKJqKuUHGyamJssaAEegpd/zul/jMb9Xp
 cmgtPF7PDMXYpX1r3WRH3SbzgcJ8ZOJvpGuElkL30QIkoOKgCjsqXwfG736hc1J+MzicKl62oQQ3x
 L9hxi2ydjWcncXzOOuQThEAUP+edI7XcYs1if1ecSs+DwHl0vsg0TMdNopv/DokYbjdzSNTI8ZzJu
 Mpn8xqqg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEXL-004ehK-HQ; Wed, 05 May 2021 10:13:49 +0000
X-UUID: b33ac9aedc1e44a288828865685c1506-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jrfCp8ArrJfpROsJXHi5WMVWf1bg3np/ju0qKM6cV1s=; 
 b=ndZgZ6XNM7n+91kU+dHt7jGg/8Y4g9eAo0uxOZvBDzIDHy0Qw8/T1zRWOe4lGqCfN1qJluUSBKp7Iz8wtRzNo1r/72co+ra/u1fuyQZ1uRzULJ6hXGeWXBkNDWaMyy7i1pTe8ZiTpdCZah4W+qlZK/a3Ir9cYuFVv5kWH1yYgjE=;
X-UUID: b33ac9aedc1e44a288828865685c1506-20210505
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1688571304; Wed, 05 May 2021 03:13:44 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 03:13:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 18:13:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 May 2021 18:13:40 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 "Rob Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v8 04/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of scp adsp controller
Date: Wed, 5 May 2021 18:06:56 +0800
Message-ID: <20210505100714.3582-5-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
References: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C6256E87149CAFFEF7FC962320F2584339E0E8D7E2905B6524838E56FA7D79562000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_031347_605313_2CC6B7B8 
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

This patch adds the new binding documentation of scp adsp controller
for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
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
