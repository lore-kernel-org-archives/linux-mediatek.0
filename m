Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CAAC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Oct 2022 03:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RTwyJ78EQUlreAtuk6YGiJk7F5TanCDI8cS4Z2YDkMY=; b=1I5XMxJXfZeaKCHPkqmNQlC2bl
	CYlMHQxCSesX6QkJ9TuAoNNe5IpD9jbZHzRE14OmEXYw2t8kJTC3nS8owx16kunxx6xnRgcdcpdam
	mjkfv3PxUPgRqxOuaDbqxfg+3C5YyRJD4C+tbQX/MVqgTBSJvMgmwqMZYDO+JRXzH9y0+54+0KJ+V
	WupsBu5fMFpR8pwNEkICO38fypMmJ21fwMq/uyDR96HCNrzkqO/jzsD33kQ6QnTaiEwzwORufBZF6
	4F5/qAUvlFx19YDv4G9NkcHyAfaSnT49rITbrVuSdM/B3sUDkHpM6yPYHt7GXur+d870OMiAvk34y
	Q4tdCZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeTAa-00CtUH-Kg; Sat, 01 Oct 2022 03:28:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeTAY-00CtTP-6m; Sat, 01 Oct 2022 03:28:03 +0000
X-UUID: fdadbe6406554b66afbaea960277cdf1-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RTwyJ78EQUlreAtuk6YGiJk7F5TanCDI8cS4Z2YDkMY=;
	b=SYhN476sGFHYdMmwJ3FGAdrvQt3WT4EYHvawTOwjFwR5EBBphXGR0Jt/zXFlfEGE72R+R1DTtD6Z4jMB9vuRvP7BIghrdoKPXAxyTvApuCMEytW+ILbqJO+SbTEHpW/RIYevY50f8dhS7v1BsZvjaE0TSMzJbQ/lNfRKYaLv3IU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:1b50600b-3189-4371-aeb0-7c25d502fe62,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:27cea107-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fdadbe6406554b66afbaea960277cdf1-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 268832877; Fri, 30 Sep 2022 20:28:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 1 Oct 2022 11:07:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 1 Oct 2022 11:07:55 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH] dt-bindings: mediatek: vcodec: Add the platform compatible to schema
Date: Sat, 1 Oct 2022 11:07:52 +0800
Message-ID: <20221001030752.14486-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_202802_256539_36C4D815 
X-CRM114-Status: GOOD (  11.11  )
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

There are venc node warnings when running dtbs_check, the clock-names
was unexpected, missing properties '#address-cells' and '#size-cells'.
Add the corresponding platform compatible to schema.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 32aee09aea33..0f2ea8d9a10c 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -67,6 +67,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
 required:
   - compatible
   - reg
@@ -84,7 +90,9 @@ allOf:
           contains:
             enum:
               - mediatek,mt8183-vcodec-enc
+              - mediatek,mt8188-vcodec-enc
               - mediatek,mt8192-vcodec-enc
+              - mediatek,mt8195-vcodec-enc
 
     then:
       required:
@@ -107,7 +115,9 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8173-vcodec-enc
+            - mediatek,mt8188-vcodec-enc
             - mediatek,mt8192-vcodec-enc
+            - mediatek,mt8195-vcodec-enc
 
     then:
       properties:
@@ -118,7 +128,7 @@ allOf:
         clock-names:
           items:
             - const: venc_sel
-    else:  # for vp8 hw decoder
+    else:  # for vp8 hw encoder
       properties:
         clock:
           items:
-- 
2.18.0


