Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04219C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O07N7hjSuUUcJBBCLVzIFQKGN4qA3BZkZQW/3dNv6nA=; b=uEjpGyjyfnG611
	GZVrm4VDdffcN2GmkJeozRv6QLMSiQixNkrTqtKR9/WIJPl4aW5UzEsby5FUoEurWYodRF6QCk0D1
	RiBEKvcxQKLpGiLiN0Qg9HJYsTS3ig3FV/Y5EJTtu+e/nBDWm2fr0tqk44rPn/epXsndqE3Kr+2DF
	oBXkWIj0pIYXz/iv+7QXBKRSV/c9BI0xq06hDWH0n1fsWnvfKIF/sYQcoVYNZyCSIBje0u2ZbdjSM
	iIIattWewLY3kVujquxv7Wc7CD5NnCJtPBMdQ/8x4O7UPnDKrngt2A0kVgrYdOrxr3UIjYms55qzk
	WC4LcocsXjc88mHFaPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7y6i-005bZp-50; Thu, 13 Jan 2022 11:17:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7y6G-005bQH-Um; Thu, 13 Jan 2022 11:17:02 +0000
X-UUID: f28ce510f6214e2da81f66bf392751a9-20220113
X-UUID: f28ce510f6214e2da81f66bf392751a9-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1803584868; Thu, 13 Jan 2022 04:16:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 03:11:36 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 19:11:35 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 19:11:34 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Joerg Roedel <joro@8bytes.org>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>, <anthony.huang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 4/7] dt-bindings: memory: mediatek: Add mt8186 support
Date: Thu, 13 Jan 2022 19:10:54 +0800
Message-ID: <20220113111057.29918-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220113111057.29918-1-yong.wu@mediatek.com>
References: <20220113111057.29918-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_031701_028770_BBCB9707 
X-CRM114-Status: GOOD (  12.03  )
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

Add mt8186 smi support in the bindings.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/memory-controllers/mediatek,smi-common.yaml      | 4 +++-
 .../bindings/memory-controllers/mediatek,smi-larb.yaml        | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 4fca71f34310..a98b359bf909 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -16,7 +16,7 @@ description: |
   MediaTek SMI have two generations of HW architecture, here is the list
   which generation the SoCs use:
   generation 1: mt2701 and mt7623.
-  generation 2: mt2712, mt6779, mt8167, mt8173, mt8183, mt8192 and mt8195.
+  generation 2: mt2712, mt6779, mt8167, mt8173, mt8183, mt8186, mt8192 and mt8195.
 
   There's slight differences between the two SMI, for generation 2, the
   register which control the iommu port is at each larb's register base. But
@@ -35,6 +35,7 @@ properties:
           - mediatek,mt8167-smi-common
           - mediatek,mt8173-smi-common
           - mediatek,mt8183-smi-common
+          - mediatek,mt8186-smi-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -125,6 +126,7 @@ allOf:
           enum:
             - mediatek,mt6779-smi-common
             - mediatek,mt8183-smi-common
+            - mediatek,mt8186-smi-common
             - mediatek,mt8192-smi-common
             - mediatek,mt8195-smi-common-vdo
             - mediatek,mt8195-smi-common-vpp
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index c5c32c910045..4db8690829cd 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -23,6 +23,7 @@ properties:
           - mediatek,mt8167-smi-larb
           - mediatek,mt8173-smi-larb
           - mediatek,mt8183-smi-larb
+          - mediatek,mt8186-smi-larb
           - mediatek,mt8192-smi-larb
           - mediatek,mt8195-smi-larb
 
@@ -75,6 +76,7 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8183-smi-larb
+            - mediatek,mt8186-smi-larb
             - mediatek,mt8195-smi-larb
 
     then:
@@ -107,6 +109,7 @@ allOf:
               - mediatek,mt2701-smi-larb
               - mediatek,mt2712-smi-larb
               - mediatek,mt6779-smi-larb
+              - mediatek,mt8186-smi-larb
               - mediatek,mt8192-smi-larb
               - mediatek,mt8195-smi-larb
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
