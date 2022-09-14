Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBC3C6FA89
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AH79p2a9DT/0U0S1MP8NXAnU3A37xaeNFygW5qUmxbI=; b=JYuIhW2R8W7QPZBoE+M1hJESlT
	eLEwqvP9LBqFDRwmm7G+fG20wH0/zn6WmKwqvDaGE9FZ5R2Sacnd8gwbrQXSnlcZCyQC0DR7kClnI
	eyXapk1eVsGnf0Hg4+6K5c1zPI/Zf4pictTSdqAtQFeUE3Xn8t91w92P1FMGuyHI0bjzPsr2eWd4+
	N1SQu00G5+96x4teAO3lKgnXdI6AmwWTZRDC/KkYy0MI+C3B3Ev7s7P7tKenpEC5YY2mafhZvUh0w
	Wb1E2AMCGw29eEYKuT9wPnUsXPslKGML6QmfbK5ZASYz63Bp+cv9cmO0aCqHLnkIarurDglgaDHGO
	kcC84Tmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYLZk-008DT9-PJ; Wed, 14 Sep 2022 06:08:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYLZg-008DGc-PQ; Wed, 14 Sep 2022 06:08:42 +0000
X-UUID: 72597072b5604f84b6daa33a8d4090cf-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AH79p2a9DT/0U0S1MP8NXAnU3A37xaeNFygW5qUmxbI=;
	b=RvLn7dkJu2xzeN+lvsmyZ9+KYDE2HqmdOxxBZd32wNKw0wgxKXrQEE99EU2JdO49vKBCN1/u3n4ocUlys1jtpcuOWIAom5pJqEhUZqT9Q93hOEt7pp80ytdsCp3ffaOglnwGRoHQXJnjC1B77Zw65dosgdB8JJL0SZsRI8cQ/v0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:724b4baa-5b0f-40d7-a53c-66869986f2c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:38b05eec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 72597072b5604f84b6daa33a8d4090cf-20220913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 539387264; Tue, 13 Sep 2022 23:08:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 14:07:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 14:07:48 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/7] dt-bindings: phy: mediatek,tphy: add property to set pre-emphasis
Date: Wed, 14 Sep 2022 14:07:41 +0800
Message-ID: <20220914060746.10004-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
References: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_230840_867703_0A2EA887 
X-CRM114-Status: GOOD (  10.01  )
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

Add a property to set usb2 phy's pre-emphasis, which used to widen eye
opening and boost eye swing.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: add acked-by Krzysztof
v2: Add more description suggested by Krzysztof
---
 .../devicetree/bindings/phy/mediatek,tphy.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 848edfb1f677..e0754fb44451 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -219,6 +219,16 @@ patternProperties:
         minimum: 1
         maximum: 15
 
+      mediatek,pre-emphasis:
+        description:
+          The level of pre-emphasis which used to widen the eye opening and
+          boost eye swing, the unit step is about 4.16% increment; e.g. the
+          level 1 means amplitude increases about 4.16%, the level 2 is about
+          8.3% etc. (U2 phy)
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 3
+
       mediatek,bc12:
         description:
           Specify the flag to enable BC1.2 if support it
-- 
2.18.0


