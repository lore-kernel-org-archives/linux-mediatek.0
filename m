Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5B2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 11:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hD4pX89BXJEASTfSd3kYdp13nzU/IcE2ptcnBPFmMCg=; b=uIKCcX1HmyFLAE
	zB3bRRDAKcTltkJZZJVoeTFI2/ewCBO62RIIQiKDbBKW789ptBkCVJpKpGR0zptHXbN0NlJwzjavP
	WSCYgnNKmTqLfmAX9d0SJIm2t1BYnTBhvPnIcb19dDKBltNX/7n+MbomNSDYvL+vB/pN5NLs2+Drf
	sX4aktd5Domh4W/3hffGRumVcPGJEHJL2cVIpaHFx52ppaUpH2F2CX0DfYlOcWqxFZBYzChSIU80/
	UUN3qe4jNOCCXPhnAENE7C80kL2vpD9I0AXMpOhjDTUYPc2PdE1vM6CWPy4OkOt2b9U4ya40Z4dAx
	b0PFSjD8iDXnHcITUPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUSCT-00CfUd-QE; Wed, 16 Mar 2022 11:52:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUSCC-00CfNl-Bk; Wed, 16 Mar 2022 11:52:07 +0000
X-UUID: 665cdd9c5e7246c1b1cd05c17977229f-20220316
X-UUID: 665cdd9c5e7246c1b1cd05c17977229f-20220316
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 833090384; Wed, 16 Mar 2022 04:52:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 04:51:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 16 Mar 2022 19:51:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 19:51:57 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <p.zabel@pengutronix.de>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <jassisinghbrar@gmail.com>,
 <fparent@baylibre.com>, <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V8 1/5] dt-bindings: display: mediatek: add aal binding for
 MT8183
Date: Wed, 16 Mar 2022 19:51:51 +0800
Message-ID: <20220316115155.17834-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220316115155.17834-1-rex-bc.chen@mediatek.com>
References: <20220316115155.17834-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_045204_425884_B7791D7C 
X-CRM114-Status: UNSURE (   9.47  )
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

Add aal binding for MT8183.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 61f0ed1e388f..eb0299b80522 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -22,7 +22,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: mediatek,mt8173-disp-aal
+          - enum:
+              - mediatek,mt8173-disp-aal
+              - mediatek,mt8183-disp-aal
       - items:
           - enum:
               - mediatek,mt2712-disp-aal
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
