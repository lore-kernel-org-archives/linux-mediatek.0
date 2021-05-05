Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E55C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:16:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075E56139A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 075E56139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s1KqAl0JOFKg0pz2WlTNoCJ6RXFg+9+kM8sMsdquw38=; b=D+LkZhxCOKPsKAnofuDj28AGm
	1MtMhAgU6OwZZX8IQrzl1SwAe4sbQ2544bIj6aNyyrZaYnY+Lw64l4BYcIhmjmTAs+tvXP4HTpxpi
	43b97hHGInV3COSRzZwe+/+ya5QLnWapUK6Hlk0rfxMAcX0lHuJllKzXD5ulUZEyjerLP8HHWb9iK
	6HbK1AM/2db3Jv45Jx4MSf4tB9GZQFOi0WImvS9JOZKD6+lo6qFk5FqXd1hugudqn4+89E7km4Za3
	IZr+S5d1+SPzUxrThWPGQh5EbTBi+wrNQtn6G+jts2b4sYMP7f7hmnypRLh8dI/dArFwFxYOve6xN
	tH9aB7K3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leEZL-000s8I-9C; Wed, 05 May 2021 10:15:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEXQ-000rN6-Uu; Wed, 05 May 2021 10:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=QvtKCMBBQcoNWh9/sXHAdCGTJLRvd7H6GdGx4BD6lsY=; b=M4L6O1OvArlC0FLNir7Q0Cpy8k
 jjR6iJsm2MnaYjS7BO1PK8v4hPnQ13UHcCFfZlrqTyIGI7xsqiMXMN9SlOheC0dPNYTlERsSxvgH5
 L6oPMy7QAIUHzC+GG9n5fPC3uON9vpeTYTfbVQgBHy1igoOXBHOO7FNj5aphHCzKs1GdFIIEh895Y
 teoRaq+M4vtSYgyQ4uSnItfPQ16J9/9Y2Fc5+hwUEQJ1L/So3vwM0gz8mTFjSGAG97ixIeWKeDn5V
 4pvv6+X0yLwY501aCr7q/KJ5tJ6kglw3XkiNyoekSFoHt9bX7IEc1H8SqDVv81/B/FVKwXedI9ZUg
 /a8rjhAg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEXO-004ehr-Aq; Wed, 05 May 2021 10:13:51 +0000
X-UUID: dd024cdf95c145d2b255acabbe111d72-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QvtKCMBBQcoNWh9/sXHAdCGTJLRvd7H6GdGx4BD6lsY=; 
 b=gnVFF05RbjElx7hrEg2LlIu7y28jcRVzlvQ1UzIZxKnhyn9y0dpv+7CqrfIMo3kpnglcI4j/UzTqyL2H472sxiH0jIf/o+OS9QL6d7gSd6gnLx8GBOMK4C4cr9SvZbbjwoG3uMPhHm+ViZ5bWMvREortkBgPIVgZfEBKevHDbA8=;
X-UUID: dd024cdf95c145d2b255acabbe111d72-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 429967694; Wed, 05 May 2021 03:13:43 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 03:13:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 18:13:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 May 2021 18:13:39 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v8 03/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of msdc controller
Date: Wed, 5 May 2021 18:06:55 +0800
Message-ID: <20210505100714.3582-4-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
References: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_031350_397560_03B740CC 
X-CRM114-Status: GOOD (  14.01  )
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

This patch adds the new binding documentation of msdc controller
for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,msdc.yaml  | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
new file mode 100644
index 000000000000..10eb43de2d2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,msdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MSDC Controller
+
+maintainers:
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The Mediatek msdc controller provides functional configurations and clocks to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-msdc
+          - mediatek,mt8192-msdc_top
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
+    msdc: syscon@11f60000 {
+        compatible = "mediatek,mt8192-msdc", "syscon";
+        reg = <0x11f60000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    msdc_top: syscon@11f10000 {
+        compatible = "mediatek,mt8192-msdc_top", "syscon";
+        reg = <0x11f10000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
