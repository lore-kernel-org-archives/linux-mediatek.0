Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E36C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hLRPPmkZ1h9CcY1LbMrqpLmUYQ1Ws42RBDYMgR6Pe8=; b=Hvd3+Q1lMeE9+WATxTmxMf44WQ
	EAU/HNY8zflNidgzDduwvOzvaxcEorRCqCpnQF0UA8mWQ81x8oVHxtgaRmoqy8hFFsf/MxqNePWaJ
	cpoP/qeHaFIRQgwZfJVLqchSV5j5V5NnpD4r/8mrgy9RnUfDrrrRCsfYrBIFGtJlUVa6El4Z6Kg8G
	FyQ0ZwgwTO6xcH9SHOpJiyYDKgnnMo410BdyAveep23USMKEwMPQESi69FJ/1pZilbVF9rklZ5wZg
	+eCORZTkqtwXU7p72dseeD9yrIwDrZPoXw5jOUUfGX+W5DQcTN+1Vvl2jUvJkS74KmnSbPgDlXg+d
	uIiR8Ilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtY0-00DZBN-91; Fri, 05 Aug 2022 09:23:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtXx-00DZ6s-Kp; Fri, 05 Aug 2022 09:23:11 +0000
X-UUID: f48767f4b878444584a47b869de286b8-20220805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8bc17338-3fd6-45c6-a63d-f1d61af4be76,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:25,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:0f94e32,CLOUDID:caf5d248-f57f-4088-93dd-066979cdb4e6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f48767f4b878444584a47b869de286b8-20220805
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1041848910; Fri, 05 Aug 2022 02:23:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 17:12:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 5 Aug 2022 17:12:25 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hector Yuan <hector.yuan@mediatek.com>
CC: Jia-Wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Subject: [PATCH 1/2] dt-bindings: cpufreq: add mt8188 cpufreq hw dt-bindings
Date: Fri, 5 Aug 2022 17:12:10 +0800
Message-ID: <20220805091211.2791-2-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220805091211.2791-1-jia-wei.chang@mediatek.com>
References: <20220805091211.2791-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_022310_033462_3AFFCD89 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

Add mt8188 cpufreq hw compatible in dt-bindings.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
---
 .../devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
index 9cd42a64b13e..b56d36224612 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,cpufreq-hw
+    enum:
+      - mediatek,cpufreq-hw
+      - mediatek,mt8188-cpufreq-hw
 
   reg:
     minItems: 1
-- 
2.18.0


