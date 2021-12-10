Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA01C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 18:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4R7QHbrmeKC5MyaPh0TzghMdpkL5bDDYHnfwf2o1a4=; b=ki9Hj4nOhozzCk
	3UAK14iUymkIF/mKjE9Ii5Ox70J8ny0b8jJgCC2p+hEu7STbL5x8Udep4/3awoEmDiAZ4LMwNOrIk
	xaC4Iy/iEV8irdE/+e94IUA8OrkOn8TK/g+CUK3LyczXwDdO0wxEdPxtGohucSft9S6Qb9W+QXiO8
	eXKp/8GlaoMuulOzq+2P8rjvN4npmWYMho8NSBXOMFE2QxPzfQPcII9jfj9ryRHiOl6ZBQKLrmDOG
	b++DsILPBbRRCPXYgu86HfN868+VSbKW1cqASjDHufUymwak2JNVEgAmB0DuRIIuGNwFFmR8q95Fz
	oPe89hT6Uz/D6piEvHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkEH-00365V-Jw; Fri, 10 Dec 2021 18:02:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkEC-00362T-Pt; Fri, 10 Dec 2021 18:02:43 +0000
X-UUID: 5e76eaa614154675a748db4d8d591181-20211210
X-UUID: 5e76eaa614154675a748db4d8d591181-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1334153468; Fri, 10 Dec 2021 11:02:37 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:52:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:52:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:52:28 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "JB
 Tsai" <jb.tsai@mediatek.com>
Subject: [PATCH 01/12] dt-bindings: memory: mediatek: Add MT8195 apu iommu
 bindings
Date: Sat, 11 Dec 2021 01:52:12 +0800
Message-ID: <20211210175223.31131-2-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210175223.31131-1-flora.fu@mediatek.com>
References: <20211210175223.31131-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_100240_909239_1C14C4A5 
X-CRM114-Status: UNSURE (   9.17  )
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

There are two apu iommu hardwares in MT8195.
Add MT8195 apu iommu bindings.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 3 +++
 include/dt-bindings/memory/mt8195-memory-port.h             | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 14fae9642ec9..ba1b3ce6cf99 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -81,6 +81,7 @@ properties:
           - mediatek,mt8195-iommu-vdo        # generation two
           - mediatek,mt8195-iommu-vpp        # generation two
           - mediatek,mt8195-iommu-infra      # generation two
+          - mediatek,mt8195-iommu-apu        # generation two
 
       - description: mt7623 generation one
         items:
@@ -158,6 +159,7 @@ allOf:
             - mediatek,mt8192-iommu-apu
             - mediatek,mt8195-iommu-vdo
             - mediatek,mt8195-iommu-vpp
+            - mediatek,mt8195-iommu-apu
 
     then:
       required:
@@ -170,6 +172,7 @@ allOf:
             enum:
               - mediatek,mt8192-iommu-apu
               - mediatek,mt8195-iommu-infra
+              - mediatek,mt8195-iommu-apu
 
     then:
       required:
diff --git a/include/dt-bindings/memory/mt8195-memory-port.h b/include/dt-bindings/memory/mt8195-memory-port.h
index 9882877cda9d..438e75140717 100644
--- a/include/dt-bindings/memory/mt8195-memory-port.h
+++ b/include/dt-bindings/memory/mt8195-memory-port.h
@@ -405,4 +405,8 @@
 #define IOMMU_PORT_INFRA_SSUSB_R		MTK_IFAIOMMU_PERI_ID(30)
 #define IOMMU_PORT_INFRA_SSUSB_W		MTK_IFAIOMMU_PERI_ID(31)
 
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
