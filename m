Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49219C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAunr5W8c3C7ATV+tpczbp5laYpGJmA4w76f2qKHkLY=; b=P7j35f3bYvtNC4
	7OdBUeDROECM+HOodFHTI+NRvjgQblCzONFDQ8BCtfK5nsqRPT4DHdiZ0CoZrPUKAVjY2gdkl1kPS
	I6e2izvt7doACfAjlLE5ivFsPwKurpZDeue3UYlCRIm8lFsX7fByAGigTTW1Czj5hx/voKQrKcVIs
	oD6mfTncr0i8hqQFwzyYUY+rKvbJXfo/bgh02iGw+Gc11Apaufv0lfESUq1QItvPssEr3MMgIkbyj
	t5FMBv0uAz59hZ2BiZExBEzqlbsga/LWU0HeqYo+FBih7+tjgoTNqoAMD1wGNP4+ZOme9NQKwh0NS
	F72qURvgr8M9bcK4wzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmgG-00GUmS-CJ; Fri, 22 Apr 2022 06:22:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmU0-00GOrf-Rb; Fri, 22 Apr 2022 06:09:34 +0000
X-UUID: 77d3f14ff76147718abf7930281d85fc-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:414c2ba9-cb82-4461-8244-aa28e3b2bdbd, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:f47cbdef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 77d3f14ff76147718abf7930281d85fc-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1725855741; Thu, 21 Apr 2022 23:09:11 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 23:02:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 14:01:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 14:01:59 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V3 11/17] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192-sys-clock
Date: Fri, 22 Apr 2022 14:01:46 +0800
Message-ID: <20220422060152.13534-12-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_230932_917877_AD290F1A 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We will use the infra_ao reset which is defined in mt8192-sys-clock.
The maximum value of reset-cells is 2. Therefore, we add this patch to
define it.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
index 5705bcf1fe47..28ebcecc8258 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
@@ -29,6 +29,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    maximum: 2
+
 required:
   - compatible
   - reg
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
