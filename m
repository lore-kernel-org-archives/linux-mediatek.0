Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE9AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 05:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4ifzsqkSULm1uZI3RsIIgHeAHysP73iaK/gDcIooKw=; b=KOdE+WFBBXJIXp
	zVq22+7EAfEz1R8AzSPoCzEMwVQWGOEKw8EsEPdRduNqdnYp+n0bHBNpSrNmalWgQddZO7jAhRCft
	YiNeH96X6ulrP6c29E7qocn40Ogm2To5dzSTfwmOIU1Ba5tdFqoxRxZR7hyyaIVuGW9nKuofo4tm3
	HnQfgiHktt/K3UXrBHDKTAPKdXicXLSfGjtt9+8kmNsWuWegNX2jkfPsNTsX/ICkm4wNLtZEF1gfW
	v/yszxeOsFSJDDTdJRykTag++Hb1BWgcyAMVN1IyNfqxOYO7ydH81jQzPGQd7gL5rqz4kN5pIrbwt
	K3M+fQMmqZu3LSvu26HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrvrm-003eKz-EF; Tue, 30 Nov 2021 05:39:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrvrO-003eDn-Bi; Tue, 30 Nov 2021 05:39:23 +0000
X-UUID: bb85b293335648f4a8d6bc74163d914d-20211129
X-UUID: bb85b293335648f4a8d6bc74163d914d-20211129
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1810113236; Mon, 29 Nov 2021 22:39:16 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 21:39:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Nov 2021 13:39:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Nov 2021 13:39:08 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <yc.hung@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: mediatek: mt8195: add memory-region property
Date: Tue, 30 Nov 2021 13:39:05 +0800
Message-ID: <20211130053905.28470-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211130053905.28470-1-trevor.wu@mediatek.com>
References: <20211130053905.28470-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_213922_429671_F682B675 
X-CRM114-Status: GOOD (  10.47  )
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

Add a required property "memory-region", which is used to specify memory
for DMA usage.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../devicetree/bindings/sound/mt8195-afe-pcm.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
index dcf790b053d2..6d0975b33d15 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -19,6 +19,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: |
+      Shared memory region for AFE memif.  A "shared-dma-pool".
+      See ../reserved-memory/reserved-memory.txt for details.
+
   mediatek,topckgen:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of the mediatek topckgen controller
@@ -125,6 +131,7 @@ required:
   - power-domains
   - clocks
   - clock-names
+  - memory-region
 
 additionalProperties: false
 
@@ -139,6 +146,7 @@ examples:
         interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
         mediatek,topckgen = <&topckgen>;
         power-domains = <&spm 7>; //MT8195_POWER_DOMAIN_AUDIO
+        memory-region = <&snd_dma_mem_reserved>;
         clocks = <&clk26m>,
                  <&topckgen 163>, //CLK_TOP_APLL1
                  <&topckgen 166>, //CLK_TOP_APLL2
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
