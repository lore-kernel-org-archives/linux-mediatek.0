Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178FEECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zomgoDcevkyalLuChXLfMkw/317A5gA90XYKcja6oWY=; b=SKX1aPiUIwFU1x5duiRmsXPnoS
	l+gegCVM0VQhHv/70aQju8iu2Kk9gTkw3osVpkW7yABH8Gyr4/edpU7S9z2ZyueIBb5ycsdU0TZsG
	sNmOiJx77/derr9wm18q3SOukoiJ0GUZF8pxJT/QaDcUqZXHhXXuyznR2Nhe69alGvuSRsa+vQBUv
	/3jkm2ukw1NEslb9bM1Ir4VTXHKUvfpLCv98Sni6QV4Kgp43sytL3sxCa9RC+xvV3WefFfRKu/Ghv
	19uBjeSnz14tE3fZORdMNMXajGeZgaKzbCsXW2kwqJeLBgy/n6taNNGszImsru1ZxR0Y3Ri+AEkCy
	8tO5ob2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBmU-009k8Q-DO; Mon, 19 Sep 2022 08:05:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBm8-009jfy-MY; Mon, 19 Sep 2022 08:05:12 +0000
X-UUID: 96f7884e76094cedb0dc0624b90b48ba-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zomgoDcevkyalLuChXLfMkw/317A5gA90XYKcja6oWY=;
	b=mO9WvJJL66A+ZYiJe1O2xhF3j7FYbohrUqUqvhRiniRoosvLKdaX6RlFgtBjIAeGXqo58Dwu46VTFEAcitzqrLe8ezCFEP08bLaqP0HGlR2FcwT+W6nliVyrImktUS3lFF7VngMhs2C9K1Fqiboj7KKmb5fodR4BGsHATnWUeG0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:68121ead-ea4b-44f2-9749-86cbbbebcf94,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:9b9fdff6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 96f7884e76094cedb0dc0624b90b48ba-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1294113837; Mon, 19 Sep 2022 01:04:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 16:04:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Sep 2022 16:04:20 +0800
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Biao
 Huang" <biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jianguo Zhang <jianguo.zhang@mediatek.com>
Subject: [PATCH 2/2] net: dt-bindings: dwmac: add support for mt8188
Date: Mon, 19 Sep 2022 16:04:10 +0800
Message-ID: <20220919080410.11270-3-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_010509_757735_7C160D53 
X-CRM114-Status: GOOD (  10.42  )
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

Add binding document for the ethernet on mt8188

Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
---
 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 61b2fb9e141b..b7d4f956f92e 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -20,6 +20,7 @@ select:
         enum:
           - mediatek,mt2712-gmac
           - mediatek,mt8195-gmac
+          - mediatek,mt8188-gmac
   required:
     - compatible
 
@@ -36,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-gmac
+              - mediatek,mt8188-gmac
           - const: snps,dwmac-5.10a
 
   clocks:
@@ -74,7 +76,7 @@ properties:
       or will round down. Range 0~31*170.
       For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
       or will round down. Range 0~31*550.
-      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
+      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
       or will round down. Range 0~31*290.
 
   mediatek,rx-delay-ps:
@@ -84,7 +86,7 @@ properties:
       or will round down. Range 0~31*170.
       For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
       or will round down. Range 0~31*550.
-      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
+      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value need to be a multiple
       of 290, or will round down. Range 0~31*290.
 
   mediatek,rmii-rxc:
-- 
2.25.1


