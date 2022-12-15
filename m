Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2EFC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8i5DSmAxTmfCANOGSKNu3P+/BEjO2MHm4RiH6/g3zxc=; b=XDhZnBMBvJSk132f5cdl7ouB6y
	ljwRBtsA8cklrrU42lg87MRn7Gu7QQGuHvRwFxz4y4Jt2GYwaAG1ng6swYYiznvqRcrds9mQnNayE
	Q+DjSxrxTG1JvfITwbVQmF6eJoEU3cNoWhF8QKxjDM4Fhyx3zu1JKOZbGzimQtZeyLUPYv8xsAMF7
	g01DhCQWd0SihJwZnOraTNX1sZUSWSaPV2u0kvbJRHmKBrsMQhf6THMoZXEWqWNfQpilJDJXbPsJb
	aXw5lRmUadYVYer9P57yQGDFMYtVWjo5wSAhonhx5Q4sYf68ulPcL6KQz/q7C7U+OELqAHrdJWSCl
	3uvpyo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5n52-009Fg0-Go; Thu, 15 Dec 2022 12:11:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5n4r-009FaJ-Nk; Thu, 15 Dec 2022 12:11:06 +0000
X-UUID: ff9889497e554536bf37aa74a66a27d2-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8i5DSmAxTmfCANOGSKNu3P+/BEjO2MHm4RiH6/g3zxc=;
	b=jg/YxsC9p4XjgGIBdaSg4QKXoLNrnbW/vjzpH80CJ5pBbvv+2QOsCDRlXIPL68XUoLViflKgqGVSkeMolL+RQRpX7R1jOrb2+Jl5iSPXEV0ZzRLWVBvwJ5oXmpYdMWque5TSqST/FpJGRKTPJYh/tUjJDvBx+P0i3ChpIH7yO8M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:2899fa1e-abdf-4cae-addc-2a3c7c865aaf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:3ff6b0b4-d2e2-434d-b6d3-aeae88dfcc78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ff9889497e554536bf37aa74a66a27d2-20221215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 290336740; Thu, 15 Dec 2022 05:10:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Dec 2022 20:00:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Dec 2022 20:00:20 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen
 Boyd <sboyd@kernel.org>, Ikjoon Jang <ikjn@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 3/4] dt-bindings: arm: mediatek: Add missing power-domains property
Date: Thu, 15 Dec 2022 20:00:15 +0800
Message-ID: <20221215120016.26611-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
References: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_041105_807610_3EEF3A6A 
X-CRM114-Status: UNSURE (   9.27  )
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

The "mediatek,mt8192-scp_adsp" binding requires a power domain to be
specified.

Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../arm/mediatek/mediatek,mt8192-clock.yaml     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
index b57cc2e69efb..cbedef114103 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
@@ -40,6 +40,9 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   '#clock-cells':
     const: 1
 
@@ -49,11 +52,25 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-scp_adsp
+    then:
+      required:
+        - power-domains
+
 examples:
   - |
+    #include <dt-bindings/power/mt8192-power.h>
+
     scp_adsp: clock-controller@10720000 {
         compatible = "mediatek,mt8192-scp_adsp";
         reg = <0x10720000 0x1000>;
+        power-domains = <&spm MT8192_POWER_DOMAIN_ADSP>;
         #clock-cells = <1>;
     };
 
-- 
2.18.0


