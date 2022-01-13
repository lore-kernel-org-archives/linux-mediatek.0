Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4334FC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jat6fwi3PbP8VtTQwevfmEoDjUNUWEhFWgwecXuXti0=; b=PqiqrmABHSyuAv
	30zU91BVDDy9jNqZkR1IiGDHOOqtWERtgsZ0gXziCtvFof/wszRFHZLOAcgfG+Q3icOQa10fnoUfb
	XPTTBpbNCwjaJhr16ceWTM50BU04TmGmiPyFtscHII3bpAe1Q+hrrNwQUkmQ6brXgp/BT4QftJuWn
	pf+yNrNKc7XXjVsK4GOIzDG2+m0/SUO8L8eMvvRXfMY3lli2TzLN23mgjcvpNfBOmyZYK4KEbzV6X
	4AX2uPfWLKqH9kU1iFnxTigmBb+9P1tuxRgn5dOxgTL4pYaPapGv8vVYIDV7HjoclVqwrfj6xIgwq
	cgv6tOcoa/R2WRGGP+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7yAd-005dAL-04; Thu, 13 Jan 2022 11:21:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7yAZ-005d8e-08; Thu, 13 Jan 2022 11:21:28 +0000
X-UUID: cc0ff24bf7164d56b0c9c6ba63a3f415-20220113
X-UUID: cc0ff24bf7164d56b0c9c6ba63a3f415-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1241750559; Thu, 13 Jan 2022 04:21:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 03:11:23 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 19:11:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 19:11:20 +0800
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
Subject: [PATCH v3 2/7] dt-bindings: memory: mtk-smi: No need mediatek,
 larb-id for mt8167
Date: Thu, 13 Jan 2022 19:10:52 +0800
Message-ID: <20220113111057.29918-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220113111057.29918-1-yong.wu@mediatek.com>
References: <20220113111057.29918-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_032127_078403_5DD42B3D 
X-CRM114-Status: GOOD (  10.55  )
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

Mute the warning from "make dtbs_check":

larb@14016000: 'mediatek,larb-id' is a required property
	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
larb@15001000: 'mediatek,larb-id' is a required property
	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
larb@16010000: 'mediatek,larb-id' is a required property
	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml

As the description of mediatek,larb-id, the property is only
required when the larbid is not consecutive from its IOMMU point of view.

Also, from the description of mediatek,larbs in
Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml, all the larbs
must sort by the larb index.

In mt8167, there is only one IOMMU HW and three larbs. The drivers already
know its larb index from the mediatek,larbs property of IOMMU, thus no
need this property.

Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../bindings/memory-controllers/mediatek,smi-larb.yaml           | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index bd7aa8257949..6d61c51893d2 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -106,7 +106,6 @@ allOf:
               - mediatek,mt2701-smi-larb
               - mediatek,mt2712-smi-larb
               - mediatek,mt6779-smi-larb
-              - mediatek,mt8167-smi-larb
               - mediatek,mt8192-smi-larb
               - mediatek,mt8195-smi-larb
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
