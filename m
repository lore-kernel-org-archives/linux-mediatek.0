Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E23AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQAsixgzZhOw53P9JXfydYsTYuWqJ2VKyNo+//HyPUM=; b=wD6ePWW8NAO1ho
	S73Are1jEO7cISxmkEPLIrGDzVBih1Tx7M268vgqkxBdhDc+uIWOABbSRAt+pBlFSGwxK+7pkNlPt
	Dp6tpWkujD1+2907NHatgns6Vha4IXbyIXNy3pGzlOzWBufvpdQ5g2axBvtyr411zDiFWeiOGy7ON
	CwsGD4TQLa/tJEbiCK6g0gpZzeACLk5Z3C8WXeR40hMqP1InbqELmoTAfn4HHG/ySpP1+klxciCZF
	N5SU8S2ejpQ+0FfhGmcVI2KknVgGaDiweHM6Bo77W/SYmROjJV/5ONd5i20iM8IosUOtGKzBZaJFE
	tecAyQkjvMeLnPT7o7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjg3-002pDg-M3; Fri, 10 Dec 2021 17:27:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjfN-002olx-2i; Fri, 10 Dec 2021 17:26:42 +0000
X-UUID: f77f02665c6946a896bb1a7250c111ed-20211210
X-UUID: f77f02665c6946a896bb1a7250c111ed-20211210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1090104644; Fri, 10 Dec 2021 10:26:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:26:36 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 01:26:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:34 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>
Subject: [PATCH 02/17] dt-bindings: memory: mediatek: Add MT8192 apu iommu
 bindings
Date: Sat, 11 Dec 2021 01:25:50 +0800
Message-ID: <20211210172605.30618-3-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_092641_158582_E5C58C38 
X-CRM114-Status: UNSURE (   9.63  )
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

MT8192 has one APU iommu hardware and add apu iommu bindings.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml          | 7 +++++--
 include/dt-bindings/memory/mt8192-larb-port.h              | 4 ++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index c528a299afa9..14fae9642ec9 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -77,6 +77,7 @@ properties:
           - mediatek,mt8173-m4u  # generation two
           - mediatek,mt8183-m4u  # generation two
           - mediatek,mt8192-m4u  # generation two
+          - mediatek,mt8192-iommu-apu        # generation two
           - mediatek,mt8195-iommu-vdo        # generation two
           - mediatek,mt8195-iommu-vpp        # generation two
           - mediatek,mt8195-iommu-infra      # generation two
@@ -154,6 +155,7 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8192-m4u
+            - mediatek,mt8192-iommu-apu
             - mediatek,mt8195-iommu-vdo
             - mediatek,mt8195-iommu-vpp
 
@@ -165,8 +167,9 @@ allOf:
       not:
         properties:
           compatible:
-            contains:
-              const: mediatek,mt8195-iommu-infra
+            enum:
+              - mediatek,mt8192-iommu-apu
+              - mediatek,mt8195-iommu-infra
 
     then:
       required:
diff --git a/include/dt-bindings/memory/mt8192-larb-port.h b/include/dt-bindings/memory/mt8192-larb-port.h
index 23035a52c675..908d6831bf99 100644
--- a/include/dt-bindings/memory/mt8192-larb-port.h
+++ b/include/dt-bindings/memory/mt8192-larb-port.h
@@ -240,4 +240,8 @@
 #define M4U_PORT_L20_IPE_RSC_RDMA0		MTK_M4U_ID(20, 4)
 #define M4U_PORT_L20_IPE_RSC_WDMA		MTK_M4U_ID(20, 5)
 
+#define IOMMU_PORT_APU_DATA			MTK_M4U_ID(0, 0)
+#define IOMMU_PORT_APU_VLM			MTK_M4U_ID(0, 1)
+#define IOMMU_PORT_APU_VPU			MTK_M4U_ID(0, 2)
+
 #endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
