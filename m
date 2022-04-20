Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50018C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/7hdi8TqvL/1ludmAqTWEokin/l8Q0cnMRxQHsOuNQ4=; b=g11KVVkv39e4pj
	8ZPJdL6eeELJ2euOLCDSYHn5DVhwMeL4sji68exhARZ17ymtYqSrO7p9zzM0FPeyRt8VmKgGJKC10
	59NqM2oBfGY8HeQD8nkv8Nlfez0abuuh5jpAGPAC8bPty49vf1yo+m7bx/nOewbq03x11OF1cp/Mz
	qtHjMt/WiyIi0JrvoSE+hp8iLfoQ8Cx82QXZzYfmuKQHt/rZvB1Y1UvcTaDaYTOvxbC4ljGoyPLsp
	FdFmcQCrsxxnn7qhOpu9Vj6NnN9MA5o0rW0JEWH/m80wHJl+DaZ56ewrORExffy+vOP8GrYwAz27v
	Po10fNVhINWJJeePUulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh52Y-007rti-S6; Wed, 20 Apr 2022 07:46:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh51G-007rKI-B7; Wed, 20 Apr 2022 07:45:01 +0000
X-UUID: deffa198002f4e688ac5af8a6c1e8af2-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b286d279-2531-4e65-82a9-eff9712a7ffa, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:ace37def-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: deffa198002f4e688ac5af8a6c1e8af2-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1699205037; Wed, 20 Apr 2022 00:44:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 00:34:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 20 Apr 2022 15:34:43 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Apr 2022 15:34:42 +0800
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
Subject: [PATCH] dt-bindings: media: mtk-vcodec: Adds encoder power domain
 property
Date: Wed, 20 Apr 2022 15:34:39 +0800
Message-ID: <20220420073440.31649-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_004458_403093_54D27D42 
X-CRM114-Status: GOOD (  10.58  )
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

Adds encoder power domain property

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index deb5b657a2d5..3c069c965992 100644
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
@@ -72,6 +75,7 @@ required:
   - iommus
   - assigned-clocks
   - assigned-clock-parents
+  - power-domains
 
 allOf:
   - if:
@@ -132,6 +136,7 @@ examples:
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/memory/mt8173-larb-port.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     vcodec_enc_avc: vcodec@18002000 {
       compatible = "mediatek,mt8173-vcodec-enc";
@@ -153,6 +158,7 @@ examples:
       clock-names = "venc_sel";
       assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
       assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
+      power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
     };
 
     vcodec_enc_vp8: vcodec@19002000 {
@@ -173,4 +179,5 @@ examples:
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
