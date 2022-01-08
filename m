Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jan 2022 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zruC4n650cOFrO4xzd94DPH9sI08UgV3hmT0V92dFSY=; b=G5lT2ujJgrufUt
	OEvmhnNIDAVCsUho8IaDbHbIbh3B8vxnVuEElTlBIzZRmkTtx/5/RgTHD2QLJ3AvojMM3p95L25vj
	2Xaw9pdCVdBchiuFxRKliU090xnRsPXrgw2jjpWfB+pkiloosy8I8RrXxz17dFzy9hQqrLiJCLoyC
	om6HloitVIIqvNYr1+0Al0pT9a7JK3o7RBO+4lmweQfWuIn5eHjJxzXr7PBFq4v7W4iIso0naoqlX
	MuWUlE1w57X/p+EEKuustvAfaQZ6+pYoxx2zH93a7GFgFlFAM9gZv0dRYMicfKEcdaYh5f/G4im7U
	vju7nixseCDJa5a60kQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n68R2-006EoC-Gj; Sat, 08 Jan 2022 09:54:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n68Qf-006Ej7-7i; Sat, 08 Jan 2022 09:54:30 +0000
X-UUID: 4473cfda120f43c8b60bc15430dff8b7-20220108
X-UUID: 4473cfda120f43c8b60bc15430dff8b7-20220108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 981756084; Sat, 08 Jan 2022 02:54:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Jan 2022 01:54:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 8 Jan 2022 17:54:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 Jan 2022 17:54:22 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>, <ryan-jh.yu@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: i2c: update bindings for MT8186 SoC
Date: Sat, 8 Jan 2022 17:54:17 +0800
Message-ID: <20220108095418.16602-2-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108095418.16602-1-kewei.xu@mediatek.com>
References: <20220108095418.16602-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_015429_302838_9C57D9F9 
X-CRM114-Status: UNSURE (   7.94  )
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

Add a DT binding documentation for the MT8186 soc.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 5ea216ae7084..88f74a3c81ec 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -14,6 +14,7 @@ Required properties:
       "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
       "mediatek,mt8173-i2c": for MediaTek MT8173
       "mediatek,mt8183-i2c": for MediaTek MT8183
+      "mediatek,mt8186-i2c": for MediaTek MT8186
       "mediatek,mt8192-i2c": for MediaTek MT8192
       "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek MT8195
       "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
