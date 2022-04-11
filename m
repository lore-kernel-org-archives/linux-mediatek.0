Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1064C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 04:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmg8c2OUeWyUg10Kyi1Nlu+W4QKr9a1x+rpGgQwDN7Y=; b=VGSc/w6SiJ0iJo
	vNPVWK00w4Td1ghWoU9wxktWt8G4X5MWraMKexSSBRqZ09Dyjo5pNU5SXlOI3ecYN0ghmCcY3q/mr
	tJeRhKjWvI66vq/t5GTmxJe4/6zAnk1p5riLyGUtQIx3um37btvpdizEvUv6UtId8lDQlRmg5hyho
	8MBRyHVeCtNQKnbnG+6oGJTWGTcUQN2y1E3OnImXKQsXSlcCDVXPRg9ICZqwe2pujfMxDj2mRhGIk
	tW4TdzAJuot404vFKXaOMfKBG8fu6kvmaZHLf17aSnEs0agHS5cjTXt6IvSAcyrcC1VmYk5hl9pRJ
	2bmtaqVWXup1/e5hAW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndlJI-006X2p-8i; Mon, 11 Apr 2022 04:05:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndlJE-006X1v-2h; Mon, 11 Apr 2022 04:05:49 +0000
X-UUID: 9680f448dd834370949ee9ce3764bbf9-20220410
X-UUID: 9680f448dd834370949ee9ce3764bbf9-20220410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 779323460; Sun, 10 Apr 2022 21:05:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Apr 2022 20:58:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Apr 2022 11:58:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 11 Apr 2022 11:58:44 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <yongqiang.niu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 1/3] dt-bindings: display: mediatek: Update disp_aal
 binding for MT8183
Date: Mon, 11 Apr 2022 11:58:41 +0800
Message-ID: <20220411035843.19847-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_210548_175526_211A7EF2 
X-CRM114-Status: GOOD (  11.00  )
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

The driver data of MT8183 and MT8173 are different.

For MT8173, the gamma module is inside disp_aal. When we need to adjust
gamma value, we need to use "has_gamma" to control gamma function
inside disp_aal to adjust the gamma value.

For successors like MT8183, disp_gamma is separated from disp_aal. We
just need to control disp_gamma directly and don't need to control gamma
function inside disp_aal.

With this modification, the driver doesn't require any functional changes.
We only update the dt-binding and DTS node to make it clear.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index cb4a2f39ff88..f118075e4a89 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -21,12 +21,12 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-aal
+      - enum:
+          - mediatek,mt8173-disp-aal
+          - mediatek,mt8183-disp-aal
       - items:
           - enum:
               - mediatek,mt2712-disp-aal
-              - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
           - const: mediatek,mt8173-disp-aal
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
