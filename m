Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728C8C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRkVasBccdpNJvP01WnNW8xU0RQDHoZEbafadIifWQQ=; b=HgheLte3y+/gv4
	BFAh6MON4uEtngCwxae8nF+bURqxrUYh/0C0uADFePzuDZR5Q0hnyJy6RznRXP7/SZobEemG47zbt
	dEjH05w2tJWDIHev+xbaa4UuxZxg9AEWCBjUGyEI1pgy4eba6rEfEtFsUf+72kyiSQQ8SpIRRXnsj
	puu2L+h2DsMuteOAlquI96ImHKjAee/aMU/snEt8vVi7bitwE2f8dradrg607p9lwbxQ5pgE7b7XW
	xP+wU6vaXV/9Qv+908yycffko0tqrYRKq9ViX3x+o8g7UjmSU4oAs5DpO9qlMiyt9J1RUE9UkoV3K
	ei7qDdPfbMeHsYKfvoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nARVy-009Bqh-6d; Thu, 20 Jan 2022 07:05:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nART3-0099yq-IQ; Thu, 20 Jan 2022 07:02:47 +0000
X-UUID: 5f80a1e6bfc14b39a001453fed461722-20220120
X-UUID: 5f80a1e6bfc14b39a001453fed461722-20220120
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1088708021; Thu, 20 Jan 2022 00:02:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 23:02:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 20 Jan 2022 15:02:37 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Jan 2022 15:02:36 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Fabien Parent <fparent@baylibre.com>
CC: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, "John
 Crispin" <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Biao Huang <biao.huang@mediatek.com>,
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH net-next v1 7/9] dt-bindings: net: mtk-star-emac: add
 description for new properties
Date: Thu, 20 Jan 2022 15:02:24 +0800
Message-ID: <20220120070226.1492-8-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120070226.1492-1-biao.huang@mediatek.com>
References: <20220120070226.1492-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_230245_639327_C83B6C56 
X-CRM114-Status: GOOD (  10.73  )
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

Add description for new properties which will be parsed in driver.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../bindings/net/mediatek,star-emac.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
index 87a8b25b03a6..41b1b1dd562c 100644
--- a/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
@@ -48,6 +48,22 @@ properties:
       Phandle to the device containing the PERICFG register range. This is used
       to control the MII mode.
 
+  mediatek,rmii-rxc:
+    type: boolean
+    description:
+      If present, indicates that the RMII reference clock, which is from external
+      PHYs, is connected to RXC pin. Otherwise, is connected to TXC pin.
+
+  mediatek,rxc-inverse:
+    type: boolean
+    description:
+      If present, indicates that clock on RXC pad will be inversed.
+
+  mediatek,txc-inverse:
+    type: boolean
+    description:
+      If present, indicates that clock on TXC pad will be inversed.
+
   mdio:
     type: object
     description:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
