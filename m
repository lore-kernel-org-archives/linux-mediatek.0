Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AA9C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 02:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npEo+6FVD8Kdzre43ok4fH/0CqEcSrp+2hTTN1XiO1M=; b=BLvoW2U2G/svkJoWFdkolIjv57
	GdqXr+/SAjxgsIwIZs99wMo0vfcOy9Zj0I3LQEjv5RYTUydMvcGlYKuiHwvQZTiCN9jzPocWdakRv
	PSfsmWkzVQ5qfpd6tEdUhtCHMsEUWwej0GZUIzVwvGicQp7K7uWk/p/VHK+EnjlyXEnf1zbbM8QfB
	K+ggU+dyGSescjFHb2JFKS1nUVIhC3ylgIbj5XbDvae0YHyggceYtBxoTc6yGXsQxnJMNBfmGcSyi
	SliZrPZFzBdxT15w8JUWk0fFrEHC/uk10f/BuMe5SRfVA49aly8C51WxMuAqLu8hLpiafdwy3y9yN
	cBQLjsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Nsr-0098za-Gp; Wed, 29 Jun 2022 02:56:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Nsp-0098yx-1a; Wed, 29 Jun 2022 02:56:52 +0000
X-UUID: b968b05dc30640d7bda5bc3143b0ec1b-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:d81177c2-8b94-41e9-8ebe-79f6db1b19d6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:7a7f0a86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b968b05dc30640d7bda5bc3143b0ec1b-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1189961143; Tue, 28 Jun 2022 19:51:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 29 Jun 2022 10:51:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 29 Jun 2022 10:51:18 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Fabien
 Parent" <fparent@baylibre.com>
CC: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
	<sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Biao Huang <biao.huang@mediatek.com>, Yinghua Pan
	<ot_yinghua.pan@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH net-next v4 04/10] dt-bindings: net: mtk-star-emac: add support for MT8365
Date: Wed, 29 Jun 2022 10:51:03 +0800
Message-ID: <20220629025109.21933-5-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629025109.21933-1-biao.huang@mediatek.com>
References: <20220629025109.21933-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_195651_129585_A3CDEE1B 
X-CRM114-Status: UNSURE (   9.97  )
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

Add binding document for Ethernet on MT8365.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/mediatek,star-emac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
index def994c9cbb4..6b0769e831a6 100644
--- a/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
@@ -23,6 +23,7 @@ properties:
       - mediatek,mt8516-eth
       - mediatek,mt8518-eth
       - mediatek,mt8175-eth
+      - mediatek,mt8365-eth
 
   reg:
     maxItems: 1
-- 
2.25.1


