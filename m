Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD6BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 03:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=csYL7Ruw7+jv/i8k2khrU8Y+HkTIgggS3ACRw4IdsFQ=; b=lnYNpi58OsZ32z
	3M2vTibPs9kkntny/mKAaDK5biKTXqWaWMyiOml6vR8XG/DtBkUAbgb6g4vmwFvrnBcWmA3XeVLFy
	4LPqupfvFaVvfiRjlIWYz65gLDRNtoOYNbAouhmb2Y9FIl2uwQz3EKOobU8q6Jhdfe72oXx4RIlVw
	ti+bV8V+rEP+XO0xfkivgb3TOTxD03RY70PeV+naBfLvKepxGKQmNYG0kavuCoGTuiXCPPSNwzK8S
	D6jhaaaCWoDke+WhMLI3vCjD5Ex+um07FaguKZQKh3y4X3yPeiRWegoFHn4Wkqf/jUClN5htTck/N
	VMMtrllO/71H3yEaHmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njYP3-00HG5L-D9; Wed, 27 Apr 2022 03:31:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njYP0-00HG3u-CK; Wed, 27 Apr 2022 03:31:43 +0000
X-UUID: 808240e5cfd04daabbdd25025c742d35-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:581c724f-79b7-4fc8-8e14-3bbc06080c1a, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:d6cd9cc6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 808240e5cfd04daabbdd25025c742d35-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 775284172; Tue, 26 Apr 2022 20:31:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 20:31:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 11:31:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 11:31:32 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yunfei Dong <yunfei.dong@mediatek.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
 <longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] dt-bindings: media: mtk-vcodec: Adds encoder power domain
 property
Date: Wed, 27 Apr 2022 11:31:30 +0800
Message-ID: <20220427033130.18497-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_203142_469709_9A65B2C1 
X-CRM114-Status: GOOD (  10.55  )
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

Adds encoder power domain property.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
changes compared with v1:
- set "power-domains" as a non-required property

The 'make dtbs_check' warnings('mediatek,larb') can be fixed by patch:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=633993
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index deb5b657a2d5..2d1e0c9bd6ee 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -41,6 +41,9 @@ properties:
 
   assigned-clock-parents: true
 
+  power-domains:
+    maxItems: 1
+
   iommus:
     minItems: 1
     maxItems: 32
@@ -132,6 +135,7 @@ examples:
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/memory/mt8173-larb-port.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     vcodec_enc_avc: vcodec@18002000 {
       compatible = "mediatek,mt8173-vcodec-enc";
@@ -153,6 +157,7 @@ examples:
       clock-names = "venc_sel";
       assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
       assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
+      power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
     };
 
     vcodec_enc_vp8: vcodec@19002000 {
@@ -173,4 +178,5 @@ examples:
       clock-names = "venc_lt_sel";
       assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
       assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
+      power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC_LT>;
     };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
