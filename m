Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C0CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 04:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwGRcydoN3zJshNUIpa2gHpXCAS5qTxU4+1Cj62OSlA=; b=nW/2qqSY/5XDsu
	KfFJV56n0b7YxN2sHF8l9Zi43Xzx71l/UjlPfBFHEyOK/Oopim5a3ymOtKRZNd4oxLS85Um+AQS+0
	RsSS1/HzwFssR32r5exUZExozTfklyejkzfHtb5mf8pib0MuwER6k1sLFCDrYMJrMaCT4ThTw+ByO
	ZBDl7QQSfvSRUsn4AzPh9i7UVxAy7o0AezUelQhcvY9w8JJiWRRDbHaFrmR43+uDCGWKSgAlXlAsE
	MTQxuHLQtB95QdCZRL/q6nn9eM6et3RSBk2UQqOO6Pz1T2hlAHlwj5mE45umd8Mk56Dix3jBICiCo
	xVP40Mi6IRFLlf5Zvz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhO0S-00BNZ2-RB; Thu, 21 Apr 2022 04:01:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhO0P-00BNXs-RT; Thu, 21 Apr 2022 04:01:23 +0000
X-UUID: 42dea503d5264b019d00400aa7270b62-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b95ecabe-8fc6-4813-a010-bf25c68ccccc, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:e22998ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 42dea503d5264b019d00400aa7270b62-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1796659559; Wed, 20 Apr 2022 21:01:18 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 20:51:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 11:51:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Apr 2022 11:51:17 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 4/4] dt-bindings: media: mtk-vcodec: Add encoder power domain
 property
Date: Thu, 21 Apr 2022 11:51:11 +0800
Message-ID: <20220421035111.7267-5-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220421035111.7267-1-allen-kh.cheng@mediatek.com>
References: <20220421035111.7267-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_210121_923505_573208BF 
X-CRM114-Status: GOOD (  10.26  )
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

From: Irui Wang <irui.wang@mediatek.com>

Add encoder power domain property

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index e7b65a91c92c..de2df6c6352c 100644
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
@@ -74,6 +77,7 @@ required:
   - iommus
   - assigned-clocks
   - assigned-clock-parents
+  - power-domains
 
 allOf:
   - if:
@@ -135,6 +139,7 @@ examples:
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/memory/mt8173-larb-port.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     vcodec_enc_avc: vcodec@18002000 {
       compatible = "mediatek,mt8173-vcodec-enc";
@@ -156,6 +161,7 @@ examples:
       clock-names = "venc_sel";
       assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
       assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
+      power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
     };
 
     vcodec_enc_vp8: vcodec@19002000 {
@@ -176,4 +182,5 @@ examples:
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
